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
  services.xserver.displayManager.sessionCommands = "bash ~/.config/keymaps/macbook-air-number-fix.sh";
}
