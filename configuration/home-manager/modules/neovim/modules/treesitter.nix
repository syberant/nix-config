{ pkgs, lib, config, ... }:

with lib;

let
  cfg = config.treesitter;
  grammars = pkgs.tree-sitter.builtGrammars;
in {
  options.treesitter.enable = mkEnableOption "tree-sitter";

  config = mkIf cfg.enable {
    output.config_file = ''
      lua <<EOF
      require'nvim-treesitter.configs'.setup {
        highlight = { enable = true },
      }
      EOF
    '';

    output.plugins = with pkgs.vimPlugins;
      [ (nvim-treesitter.withPlugins (_: pkgs.tree-sitter.allGrammars)) ];
  };
}
