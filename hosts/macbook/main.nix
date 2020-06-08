{ config, pkgs, ... }:

{
  # Allow unfree
  nixpkgs.config.allowUnfree = true;

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Networking
  networking.hostName = "nixos-macbook"; # Define your hostname.
  networking.enableB43Firmware = true;

  # Trackpad configuration
  services.xserver.synaptics = {
    #enable = true;
    twoFingerScroll = true;
    buttonsMap = [ 1 3 2 ];
    tapButtons = false;
  };

  services.xserver.libinput = {
    enable = true;
    tapping = false;
    disableWhileTyping = true;
    scrollMethod = "twofinger";
    naturalScrolling = true;
  };

  # VirtualBox
  # users.extraGroups.vboxusers.members = [ "sybrand" ];
  # virtualisation.virtualbox.host.enable = true;

  environment.systemPackages = with pkgs; [
    # Backlight
    xorg.xbacklight
  ];
  boot.extraModulePackages = with config.boot.kernelPackages; [
    # Backlight
    mba6x_bl

    # Webcam
    facetimehd
  ];

  # Battery life tweaks
  services.tlp.enable = true;
  services.upower.enable = true;
  powerManagement.enable = true;

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
    "73 = XF86AudioPrev F7"
    "74 = XF86AudioPlay F8"
    "75 = XF86AudioNext F9"
    "76 = XF86AudioMute F10"
    "95 = XF86AudioLowerVolume F11"
    "96 = XF86AudioRaiseVolume F12"
  ];

  programs.polybar = {
  	wlanInterface = "wlp3s0";
	showBattery = true;
  };
}
