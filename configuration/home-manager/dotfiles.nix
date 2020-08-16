{ config, ... }:

# TODO: find way to automatically link `linkFiles` to home
{
  home-manager.users.sybrand.home.file.".config" = {
    recursive = true;
    source = ../linkFiles/.config;
  };

  home-manager.users.sybrand.home.file.".gnupg" = {
    recursive = true;
    source = ../linkFiles/.gnupg;
  };

  home-manager.users.sybrand.home.file.".unison" = {
    recursive = true;
    source = ../linkFiles/.unison;
  };
}
