{
  programs.alacritty = {
    enable = true;

    # Declare settings here.
    # See https://github.com/alacritty/alacritty/blob/master/alacritty.yml
    settings = {
      window.opacity = 0.96;
      font = {
        normal.family = "Source Code Pro";
        bold.family = "Source Code Pro";
        italic.family = "Source Code Pro";
        bold_italic.family = "Source Code Pro";
        size = 12;
      };
    };
  };
}
