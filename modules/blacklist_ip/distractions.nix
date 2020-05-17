{ config, lib, pkgs, ... }:

with lib;

let cfg = config.blacklist_ip.distractions;
in {
    options.blacklist_ip.distractions = {
        reddit = mkOption {
            type = types.bool;
            default = false;
            description = "Blocks DNS requests to reddit.com if enabled.";
        };

        youtube = mkOption {
            type = types.bool;
            default = false;
            description = "Blocks DNS requests to youtube.com if enabled.";
        };
    };

    config = let
        reddit = mkIf cfg.reddit {
            networking.extraHosts = ''
                0.0.0.0 reddit.com
                ::0 reddit.com
                0.0.0.0 www.reddit.com
                ::0 www.reddit.com
            '';
        };
        youtube = mkIf cfg.youtube {
            networking.extraHosts = ''
                0.0.0.0 youtube.com
                ::0 youtube.com
                0.0.0.0 www.youtube.com
                ::0 www.youtube.com
            '';
        };

    in mkMerge [
        reddit
        youtube
    ];
}
