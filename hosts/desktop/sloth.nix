{ pkgs, nix-neovim, config, ... }:

{
  # Add gnome-terminal for compatibility
  programs.gnome-terminal.enable = true;

  containers.sloth = {
    # Completely stateless
    ephemeral = true;

    config = { lib, config, pkgs, ... }: {
      environment.systemPackages = with pkgs; [
        gcc
        nano
        tmate

        (nix-neovim.buildNeovim {
          configuration = {
            imports = [
              ../../configuration/home-manager/modules/neovim/configuration.nix
            ];

            treesitter.enable = lib.mkForce false;
          };
        })
      ];

      programs.bash.shellInit = "export TERM='xterm-256color'";
      environment.shellAliases.vi = "nvim";

      users.mutableUsers = false;
      users.users.sloth = {
        isNormalUser = true;
        initialHashedPassword = "";
      };

      users.users.root = {
        isSystemUser = true;
        initialHashedPassword =
          "$6$eP8CeVwT$KFCmQyM7kbtmMq5BI3mFUypxvVWYVyeemT7ZLdlVWn0Duw000cBLUGmaxioQ8BB4inMHKExHYACLo0qzKCKJM/";
      };
    };
  };
}
