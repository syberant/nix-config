# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ self, pkgs, config, lib, ... }:

{
  imports = with lib; with builtins; let
    hasDefault = d: hasAttr "default.nix" (readDir (./. + "/${d}"));
    isImportable = name: kind: if kind == "directory" then hasDefault name else hasSuffix ".nix" name && name != "common.nix";
    files = attrNames (filterAttrs isImportable (readDir ./.));
  in map (f: ./. + "/${f}") files ++ [
    ../toml
    ../modules/default.nix
  ];

  nix = {
    # Use experimental flakes
    package = pkgs.nixFlakes;
    extraOptions = ''
      experimental-features = nix-command flakes
    '';

    # Save space
    autoOptimiseStore = true;
    gc = {
      automatic = true;
      dates = "monthly";
      options = "--delete-older-than 30d";
    };
  };

  # Let 'nixos-version --json' know about the Git revision of this flake.
  system.configurationRevision = pkgs.lib.mkIf (self ? rev) self.rev;

  # Prevent state from accumulating.
  boot.cleanTmpDir = true; # Clean /tmp on boot.

  # Enable zfs support
  boot.supportedFilesystems = [ "zfs" ];
  # Scrub zfs pools, defaults to weekly
  services.zfs.autoScrub.enable = true;

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
    fonts = with pkgs; [ source-code-pro font-awesome_5 font-awesome_4 ];

    fontconfig = { defaultFonts.monospace = [ "Source Code Pro" ]; };
  };

  # hardware.opengl.driSupport32Bit = true;
  # services.xserver.layout = "us";
  # services.xserver.xkbOptions = "eurosign:e";

  # Set xmonad as default DE
  services.xserver.displayManager.defaultSession = "none+xmonad";

  # Disable shutdown on power key
  services.logind.extraConfig = ''
    HandlePowerKey=ignore
    HandleSuspendKey=ignore
  '';

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
    initialHashedPassword =
      "$6$2u98e8ah8KrK2m6Q$SDyp6asDzhuIXAZgiNXYjM9lpFsuB5jRfss.6HxpErbMW7AFU76ufd.xULHHkiBqqv0../zsrm.R4DauUk/u6.";
  };

  # This value determines the NixOS release with which your system is to be
  # compatible, in order to avoid breaking some software such as database
  # servers. You should change this only after NixOS release notes say you
  # should.
  system.stateVersion = "19.09"; # Did you read the comment?
}
