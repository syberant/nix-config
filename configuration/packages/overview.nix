{ config, pkgs, ... }:

{
	imports = [
		./programs.nix
                ./git.nix
                ./home-manager.nix
	];

	environment.systemPackages = with pkgs; [
		# Some defaults
		curl wget vim git tree

		# Security
		gnupg
		pass

		# Development prerequisites
		gnumake gcc

		# Personal development
        zeal tokei myNeovim

		# Personal choices
		nnn lf st unison yadm

		# Replacements for defaults
		exa bat ripgrep

		# Fluff
		neofetch cmatrix xdotool htop

        # Relaxing
        newsboat

		# Utilities for UX
		xorg.xrandr redshift

		# Utilities for CLI UX
		fzf tig entr

		# Hardware debugging utilities
		pciutils usbutils

        # Software debugging
        xorg.xev

		# Programming languages
		python3 rustup swift octave

		# Graphical defaults
		zathura signal-desktop sxiv chromium thunderbird

		# Productivity
		texlive.combined.scheme-full
        anki
        unzip
        libreoffice
	] ++ [
        # Custom
        (import ./emacs.nix {inherit pkgs; })

	(pkgs.tmux.override {
		flags = [ "-f ${../dotfiles/tmux/tmux.conf}" ];
	})

	(pkgs.mpv.override {
		flags = [ "--config-dir=${../dotfiles/mpv}" ];
	})
    ];
}
