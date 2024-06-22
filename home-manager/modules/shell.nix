{ ... }:

{
  home.sessionVariables = {
    VISUAL = "nvim";
    EDITOR = "nvim";

    # Colourise `less` output for man pages.
    # Ideally I'd use something like `bat` but it is broken for man pages currently and does not colourise correctly.
    MANPAGER = "less -R --use-color -Dd+r -Du+b";
    MANROFFOPT="-P -c";
  };
}
