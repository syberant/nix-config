{ config, pkgs, ... }:

{

  # For setting brightness to x (0<=x<=100):
  # sudo ddcutil setvcp 10 x
  # environment.systemPackages = with pkgs; [ ddcutil ];

  boot = {
    # Use a kernel driver, presents backlight(s) in /sys/class/backlight
    # Compatible with e.g. brightnessctl utility
    extraModulePackages = with config.boot.kernelPackages; [ ddcci-driver ];

    # Enable debug messages
    # extraModprobeConfig = ''
      # options ddcci dyndbg
      # options ddcci-backlight dyndbg
    # '';
  };

  # Temporarily remap F{1,2} to XF86MonBrightness{Down,Up}
  gui.keyboard.key_mappings = [
     "67 = XF86MonBrightnessDown"
     "68 = XF86MonBrightnessUp"
  ];
}
