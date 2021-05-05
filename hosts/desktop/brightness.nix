{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
        ddcutil
  ];

  boot.kernelModules = [ "i2c-dev" ];

  # For setting brightness to x (0<=x<=100):
  # sudo ddcutil setvcp 10 x
}
