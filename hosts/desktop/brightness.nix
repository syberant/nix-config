{ config, pkgs, ... }:

{
  boot = {
    # Use a kernel driver, presents backlight(s) in /sys/class/backlight
    # Compatible with e.g. brightnessctl utility
    extraModulePackages = with config.boot.kernelPackages; [ ddcci-driver ];
    kernelModules = [ "ddcci" ];

    # Enable debug messages
    # extraModprobeConfig = ''
      # options ddcci dyndbg
      # options ddcci-backlight dyndbg
    # '';
  };

  # The ddcci kernel driver does not currently autodetect my ddcci screen.
  # This is most likely the fault of the proprietary nvidia driver,
  # but is solved by forcing a detect with a systemd service.
  systemd.services."ddcci-force-detect" = {
    description = "Forces detection of i2c-5 for the ddcci display backlight driver.";
    documentation = [
      "https://gitlab.com/ddcci-driver-linux/ddcci-driver-linux/-/issues/7"
      "https://gitlab.com/ddcci-driver-linux/ddcci-driver-linux/-/issues/2"
    ];

    # Automatically run on bootup, hopefully after gpu is done initializing...
    wantedBy = [ "multi-user.target" ];
    after = [ "multi-user.target" ];

    # TODO: ensure running on hibernate resume

    path = with pkgs; [ coreutils ];
    script = "echo 'ddcci 0x37' > /sys/bus/i2c/devices/i2c-5/new_device || test -e /sys/class/backlight/ddcci5";
  };

  # Temporarily remap F{1,2} to XF86MonBrightness{Down,Up}
  gui.keyboard.key_mappings =
    [ "67 = XF86MonBrightnessDown" "68 = XF86MonBrightnessUp" ];
}
