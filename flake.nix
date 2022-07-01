{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-22.05";
    nixpkgs-git.url = "github:NixOS/nixpkgs";

    # (Semi-)official auxiliary repositories
    nixos-hardware.url = "github:NixOS/nixos-hardware";
    NUR = {
      url = "github:nix-community/NUR";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager/release-22.05";
      # inputs.nixpkgs.follows = "nixpkgs-git";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Own flakes
    xmonad-sybrand = {
      url = "github:syberant/xmonad-sybrand";
      # url = "/home/sybrand/Documents/Programmeren/Nix/xmonad";
    };
    nix-neovim = {
      url = "github:syberant/nix-neovim";
      # url = "/home/sybrand/Documents/Programmeren/Nix/nix-neovim";
      inputs.nixpkgs.follows = "nixpkgs";
      # inputs.nixpkgs.follows = "nixpkgs-git";
    };
    # nur-syberant = {
    # url = "/home/sybrand/Documents/Programmeren/Nix/nur-packages";
    # flake = false;
    # };

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

    # Misc
    flake-utils.url = "github:numtide/flake-utils";
    hosts.url = "github:StevenBlack/hosts";
  };

  outputs = { self, nixpkgs, nixpkgs-git, nixos-hardware, NUR, home-manager
    , sops-nix, xmonad-sybrand, nix-neovim, secrets, flake-utils, hosts }:

    let
      # TODO: utilise flake-utils for this
      system = "x86_64-linux";
      specialArgs = {
        inherit self nixos-hardware nix-neovim secrets;

        pkgs = import nixpkgs {
          inherit system;
          config.allowUnfree = true;
          overlays = [
            xmonad-sybrand.overlay
            NUR.overlay

            # For temporarily bypassing NUR to get my latest nur-packages
            # (final: prev: {
            # nur = import NUR {
            # nurpkgs = prev;
            # pkgs = prev;
            # repoOverrides = { syberant = import nur-syberant { pkgs = prev; }; };
            # };
            # })
          ];
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
          hosts.nixosModule
          sops-nix.nixosModules.sops
          home-manager.nixosModules.home-manager
          hm-nixos-as-super
          xmonad-sybrand.nixosModule
          ./configuration/common.nix
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

      nixosConfigurations.test-vm = nixpkgs.lib.nixosSystem {
        inherit specialArgs system;

        modules = [ sharedModule { networking.hostId = "e0aa3905"; } ];
      };
    } // flake-utils.lib.eachDefaultSystem (system: {
      apps.neovim = let
        configuration = {
          imports =
            [ ./configuration/home-manager/modules/neovim/configuration.nix ];

          output.path.style = nixpkgs.lib.mkForce "pure";
        };
      in flake-utils.lib.mkApp {
        drv = nix-neovim.buildNeovim { inherit configuration; };
        exePath = "/bin/nvim";
      };

      apps.zet = flake-utils.lib.mkApp {
        drv = nix-neovim.buildNeovim {
          configuration =
            ./configuration/home-manager/modules/notes/configuration.nix;
        };
        exePath = "/bin/nvim";
      };

      # I find a REPL occasionally very useful in debugging
      apps.repl = flake-utils.lib.mkApp {
        drv = let pkgs = import nixpkgs { inherit system; };
        in pkgs.writeShellScriptBin "repl" ''
          confnix=$(mktemp)

          cat >$confnix <<EOF
          let flake = builtins.getFlake "/etc/nixos";
          in builtins.trace ${"''"}
            This REPL loads the following variables:
              - pkgs, stable version
              - nixpkgs-git, master branch, often breaks
              - flake, the complete flake
              - macbook, NixOS config of ./hosts/macbook
              - desktop, NixOS config of ./hosts/desktop
          ${"''"} {
            inherit flake;

            # Access the NixOS config after evaluation
            # Useful for double-checking whether options are set like you expect them to be
            macbook = flake.outputs.nixosConfigurations.nixos-macbook.config;
            desktop = flake.outputs.nixosConfigurations.nixos-desktop.config;

            pkgs = import "${nixpkgs}" {};
            nixpkgs-git = import "${nixpkgs-git}" {};
          }
          EOF

          trap "rm $confnix" EXIT
          nix repl $confnix
        '';
      };
    });
}
