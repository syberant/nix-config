{ lib, pkgs, ... }:

{
  programs = {
    browserpass.enable = true;

    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
    };
  };
}
