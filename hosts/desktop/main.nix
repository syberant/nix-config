{ config, pkgs, ... }:

{
  # Use the GRUB 2 boot loader.
  #boot.loader.grub.enable = true;
  #boot.loader.grub.version = 2;
  # boot.loader.grub.efiSupport = true;
  # boot.loader.grub.efiInstallAsRemovable = true;
  # boot.loader.efi.efiSysMountPoint = "/boot/efi";
  # Define on which hard drive you want to install Grub.
  boot.loader.grub.device = "/dev/sda"; # or "nodev" for efi only
  /* boot.loader.grub.useOSProber = true; */

  # Mount additional filesystems
  #fileSystems."/home".device = "/dev/disk/by-label/home";

  networking.hostName = "nixos-desktop"; # Define your hostname.

  # Get Xserver working
  nixpkgs.config.allowUnfree = true;
  services.xserver.videoDrivers = [ "nvidia" ];
  hardware.opengl.driSupport32Bit = true;
  #boot.kernelModules = [ "i915" ];
}
