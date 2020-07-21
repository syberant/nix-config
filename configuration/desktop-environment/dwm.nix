{ pkgs, config, ... }:

let dwm = pkgs.nur.repos.syberant.dwm.override {
  patches = [
    ../dotfiles/dwm/dwm-viewcumulative-6.2.diff

    pkgs.nur.repos.syberant.dwm-patches.swallow
    pkgs.nur.repos.syberant.dwm-patches.namedscratchpads

    # Considered patches:
    # namedscratchpads
    # swallow
    # keymodes
  ];

  configh = ../dotfiles/dwm/config.h;
};
in {
  services.xserver.displayManager.session = [{
    manage = "window";
    name = "dwm";
    start = ''
      ${dwm}/bin/dwm 2> /tmp/dwm_log_err > /tmp/dwm_log &
      waitPID=$!

      #${pkgs.polybar}/bin/polybar -c ${import ../generators/polybar.nix { config = config.systemInfo; }} example &
      ${pkgs.sxhkd}/bin/sxhkd -c ${import ../generators/sxhkdrc.nix { inherit pkgs; }} &
      ${pkgs.dunst}/bin/dunst -config ${../dotfiles/dunst/config} &
      ~/.fehbg
    '';
  }];
}
