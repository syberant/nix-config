{ lib, pkgs, ... }:

{
  programs = {
    bash.interactiveShellInit = builtins.readFile ../dotfiles/bash/bashrc +
    lib.optionalString (builtins.pathExists ../dotfiles/bash/bash_aliases) ''
      . ${../dotfiles/bash/bash_aliases}
    '' + ''
      # Enable cool fzf functionality such as ctrl+r history searching
      source ${pkgs.fzf}/share/fzf/completion.bash
      source ${pkgs.fzf}/share/fzf/key-bindings.bash
    '';

    rupa_z.enable = true;

    gnupg.agent.enable = true;
  };
}
