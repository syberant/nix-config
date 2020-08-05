{ config, ... }:

{
  home-manager.users.sybrand.programs.ssh = {
    enable = true;

    matchBlocks."nixos-desktop" = {
      user = "sybrand";
      hostname = "vlindersingel.crabdance.com";
      identityFile = [ config.sops.secrets.desktop-ssh-key.path ];
      identitiesOnly = true;
    };
  };
}
