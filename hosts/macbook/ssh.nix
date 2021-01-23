{ config, ... }:

{
  home-manager.users.sybrand.programs.ssh = {
    enable = true;

    matchBlocks."nixos-desktop" = {
      user = "sybrand";
      hostname = "192.168.178.30";
      identityFile = [ config.sops.secrets.desktop-ssh-key.path ];
      identitiesOnly = true;
    };
  };
}
