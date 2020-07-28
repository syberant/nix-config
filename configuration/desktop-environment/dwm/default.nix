{ pkgs, config, ... }:

let confdir = ../..;
in {
  environment.systemPackages = [ (import ./package.nix {inherit pkgs;}) ];

  services.xserver.displayManager.session = [{
    manage = "window";
    name = "dwm";
    start = ''
      while true; do
        dwm 2> /tmp/dwm_log_stderr > /tmp/dwm_log_stdout
      done &
      waitPID=$!

      #${pkgs.polybar}/bin/polybar -c ${import "${confdir}/generators/polybar.nix" { config = config.systemInfo; }} example &
      ${pkgs.sxhkd}/bin/sxhkd -c ${import "${confdir}/generators/sxhkdrc.nix" { inherit pkgs; }} &
      ${pkgs.dunst}/bin/dunst -config ${"${confdir}/dotfiles/dunst/config"} &
      ~/.fehbg
    '';
  }];
}
