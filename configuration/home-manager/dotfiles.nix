{ config, ... }:

{
  home-manager.users.sybrand.home.file."\.config" = {
    recursive = true;
    source = ../linkFiles/.config;
  };
}
