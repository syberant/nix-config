# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ self, lib, pkgs, ... }:

with lib;
with pkgs.nur.repos.syberant.lib;

let
  getFiles = { dir, suffixes ? [], recursive ? false, allow_default ? true }:
    let
      hasDefault = d: hasAttr "default.nix" (builtins.readDir (dir + "/${d}"));
      isImportable = name: kind:
        if kind == "directory" then
          recursive || (allow_default && hasDefault name)
        else
          lists.any (v: hasSuffix v name) suffixes;
      files = attrNames (filterAttrs isImportable (builtins.readDir dir));
    in map (f: dir + "/${f}") files;
  getAllFiles = dir: getFiles { inherit dir; suffixes = [ "nix" "toml" ]; recursive = true; };

  importFile = file:
    if hasSuffix "toml" file then
        importToml file
      else if hasSuffix "nix" file then
        file
      else throw "Unrecognized module file type '${file}', only 'nix' and 'toml' are allowed.";
  importFiles = dir: map importFile (getAllFiles dir);
in {
  imports = importFiles ./config ++ [
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
