{ ... }:

{
  home-manager.users.sybrand.xdg.configFile = {
    "starship.toml".source = ../dotfiles/starship/starship.toml;
  };
}
