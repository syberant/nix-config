{ pkgs }:

pkgs.writeText "sxhkd-config" ''
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

  XF86{Sleep,PowerOff}
      ${pkgs.nur.repos.syberant.powermenu} {#,#}
''
