{ wlanInterface ? "unspecified", extraConfig ? "", ... }:

builtins.toFile "polybar-config" ''

${extraConfig}

[module/wlan]
type = internal/network
interface = ${wlanInterface}
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

format-prefix = " "
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

date = " %d-%m"
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
adapter = "AC"
full-at = 100

format-charging = <animation-charging> <label-charging>
format-charging-underline = #ffb52a

format-discharging = <animation-discharging> <label-discharging>
format-discharging-underline = ''${self.format-charging-underline}

format-full-prefix = " "
format-full-prefix-foreground = ''${colors.foreground-alt}
format-full-underline = ''${self.format-charging-underline}

ramp-capacity-0 = 
ramp-capacity-1 = 
ramp-capacity-2 = 
ramp-capacity-foreground = ''${colors.foreground-alt}

animation-charging-0 = 
animation-charging-1 = 
animation-charging-2 = 
animation-charging-foreground = ''${colors.foreground-alt}
animation-charging-framerate = 750

animation-discharging-0 = 
animation-discharging-1 = 
animation-discharging-2 = 
animation-discharging-foreground = ''${colors.foreground-alt}
animation-discharging-framerate = 750

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
''