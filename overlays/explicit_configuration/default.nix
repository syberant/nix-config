self: super: let
	lib = super.lib;
	overridable_flags = import ./overridable_flags.nix;
in {
    # mpv
    # NOTE: sets a config DIRECTORY instead of a single file
    mpv = overridable_flags {
    	name = "mpv";
	derivation = super.mpv;
	pkgs = super;
    };

    # tmux
    tmux = overridable_flags {
    	name = "tmux";
	derivation = super.tmux;
	pkgs = super;
    };

    # sxhkd
    sxhkd = overridable_flags {
	name = "sxhkd";
	derivation = super.sxhkd;
	pkgs = super;
    };

    # polybar
    polybar = overridable_flags {
    	name = "polybar";
	derivation = super.polybarFull;
	pkgs = super;
    };

    # ncmpcpp
    ncmpcpp = overridable_flags {
    	name = "ncmpcpp";
	derivation = super.ncmpcpp;
	pkgs = super;
    };

    # dunst
    dunst = overridable_flags {
	name = "dunst";
	derivation = super.dunst;
	pkgs = super;
    };
}
