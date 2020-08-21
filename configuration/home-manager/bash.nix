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
    '';

    shellAliases = {
      "ls" = "lsd --icon=never";
      vi = "nvim";
    };
  };
}
