# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ lib, pkgs, ... }:

with lib;
with pkgs.nur.repos.syberant.lib;

let
  importFile = importFileWithHandler defaultHandlers;

  collectFiles = dir:
    getFiles {
      inherit dir;
      suffixes = [ "nix" "toml" ];
    };

  importFiles = dir: map importFile (collectFiles dir);
in {
  imports = importFiles ./config ++ [
    ../home-manager
    ../modules
    ./secrets
    ./n-system-scripts
  ];
}
