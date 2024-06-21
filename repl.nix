{ flake, pkgs, nixpkgs-git }:

with pkgs.lib;

let
  joinPath = l: concatStringsSep "/" l;
  storePathPrefix = p: joinPath (lists.take 4 (splitString "/" p));
  storePathSuffix = p: joinPath (lists.drop 4 (splitString "/" p));
  getDeclarations = option: foldl (acc: x: recursiveUpdate acc { "${x.prefix}" = { "${x.suffix}" = x.value; };}) {} (map (v: { prefix = storePathPrefix v.file; suffix = storePathSuffix v.file; inherit (v) value; }) option.definitionsWithLocations);
in builtins.trace ''
  This REPL loads the following variables:
    - pkgs, stable version
    - nixpkgs-git, master branch, often breaks
    - flake, the complete flake
    - cfg.<host>, NixOS config of a particular host
      - Useful for double-checking whether options are set like you expect them to be
    - opt.<host>, NixOS options of a particular host
      - This provides information about how the module system processed your config.
      - See where values are set.

  It also provides the following convenience functions:
  - whoDefined <option>, check which files set this option
    - Example: `whoDefined opt.nixos-thinkpad.networking.networkmanager.enable`
  - whoDefinedWhat <option>, for each file that set this option see what they set it to
    - Example: `whoDefinedWhat opt.nixos-thinkpad.networking.networkmanager.enable`
"'' {
  inherit flake pkgs nixpkgs-git;

  cfg = mapAttrs (k: v: v.config) flake.outputs.nixosConfigurations;
  opt = mapAttrs (k: v: v.options) flake.outputs.nixosConfigurations;

  inherit getDeclarations;
  whoDefined = option: mapAttrs (k: v: attrNames v) (getDeclarations option);
  whoDefinedWhat = getDeclarations;
}
