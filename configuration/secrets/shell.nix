let
  sources = import ../../nix/sources.nix;
  pkgs = import sources.nixpkgs { };
  sops = pkgs.callPackage sources.sops-nix { };
in pkgs.mkShell {
  # Directory containing public keys
  sopsPGPKeyDirs = [ ./keys ];

  # Automatically set SOPS_PGP_FP with above public keys
  # Allows editing the secrets.yaml file
  nativeBuildInputs = with sops; [ sops-pgp-hook ];
}
