# Largely copied from a great blog post:
# https://sharksforarms.dev/posts/neovim-rust/

{ pkgs, lib, config, ... }:

with lib;

let cfg = config.lsp;
in {
  options.lsp = { enable = mkEnableOption "LSP"; };

  config = mkIf cfg.enable {
    vim.opt = {
      completeopt = "menuone,noinsert,noselect";

      # Set updatetime for CursorHold
      # 300ms of no cursor movement to trigger CursorHold
      updatetime = 300;

      # have a fixed column for the diagnostics to appear in
      # this removes the jitter when warnings/errors flow in
      signcolumn = "yes";
    };

    # https://discourse.nixos.org/t/rust-src-not-found-and-other-misadventures-of-developing-rust-on-nixos/11570/2
    output.makeWrapper =
      "--set RUST_SRC_PATH ${pkgs.rust.packages.stable.rustPlatform.rustLibSrc}";

    output.config_file = ''
      set shortmess+=c

      lua <<EOF

      -- nvim_lsp object
      local nvim_lsp = require'lspconfig'

      -- function to attach completion when setting up lsp
      local on_attach = function(client)
          require'completion'.on_attach(client)
      end

      -- handle diagnostics
      -- https://github.com/nvim-lua/diagnostic-nvim/issues/73
      vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
        vim.lsp.diagnostic.on_publish_diagnostics, {
          virtual_text = true,
          signs = true,
          update_in_insert = false,
        }
      )

      -- Enable rust_analyzer
      ${optionalString config.languages.rust.enable ''
        nvim_lsp.rust_analyzer.setup({
          on_attach = on_attach,
          cmd = { "${pkgs.rust-analyzer}/bin/rust-analyzer" },
        })
      ''}

      EOF

      " Trigger completion with <Tab>
      inoremap <silent><expr> <TAB>
        \ pumvisible() ? "\<C-n>" :
        \ <SID>check_back_space() ? "\<TAB>" :
        \ completion#trigger_completion()

      function! s:check_back_space() abort
          let col = col('.') - 1
          return !col || getline('.')[col - 1]  =~ '\s'
      endfunction

      " Keybindings
      nnoremap <silent> K <cmd>lua vim.lsp.buf.hover()<CR>

      " Show diagnostic popup on cursor hold
      autocmd CursorHold * lua vim.lsp.diagnostic.show_line_diagnostics()

      " Enable type inlay hints
      autocmd CursorMoved,InsertLeave,BufEnter,BufWinEnter,TabEnter,BufWritePost *
      \ lua require'lsp_extensions'.inlay_hints{ prefix = "", highlight = "Comment" }
    '';

    output.plugins = with pkgs.vimPlugins; [
      nvim-lspconfig
      lsp_extensions-nvim
      completion-nvim
    ];

    output.path.path = with pkgs; [ cargo rustc rustfmt ];
  };
}
