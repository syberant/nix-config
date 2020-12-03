{ pkgs, lib, config, ... }:

with lib;

let grammars = pkgs.tree-sitter.builtGrammars;
in {
  output.config_file = ''
    lua <<EOF
    -- Version mismatch right now...
    -- vim.treesitter.require_language("cpp", "${grammars.cpp}/parser")

    require'nvim-treesitter.configs'.setup {
      -- TODO: this does not install to the nix store
      ensure_installed = "maintained",
      highlight = { enable = true },
    }
    EOF
  '';

  output.plugins = with pkgs.vimPlugins;
    [
      (pkgs.vimUtils.buildVimPluginFrom2Nix {
        name = "nvim-treesitter";

        src = pkgs.fetchFromGitHub {
          owner = "nvim-treesitter";
          repo = "nvim-treesitter";
          rev = "6eca8d2f3860e7d76b0b524877c13206c2900b01";
          sha256 = "02am1iaa61nn9yrzq9rfvryz8wk3hnjacixzljk74dblc6n0bmii";
        };
      })
    ];
}
