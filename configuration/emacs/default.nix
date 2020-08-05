{ pkgs, ... }:

{
  services.emacs = {
    enable = true;
    package = import ./package.nix { inherit pkgs; };
  };
}
