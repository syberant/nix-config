{ config, pkgs, ... }:

{
	imports = [
		./emacs.nix
	];

	environment.systemPackages = with pkgs; [
		# Some defaults
		curl wget vim git tmux tree

		# Security
		gnupg
		#password-store

		# Development prerequisites
		gnumake gcc binutils

		# Personal development
		rustup

		# Personal choices
		neovim nnn lf st fzf unison

		# Replacements for defaults
		exa bat ripgrep

		# Fluff
		neofetch cmatrix

		# Utilities for UX
		sxhkd

		# Utilities for CLI UX
		fzf

		# Hardware debugging utilities
		pciutils usbutils

		# Programming languages
		python3

		# Graphical defaults
		firefox zathura signal-desktop

		# Productivity
		#texlive-combined-full-2018
	];
}
