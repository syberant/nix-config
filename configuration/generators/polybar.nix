# Use callPackage
{ config, polybar ? { modules-left = ""; }, stdenv, fetchFromGitHub, python3, writeText, ... }:

let polypomo = stdenv.mkDerivation {
  name = "polypomo";
  src = fetchFromGitHub {
    owner = "unode";
    repo = "polypomo";
    rev = "86df2b1a2d4af7b2d581f7feca7de924d3858a34";
    sha256 = "0gy6w31vyw7ihblcyl2brk297mvyzc3mc8nnpikhqk3b50pb2xnx";
  };

  patchPhase = ''
    sed 's|^#!/usr/bin/env python3|#!${python3}/bin/python3|' -i polypomo
    sed 's/^TOMATO.*/TOMATO = "🍅"/' -i polypomo
    sed 's/^BREAK.*/BREAK = " "/' -i polypomo
  '';

  installPhase = ''
    mkdir -p $out
    mv polypomo $out/polypomo
  '';
};
in writeText "polybar-config" ''
;==========================================================
;
;
;   ██████╗  ██████╗ ██╗  ██╗   ██╗██████╗  █████╗ ██████╗
;   ██╔══██╗██╔═══██╗██║  ╚██╗ ██╔╝██╔══██╗██╔══██╗██╔══██╗
;   ██████╔╝██║   ██║██║   ╚████╔╝ ██████╔╝███████║██████╔╝
;   ██╔═══╝ ██║   ██║██║    ╚██╔╝  ██╔══██╗██╔══██║██╔══██╗
;   ██║     ╚██████╔╝███████╗██║   ██████╔╝██║  ██║██║  ██║
;   ╚═╝      ╚═════╝ ╚══════╝╚═╝   ╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═╝
;
;
;   To learn more about how to configure Polybar
;   go to https://github.com/polybar/polybar
;
;   The README contains a lot of information
;
;==========================================================

