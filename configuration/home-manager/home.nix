{ ... }:

{
  imports = [
    ./modules/dotfiles.nix

    ./modules/bash.nix
    ./modules/firefox.nix
    ./modules/fzf.nix
    ./modules/git.nix
    ./modules/shell.nix
    ./modules/ssh.nix
    ./modules/xdg.nix
  ];
}
