{ config, pkgs, ... }:

{
  imports = [ ./programs.nix ./git.nix ./home-manager.nix ];

  environment.systemPackages = with pkgs;
    [
      # Some defaults
      curl
      wget
      vim
      git
      tree

      # Security
      gnupg
      pass

      # Development prerequisites
      gnumake
      gcc

      # Personal development
      zeal
      tokei
      myNeovim
      niv

      # Personal choices
      nnn
      lf
      st
      unison
      yadm

      # Rust coreutils
      lsd
      bat
      ripgrep
      fd
      dust

      # Fluff
      neofetch
      cmatrix
      xdotool
      htop
      ytop

      # Relaxing
      newsboat

      # Utilities for UX
      xorg.xrandr
      redshift

      # Utilities for CLI UX
      fzf
      tig
      entr
      starship

      # Hardware debugging utilities
      pciutils
      usbutils

      # Software debugging
      xorg.xev

      # Programming languages
      python3
      rustup
      octave
      #swift # Doesn't work on latest unstable

      # Formatters
      nixfmt

      # Graphical defaults
      zathura
      signal-desktop
      sxiv
      chromium
      thunderbird

      # Productivity
      texlive.combined.scheme-full
      anki
      unzip
      libreoffice
    ] ++ [
      # Custom
      (import ./emacs.nix { inherit pkgs; })

      (pkgs.tmux.override { flags = [ "-f ${../dotfiles/tmux/tmux.conf}" ]; })

      (pkgs.mpv.override { flags = [ "--config-dir=${../dotfiles/mpv}" ]; })
    ];
}
