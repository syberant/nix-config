# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ lib, pkgs, ... }:

with lib;
with pkgs.nur.repos.syberant.lib;

let
  importDhall = file:
    import (pkgs.stdenv.mkDerivation {
      name = "dhall-compiled.nix";

      buildCommand = ''
        dhall-to-nix <<< "${file}" > $out
      '';

      buildInputs = [ pkgs.dhall-nix ];
    });

  handlers = defaultHandlers // {
    dhall = file:
      let code = importDhall file;
      in if isFunction code then
      # TODO: Support setting `_file` here, needs NixOS module system changes.
      # Another option is disabling support for returning functions as Dhall modules.
        code
      else {
        _file = file;
        config = code;
      };
  };
  importFile = importFileWithHandler handlers;

  collectFiles = dir:
    getFiles {
      inherit dir;
      suffixes = [ "nix" "toml" "dhall" ];
    };

  importFiles = dir: map importFile (collectFiles dir);
in {
  imports = importFiles ./config ++ [
    ../home-manager
    ../modules
    ./secrets
    ./n-system-scripts
    ./purescript
  ];

  # Fixes bug with typo in maintainer name
  disabledModules = [ "services/misc/invidious-router.nix" ];
}
