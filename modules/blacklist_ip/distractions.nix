{ config, lib, pkgs, ... }:

with lib;

let cfg = config.blacklist_ip.distractions;
in {
    options.blacklist_ip.distractions = {
        blockedSites = mkOption {
            type = with types; listOf str;
            default = [];
            description = "Block DNS requests to these sites.";
        };
    };

    config = let
        blockSite = site: ''
            0.0.0.0 ${site}
            ::0 ${site}
            0.0.0.0 www.${site}
            ::0 www.${site}
        '';
    in {
      networking.extraHosts = concatMapStrings blockSite cfg.blockedSites;
    };
}
