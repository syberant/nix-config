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
      export FZF_CTRL_T_OPTS="--preview 'bat --color=always --line-range :100 {}'"
      export FZF_ALT_C_OPTS="--preview 'tree -C {} | head -100'"
    '';

    rupa_z.enable = true;

    browserpass.enable = true;

    gnupg.agent.enable = true;
  };
}
