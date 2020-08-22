{ config, ... }:

# TODO: find way to automatically link `linkFiles` to home
{
  home.file = {
    ".config" = {
      recursive = true;
      source = ../linkFiles/.config;
    };

    ".gnupg" = {
      recursive = true;
      source = ../linkFiles/.gnupg;
    };

    ".unison" = {
      recursive = true;
      source = ../linkFiles/.unison;
    };
  };
}
