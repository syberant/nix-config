{ lib, pkgs, flake-inputs, ... }:

{
  imports = [
    flake-inputs.nixos-hardware.nixosModules.apple-macbook-air-6
    ./hardware-configuration.nix
  ];

  disabledModules = [ "wayland.toml" "pkgs-gui.toml" ];
  programs.firefox.enable = lib.mkForce false;
  services.xserver.enable = lib.mkForce false;
  services.displayManager.enable = lib.mkForce false;

  # Unique ID for zfs
  networking.hostId = "fec9e12c";

  # Allow unfree
  nixpkgs.config.allowUnfree = true;

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Networking
  networking.hostName = "nixos-macbook"; # Define your hostname.

  # Allow remote SSH port forwarding
  services.openssh.settings.GatewayPorts = "yes";

  # Disable shutdown on power key
  # services.logind.extraConfig = ''
  #   HandlePowerKey=ignore
  #   HandleSuspendKey=ignore
  # '';

  services.cage = {
    enable = true;
    user = "sybrand";
    program = "${pkgs.foot}/bin/foot";
  };

  # Makes it so that media keys require pressing the Fn button instead of F1-F12
  boot.kernel.sysfs.module.hid_apple.parameters.fnmode = 2;
  services.keyd.keyboards.default.settings.main = {
    f1 = "1";
    f2 = "2";
    f3 = "3";
    f4 = "4";
    f5 = "5";
    f6 = "6";
    f7 = "7";
    f8 = "8";
    f9 = "9";
    f10 = "0";

    "shift+f1" = "!";
    "shift+f2" = "@";
    "shift+f3" = "#";
    "shift+f4" = "$";
    "shift+f5" = "%";
    "shift+f6" = "^";
    "shift+f7" = "&";
    "shift+f8" = "*";
    "shift+f9" = "(";
    "shift+f10" = ")";
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
  system.stateVersion = "25.05"; # Did you read the comment?
}
