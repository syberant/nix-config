{ pkgs, ... }:

{
  imports = [ ./keybindings.nix ./lsp ./telescope.nix ./treesitter.nix ./vimtex.nix ];

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

    vim.opt = {
      wrap = true;
      lbr = true;
      timeoutlen = 400;
    };

  # base = {
    # search.enable = true;
    # wrapping.enable = true;
    # files.enable = true;
  # };

  # output.plugins = with pkgs.vimPlugins; [];

  output.path.style = "impure";
  output.makeWrapper = "--set LUA_PATH '${./lua}/?.lua;;'";
  output.path.path = with pkgs; [ xclip ];

  output.extraConfig = ''
    " Keybindings
    :lua require'keybindings'

    " TODO: Set clipboard tool with g:clipboard
  '';
}
