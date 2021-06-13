{ lib, options, pkgs, ... }:

with lib;
with builtins;

let
  # getNestedAttr :: Attr -> [ String ] -> Option<Any>
  getNestedAttr = foldl' (state: arg: state.${arg} or null);
  # ofPkgs :: String -> package
  ofPkgs = p:
    let package = getNestedAttr pkgs (splitString "." p);
    in if package == null then throw "Could not unpack `pkgs.${p}` declared in a TOML file, pkgs doesn't have that attribute." else package;

  # Does special processing so strings can be used to configure options requiring packages.
  mapTypeLeaf = { value, opts }:
    let
      type = opts.type or null;
      description = type.description or null;
    in if type == types.package then
    # value :: package
      ofPkgs value
    else if description == "list of packages" then
    # TODO: proper typechecking, Nix's equality operator doesn't work here
    # value :: [ package ]
      map ofPkgs value
    else if description == "list of paths" then
    # TODO: proper typechecking, Nix's equality operator doesn't work here
    # value :: [ path ]
    # Used by some (e.g. fonts.fonts) instead of `listOf packages`
      map ofPkgs value
    else
    # Some other type, no need to use pkgs here.
      value;
  mapTOMLConfig = set:
    let
      rec_map = name_path: value:
        mapTypeLeaf {
          inherit value;
          opts = getNestedAttr options name_path;
        };
    in mapAttrsRecursive rec_map set;

  fromFile = file:
    let
      path = ./config + "/${file}";
      rawSet = fromTOML (readFile path);
      set = addErrorContext
        "while parsing TOML file '${path}' (try fixing your syntax):" rawSet;
      mapped = mapTOMLConfig set;
      config =
        addErrorContext "while doing special processing on TOML file '${path}':"
        mapped;
    in { ... }: {
      inherit config;

      # Set the file that generates this module, useful for debugging.
      # `nixos-rebuild` uses this to tell you where an error occurred like so:
      # … while evaluating definitions from `/nix/store/1wgf129l46kvrcnac6bsfazjf08df54f-fonts.toml':
      _file = path;
    };
  files = attrNames (readDir ./config);
in {
  # TODO: Output generated configuration somewhere for transparency
  imports = map fromFile files;
}
