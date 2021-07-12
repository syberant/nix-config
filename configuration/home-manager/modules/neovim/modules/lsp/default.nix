# Largely copied from a great blog post:
# https://sharksforarms.dev/posts/neovim-rust/

{ pkgs, lib, config, ... }:

with lib;

{
  imports = [ ./nvim-compe.nix ];

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

  vim.g.lightline.component_expand.lsp_status = "LspStatus";
  vim.g.lightline.active.right = mkAfter [ [ "lsp_status" ] ];

  # https://discourse.nixos.org/t/rust-src-not-found-and-other-misadventures-of-developing-rust-on-nixos/11570/2
  output.makeWrapper = mkIf config.languages.rust.enable
    "--set RUST_SRC_PATH ${pkgs.rust.packages.stable.rustPlatform.rustLibSrc}";

  output.config_file = ''
    set shortmess+=c

    lua <<EOF
    -- lsp_status
    local lsp_status = require('lsp-status')
    lsp_status.config({
      status_symbol = "",
      current_function = false,
      -- indicator_errors = 'E',
      -- indicator_warnings = 'W',
      -- indicator_info = 'i',
      -- indicator_hint = '?',
      -- indicator_ok = '好',
    })
    lsp_status.register_progress()

    function on_attach(client)
      lsp_status.on_attach(client)
    end

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
        on_attach = on_attach,
        capabilities = lsp_status.capabilities,
      })
    ''}

    ${optionalString config.languages.nix.enable ''
      nvim_lsp.rnix.setup({
        on_attach = on_attach,
        capabilities = lsp_status.capabilities,
      })
    ''}
    EOF

    " Statusline
    function! LspStatus() abort
      if luaeval('#vim.lsp.buf_get_clients() > 0')
        return luaeval("require('lsp-status').status()")
      endif
      return ""
    endfunction
    autocmd InsertLeave,BufEnter,BufWritePost * call lightline#update()
    autocmd User LspDiagnosticsChanged call lightline#update()

    " Show diagnostic popup on cursor hold
    autocmd CursorHold * lua vim.lsp.diagnostic.show_line_diagnostics()

    " Enable type inlay hints
    autocmd CursorMoved,InsertLeave,BufEnter,BufWinEnter,TabEnter,BufWritePost *
    \ lua require'lsp_extensions'.inlay_hints{ prefix = "", highlight = "Comment" }
  '';

  output.plugins = with pkgs.vimPlugins; [
    nvim-lspconfig
    lsp_extensions-nvim
    lsp-status-nvim
  ];

  output.path.path = with pkgs;
    optionals config.languages.rust.enable [ cargo rustc rustfmt ]
    ++ optionals config.languages.nix.enable [ rnix-lsp ];
}
