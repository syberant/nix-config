{ pkgs }:

pkgs.writeText "sxhkd-config" ''
  # Brightness up and down
  XF86MonBrightness{Up,Down}
      ${pkgs.brightnessctl}/bin/brightnessctl set {+5%,5%-}

  # Sound up and down
  XF86Audio{LowerVolume,RaiseVolume}
      amixer set Master 5%{-,+}

  # Toggle sound
  XF86AudioMute
      amixer set Master toggle

  # Toggle playing/pausing mpd
  XF86AudioPlay
      mpc toggle

  XF86AudioPrev
      mpc prev

  XF86AudioNext
      mpc next

  # Take screenshot
  {super + ,}Print
    ${pkgs.scrot}/bin/scrot '%Y-%m-%d_%H:%M:%S.png' {,-s} -e 'mkdir -p ~/Pictures/Screenshots; mv $f ~/Pictures/Screenshots'
''
