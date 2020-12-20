{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-20.09";
    nixpkgs-git.url = "github:NixOS/nixpkgs/master";

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

    nix-neovim = {
      url = "github:syberant/nix-neovim";
      inputs.nixpkgs.follows = "nixpkgs";
    };

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

  outputs = { self, nixpkgs, nixpkgs-git, nixos-hardware, NUR, home-manager
    , sops-nix, nix-neovim, secrets }:

    let
      specialArgs = {
        inherit self nixos-hardware nix-neovim secrets;

        pkgs = import nixpkgs {
          system = "x86_64-linux";
          config = { allowUnfree = true; };
          overlays = [
            NUR.overlay
            (import ./overlays/explicit_configuration)
          ];
        };

        nixpkgs-git = import nixpkgs-git {
          system = "x86_64-linux";
          config = { allowUnfree = true; };
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
    in {
      nixosConfigurations.nixos-macbook = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        inherit specialArgs;

        modules = [
          ./hosts/macbook/main.nix
          sops-nix.nixosModules.sops
          home-manager.nixosModules.home-manager
          hm-nixos-as-super
          {
            # Pin nixpkgs in registry
            nix.registry.nixpkgs.flake = nixpkgs;
          }
        ];
      };

      nixosConfigurations.nixos-desktop = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        inherit specialArgs;

        modules = [
          ./hosts/desktop/main.nix
          sops-nix.nixosModules.sops
          home-manager.nixosModules.home-manager
          hm-nixos-as-super
          {
            # Pin nixpkgs in registry
            nix.registry.nixpkgs.flake = nixpkgs;
          }
        ];
      };
    };
}
