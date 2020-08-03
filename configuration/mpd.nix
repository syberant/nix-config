{ pkgs, ... }:

# From https://nixos.wiki/wiki/MPD
{
  hardware.pulseaudio.extraConfig =
    "load-module module-native-protocol-tcp auth-ip-acl=127.0.0.1";

  services.mpd = {
    enable = true;

    # Use personal music directory
    # Requires read acces on music directory itself and execute priviliges on parent directories.
    # chmod 710 /home/sybrand
    # FIXME: TODO: find better way
    musicDirectory = "/home/sybrand/Media/Music";
    playlistDirectory = "/home/sybrand/Media/Music/Playlists";
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
    pkgs.ncmpcpp
  ];
}
