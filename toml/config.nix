{ lib, options, pkgs, ... }:

with lib;
with builtins;

let
  getNestedAttr = p: list:
    if !(hasAttr (head list) p) then
      null
    else
      let
        h = p.${head list};
        t = tail list;
      in if (t == [ ]) then h else getNestedAttr h t;
  ofPkgs = p: getNestedAttr pkgs (splitString "." p);

  mapTypeLeaf = { value, opts }:
    if opts.type == types.package then
    # value :: package
      ofPkgs value
    else if opts.type.description == "list of packages" then
    # TODO: proper typechecking, Nix's equality doesn't work here
    # value :: [ package ]
      map ofPkgs value
    else if opts.type.description == "list of paths" then
    # TODO: proper typechecking, Nix's equality doesn't work here
    # value :: [ path ]
    # Used by some (e.g. fonts.fonts) instead of `listOf packages`
      map ofPkgs value
    else
    # Some other type, no need to use pkgs here.
      value;
  mapValue = { value, opts }@attrs:
    if opts ? type then mapTypeLeaf attrs else value;
  mapTOMLConfig = set:
    let
      rec_map = name_path: value:
        mapValue {
          inherit value;
          opts = getNestedAttr options name_path;
        };
    in mapAttrsRecursive rec_map set;

  fromFile = file: mapTOMLConfig (fromTOML (readFile (./config + "/${file}")));
  files = attrNames (readDir ./config);
in {
  # TODO: Output generated configuration for transparency
  # TODO: Add context for better error messages
  config = mkMerge (map fromFile files);
}
