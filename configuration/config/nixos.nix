{ self, config, pkgs, ... }:

with pkgs.lib;

{
  # Include a copy of the flake used to build a generation *inside* that generation
  # Accessible at /run/current-system/sw/share/self-flake/nested/dir
  environment = {
    # TODO: Fix mess with nested dir
    systemPackages = [ (pkgs.runCommand "nixos-configuration-flake" {} "mkdir -p $out/share/self-flake/nested/dir; cp -r ${self}/* $out/share/self-flake/nested/dir") ];
    pathsToLink = [ "/share/self-flake" ];
  };

  nix = {
    # Disable using `nix-channel`
    channel.enable = false;

    # Needed for `nix-shell` and `nix-build`
    nixPath = [ "nixpkgs=${pkgs.path}" ];
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
