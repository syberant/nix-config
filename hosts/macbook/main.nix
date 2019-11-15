{ config, pkgs, ... }:

{
  # Allow unfree
  nixpkgs.config.allowUnfree = true;

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos-macbook"; # Define your hostname.
  networking.enableB43Firmware = true;

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

  # Battery life tweaks
  services.tlp.enable = true;
  services.upower.enable = true;
  powerManagement.enable = true;

  # Map keys on startup
  services.xserver.displayManager.sessionCommands = "bash ~/.config/keymaps/macbook-air-number-fix.sh";
}
