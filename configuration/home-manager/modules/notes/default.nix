{ pkgs, nix-neovim, ... }:

let
  zet = nix-neovim.buildNeovim { configuration = ./configuration.nix; };
  wrapped = pkgs.stdenv.mkDerivation {
    name = "zet";
    src = zet;

    installPhase = ''
      mkdir -p $out/bin
      cp $src/bin/nvim $out/bin/zet
    '';
  };
in { home.packages = [ wrapped ]; }
