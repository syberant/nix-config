# Largely copied from a great blog post:
# https://sharksforarms.dev/posts/neovim-rust/

{ pkgs, lib, config, ... }:

with lib;

{
  vim.opt = {
    completeopt = "menuone,noinsert,noselect";

    # Set updatetime for CursorHold
    # 300ms of no cursor movement to trigger CursorHold
    updatetime = 300;

    # have a fixed column for the diagnostics to appear in
    # this removes the jitter when warnings/errors flow in
    signcolumn = "yes";
  };

  vim.keybindings.keybindings-shortened = {
    "K" = { command = "<cmd>lua vim.lsp.buf.hover()<cr>"; };
  };

  # https://discourse.nixos.org/t/rust-src-not-found-and-other-misadventures-of-developing-rust-on-nixos/11570/2
  output.makeWrapper =
    "--set RUST_SRC_PATH ${pkgs.rust.packages.stable.rustPlatform.rustLibSrc}";

  output.config_file = ''
    set shortmess+=c

    lua <<EOF

    -- nvim_lsp object
    local nvim_lsp = require'lspconfig'

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
        cmd = { "${pkgs.rust-analyzer}/bin/rust-analyzer" },
      })
    ''}
    EOF

    " Show diagnostic popup on cursor hold
    autocmd CursorHold * lua vim.lsp.diagnostic.show_line_diagnostics()

    " Enable type inlay hints
    autocmd CursorMoved,InsertLeave,BufEnter,BufWinEnter,TabEnter,BufWritePost *
    \ lua require'lsp_extensions'.inlay_hints{ prefix = "", highlight = "Comment" }
  '';

  output.plugins = with pkgs.vimPlugins; [
    nvim-lspconfig
    lsp_extensions-nvim
  ];

  output.path.path = with pkgs; [ cargo rustc rustfmt ];
}
