{ lib, ... }:

{
  programs.mpv = {
    enable = true;

    config = {
      ytdl-format = lib.mkDefault
        "bestvideo[height<=720]+bestaudio/best[height<=720]/bestvideo+bestaudio/best";
      slang = "en-GB,en,en-US,nl";

      vo = "gpu,";
      hwdec = "auto";
      fullscreen = "yes";

      # Cache settings
      cache = "yes";
      cache-secs = 3600;
      demuxer-max-bytes = "1000m";
    };

    bindings = {
      UP = "add volume 2";
      DOWN = "add volume -2";
    };
  };
}
