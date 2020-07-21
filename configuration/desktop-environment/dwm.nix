{ pkgs, config, ... }:

with pkgs.lib;

let dwm = pkgs.dwm.overrideAttrs (old: rec {
  #src = /home/sybrand/Documents/Programmeren/C/dwm;

  nativeBuildInputs = [ pkgs.git ];

  patchPhase = singleton ''
    eval "$prePatch"
  '' ++ builtins.map (file: ''
    echo "Patching using patch ${file}"
    git apply -C0 --exclude="config.h" --exclude="config.def.h" ${file}
  '') patches ++ singleton ''
    eval "$postPatch"
  '';

  patches = [
    ../dotfiles/dwm/dwm-viewcumulative-6.2.diff

    pkgs.nur.repos.syberant.dwm-patches.swallow
    pkgs.nur.repos.syberant.dwm-patches.namedscratchpads

    # Considered patches:
    # namedscratchpads
    # swallow
    # keymodes
  ];

  postPatch = ''
    echo "Moving ${../dotfiles/dwm/config.h} to config.h"
    cp ${../dotfiles/dwm/config.h} config.h

    echo "Rule is declared as follows, make sure your config.h matches!"
    printf "\n"
    sed -n '/const Layout \*lt\[2\];/,+100p ; /} Rule;/q' dwm.c | sed 1,3d
    printf "\n"
  '';
});
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
