{ config, lib, pkgs, modulesPath, ... }:

{
  imports =
    [ (modulesPath + "/installer/scan/not-detected.nix")
    ];

  #################################
  # HIGHER LEVEL HARDWARE SUPPORT #
  #################################
  services.xserver.videoDrivers = [ "amdgpu" ];
  hardware.graphics.enable32Bit = true;
  hardware.bluetooth.enable = true;

  ################################
  # LOWER LEVEL HARDWARE SUPPORT #
  ################################
  boot.initrd.availableKernelModules = [ "nvme" "xhci_pci" "thunderbolt" "usb_storage" "sd_mod" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-amd" ];
  boot.extraModulePackages = with config.boot.kernelPackages; [ zenpower ];
  boot.blacklistedKernelModules = [
    # Blacklisting required by zenpower
    "k10temp"
  ];

  fileSystems."/" =
    { device = "rpool/root";
      fsType = "zfs";
    };

  fileSystems."/boot" =
    { device = "/dev/disk/by-uuid/437B-789D";
      fsType = "vfat";
    };

  fileSystems."/home" =
    { device = "rpool/home";
      fsType = "zfs";
    };

  fileSystems."/persist" =
    { device = "rpool/persistence";
      neededForBoot = true;
      fsType = "zfs";
    };

  fileSystems."/nix" =
    { device = "rpool/nixos";
      fsType = "zfs";
    };

  swapDevices =
    [ { device = "/dev/disk/by-uuid/64cfed8e-0d97-4fa6-9537-0a18be0f1fb7"; }
    ];

  # Enables DHCP on each ethernet and wireless interface. In case of scripted networking
  # (the default) this is the recommended approach. When using systemd-networkd it's
  # still possible to use this option, but it's recommended to use it in conjunction
  # with explicit per-interface declarations with `networking.interfaces.<interface>.useDHCP`.
  networking.useDHCP = lib.mkDefault true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
