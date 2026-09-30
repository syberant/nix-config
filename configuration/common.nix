# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{
  flake-inputs,
  lib,
  pkgs,
  ...
}:

with lib;

let
  lib-syberant = pkgs.nur.repos.syberant.lib;

  importFile = lib-syberant.importFileWithHandler lib-syberant.defaultHandlers;

  collectFiles =
    dir:
    lib-syberant.getFiles {
      inherit dir;
      suffixes = [
        "nix"
        "toml"
      ];
    };

  importFiles = dir: map importFile (collectFiles dir);
in
{
  imports =
    importFiles ./config
    ++ [
      ../home-manager
      ../modules
      ./secrets
      ./n-system-scripts
    ]
    ++ (with flake-inputs; [
      sops-nix.nixosModules.sops
      home-manager.nixosModules.home-manager
      impermanence.nixosModules.impermanence
    ]);
}
