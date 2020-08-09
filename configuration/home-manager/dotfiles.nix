{ config, ... }:

{
  home-manager.users.sybrand.home.file.".config" = {
    recursive = true;
    source = ../linkFiles/.config;
  };

  home-manager.users.sybrand.home.file.".gnupg" = {
    recursive = true;
    source = ../linkFiles/.gnupg;
  };
}