[colors]
;background = ''${xrdb:color0:#222}
background-alt = #444
;foreground = ''${xrdb:color7:#222}
foreground-alt = #777
primary = #ffb52a
secondary = #e60053
alert = #bd2c40

; Nord colorscheme
; https://github.com/Yucklys/polybar-nord-theme
background = #2E3440
buffer = #4c566a
foreground = #D8DEE9
nord6 = #ECEFF4
nord7 = #8FBCBB
nord8 = #88C0D0
nord9 = #81A1C1
urgent = #BF616A

[bar/example]
;monitor = ''${env:MONITOR:HDMI-1}
width = 100%
height = 27
;offset-x = 1%
;offset-y = 1%
radius = 6.0

background = ''${colors.background}
foreground = ''${colors.foreground}

line-size = 3
line-color = #f00

border-size = 4
border-color = #00000000

padding-left = 0
padding-right = 2

module-margin-left = 1
module-margin-right = 2

font-0 = "Source Code Pro Semibold:size=10;1"
font-1 = FontAwesome5Free:style=Solid:size=11;2
font-2 = FontAwesome:style=Regular:size=11;2
font-3 = FontAwesome5Free:style=Regular:size=11;2
font-4 = FontAwesome5Brands:style=Regular:size=11;2

modules-left = ${polybar.modules-left}
modules-center = polypomo pulseaudio mpd
modules-right = wlan ${if config.hasBattery then "battery" else ""} memory cpu date

tray-position = right
tray-padding = 2
;tray-background = #0063ff

;wm-restack = bspwm
;wm-restack = i3

;override-redirect = true

;scroll-up = bspwm-desknext
;scroll-down = bspwm-deskprev

;scroll-up = i3wm-wsnext
;scroll-down = i3wm-wsprev

cursor-click = pointer
cursor-scroll = ns-resize

[module/wlan]
type = internal/network
interface = ${config.wlanInterface}
interval = 3.0

format-connected = <ramp-signal> <label-connected>
format-connected-underline = #9f78e1
label-connected = %local_ip%

format-disconnected = <label-disconnected>
format-disconnected-underline = ''${self.format-connected-underline}
label-disconnected = disconnected
label-disconnected-foreground = ''${colors.foreground-alt}

ramp-signal-0 = 
ramp-signal-foreground = ''${colors.foreground-alt}

[module/xkeyboard]
type = internal/xkeyboard
blacklist-0 = num lock

format-prefix = " "
format-prefix-foreground = ''${colors.foreground-alt}
format-prefix-underline = ''${colors.secondary}

label-layout = %layout%
label-layout-underline = ''${colors.secondary}

label-indicator-padding = 2
label-indicator-margin = 1
label-indicator-background = ''${colors.secondary}
label-indicator-underline = ''${colors.secondary}

[module/filesystem]
type = internal/fs
interval = 25

mount-0 = /

label-mounted = %{F#0a81f5}%mountpoint%%{F-}: %percentage_used%%
label-unmounted = %mountpoint% not mounted
label-unmounted-foreground = ''${colors.foreground-alt}

[module/i3]
type = internal/i3
format = <label-state> <label-mode>
index-sort = true
wrapping-scroll = false

; Only show workspaces on the same output as the bar
;pin-workspaces = true

label-mode-padding = 2
label-mode-foreground = #000
label-mode-background = ''${colors.primary}

; focused = Active workspace on focused monitor
label-focused = %index%
label-focused-background = ''${colors.background-alt}
label-focused-underline= ''${colors.primary}
label-focused-padding = 2

; unfocused = Inactive workspace on any monitor
label-unfocused = %index%
label-unfocused-padding = 2

; visible = Active workspace on unfocused monitor
label-visible = %index%
label-visible-background = ''${self.label-focused-background}
label-visible-underline = ''${self.label-focused-underline}
label-visible-padding = ''${self.label-focused-padding}

; urgent = Workspace with urgency hint set
label-urgent = %index%
label-urgent-background = ''${colors.alert}
label-urgent-padding = 2

; Separator in between workspaces
; label-separator = |

[module/ewmh]
type = internal/xworkspaces
enable-scroll = false

label-active-underline = ''${colors.nord7}
label-active-foreground = ''${colors.nord7}
label-active-padding = 1

label-occupied-underline = ''${colors.nord9}
label-occupied-foreground = ''${colors.nord9}
label-occupied-padding = 1

label-empty-foreground = ''${colors.buffer}
label-empty-padding = 1

label-urgent-foreground = ''${colors.urgent}
label-urgent-background = ''${colors.foreground}
label-urgent-padding = 1

[module/mpd]
type = internal/mpd
format-online = <label-song>  <icon-prev> <icon-stop> <toggle> <icon-next>

icon-prev = 
icon-stop = 
icon-play = 
icon-pause = 
icon-next = 

label-song-maxlen = 25
label-song-ellipsis = true

[module/xbacklight]
type = internal/xbacklight

format = <label> <bar>
label = BL

bar-width = 10
bar-indicator = |
bar-indicator-foreground = #fff
bar-indicator-font = 2
bar-fill = ─
bar-fill-font = 2
bar-fill-foreground = #9f78e1
bar-empty = ─
bar-empty-font = 2
bar-empty-foreground = ''${colors.foreground-alt}

[module/cpu]
type = internal/cpu
interval = 2
format-prefix = " "
format-prefix-foreground = ''${colors.foreground-alt}
format-underline = #f90000
label = %percentage:2%%

[module/memory]
type = internal/memory
interval = 2
format-prefix = " "
format-prefix-foreground = ''${colors.foreground-alt}
format-underline = #4bffdc
label = %percentage_used%%

[module/date]
type = internal/date
interval = 5

date =
date-alt = " %A %d %B %Y"

time = %H:%M
time-alt = %H:%M:%S

format-prefix = 
format-prefix-foreground = ''${colors.foreground-alt}
format-underline = #0a6cf5

label = %date% %time%

[module/pulseaudio]
type = internal/pulseaudio

format-volume = <ramp-volume> <label-volume>
;format-volume = <label-volume> <bar-volume>
label-volume = %percentage%%
label-volume-foreground = ''${root.foreground}

ramp-volume-0 = 
ramp-volume-1 = 
ramp-volume-2 = 

label-muted = ""
label-muted-foreground = #666

bar-volume-width = 10
bar-volume-foreground-0 = #55aa55
bar-volume-foreground-1 = #55aa55
bar-volume-foreground-2 = #55aa55
bar-volume-foreground-3 = #55aa55
bar-volume-foreground-4 = #55aa55
bar-volume-foreground-5 = #f5a70a
bar-volume-foreground-6 = #ff5555
bar-volume-gradient = false
bar-volume-indicator = |
bar-volume-indicator-font = 2
bar-volume-fill = ─
bar-volume-fill-font = 2
bar-volume-empty = ─
bar-volume-empty-font = 2
bar-volume-empty-foreground = ''${colors.foreground-alt}

[module/battery]
type = internal/battery
battery = "BAT0"
adapter = "ADP1"
;full-at = 100

format-charging = <label-charging>
format-charging-prefix = " "
format-charging-prefix-foreground = ''${colors.foreground-alt}
label-charging = %percentage_raw%%
format-charging-underline = #55aa55

format-discharging = <animation-discharging> <label-discharging>
label-discharging = %percentage_raw%%
format-discharging-underline = #ff5555

format-full = FULL
format-full-underline = ''${self.format-charging-underline}

ramp-capacity-0 = 
ramp-capacity-1 = 
ramp-capacity-2 = 
ramp-capacity-3 = 
ramp-capacity-4 = 
ramp-capacity-foreground = ''${colors.foreground-alt}

animation-discharging-0 = 
animation-discharging-1 = 
animation-discharging-2 = 
animation-discharging-3 = 
animation-discharging-4 = 
animation-discharging-foreground = ''${colors.foreground-alt}
animation-discharging-framerate = 500

[module/temperature]
type = internal/temperature
thermal-zone = 0
warn-temperature = 60

format = <ramp> <label>
format-underline = #f50a4d
format-warn = <ramp> <label-warn>
format-warn-underline = ''${self.format-underline}

label = %temperature-c%
label-warn = %temperature-c%
label-warn-foreground = ''${colors.secondary}

ramp-0 = 
ramp-1 = 
ramp-2 = 
ramp-foreground = ''${colors.foreground-alt}

[settings]
screenchange-reload = true
;compositing-background = xor
;compositing-background = screen
;compositing-foreground = source
;compositing-border = over
;pseudo-transparency = false

[global/wm]
margin-top = 5
margin-bottom = 5

; Pomodoro timer!
[module/polypomo]
type = custom/script
exec = ${polypomo}/polypomo --worktime 1500 --breaktime 300
tail = true

label = %output%
click-left = ${polypomo}/polypomo toggle
click-right = ${polypomo}/polypomo end
click-middle = ${polypomo}/polypomo lock
scroll-up = ${polypomo}/polypomo time +60
scroll-down = ${polypomo}/polypomo time -60
''
