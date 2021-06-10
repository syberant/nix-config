{ config, pkgs, nixos-hardware, ... }:

{
  imports = [
    ./syncthing.nix
    ./ssh.nix
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
    tapping = false;
    disableWhileTyping = true;
    scrollMethod = "twofinger";
    naturalScrolling = true;
  };

  # Webcam
  hardware.facetimehd.enable = true;

  # Battery life tweaks
  # - view usage with powerstat
  services.tlp = {
    enable = true;
    extraConfig = ''
      # force battery mode even on AC
      TLP_DEFAULT_MODE=BAT
      TLP_PERSISTANT_DEFAULT=1

      # manually set performance policy
      ENERGY_PERF_POLICY_ON_BAT=power
      ENERGY_PERF_POLICY_ON_AC=balance-performance
    '';
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

  systemInfo = {
    wlanInterface = "wlp3s0";
    hasBattery = true;
  };
}
