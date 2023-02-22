{ lib, pkgs, nixos-hardware, ... }:

{
  imports = [
    ./syncthing.nix
    nixos-hardware.nixosModules.apple-macbook-air-6
    ./hardware-configuration.nix
  ];

  # Unique ID for zfs
  networking.hostId = "fec9e12c";
  # Enable trim for SSD
  services.zfs.trim.enable = true;

  # Allow unfree
  nixpkgs.config.allowUnfree = true;

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Networking
  networking.hostName = "nixos-macbook"; # Define your hostname.
  networking.enableB43Firmware = true;

  # Trackpad configuration
  services.xserver.libinput = {
    enable = true;

    touchpad = {
      tapping = false;
      disableWhileTyping = true;
      scrollMethod = "twofinger";
      naturalScrolling = true;
    };
  };

  # Bluetooth
  hardware.bluetooth.enable = true;

  # Webcam
  hardware.facetimehd.enable = true;

  # Disable shutdown on power key
  services.logind.extraConfig = ''
    HandlePowerKey=ignore
    HandleSuspendKey=ignore
  '';

  # Battery life tweaks
  # - view usage with powerstat
  services.tlp = {
    enable = true;
    settings = {
      # force battery mode even on AC
      TLP_DEFAULT_MODE = "BAT";
      TLP_PERSISTANT_DEFAULT = 1;

      # manually set performance policy
      ENERGY_PERF_POLICY_ON_BAT = "power";
      ENERGY_PERF_POLICY_ON_AC = "balance-performance";
    };
  };
  powerManagement.powertop.enable = true;

  # Map keys on startup
  gui.keyboard.key_mappings = [
    "232 = 1 exclam"
    "233 = 2 at"
    "128 = 3 numbersign"
    "212 = 4 dollar"
    "237 = 5 percent"
    "238 = 6 asciicircum"
    "173 = 7 ampersand"
    "172 = 8 asterisk"
    "171 = 9 parenleft"
    "121 = 0 parenright"

    # Remap fn buttons
    # Original fn functionality still available with shift
    "67 = XF86MonBrightnessDown F1"
    "68 = XF86MonBrightnessUp F2"
    "73 = XF86AudioPrev F7"
    "74 = XF86AudioPlay F8"
    "75 = XF86AudioNext F9"
    "76 = XF86AudioMute F10"
    "95 = XF86AudioLowerVolume F11"
    "96 = XF86AudioRaiseVolume F12"
  ];

  services.xserver.sybrand-desktop-environment.polybar = {
    wlanInterface = "wlp3s0";
    config."bar/example".modules-right = lib.mkOrder 50 [ "battery" ];
  };

  home-manager.users.sybrand.home.sessionVariables = {
    MAGICK_MEMORY_LIMIT = "4GB";
  };

  environment.systemPackages = with pkgs;
    [
      # For debugging intel CPU behaviour.
      i7z
    ];

  # This value determines the NixOS release with which your system is to be
  # compatible, in order to avoid breaking some software such as database
  # servers. You should change this only after NixOS release notes say you
  # should.
  system.stateVersion = "19.09"; # Did you read the comment?
}
