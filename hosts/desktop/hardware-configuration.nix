# Do not modify this file!  It was generated by ‘nixos-generate-config’
# and may be overwritten by future invocations.  Please make changes
# to /etc/nixos/configuration.nix instead.
{ config, lib, pkgs, modulesPath, ... }:

{
  imports =
    [ (modulesPath + "/installer/scan/not-detected.nix")
    ];

  hardware.cpu.amd.updateMicrocode = true;

  boot.initrd.availableKernelModules = [ "nvme" "xhci_pci" "ahci" "usbhid" "sd_mod" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-amd" "nct6775" ];
  boot.extraModulePackages = [ ];

  fileSystems."/" =
    { device = "/dev/disk/by-uuid/98125eb6-20d3-4707-bbfd-d89875a750ab";
      fsType = "ext4";
    };

  fileSystems."/home" =
    { device = "/dev/disk/by-uuid/c245a752-2e87-4af9-acfe-4d4222c9dc26";
      fsType = "ext4";
    };

  swapDevices =
    [ { device = "/dev/disk/by-uuid/a761b761-69f2-4f0a-9950-d9b18a2b37e2"; }
    ];
}
