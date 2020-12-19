{ pkgs, nix-neovim, ... }:

let
  myNeovim = import nix-neovim {
    inherit pkgs;
    configuration = ./configuration.nix;
  };
in {
  home.packages = [ myNeovim ];
}
