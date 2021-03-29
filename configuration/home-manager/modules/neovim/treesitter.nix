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
            rev = "407ff057db0216afd3b36d8564980a13de9614e6";
            sha256 = "19l7vbp0hmcnqy5nikfyqy3qdk3a26j3jmcaypky959s1hy6kab9";
          };
        })
      ];
  };
}
