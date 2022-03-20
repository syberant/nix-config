{ pkgs, lib, config, ... }:

{
  vim.keybindings.keybindings-shortened."<leader>fk" = {
    command =
      ":lua require'telescope'.extensions.file_browser.file_browser(require'telescope.themes'.get_ivy({ initial_mode = 'normal', default_selection_index = 2, }))<CR>";
    label = "Browse Files";
  };

  output.extraConfig = ''
    lua << EOF
      local tele = require'telescope'
      local fba = tele.extensions.file_browser.actions
      local tla = require'telescope.actions'

      tele.setup {
        extensions = {
          file_browser = {
            mappings = {
              ["n"] = {
                  ["h"] = fba.goto_parent_dir,
                  ["l"] = tla.select_default,
                  ["e"] = tla.select_default,

                  -- Misc
                  ["zh"] = fba.toggle_hidden,
                  ["~"] = fba.goto_home_dir,
                  ["`"] = fba.goto_cwd,
                  ["="] = fba.change_cwd,
              },
            }
          }
        }
      }

      tele.load_extension("file_browser")
    EOF
  '';

  output.plugins = with pkgs.vimPlugins;
    [
      (pkgs.vimUtils.buildVimPlugin {
        name = "telescope-file-browser-nvim";
        namePrefix = "";

        src = pkgs.fetchFromGitHub {
          owner = "nvim-telescope";
          repo = "telescope-file-browser.nvim";
          rev = "84efd93ec772696c1cce2aada4d39f2756953964";
          sha256 = "sha256-E36Bu5zdojCj5M0thRfRL7BEtqFs/vruKQinbIloQ9g=";
        };

        # Get nvim's ShaDa file in a writable location
        XDG_DATA_HOME = "/build/tmp";

        # Needed for executing lua scripts
        nativeBuildInputs = with pkgs; [ neovim ];
      })
    ];
}
