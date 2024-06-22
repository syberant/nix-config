# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ self, ... }:

{
  imports = [
    ../desktop-environment
    ../home-manager
    ../toml
    ../modules
    ./secrets
    ./n-system-scripts
  ];

  # Let 'nixos-version --json' know about the Git revision of this flake.
  system.configurationRevision = self.rev or "dirty";
}
