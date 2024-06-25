# Stolen from:
# https://github.com/splintah/xmonad-splintah/blob/master/flake.nix
{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-22.05";
  };

  outputs = { self, nixpkgs, ... }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
      haskellPackages = pkgs.haskellPackages;
    in {
      packages.${system}.xmonad-sybrand =
        haskellPackages.callPackage ./derivation.nix { };

      defaultPackage.${system} = self.packages.${system}.xmonad-sybrand;

      defaultApp.${system} = {
        type = "app";
        program = "${self.packages.${system}.xmonad-sybrand}/bin/xmonad";
      };

      nixosModule = self.nixosModules.importAll;
      # nixosModules = let files = attrNames (readDir ./modules) in ;
      # nixpkgs.lib.recursiveUpdate
      nixosModules.importAll = { ... }: {
        imports = [ ./modules/xmonad-sybrand.nix ./modules/agnostic/common.nix ];
      };

      overlay = final: prev: {
        xmonad-sybrand = self.packages.${system}.xmonad-sybrand;
      };

      # For testing in a vm
      # sudo nixos-rebuild
      nixosConfigurations.test-vm = let system = "x86_64-linux";
      in nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = {
          pkgs = import nixpkgs {
            inherit system;
            overlays = [ self.overlay ];
          };
        };
        modules = [
          self.nixosModule
          {
            users.users.test = {
              isNormalUser = true;
              initialPassword = "notWine";
            };

            services.xserver = {
              enable = true;
              sybrand-desktop-environment = {
                enable = true;
                impureConfig = true;
              };
              displayManager.defaultSession = "none+xmonad";
            };

            # Enable SSH access
            services.openssh.enable = true;

            # https://github.com/NixOS/nixpkgs/issues/59219
            imports = [ "${nixpkgs}/nixos/modules/virtualisation/qemu-vm.nix" ];

            # Speed up the VM a bit
            virtualisation = {
              # Significantly speeds up reading from virtual disk
              # Set to 300 MB for now
              # See: https://wiki.qemu.org/Documentation/9psetup#msize
              msize = 300 * 1000 * 1000;

              # 4 GB of memory
              memorySize = 4000;

              # Use multiple cores for a bit more power.
              cores = 4;
            };
          }
        ];
      };
    };
}
