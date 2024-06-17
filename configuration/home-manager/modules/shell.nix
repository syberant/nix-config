{ ... }:

{
  home.sessionVariables = {
    VISUAL = "nvim";
    EDITOR = "nvim";

    # Use bat as manpager
    # See: https://github.com/sharkdp/bat#man
    MANPAGER = "sh -c 'col -bx | bat --language man --plain --theme gruvbox-dark'";
    MANROFFOPT="-c";
  };
}
