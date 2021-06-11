{ lib, ... }:

with lib;

fromTOML (readFile ./config.toml)
