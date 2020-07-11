{ pkgs, ... }:

let dwm = pkgs.dwm.overrideAttrs (old: {
  postPatch = ''
    cp ${../dotfiles/dwm/config.h} ./config.h
  '';

  patches = [
  ];
});
in {
  services.xserver.displayManager.session = [{
    manage = "window";
    name = "dwm";
    start = ''
      ${dwm}/bin/dwm &
      waitPID=$!
    '';
  }];
}
