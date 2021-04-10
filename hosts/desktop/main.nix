{ config, pkgs, ... }:

{
  imports = [
    ./sloth.nix
    ./syncthing.nix
    ./freedns.nix
    ./hardware-configuration.nix
    ../../configuration/common.nix
  ];
  # Use the GRUB 2 boot loader.
  #boot.loader.grub.enable = true;
  #boot.loader.grub.version = 2;
  # boot.loader.grub.efiSupport = true;
  # boot.loader.grub.efiInstallAsRemovable = true;
  # boot.loader.efi.efiSysMountPoint = "/boot/efi";
  # Define on which hard drive you want to install Grub.
  boot.loader.grub.device = "/dev/nvme0n1"; # or "nodev" for efi only
  /* boot.loader.grub.useOSProber = true; */

  networking.hostName = "nixos-desktop"; # Define your hostname.

  # Unique ID for zfs
  networking.hostId = "b590f6d7";
  # Enable trim for SSD
  # services.zfs.trim.enable = true;

  # Virtualbox
  users.extraGroups.vboxusers.members = [ "sybrand" ];
  virtualisation.virtualbox.host.enable = true;

  # Get Xserver working
  nixpkgs.config.allowUnfree = true;
  services.xserver.videoDrivers = [ "nvidia" ];
  hardware.opengl.driSupport32Bit = true;

  environment.systemPackages = with pkgs; [
        minecraft
        freeciv

        # For World of Tanks
        wine-staging
        winetricks
        vulkan-loader
  ];

  # Block distracting websites
  blacklist_ip.distractions = {
    reddit = true;
    # youtube = true;
  };

  # Watch yt on a bigger screen
  home-manager.users.sybrand.programs.mpv.config = {
    ytdl-format = "bestvideo[height<=1440]+bestaudio";
    sub-font-size = 40;
  };

  systemInfo.wlanInterface = "wlp2s0f0u3";
}
