{ pkgs, ... }:

{
	plugins = with pkgs.vimPlugins; [
		# Easy editing
		vim-trailing-whitespace
		vim-easymotion

		# Aesthetics
		lightline-vim
		colorizer

		# Colour theme
		gruvbox
	];

	code = builtins.readFile ./main.vim;
}
