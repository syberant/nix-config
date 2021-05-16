{ pkgs, ... }:

{
  telescope.enable = true;

  output.extraConfig = ''
    lua <<EOF

    local actions = require('telescope.actions')
    require('telescope').setup{
      defaults = {
        mappings = {
          i = {
            ["<esc>"] = actions.close
          },
        },
      }
    }

    EOF
  '';
}
