builtins.toFile "i3-config-file" (
	builtins.readFile ../../config/i3/config +
	"exec_always --no-startup-id polybar example &" +
	"exec sxhkd &"
)
