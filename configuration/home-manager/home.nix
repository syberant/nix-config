{ lib, ... }:

{
  imports = with lib; with builtins; let
    dir = ./modules;
    hasDefault = d: hasAttr "default.nix" (readDir (dir + "/${d}"));
    isImportable = name: kind: if kind == "directory" then hasDefault name else hasSuffix ".nix" name;
    files = attrNames (filterAttrs isImportable (readDir dir));
  in map (f: dir + "/${f}") files;
}
