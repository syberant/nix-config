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

${builtins.readFile ../../modules/programs/polybar/defaultModules.conf}

''
