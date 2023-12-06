{ config, pkgs, lib, ... }:

{
  imports = [
    ./brightness.nix
    ./syncthing.nix
    ./hardware-configuration.nix
    ./sleep.nix
  ];
  boot.loader.grub = {
    # boot.loader.grub.efiSupport = true;
    # boot.loader.grub.efiInstallAsRemovable = true;
    # boot.loader.efi.efiSysMountPoint = "/boot/efi";

    memtest86.enable = true;

    # Define on which hard drive you want to install Grub.
    device = "/dev/nvme0n1"; # or "nodev" for efi only

    # Set resolution correctly
    gfxmodeBios = "2560x1440x32,1920x1080x32,auto";
    gfxmodeEfi = "2560x1440x32,1920x1080x32,auto";
  };

  networking.hostName = "nixos-desktop"; # Define your hostname.
  hardware.bluetooth.enable = true;

  # Unique ID for zfs
  networking.hostId = "b590f6d7";
  # Enable trim for SSD
  # services.zfs.trim.enable = true;

  # Virtualbox
  users.extraGroups.vboxusers.members = [ "sybrand" ];
  virtualisation.virtualbox.host.enable = true;


  # Swap left alt and super key
  services.xserver.xkbOptions = "altwin:swap_alt_win";
  # Get Xserver working
  nixpkgs.config.allowUnfree = true;
  services.xserver.videoDrivers = [ "amdgpu" ];
  hardware.opengl.driSupport32Bit = true;

  programs.steam.enable = true;
  environment.systemPackages = with pkgs; [
        # minecraft
        prismlauncher

        # Needs overrides for macbook
        tor-browser-bundle-bin

        # See CPU sensor information
        zenmonitor

        # Radeon GPU
        radeontop lm_sensors
  ];

  # Monitor hardware
  programs.corectrl = {
    enable = true;
    gpuOverclock.enable = true;
  };

  # Block distracting websites
  blacklist_ip.distractions.blockedSites = [
    "reddit.com"
    # "youtube.com"
    "nos.nl"
    "bbc.com"
    "arstechnica.com"
  ];

  # Watch yt on a bigger screen
  home-manager.users.sybrand.programs.mpv.config = {
    ytdl-format = "bestvideo[height<=1440]+bestaudio";
    sub-font-size = 40;
    vo = lib.mkForce "vdpau"; # Workaround for `gpu` variant crashing
  };

  # This value determines the NixOS release with which your system is to be
  # compatible, in order to avoid breaking some software such as database
  # servers. You should change this only after NixOS release notes say you
  # should.
  system.stateVersion = "19.09"; # Did you read the comment?
}
