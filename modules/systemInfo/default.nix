{ lib, ... }:

with lib;

{
    options.systemInfo = {
        wlanInterface = mkOption {
            type = types.str;
            default = "wlp0s3";
            description = ''
                The wireless interface to use for wifi connections.
            '';
        };

	hasBattery = mkOption {
	    type = types.bool;
	    default = false;
            description = ''
                Whether this device has a battery.
            '';
	};
    };
}
