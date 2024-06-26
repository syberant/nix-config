# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ self, lib, pkgs, config, ... }:

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
  importFile = importFileWithHandler defaultHandlers;

  importFiles = dir: map importFile (getNixTomlJsonFiles dir);
in {
  imports = importFiles ./config ++ [
    ../desktop-environment
    ../home-manager
    ../modules
    ./secrets
    ./n-system-scripts
    (handlers.dhall ./surf.dhall)
  ];

  nix = {
    # Disable using `nix-channel`
    channel.enable = false;
  };

  # Let 'nixos-version --json' know about the Git revision of this flake.
  system.configurationRevision = self.rev or "dirty";

  system.nixos = {
    # Set label in GRUB to first 7 characters of the git hash of the last commit.
    label = let
      abbreviate = s: concatStrings (take 7 (stringToCharacters s));
    in abbreviate config.system.configurationRevision;

    # Use tags to keep track of features, these will also be shown in GRUB
    # tags = [ "tag1" "tag2" ];
  };
}
