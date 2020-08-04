{ pkgs, config, ... }:

{
  systemd.timers.freedns_updater = {
    description = "Timer for updating dynamic dns.";

    partOf = [ "freedns_updater.service" ];
    wantedBy = [ "timers.target" ];
    timerConfig = {
      OnUnitActiveSec = "3600";
      Persistent = "true";
    };
  };

  systemd.services.freedns_updater = {
    description = "Update freedns with new dynamic ip.";

    after = [ "network.target" ];

    serviceConfig = {
      Type = "oneshot";
      SupplemantaryGroups = [ config.users.groups.keys.name ];
    };

    script = ''
      ${pkgs.curl}/bin/curl https://freedns.afraid.org/dynamic/update.php?$(cat /run/secrets/freedns)
    '';
  };
}
