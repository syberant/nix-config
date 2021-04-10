{ config, pkgs, nixpkgs-git, ... }:

{
  imports = [ ./programs.nix ];

  environment.systemPackages = with pkgs; [
    # Some defaults
    curl
    wget
    vim
    git
    tree
    tmux

    # Security
    gnupg
    pass

    # Development prerequisites
    gnumake
    gcc

    # Personal development
    zeal
    tokei
    niv

    # Personal choices
    nnn
    lf
    st
    yadm

    # Rust coreutils
    lsd
    bat
    ripgrep
    fd
    du-dust

    # Fluff
    neofetch
    cmatrix
    xdotool
    htop
    ytop

    # Relaxing
    newsboat
    nur.repos.syberant.ytfzf

    # Utilities for UX
    xorg.xrandr
    redshift

    # Utilities for CLI UX
    fzf
    tig
    entr
    starship
    poppler_utils

    # Hardware debugging utilities
    pciutils
    usbutils

    # Software debugging
    xorg.xev

    # Programming languages
    python3
    cargo
    octave
    #swift # Doesn't work on latest unstable

    # Formatters
    nixfmt
    rustfmt

    # Graphical defaults
    zathura
    signal-desktop
    sxiv
    chromium
    thunderbird
    scrot

    # Productivity
    texlive.combined.scheme-full
    pandoc
    anki
    unzip
    libreoffice
    okular # PDF Editor

    # Mathematics and other study-related programs
    geogebra6

    # Proprietary stuff
    nixpkgs-git.discord
  ];
}
