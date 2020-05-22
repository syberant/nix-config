# Based on a config largely copied from https://github.com/splintah/dotfiles/blob/master/vim/vimrc
# at 2018/07/10

{ pkgs, ... }:

pkgs.neovim.override {
    configure = {
        packages.myVimPackage = with pkgs.vimPlugins; {
            start = [
                # Easy editing
                vim-trailing-whitespace
                vim-easymotion

                # Aesthetics
                lightline-vim

                    # Focus mode
                    #limelight-vim
                    #goyo

                # Colour theme
                gruvbox
                colorizer
                seoul256-vim

		# Markdown
		vim-pandoc-syntax
            ];
        };

        customRC =
            builtins.readFile "${./main.vim}" +
            builtins.readFile "${./markdown.vim}";
    };
}
