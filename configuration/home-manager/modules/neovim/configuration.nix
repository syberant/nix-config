{ pkgs, ... }:

{
  imports = [ ./lsp ./treesitter.nix ./vimtex.nix ];

  languages = {
    nix.enable = true;
    haskell.enable = true;
    rust.enable = true;
  };
  neoformat.enable = true;
  lightline.enable = true;
  colourscheme.gruvbox.enable = true;
  nerdcommenter.enable = true;
  gitgutter.enable = true;
  vim-surround.enable = true;
  vim-which-key = {
    enable = true;
    showkeys = [ "<Space>" ];
  };
  lsp.enable = true;
  treesitter.enable = true;

  base = {
    leader = "\\<space>";

    search.enable = true;
    wrapping.enable = true;
    files.enable = true;
  };

  output.package = pkgs.neovim-nightly;

  output.plugins = with pkgs.vimPlugins; [ fzf-vim fzfWrapper ];

  output.path = pkgs.stdenv.initialPath;

  output.extraConfig = ''
    map <leader>; <Plug>NERDCommenterToggle

    set timeoutlen=300

    " wrapping settings
    set wrap lbr
    noremap <buffer> <silent> k gk
    noremap <buffer> <silent> j gj
    noremap <buffer> <silent> 0 g0
    noremap <buffer> <silent> $ g$

    " Better escaping? Don't exactly know why this is here.
    tnoremap <Esc> <c-\><c-n>
    inoremap <Esc> <Esc><Esc>
  '' + builtins.readFile ./keybindings.vim;
}
