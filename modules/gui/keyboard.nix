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

        key_mappings = mkOption {
            type = types.listOf types.str;
            default = [];
        };
	};

	config = let
        control_as_escape = mkIf cfg.control_as_escape {
            environment.systemPackages = [ pkgs.xcape ];

            services.xserver.displayManager.sessionCommands = ''
                ${pkgs.xcape}/bin/xcape -e 'Control_L=Escape'
            '';
        };
        caps_lock_to_control = mkIf cfg.caps_lock_to_control {
            services.xserver.xkbOptions = "ctrl:nocaps";
        };
        key_mappings =
            let code = map (a: ''xmodmap -e "keycode '' + a + ''"'') cfg.key_mappings;
            in {
                services.xserver.displayManager.sessionCommands = builtins.concatStringsSep "\n" code;
            };
    in mkMerge [
        control_as_escape
        caps_lock_to_control
        key_mappings
    ];
}
