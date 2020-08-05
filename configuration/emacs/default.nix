{ pkgs, ... }:

{
  services.emacs = {
    enable = true;
    package = import ./package.nix { inherit pkgs; };
  };

  home-manager.users.sybrand.home.file.".emacs" = {
    source = ../linkFiles/.config/emacs/init.el;
  };
}
