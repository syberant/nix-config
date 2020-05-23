{ pkgs, ... }:

{
	plugins = with pkgs.vimPlugins; [
		vim-pandoc-syntax
	];

	code = builtins.readFile ./markdown.vim;
}
