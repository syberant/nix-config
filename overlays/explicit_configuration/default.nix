self: super: let
	lib = super.lib;
	overridable_flags = import ./overridable_flags.nix;
in {
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

    # dunst
    dunst = overridable_flags {
	name = "dunst";
	derivation = super.dunst;
	pkgs = super;
    };
}
