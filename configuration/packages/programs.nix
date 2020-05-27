{ lib, ... }:

{
  programs = {
    bash.interactiveShellInit = builtins.readFile ../dotfiles/bash/bashrc +
      lib.optionalString (builtins.pathExists ../dotfiles/bash/bash_aliases) ". ${../dotfiles/bash/bash_aliases}";

    rupa_z.enable = true;

    gnupg.agent.enable = true;
  };
}
