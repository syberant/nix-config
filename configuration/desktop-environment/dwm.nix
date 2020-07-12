{ pkgs, config, ... }:

let dwm = pkgs.dwm.overrideAttrs (old: {
  #src = /home/sybrand/Documents/Programmeren/C/dwm;

  postPatch = ''
    cp ${../dotfiles/dwm/config.h} ./config.h
  '';

  patches = [
    ../dotfiles/dwm/dwm-viewcumulative-6.2.diff

    # Considered patches:
    # namedscratchpads
    # swallow
    # keymodes
  ];
});
in {
  services.xserver.displayManager.session = [{
    manage = "window";
    name = "dwm";
    start = ''
      ${dwm}/bin/dwm &
      waitPID=$!

      #${pkgs.polybar}/bin/polybar -c ${import ../generators/polybar.nix { config = config.systemInfo; }} example &
      ${pkgs.sxhkd}/bin/sxhkd -c ${import ../generators/sxhkdrc.nix { inherit pkgs; }} &
      ${pkgs.dunst}/bin/dunst -config ${../dotfiles/dunst/config} &
      ~/.fehbg
    '';
  }];
}
