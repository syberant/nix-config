{ pkgs, config, ... }:

{
  systemd.user.timers.unison_sync = {
    description = "Timer for unison_sync.service";

    partOf = [ "unison_sync.service" ];
    wantedBy = [ "timers.target" ];
    timerConfig = {
      OnUnitActiveSec = "300";
      Persistent = "true";
    };
  };

  systemd.user.services.unison_sync = {
    description = "Unison syncing to nixos-desktop";

    after = [ "network.target" ];
    environment.HOME = "/home/sybrand";

    unitConfig = { ConditionACPower = true; };

    serviceConfig = { Type = "oneshot"; };

    script = ''
      ${pkgs.unison}/bin/unison -sshcmd="${pkgs.openssh}/bin/ssh" -sshargs="-i ${config.sops.secrets.desktop-ssh-key.path}" -auto -batch -ui text nixos-desktop
    '';
  };
}
