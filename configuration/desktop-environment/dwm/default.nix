{ pkgs, config, ... }:

let confdir = ../..;
in {
  services.xserver.displayManager.session = [{
    manage = "window";
    name = "dwm";
    start = ''
      ${import ./package.nix {inherit pkgs;}}/bin/dwm 2> /tmp/dwm_log_err > /tmp/dwm_log &
      waitPID=$!

      #${pkgs.polybar}/bin/polybar -c ${import "${confdir}/generators/polybar.nix" { config = config.systemInfo; }} example &
      ${pkgs.sxhkd}/bin/sxhkd -c ${import "${confdir}/generators/sxhkdrc.nix" { inherit pkgs; }} &
      ${pkgs.dunst}/bin/dunst -config ${"${confdir}/dotfiles/dunst/config"} &
      ~/.fehbg
    '';
  }];
}
