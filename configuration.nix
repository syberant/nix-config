# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, ... }:

let pkgs = let
    inherit (import <nixpkgs> {}) fetchFromGitHub;
    nixpkgs = fetchFromGitHub {
        owner = "NixOS";
        repo = "nixpkgs-channels";
        rev = "f45ccd9d20b4e90e43c4562b9941ea1dbd8f07a4";
        sha256 = "10476ij19glhs2yy1pmvm0azd75ifjchpfbljn7h1cnnpii1xprc";
    };
  in import nixpkgs {};
in {
  imports =
    [ # Include the results of the hardware scan.
      ./current_host/hardware-configuration.nix
      ./current_host/main.nix
      ./packages/overview.nix
      ./modules/default.nix
    ];


  # Configure overlays
  nixpkgs.overlays = [
    (import ./overlays/added_packages)
    (import ./overlays/explicit_configuration)
  ];

  # My custom derivations live here
  environment.extraInit = "export NIX_PATH=custompkgs=/etc/nixos/custompkgs/default.nix:$NIX_PATH";

  programs.rupa_z.enable = true;

  networking.networkmanager.enable = true; # Enables wireless support via NetworkManager.
  #networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # The global useDHCP flag is deprecated, therefore explicitly set to false here.
  # Per-interface useDHCP will be mandatory in the future, so this generated config
  # replicates the default behaviour.
  networking.useDHCP = false;
  #networking.interfaces.wlp3s0.useDHCP = true;

  # Select internationalisation properties.
  # i18n = {
  #   consoleFont = "Lat2-Terminus16";
  #   consoleKeyMap = "us";
  #   defaultLocale = "en_US.UTF-8";
  # };

  # Set your time zone.
  time.timeZone = "Europe/Amsterdam";

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = { enable = true; enableSSHSupport = true; };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # Make computer discoverable through avahi
  services.avahi = {
    enable = true;
    nssmdns = true;
    publish.enable = true;
    publish.addresses = true;
  };

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  # Enable sound.
  sound.enable = true;
  hardware.pulseaudio.enable = true;

  # Fonts
  fonts = {
    fonts = with pkgs; [
      source-code-pro
    ];

    fontconfig = {
      defaultFonts.monospace = [ "Source Code Pro" ];
    };
  };

  # Hide mouse after a while
  services.unclutter = {
    enable = true;
    extraOptions = [ "noevents" "idle 2" ];
  };

  # Keyboard delay
  services.xserver.autoRepeatDelay = 250;

  # GPG config
  programs.gnupg.agent.enable = true;

  # Enable the X11 windowing system.
  services.xserver = {
    enable = true;
  };

  # hardware.opengl.driSupport32Bit = true;
  # services.xserver.layout = "us";
  # services.xserver.xkbOptions = "eurosign:e";

  # Enable i3 as desktop/window manager
  services.xserver.windowManager.i3 = {
    enable = true;
    configFile = "${./config/i3/config}";
    extraPackages = with pkgs; [
      dmenu
      feh
      rxvt_unicode
      i3status
    ];
  };

  # Enable compton
  services.compton = {
    enable = true;
    opacityRules = [
      "90:class_g = 'st-256color'"
      # "90:class_g = 'st-256color' && enabled"
      # "70:class_g = 'st-256color' && !enabled"
    ];
  };

  # Enable a nice Display Manager for logging in.
  services.xserver.displayManager.sddm.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.sybrand = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" ]; # Enable ‘sudo’ for the user.
    # Temporary password, should be changed later on
    initialHashedPassword = "$6$2u98e8ah8KrK2m6Q$SDyp6asDzhuIXAZgiNXYjM9lpFsuB5jRfss.6HxpErbMW7AFU76ufd.xULHHkiBqqv0../zsrm.R4DauUk/u6.";
  };

  # This value determines the NixOS release with which your system is to be
  # compatible, in order to avoid breaking some software such as database
  # servers. You should change this only after NixOS release notes say you
  # should.
  system.stateVersion = "19.09"; # Did you read the comment?

}
