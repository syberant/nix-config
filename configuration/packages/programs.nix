{ lib, pkgs, ... }:

{
  programs = {
    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
    };

    geary.enable = true;
  };
}
