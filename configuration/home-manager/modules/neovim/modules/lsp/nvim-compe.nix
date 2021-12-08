{ pkgs, ... }:

{
  output.plugins = with pkgs.vimPlugins; [
    nvim-compe

    (pkgs.vimUtils.buildVimPlugin {
      name = "compe-tmux";
      src = pkgs.fetchFromGitHub {
        owner = "andersevenrud";
        repo = "compe-tmux";
        rev = "d0256c802411e0e76c979e2b7e150f4f8a71a6b0";
        sha256 = "vd4kUhYrDuVBCJMBNuX5EGzg2RC1mKK2bcKlPLfzObM=";
      };

      configurePhase = ''
        substituteInPlace lua/compe_tmux/utils.lua --replace 'c ~= nil' 'c ~= nil and c.source ~= nil'
      '';
    })
  ];

  vim.keybindings.keybindings-shortened = {
    "<cr>" = {
      mode = "i";
      options.expr = true;
      command = "compe#confirm('<cr>')";
    };
  };

  plugin.setup.compe = {
    enabled = true;
    source = {
      path = true;
      buffer = true;
      calc = true;
      nvim_lsp = true;
      nvim_lua = true;
      tmux = {
        # Disabling for now because it caused nvim to crash in tmate
        disabled = true;
        all_panes = true;
        kind = "";
      };
    };
  };
}
