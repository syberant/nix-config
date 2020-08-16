# Based on a config largely copied from https://github.com/splintah/dotfiles/blob/master/vim/vimrc
# at 2018/07/10

{ pkgs, ... }:

pkgs.neovim.override {
  configure = let
    modules = [
      (import ./modules/main.nix { inherit pkgs; })
      (import ./modules/markdown.nix { inherit pkgs; })
      (import ./modules/nix.nix { inherit pkgs; })
      (import ./modules/rust.nix { inherit pkgs; })
    ];
    plugins = builtins.foldl' (a: b: a ++ b.plugins) [ ] modules;
    code = builtins.foldl' (a: b: a + "\n" + b.code) "" modules;
  in {
    packages.myVimPackage.start = plugins;

    customRC = code;
  };
}
