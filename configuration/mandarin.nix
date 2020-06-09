{ pkgs, ... }:

{
        # TODO: declaratively configure fcitx
	# Disable default fcitx module
        #disabledModules = [ "i18n/input-method/fcitx.nix" ];

	# Import custom one
        #imports = [ ./fcitx.nix ];

	fonts.fonts = [ pkgs.noto-fonts-cjk ];

	services.xserver.layout = "us";

	i18n.inputMethod = {
		enabled = "fcitx";
		fcitx.engines = with pkgs.fcitx-engines; [ libpinyin ];
	};
}
