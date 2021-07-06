{ pkgs, ... }:

{
  imports =
    [ ./lsp ./telescope.nix ./treesitter.nix ./vimtex.nix ];

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
  lsp.enable = true;
  treesitter.enable = true;

  vim-tmux-navigator.enable = true;

  base = {
    keybindings = {
      leader = "\\<space>";
      which-key-nvim = true;
    };

    options.set = {
      wrap = true;
      lbr = true;
    };

    search.enable = true;
    wrapping.enable = true;
    files.enable = true;
  };

  # output.plugins = with pkgs.vimPlugins; [];

  output.path.style = "impure";
  output.makeWrapper = "--set LUA_PATH '${./lua}/?.lua;;'";
  output.path.path = with pkgs; [ xclip ];

  output.extraConfig = ''
    " wrapping settings
    noremap <buffer> <silent> k gk
    noremap <buffer> <silent> j gj
    noremap <buffer> <silent> 0 g0
    noremap <buffer> <silent> $ g$

    " Better escaping? Don't exactly know why this is here.
    tnoremap <Esc> <c-\><c-n>
    inoremap <Esc> <Esc><Esc>

    " Keybindings
    :lua require'keybindings'

    " TODO: Set clipboard tool with g:clipboard
  '';

  base.timeoutlen = 400;
}
