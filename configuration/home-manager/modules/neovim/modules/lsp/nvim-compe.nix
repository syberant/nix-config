{ pkgs, ... }:

{
  output.plugins = with pkgs.vimPlugins; [ nvim-compe ];

  vim.keybindings.keybindings-shortened = {
    "<cr>" = { mode = "i"; options.expr = true; command = "compe#confirm('<cr>')"; };
  };

  output.extraConfig = ''
    lua <<EOF

      require('compe').setup{
        enabled = true;
        source = {
          path = true;
          buffer = true;
          calc = true;
          nvim_lsp = true;
          nvim_lua = true;
        };
      }

    EOF
  '';
}
