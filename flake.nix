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
      flake = false;
    };

    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    secrets = {
      url = "/secrets/nixos-configuration";
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
          overlays = [ NUR.overlay (import ./overlays/explicit_configuration) ];
        };

        nixpkgs-git = import nixpkgs-git {
          system = "x86_64-linux";
          config = { allowUnfree = true; };
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
          {
            # Pin nixpkgs in registry
            nix.registry.nixpkgs.flake = nixpkgs;
          }
        ];

      };

      nixosConfigurations.nixos-desktop = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [ ./hosts/desktop/main.nix ];
      };
    };
}
