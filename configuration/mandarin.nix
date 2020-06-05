{ pkgs, ... }:

{
	fonts.fonts = [ pkgs.noto-fonts-cjk ];

	services.xserver.layout = "us";

	i18n.inputMethod = {
		enabled = "fcitx";
		fcitx.engines = with pkgs.fcitx-engines; [ libpinyin ];
	};
}
