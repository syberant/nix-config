{ lib, pkgs, ... }:

{
  programs = {
    rupa_z.enable = true;

    browserpass.enable = true;

    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
    };
  };
}
