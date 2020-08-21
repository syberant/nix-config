{ pkgs, ... }:

let
  nur-no-pkgs = import (import ../nix/sources.nix).NUR {
    #repoOverrides.syberant = import /home/sybrand/Documents/Programmeren/Nix/nur-packages { };
  };
in {
  imports = [ nur-no-pkgs.repos.syberant.modules.shell-environments ];

  programs.shell-environments = {
    modules = {
      base.include = [ "fixenv" ];

      rust-coreutils = {
        extraPackages = with pkgs; [ bat lsd ripgrep fd ];
        bashrc = ''
          alias ls="lsd --icon=never"
        '';
      };

      # Fix variables that should be passed through, TERM gets appropriate value for tmux
      fixenv.bashrc = ''
        export HOME=/home/sybrand
        export TERM=screen
      '';
    };

    environments = [
      {
        name = "fluff";
        extraPackages = with pkgs; [ tmux neofetch cmatrix sl pipes ];
        bashrc = ''
          # Stop tmux from reusing an existing server
          # TODO: fix tmux stubbornly sourcing ~/.bashrc
          export TMUX_TMPDIR=$TMP
        '';
      }
      {
        name = "rust";
        extraPackages = with pkgs; [ rustc cargo rustfmt myNeovim ];
        include = [ "rust-coreutils" ];
        bashrc = ''
          alias vi=nvim
          export EDITOR=nvim
          export VISUAL=nvim
        '';
      }
    ];
  };
}
