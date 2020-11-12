{ pkgs, ... }:

let
  sources = import ../../../../nix/sources.nix;
  myNeovim = import sources.nix-neovim {
    inherit pkgs;
    configuration = ./configuration.nix;
  };
in {
  home.packages = [ myNeovim ];
}
# in { }
