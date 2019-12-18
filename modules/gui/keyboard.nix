{ config, lib, pkgs, ... }:

with lib;

let
	cfg = config.gui.keyboard;
in {
	options.gui.keyboard = {
		control_as_escape = mkOption {
			type = types.bool;
			default = true;
			description = "If enabled, control will act as control when held and as escape when tapped.";
		};

        caps_lock_to_control = mkOption {
            type = types.bool;
            default = true;
            description = "If enabled, caps lock will be mapped to control.";
        };

        repetition_delay = mkOption {
            type = types.string;
            default = "180";
            description = "Amount of milliseconds delay before a key starts repeating.";
        };
	};

	config =
        mkIf cfg.control_as_escape {
            environment.systemPackages = [ pkgs.xcape ];

            services.xserver.displayManager.sessionCommands = ''
                ${pkgs.xcape}/bin/xcape -e 'Control_L=Escape'
            '';
        } // mkIf cfg.caps_lock_to_control {
            services.xserver.xkbOptions = "ctrl:nocaps";
        } // {

        # Repetition delay
        environment.systemPackages = [ pkgs.xorg.xset ];
        services.xserver.displayManager.sessionCommands = ''
            ${pkgs.xorg.xset}/bin/xset r rate ${cfg.repetition_delay}
        '';
    };
}
