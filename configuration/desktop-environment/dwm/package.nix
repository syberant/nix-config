{ pkgs }:

pkgs.nur.repos.syberant.dwm.override {
  patches = with pkgs.nur.repos.syberant.dwm-patches; [
    ../../dotfiles/dwm/dwm-viewcumulative-6.2.diff

    swallow
    namedscratchpads
    #floatrules
    actualfullscreen
  ];

  configh = ../../dotfiles/dwm/config.h;
}
