{ pkgs, ... }:

let
  importPureScriptDir = dir:
    import (pkgs.stdenv.mkDerivation {
      name = "purescript-compiled.nix";

      buildCommand = ''
        TODO '${dir}' > $out
      '';

      buildInputs = [ pkgs.purenix ];
    }).nixosModule;

    # Compile this with `spago build`
    resultFile = ./output/Main/default.nix;
    purescript-module = args: {
      config = (import resultFile).nixosModule args;
      _file = resultFile;
    };
in {
  imports = [ purescript-module ];
}
