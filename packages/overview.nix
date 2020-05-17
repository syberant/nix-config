{ config, pkgs, ... }:

{
	imports = [
	];

	environment.systemPackages = with pkgs; [
		# Some defaults
		curl wget vim git tmux tree

		# Security
		gnupg
		pass

		# Development prerequisites
		gnumake gcc binutils

		# Personal development
        zeal tokei

		# Personal choices
		neovim nnn lf st unison yadm

		# Replacements for defaults
		exa bat ripgrep

		# Fluff
		neofetch cmatrix xdotool

        # Relaxing
        newsboat mpv

		# Utilities for UX
		sxhkd xorg.xrandr xcape

		# Utilities for CLI UX
		fzf tig entr

		# Hardware debugging utilities
		pciutils usbutils

        # Software debugging
        xorg.xev

		# Programming languages
		python3 rustup swift octave

		# Graphical defaults
		firefox zathura signal-desktop sxiv chromium thunderbird

		# Productivity
		texlive.combined.scheme-full
        anki
        unzip
        libreoffice
	] ++ [
        # Custom
        (import ./emacs.nix {inherit pkgs; })
    ];
}
