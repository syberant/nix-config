{ pkgs, lib, config, ... }:

with lib;

let cfg = config.lsp;
in {
  options.lsp = { enable = mkEnableOption "LSP"; };

  config = mkIf cfg.enable {
    output.config_file = ''
      set completeopt=menuone,noinsert,noselect
      set shortmess+=c

      lua <<EOF

      -- nvim_lsp object
      local nvim_lsp = require'nvim_lsp'

      -- function to attach completion and diagnostics
      -- when setting up lsp
      local on_attach = function(client)
          require'completion'.on_attach(client)
          require'diagnostic'.on_attach(client)
      end

      -- Enable rust_analyzer
      ${optionalString config.languages.rust.enable ''
        nvim_lsp.rust_analyzer.setup({
          on_attach=on_attach;
          cmd={ "${pkgs.rust-analyzer}/bin/rust-analyzer" };
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

      " Visualize diagnostics
      let g:diagnostic_enable_virtual_text = 1
      let g:diagnostic_trimmed_virtual_text = '40'
      " Don't show diagnostics while in insert mode
      let g:diagnostic_insert_delay = 1

      " Set updatetime for CursorHold
      " 300ms of no cursor movement to trigger CursorHold
      set updatetime=300
      " Show diagnostic popup on cursor hold
      autocmd CursorHold * lua vim.lsp.util.show_line_diagnostics()

      " Enable type inlay hints
      autocmd CursorMoved,InsertLeave,BufEnter,BufWinEnter,TabEnter,BufWritePost *
      \ lua require'lsp_extensions'.inlay_hints{ prefix = "", highlight = "Comment" }
    '';

    output.plugins = with pkgs.vimPlugins; [
      nvim-lspconfig
      (pkgs.callPackage ./completion-nvim.nix { })
      (pkgs.callPackage ./diagnostic-nvim.nix { })
      (pkgs.callPackage ./lsp_extensions.nix { })
    ];
  };
}
