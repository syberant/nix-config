# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ self, pkgs, config, lib, ... }:

{
  imports = with lib; with builtins; let
    hasDefault = d: hasAttr "default.nix" (readDir (./. + "/${d}"));
    isImportable = name: kind: if kind == "directory" then hasDefault name else hasSuffix ".nix" name && name != "common.nix";
    files = attrNames (filterAttrs isImportable (readDir ./.));
  in map (f: ./. + "/${f}") files ++ [
    ../toml
    ../modules/default.nix
  ];

  # Let 'nixos-version --json' know about the Git revision of this flake.
  system.configurationRevision = pkgs.lib.mkIf (self ? rev) self.rev;

  # hardware.opengl.driSupport32Bit = true;
  # services.xserver.layout = "us";
  # services.xserver.xkbOptions = "eurosign:e";

  # Disable shutdown on power key
  services.logind.extraConfig = ''
    HandlePowerKey=ignore
    HandleSuspendKey=ignore
  '';

  # This value determines the NixOS release with which your system is to be
  # compatible, in order to avoid breaking some software such as database
  # servers. You should change this only after NixOS release notes say you
  # should.
  system.stateVersion = "19.09"; # Did you read the comment?
}
