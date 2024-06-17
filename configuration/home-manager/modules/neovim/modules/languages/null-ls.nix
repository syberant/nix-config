{ pkgs, lib, config, ... }:

with lib;

{
  output.plugins = with pkgs.vimPlugins; [ null-ls-nvim plenary-nvim ];

  output.config_file = ''
    lua << EOF
      local n = require'null-ls'

      local h = require("null-ls.helpers")
      local methods = require("null-ls.methods")
      local FORMATTING = methods.internal.FORMATTING

      -- See https://github.com/jose-elias-alvarez/null-ls.nvim/blob/4eb2fa8db8654508ea8b6e836736a25efaa6609a/lua/null-ls/builtins/formatting/fourmolu.lua
      -- TODO: figure out if this is indeed how you're supposed to do it and upstream
      local stylish_haskell = h.make_builtin({
          name = "stylish-haskell",
          meta = {
              url = "https://github.com/haskell/stylish-haskell",
              description = "Haskell code prettifier",
          },
          method = FORMATTING,
          filetypes = { "haskell" },
          generator_opts = {
              command = "stylish-haskell",
              to_stdin = true,
          },
          factory = h.formatter_factory,
      })

      n.setup({
        sources = {
          n.builtins.formatting.stylua,
          n.builtins.formatting.rustfmt,
          n.builtins.formatting.nixfmt,
          stylish_haskell,
          -- https://github.com/jose-elias-alvarez/null-ls.nvim/issues/640
          n.builtins.formatting.black.with({ args = { "--quiet", "-" }, }),
        },
      })
    EOF
  '';

  output.path.path = with pkgs; [
    # Formatters
    stylua
    stylish-haskell
    nixfmt-classic
    rustfmt
    black

    # Linters
  ];
}
