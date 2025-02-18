{ pkgs, ... }:

# This configures support for the Lean theorem prover

{
  output.plugins = with pkgs.vimPlugins; [lean-nvim];

  plugin.setup.lean = {
    mappings = true;
  };
}
