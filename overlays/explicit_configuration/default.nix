self: super: {
    # mpv
    # NOTE: sets a config DIRECTORY instead of a single file
    mpv = super.symlinkJoin {
      name = "mpv";
      buildInputs = [ super.makeWrapper ];
      paths = [ super.mpv ];
      postBuild = ''
        wrapProgram "$out/bin/mpv" --add-flags "--config-dir=${../../config/mpv}"
      '';
    };

    # tmux
    tmux = super.symlinkJoin {
      name = "tmux";
      buildInputs = [ super.makeWrapper ];
      paths = [ super.tmux ];
      postBuild = ''
        wrapProgram "$out/bin/tmux" --add-flags "-f ${../../config/tmux/tmux.conf}"
      '';
    };
}
