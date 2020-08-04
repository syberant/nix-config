let
  sources = import ../../nix/sources.nix;
  pkgs = import sources.nixpkgs { };
  sops = pkgs.callPackage sources.sops-nix { };
in pkgs.mkShell {
  # Directory containing public keys
  sopsPGPKeyDirs = [ ./keys ];

  nativeBuildInputs = with sops;
    [
      # Automatically set SOPS_PGP_FP with above public keys
      # Allows editing the secrets.yaml file
      sops-pgp-hook

      # Import ssh keys to gpg for new hosts, takes some time to build
      #ssh-to-pgp
    ];
}
