{ pkgs, ... }:

{
  output.extraConfig = ''
    lua << EOF
      require('gitsigns').setup {
        -- Disable default keybindings
        keymaps = {},
      }
    EOF
  '';

  output.plugins = with pkgs.vimPlugins; [ gitsigns-nvim ];
  output.path.path = with pkgs; [ git ];
}
