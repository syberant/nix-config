{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-20.09";
    nixpkgs-git.url = "github:NixOS/nixpkgs/master";

    # Flake utilities
    flake-utils.url = "github:numtide/flake-utils";

    # (Semi-)official auxiliary repositories
    nixos-hardware.url = "github:NixOS/nixos-hardware";
    NUR = {
      url = "github:nix-community/NUR";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:rycee/home-manager/release-20.09";
      # inputs.nixpkgs.follows = "nixpkgs-git";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Own flakes
    xmonad-sybrand = {
      # url = "github:syberant/xmonad-sybrand";
      url = "/home/sybrand/Documents/Programmeren/Nix/xmonad";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-neovim = {
      url = "github:syberant/nix-neovim";
      # url = "/home/sybrand/Documents/Programmeren/Nix/nix-neovim";
      inputs.nixpkgs.follows = "nixpkgs-git";
    };

    # Secrets
    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    secrets = {
      # Private repository (and encrypted, I'm not that careless)
      url = "git+https://github.com/syberant/secrets.git";
      flake = false;
    };
  };

  outputs = { self, flake-utils, nixpkgs, nixpkgs-git, nixos-hardware, NUR
    , home-manager, sops-nix, xmonad-sybrand, nix-neovim, secrets }:

    let
      # TODO: utilise flake-utils for this
      system = "x86_64-linux";
      specialArgs = {
        inherit self nixos-hardware nix-neovim secrets;

        pkgs = import nixpkgs {
          inherit system;
          config.allowUnfree = true;
          overlays = [ xmonad-sybrand.overlay NUR.overlay (import ./overlays/explicit_configuration) ];
        };

        nixpkgs-git = import nixpkgs-git {
          inherit system;
          config.allowUnfree = true;
        };
      };
      # https://github.com/cideM/dotfiles/blob/master/flake.nix
      hm-nixos-as-super = { config, ... }: {
        # Submodules have merge semantics, making it possible to amend
        # the `home-manager.users` submodule for additional functionality.
        options.home-manager.users = let lib = specialArgs.pkgs.lib;
        in lib.mkOption {
          type = lib.types.attrsOf (lib.types.submoduleWith {
            modules = [ ];
            # Makes specialArgs available to Home Manager modules as well.
            specialArgs = specialArgs // {
              # Allow accessing the parent NixOS configuration.
              super = config;
            };
          });
        };
      };
      sharedModule = {
        imports = [
          sops-nix.nixosModules.sops
          home-manager.nixosModules.home-manager
          hm-nixos-as-super
          xmonad-sybrand.nixosModule
        ];

        # Pin nixpkgs in registry
        nix.registry.nixpkgs.flake = nixpkgs;

        # Pin NIX_PATH
        nix.nixPath =
          [ "nixpkgs=${nixpkgs}" "nixos-config=/etc/nixos/configuration.nix" ];
      };
    in {
      nixosConfigurations.nixos-macbook = nixpkgs.lib.nixosSystem {
        inherit specialArgs system;

        modules = [ ./hosts/macbook/main.nix sharedModule ];
      };

      nixosConfigurations.nixos-desktop = nixpkgs.lib.nixosSystem {
        inherit specialArgs system;

        modules = [ ./hosts/desktop/main.nix sharedModule ];
      };
    } // flake-utils.lib.eachDefaultSystem (system: {
      apps = let
        configuration = {
          imports =
            [ ./configuration/home-manager/modules/neovim/configuration.nix ];
        };
        bin = nix-neovim.fromConfig configuration;
        mkApp = flake-utils.lib.mkApp;
        pkgs = import nixpkgs { inherit system; };
      in {
        neovim = mkApp { drv = bin; };

        neovim-debug = mkApp {
          drv = pkgs.writeScriptBin "neovim-debug" ''
            echo 'Opening ${bin.passthru.customRC}'
            ${bin}/bin/nvim ${bin.passthru.customRC} $@
          '';
        };
      };
    });
}
