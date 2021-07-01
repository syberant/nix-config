{ ... }:

{
  programs.bash = {
    enable = true;
    historyControl = [ "erasedups" ];
    historyFileSize = 1000000;

    initExtra = ''
      # Use starship for prompt
      eval "$(starship init bash)"

      # Quit to current directory in nnn
      export NNN_TMPFILE="/tmp/nnn"
      n() {
          nnn "$@"

          if [ -f $NNN_TMPFILE ]; then
              . $NNN_TMPFILE
              rm -f $NNN_TMPFILE > /dev/null
          fi
      }

      # Enable vi mode
      # Unfortunately bash doesn't provide this information to starship
      $ so you will have to guess which mode you're in
      # https://github.com/starship/starship/issues/1171#issuecomment-636972187
      set -o vi
    '';

    shellAliases = {
      "ls" = "lsd --icon=never";
      vi = "nvim";
      open = "xdg-open";
    };
  };
}
