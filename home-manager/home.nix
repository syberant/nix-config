{ pkgs, ... }:

{
  imports = pkgs.nur.repos.syberant.lib.getNixFiles ./modules;
}
