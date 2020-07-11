{ pkgs, config, ... }:

{
  # Hide mouse after a while
  services.unclutter = {
    enable = true;
    extraOptions = [ "noevents" "idle 2" ];
  };

  # Enable the X11 windowing system.
  services.xserver = {
    enable = true;

    # Keyboard delay
    autoRepeatDelay = 250;
    xkbOptions = "compose:ralt";
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
}
