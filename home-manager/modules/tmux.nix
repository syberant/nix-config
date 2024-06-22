{ pkgs, ... }:

{
  # From: https://github.com/tmux-plugins/tmux-continuum/blob/master/scripts/handle_tmux_automatic_start/systemd_enable.sh
  # TODO: Fix flakiness and add save script
  systemd.user.services.tmux-server = {
    Unit = {
      Description = "tmux default session (detached)";
      Documentation = [ "man:tmux(1)" ];

    };

	Service = {
      Type="forking";
      Environment=["DISPLAY=:0"];
      ExecStart="${pkgs.tmux}/bin/tmux new-session -d";

      # ExecStop="${pkgs.tmuxPlugins.resurrect}/scripts/save.sh";
      ExecStop="${pkgs.tmux}/bin/tmux kill-server";
      KillMode="control-group";

      RestartSec=2;
    };

	Install.WantedBy=["default.target"];
  };

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
      bind | split-window -h -c "#{pane_current_path}"
      bind - split-window -v -c "#{pane_current_path}"

      # Use vim-like keybindings for copying
      bind P paste-buffer
      bind-key -T copy-mode-vi v send-keys -X begin-selection
      bind-key -T copy-mode-vi y send-keys -X copy-selection
      bind-key -T copy-mode-vi r send-keys -X rectangle-toggle
    '';
  };
}
