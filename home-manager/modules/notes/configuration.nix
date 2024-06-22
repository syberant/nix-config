{ pkgs, lib, ... }:

with lib;
with builtins;

let notes_path = "/home/sybrand/Notities/Zettelkasten";
in {
  imports = [ ../neovim/modules/base.nix ../neovim/modules/visual/colourscheme.nix ] ++ [ ./compe.nix ];

  vim.g = {
    # vimwiki_list = [{
      # path = notes_path;
      # syntax = "markdown";
      # ext = ".md";
      # nested_syntaxes = {
        # # These are in addition to the syntaxes already known to vim.
        # "c++" = "cpp";
      # };
      # # custom_wiki2html = "script.sh";
      # auto_diary_index = 1;
    # }];
    # vimwiki_filetypes = [ "markdown" "pandoc" ];

    # # Pandoc syntax highlighting
    # "pandoc#syntax#conceal#urls" = 1;
    # "pandoc#syntax#codeblocks#embeds#langs" =
      # [ "python" "cpp" "haskell" "bash=sh" ];
  };

  vim.opt = {
    wrap = true;
    lbr = true;
    timeoutlen = 400;

    # Let `gf` and other vim builtins find my notes
    suffixesadd = ".md";
  };

  plugin.setup.telekasten = rec {
    home = notes_path;
    dailies = "${home}/daily";
    weeklies = "${home}/weekly";
    templates = "${home}/templates";

    tag_notation = "#tag";

    # BUG: https://github.com/renerocksai/telekasten.nvim/issues/95
    subdirs_in_links = false;
  };

  vim.keybindings = {
    leader = " ";
    which-key-nvim = true;

    keybindings."<leader>" = {
      wc = {
        command = "<cmd>execute 'edit ' . strftime('%Y%m%d%H%M.md')<cr>";
        label = "New Note";
      };

      "fo" = { command = "<cmd>lua require'zettelescope'.find_zettel() <cr>"; };
      "f/" = { command = "<cmd>Telescope live_grep<cr>"; };
    };

    # Quick and dirty general keybindings
    keybindings-shortened = {
      k = { command = "gk"; };
      j = { command = "gj"; };
      "0" = { command = "g0"; };
      "$" = { command = "g$"; };
    };
  };

  output.plugins = with pkgs.vimPlugins; [
    telescope-nvim
    # vimwiki
    # vim-pandoc-syntax

    (pkgs.vimUtils.buildVimPlugin {
      name = "telekasten.nvim";
      src = pkgs.fetchFromGitHub {
        owner = "renerocksai";
        repo = "telekasten.nvim";
        rev = "d4321a834828ab8bc4704eb3f6f982ba026b84a8";
        sha256 = "sha256-Uj86EwtZy99duQ1lRw8m1gfCwvHSbTBpTYBz3ZgKzF0=";
      };
    })
  ];
  output.makeWrapper = "--set LUA_PATH '${./.}/?.lua;;'";

  output.path = {
    style = "pure";
    path = with pkgs; [ xclip fd ripgrep ];
  };

  output.extraConfig = ''
    lua << EOF

    -- Close telescope on <esc>
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

    -- Only start which-key.nvim for these keys
    -- I was getting sick and tired of it opening on random operators...
    require('which-key').setup {
      triggers = {"<leader>", "g", "z", "<C-w>"},
    }

    EOF

    " Automatically use "+ registry
    set clipboard+=unnamedplus

    " Cd into notes directory
    cd ${notes_path}

    " Open todo list aggregator
    " TODO: fix this so the filetype loads correctly in a less hacky way
    autocmd VimEnter * edit 202106252212-todo-lists.md | setlocal ft=vimwiki.markdown.pandoc
  '';
}
