{ ... }:

{
  programs.bash = {
    enable = true;
    historyControl = [ "erasedups" ];
    historyFileSize = 1000000;

    initExtra = ''
      # Use starship for prompt
      eval "$(starship init bash)"
    '';

    shellAliases = {
      "ls" = "lsd --icon=never";
      vi = "nvim";
      open = "xdg-open";
      tt = "taskwarrior-tui";
    };
  };
}
