{ pkgs, lib, ... }:

{
  imports = [ ./syncthing.nix ./hardware-configuration.nix ./udev.nix ];

  # Enable fully offline builds
  system.includeBuildDependencies = true;

  services.ollama = {
    enable = true;
  };

  programs.steam.enable = true;
  environment.systemPackages = with pkgs; [
    mate.mate-polkit
    prismlauncher
    zenmonitor
  ];

  security.polkit.enable = true;

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
  services.libinput = {
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

  # Keyboard config
  services.xserver.xkb.options =
    "altwin:swap_alt_win"; # Swap left alt and super key
  console.useXkbConfig = true; # use xkbOptions in tty.

  services.xserver.sybrand-desktop-environment.polybar = {
    wlanInterface = "wlp1s0";
    config."bar/example".modules-right = lib.mkOrder 50 [ "battery" ];
  };

  # Automatically switch between dual- and single-display options
  services.autorandr.enable = true;

  # Configure ytfzf for a 1920x1200 screen
  home-manager.users.sybrand.home.file = {
    ".config/ytfzf/conf.sh" = {
      text = ''
        video_pref="bestvideo[height<=1200]"
        pages_to_scrape=2
      '';
    };
  };

  # Fingerprint reader
  services.fprintd.enable = true;

  # Hibernate/sleep
  # Encrypted swap: https://unix.stackexchange.com/questions/529047/is-there-a-way-to-have-hibernate-and-encrypted-swap-on-nixos

  # Use the GRUB2 boot loader.
  boot.loader.grub = {
    enable = true;
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
  boot.kernelPackages = pkgs.linuxKernel.packages.linux_6_12;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "22.11"; # Did you read the comment?

}
