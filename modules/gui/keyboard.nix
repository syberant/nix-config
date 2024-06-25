{ config, lib, pkgs, ... }:

with lib;

let cfg = config.gui.keyboard;
in {
  options.gui.keyboard = {
    key_mappings = mkOption {
      type = types.listOf types.str;
      default = [ ];
    };
  };

  config =
    let code = map (a: ''xmodmap -e "keycode '' + a + ''"'') cfg.key_mappings;
    in {
      services.xserver.displayManager.sessionCommands = ''
        PATH="$PATH:${pkgs.xorg.xmodmap}/bin" bash ${
          pkgs.writeScript "macbook-fix-numbers"
          (builtins.concatStringsSep "\n" code)
        }'';
    };
}
