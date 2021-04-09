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
    };

    bindings = {
      UP = "add volume 2";
      DOWN = "add volume -2";
    };
  };
}
