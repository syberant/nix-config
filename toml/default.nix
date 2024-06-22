{ lib, pkgs, nixpkgs-git, ... }:

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
  imports = importFiles ./config;

  environment.systemPackages = let
    ofPkgs = p: getAttrFromPath (splitString "." p) pkgs;
    fromList = { file, packages }:
      map ofPkgs (fromTOML (readFile file)).packages;
  in flatten (map fromList [
    {
      file = ./unstable.toml;
      packages = nixpkgs-git;
    }
  ]);
}
