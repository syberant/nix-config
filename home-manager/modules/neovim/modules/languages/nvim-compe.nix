{ pkgs, ... }:

{
  output.plugins = with pkgs.vimPlugins; [
    nvim-cmp

    # Various sources
    cmp-path
    cmp-buffer
    cmp-calc
    cmp-nvim-lua
    cmp-nvim-lsp
    cmp-latex-symbols
    cmp-tmux
  ];

  output.extraConfig = ''
    lua << EOF
    local cmp = require'cmp'
    local select_opts = {behavior = cmp.SelectBehavior.Select}

    cmp.setup {
      mapping = {
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({select = true}),
        ['<Tab>'] = cmp.mapping.confirm({select = true}),

        ['<C-u>'] = cmp.mapping.scroll_docs(-4),
        ['<C-d>'] = cmp.mapping.scroll_docs(4),

        ['<Up>'] = cmp.mapping.select_prev_item(select_opts),
        ['<Down>'] = cmp.mapping.select_next_item(select_opts),
        ['<C-p>'] = cmp.mapping.select_prev_item(select_opts),
        ['<C-n>'] = cmp.mapping.select_next_item(select_opts),
      }
    }
    EOF
  '';

  plugin.setup.cmp = {
    # TODO: maybe do non-default keybindings?
    # See :help cmp-mapping

    sources = [
      {
        name = "path";
        group_index = 1;
      }
      {
        name = "nvim_lsp";
        group_index = 1;
      }
      {
        name = "nvim_lua";
        group_index = 1;
      }
      {
        name = "latex_symbols";
        group_index = 1;
      }
      {
        name = "calc";
        group_index = 2;
      }
      {
        name = "buffer";
        group_index = 2;
      }
      {
        name = "tmux";
        option.all_panes = true;
        group_index = 3;
      }
    ];
  };
}
