{ ... }:

{
  imports = [
    ./modules/dotfiles.nix

    ./modules/bash.nix
    ./modules/firefox.nix
    ./modules/fzf.nix
    ./modules/git.nix
    ./modules/neovim
    ./modules/mail.nix
    ./modules/mpv.nix
    ./modules/shell.nix
    ./modules/ssh.nix
    ./modules/tmux.nix
    ./modules/xdg.nix
    ./modules/z.nix
  ];
}
