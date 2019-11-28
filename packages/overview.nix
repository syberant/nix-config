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

		# Personal choices
		neovim nnn lf st unison yadm

		# Replacements for defaults
		exa bat ripgrep

		# Fluff
		neofetch cmatrix

		# Utilities for UX
		sxhkd

		# Utilities for CLI UX
		fzf tig

		# Hardware debugging utilities
		pciutils usbutils

		# Programming languages
		python3 rustup swift

		# Graphical defaults
		firefox zathura signal-desktop sxiv

		# Productivity
		texlive.combined.scheme-full
	] ++ [
        # Custom
        (import ./emacs.nix {inherit pkgs; })
    ];
}
