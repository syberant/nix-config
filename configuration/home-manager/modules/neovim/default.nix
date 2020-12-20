{ pkgs, nix-neovim, ... }:

let myNeovim = nix-neovim.fromConfig ./configuration.nix;
in { home.packages = [ myNeovim ]; }
