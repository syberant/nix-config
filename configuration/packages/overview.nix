{ config, pkgs, ... }:

let
  sources = import ../../nix/sources.nix;
  nixpkgs-git = import sources.nixpkgs-git { config.allowUnfree = true; };
in {
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
    myNeovim
    niv
    # For codecup
    nur.repos.syberant.caia

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
    du-dust

    # Fluff
    neofetch
    cmatrix
    xdotool
    htop
    ytop

    # Relaxing
    newsboat
    mpv

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
    # rustc cargo
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

    # Proprietary stuff
    nixpkgs-git.discord
  ];
}
