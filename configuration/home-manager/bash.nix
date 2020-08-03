{ ... }:

{
  home-manager.users.sybrand.programs.bash = {
    enable = true;
    historyControl = [ "erasedups" ];
    historyFileSize = 1000000;

    initExtra = ''
      # Use starship for prompt
      eval "$(starship init bash)"

      # Set program preferences
      export VISUAL=nvim
      export EDITOR=nvim

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
      "ls" = "ls --color=auto";
      "ls -l" = "lsd --icon=never -l";
      "ls -al" = "lsd --icon=never -al";
      "ls -la" = "lsd --icon=never -al";
      vi = "nvim";
    };
  };
}
