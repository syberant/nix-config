{ pkgs, config, lib, ... }:

with lib;

let
    cfg = config.programs.polybar;
in {
    options.programs.polybar = {
        enable = mkOption {
            type = types.bool;
            default = false;
            description = ''
                If enabled polybar will be installed, note that it won't be autostarted yet.
            '';
        };

        enableConfigFile = mkOption {
            type = types.bool;
            default = false;
            description = ''
                Sets the config file if enabled.
            '';
        };

        useDefaultModules = mkOption {
            type = types.bool;
            default = true;
            description = ''
                Appends the base modules onto the config file.
            '';
        };

        configLines = mkOption {
            type = types.nullOr types.str;
            default = null;
            description = ''
	    	Configuration for in the config file.
            '';
        };

	wlanInterface = mkOption {
	    type = types.str;
	    default = "";
	    description = "Interface name for wlan, for example wlp2s0f0u3.";
	};
    };

    config = mkIf cfg.enable {
        environment.systemPackages = [(pkgs.polybar.override {
		configFile = optionalString cfg.enableConfigFile (builtins.toFile "polybar-config" (
			cfg.configLines + "\n" + ''
				[module/wlan]
				type = internal/network
				interface = ${cfg.wlanInterface}
				interval = 3.0

				format-connected = <ramp-signal> <label-connected>
				format-connected-underline = #9f78e1
				label-connected = %essid% %local_ip%

				format-disconnected = <label-disconnected>
				format-disconnected-underline = ''${self.format-connected-underline}
				label-disconnected = disconnected
				label-disconnected-foreground = ''${colors.foreground-alt}

				ramp-signal-0 = 
				ramp-signal-foreground = ''${colors.foreground-alt}
			'' + "\n" +
			optionalString cfg.useDefaultModules builtins.readFile ./defaultModules.conf
		));
	})];
    };
}
