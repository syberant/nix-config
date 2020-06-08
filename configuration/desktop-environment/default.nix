{ pkgs, ... }:

let lib = pkgs.lib;
in {
  imports = [ ];

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

    # Enable i3 as desktop/window manager
    windowManager.i3 = {
	enable = true;
	configFile = pkgs.writeText "i3-config-file" (
		builtins.readFile ../dotfiles/i3/config +
		"exec_always --no-startup-id polybar example &" +
		"exec ${pkgs.sxhkd}/bin/sxhkd -c ${../dotfiles/sxhkd/sxhkdrc} &" +
		"exec ${pkgs.dunst}/bin/dunst -config ${../dotfiles/dunst/config} &"
	);
	package = pkgs.i3-gaps;
	extraPackages = with pkgs; [
	  dmenu
	  feh
	  rxvt_unicode
	];
    };
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

  # Polybar
  programs.polybar = {
  	enable = true;
	enableConfigFile = true;
  };
}
