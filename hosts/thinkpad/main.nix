{ pkgs, lib, ... }:

{
  imports = [ ./syncthing.nix ./hardware-configuration.nix ];

  environment.systemPackages = with pkgs; [ prismlauncher zenmonitor ];

  # Power efficiency
  powerManagement.cpuFreqGovernor = "powersave";
  services.tlp = {
    enable = true;
    settings = {
      # Set battery thresholds for increasing battery lifespan
      START_CHARGE_THRESH_BAT0 = 70;
      STOP_CHARGE_THRESH_BAT0 = 90;

      # manually set performance policy
      ENERGY_PERF_POLICY_ON_BAT = "power";
      ENERGY_PERF_POLICY_ON_AC = "performance";
    };
  };

  # Trackpad configuration
  services.xserver.libinput = {
    enable = true;

    touchpad = {
      accelSpeed = "0.3";
      clickMethod = "clickfinger";
      tapping = false;

      # Scrolling
      scrollMethod = "twofinger";
      naturalScrolling = true;
    };
  };

  services.xserver.sybrand-desktop-environment.polybar = {
    wlanInterface = "wlp1s0";
    config."bar/example".modules-right = lib.mkOrder 50 [ "battery" ];
  };

  # Fingerprint reader
  services.fprintd.enable = true;

  # Use the GRUB2 boot loader.
  boot.loader.grub = {
    enable = true;
    version = 2;
    device = "nodev";
    efiSupport = true;
    enableCryptodisk = true;
  };
  boot.loader.efi.canTouchEfiVariables = true;

  # Use ZFS over an encrypted LUKS
  boot.supportedFilesystems = [ "zfs" ];
  networking.hostId = "E06B7D0B"; # Required by ZFS
  boot.initrd.luks.devices.root = {
    device = "/dev/disk/by-uuid/96ec3e70-450f-4d4a-bed2-69053a9f3758";

    # Required even if we're not using LVM apparently
    preLVM = true;
  };

  networking.hostName = "nixos-thinkpad"; # Define your hostname.

  # Newer kernel
  # boot.kernelPackages = pkgs.linuxKernel.packages.linux_6_1;
  # Use latest kernel compatible with ZFS
  boot.kernelPackages = pkgs.zfs.latestCompatibleLinuxPackages;

  # Select internationalisation properties.
  # i18n.defaultLocale = "en_US.UTF-8";
  # console = {
  #   font = "Lat2-Terminus16";
  #   keyMap = "us";
  #   useXkbConfig = true; # use xkbOptions in tty.
  # };

  # Configure keymap in X11
  # services.xserver.layout = "us";
  # services.xserver.xkbOptions = {
  #   "eurosign:e";
  #   "caps:escape" # map caps to escape.
  # };

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "22.11"; # Did you read the comment?

}
