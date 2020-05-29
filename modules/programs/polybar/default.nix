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

        configLines = mkOption {
            type = types.str;
            default = "";
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

    config = let
    	file = import ../../../configuration/generators/polybar.nix {
		wlanInterface = cfg.wlanInterface;
		extraConfig = cfg.configLines;
	};
    in mkIf cfg.enable {
        environment.systemPackages = lib.singleton (
	    pkgs.polybar.override { flags = lib.singleton (
		optionalString cfg.enableConfigFile "-c ${file}"
	    );}
	);
    };
}
