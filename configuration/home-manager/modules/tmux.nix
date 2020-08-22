{ pkgs, ... }:

{
  programs.tmux = {
    enable = true;

    clock24 = true;

    plugins = with pkgs; [
      {
        plugin = tmuxPlugins.resurrect;
        extraConfig = ''
          set -g @resurrect-capture-pane-contents 'on'
        '';
      }

      {
        plugin = tmuxPlugins.continuum;
        extraConfig = ''
          set -g @continuum-restore 'on'
          set -g @continuum-save-interval '10' # Minutes
        '';
      }
    ];

    # Keybindings
    keyMode = "vi";
    shortcut = "a";

    extraConfig = ''
      # More friendly split pane
      bind-key h split-window -h
      bind-key v split-window -v

      # Use vim-like keybindings for copying
      bind P paste-buffer
      bind-key -T copy-mode-vi v send-keys -X begin-selection
      bind-key -T copy-mode-vi y send-keys -X copy-selection
      bind-key -T copy-mode-vi r send-keys -X rectangle-toggle

      # Remove delay when pressing Esc
      # http://superuser.com/a/252717/65504
      set -sg escape-time 0
    '';
  };
}
