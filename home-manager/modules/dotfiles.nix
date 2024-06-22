{ config, ... }:

# TODO: find way to automatically link `linkFiles` to home
{
  home.file = let linkFiles = ../linkFiles;
  in {
    ".config" = {
      recursive = true;
      source = "${linkFiles}/.config";
    };

    ".gnupg" = {
      recursive = true;
      source = "${linkFiles}/.gnupg";
    };
  };
}
