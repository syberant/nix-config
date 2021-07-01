{ pkgs, ... }:

{
  programs.tmux = {
    enable = true;

    clock24 = true;

    plugins = with pkgs.tmuxPlugins; [
      {
        plugin = resurrect;
        extraConfig = ''
          set -g @resurrect-capture-pane-contents 'on'
        '';
      }

      {
        plugin = continuum;
        extraConfig = ''
          set -g @continuum-restore 'on'
          set -g @continuum-save-interval '10' # Minutes
        '';
      }

      {
        plugin = vim-tmux-navigator;
        extraConfig = ''
          # https://github.com/christoomey/vim-tmux-navigator#restoring-clear-screen-c-l
          bind C-l send-keys 'C-l'
        '';
      }
    ];

    # Set TERM correctly, fixes colours
    terminal = "screen-256color";

    # Remove delay when pressing Esc
    # http://superuser.com/a/252717/65504
    escapeTime = 0;

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
    '';
  };
}
