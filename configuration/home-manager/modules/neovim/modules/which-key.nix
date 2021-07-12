{ pkgs, ... }:

{
  vim.keybindings.which-key-nvim = true;

  output.extraConfig = ''
    lua << EOF
      require('which-key').setup {
        -- Only start which-key.nvim for these keys
        -- I was getting sick and tired of it opening on random operators...
        triggers = {"<leader>", "g", "z", "<C-w>"},
      }
    EOF
  '';
}
