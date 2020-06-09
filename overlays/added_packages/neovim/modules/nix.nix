{ pkgs, ... }:

{
	plugins = with pkgs.vimPlugins; [
		vim-nix
	];

	code = "";
}
