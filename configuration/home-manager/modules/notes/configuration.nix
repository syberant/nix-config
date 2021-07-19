{ pkgs, lib, ... }:

with lib;
with builtins;

let notes_path = "/home/sybrand/Notities/Zettelkasten";
in {
  colourscheme.gruvbox.enable = true;

  vim.g = {
    vimwiki_list = [{
      path = notes_path;
      syntax = "markdown";
      ext = ".md";
      nested_syntaxes = {
        # These are in addition to the syntaxes already known to vim.
        "c++" = "cpp";
      };
      # custom_wiki2html = "script.sh";
    }];
    vimwiki_filetypes = [ "markdown" "pandoc" ];

    # Pandoc syntax highlighting
    "pandoc#syntax#conceal#urls" = 1;
    "pandoc#syntax#codeblocks#embeds#langs" = [ "python" "cpp" "haskell" "bash=sh" ];
  };

  vim.opt = {
    wrap = true;
    lbr = true;
    timeoutlen = 400;

    # Let `gf` and other vim builtins find my notes
    suffixesadd = ".md";
  };

  vim.keybindings = {
    leader = " ";

    keybindings."<leader>" = {
      "fo" = { command = "<cmd>Telescope find_files<cr>"; };
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

  output.plugins = with pkgs.vimPlugins; [ telescope-nvim vimwiki vim-pandoc-syntax ];

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

    EOF

    " Cd into notes directory
    cd ${notes_path}

    " Open todo list aggregator
    " TODO: fix this so the filetype loads correctly in a less hacky way
    autocmd VimEnter * edit 202106252212-todo-lists.md | setlocal ft=vimwiki.markdown.pandoc
  '';
}