{ pkgs, ... }:

# From https://nixos.wiki/wiki/MPD
{
  hardware.pulseaudio.extraConfig = "load-module module-native-protocol-tcp auth-ip-acl=127.0.0.1";

  services.mpd = {
    enable = true;

    # Use personal music directory
    # Requires read acces on music directory itself and execute priviliges on parent directories.
    # chmod 710 /home/sybrand
    musicDirectory = "/home/sybrand/Media/Music";
    group = "users";

    extraConfig = ''
	audio_output {
		type "pulse"
		name "Pulseaudio"
		server "127.0.0.1"
	}
    '';
  };

  environment.systemPackages = [
	pkgs.mpc_cli
  	(pkgs.ncmpcpp.override {
		flags = [ "--config ${./dotfiles/ncmpcpp/ncmpcpp.conf}" "--bindings ${./dotfiles/ncmpcpp/bindings.conf}" ];
	})
  ];
}
