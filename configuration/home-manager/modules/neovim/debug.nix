{ pkgs ? import <nixpkgs> { }, ... }:

let sources = import ../../../../nix/sources.nix;
in import sources.nix-neovim {
  inherit pkgs;
  configuration = ./configuration.nix;
}
