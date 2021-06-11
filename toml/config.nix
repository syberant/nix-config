{ lib, ... }:

with lib;
with builtins;

let 
  fromFile = file: fromTOML (readFile (./config + "/${file}"));
  files = attrNames (readDir ./config);
in mkMerge (map fromFile files)
