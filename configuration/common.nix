# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ pkgs, config, lib, ... }:

{
  imports =
    [
      ./packages/overview.nix
      ./desktop-environment/default.nix
      ./mpd.nix
      ./mandarin.nix
      ../modules/default.nix
    ];

  # Configure overlays
  nixpkgs.overlays = [
    (import ../overlays/added_packages)
    (import ../overlays/explicit_configuration)
    (import ../overlays/nur.nix)
  ];

  # Set pkgs
  nixpkgs.pkgs =
    let pinned_pkgs = (import <nixpkgs> {}).fetchFromGitHub {
        owner = "NixOS";
        repo = "nixpkgs-channels";
        rev = "f45ccd9d20b4e90e43c4562b9941ea1dbd8f07a4";
        sha256 = "10476ij19glhs2yy1pmvm0azd75ifjchpfbljn7h1cnnpii1xprc";
    };
    in import pinned_pkgs { config = config.nixpkgs.config; };

  # Prevent state from accumulating.
  boot.cleanTmpDir = true; # Clean /tmp on boot.

  # Enables wireless support via NetworkManager.
  networking.networkmanager.enable = true;

  # The global useDHCP flag is deprecated, therefore explicitly set to false here.
  # Per-interface useDHCP will be mandatory in the future, so this generated config
  # replicates the default behaviour.
  networking.useDHCP = false;
  #networking.interfaces.wlp3s0.useDHCP = true;

  # Set your time zone.
  time.timeZone = "Europe/Amsterdam";

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # Make computer discoverable through avahi
  services.avahi = {
    enable = true;
    nssmdns = true;
    publish.enable = true;
    publish.addresses = true;
  };

  # Enable sound.
  sound.enable = true;
  hardware.pulseaudio.enable = true;

  # Fonts
  fonts = {
    fonts = with pkgs; [
      source-code-pro
      font-awesome_5
      font-awesome_4
    ];

    fontconfig = {
      defaultFonts.monospace = [ "Source Code Pro" ];
    };
  };

  # hardware.opengl.driSupport32Bit = true;
  # services.xserver.layout = "us";
  # services.xserver.xkbOptions = "eurosign:e";

  # Disable shutdown on power key
  services.logind.extraConfig = ''
    HandlePowerKey=ignore
    HandleSuspendKey=ignore
  '';

  # Enable a nice Display Manager for logging in.
  services.xserver.displayManager.sddm.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.sybrand = {
    isNormalUser = true;
    extraGroups = [
      "wheel" # Enable ‘sudo’ for the user.
      "networkmanager"
      "audio"
      "video"
    ];
    # Temporary password, should be changed later on
    initialHashedPassword = "$6$2u98e8ah8KrK2m6Q$SDyp6asDzhuIXAZgiNXYjM9lpFsuB5jRfss.6HxpErbMW7AFU76ufd.xULHHkiBqqv0../zsrm.R4DauUk/u6.";
  };

  # This value determines the NixOS release with which your system is to be
  # compatible, in order to avoid breaking some software such as database
  # servers. You should change this only after NixOS release notes say you
  # should.
  system.stateVersion = "19.09"; # Did you read the comment?
}