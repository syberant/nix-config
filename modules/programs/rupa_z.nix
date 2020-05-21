# load it at beginning of interactive shell
/* programs.bash.interactiveShellInit = ". rupa_z_init"; */

{ pkgs, config, lib, ... }:

with lib;

let
    cfg = config.programs.rupa_z;
in {
    options.programs.rupa_z = {
        enable = mkOption {
            type = types.bool;
            default = false;
            description = ''
                If enabled, z will be available as a script to be run.
            '';
        };

        onInteractive = mkOption {
            type = types.bool;
            default = true;
            description = ''
                If enabled, the z script will be run at the start of every interactive session.
                This will allow you to access its functionality.
            '';
        };
    };

    config = mkIf cfg.enable {
        environment.interactiveShellInit =  mkIf cfg.onInteractive ". ${pkgs.rupa_z}/bin/rupa_z_init";

        environment.systemPackages = [ pkgs.rupa_z ];
    };
}
