{ ... }:

{
  # TODO: this doesn't work, fix it
  # Workaround by just exporting vars in bashrc
  home-manager.users.sybrand.home.sessionVariables = {
    VISUAL = "nvim";
    EDITOR = "nvim";
  };
}
