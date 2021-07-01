{ lib, pkgs, ... }:

with pkgs.nur.repos.syberant.lib;

{
  # TODO: Output generated configuration somewhere for transparency
  imports = map importToml (getTomlFiles ./config);
}
