{ pkgs }:

pkgs.writeText "i3-config-file" (
	builtins.readFile ../dotfiles/i3/config +
	"exec_always --no-startup-id polybar example &" +
	"exec ${pkgs.sxhkd}/bin/sxhkd -c ${../dotfiles/sxhkd/sxhkdrc} &"
)
