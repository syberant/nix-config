{ pkgs, ... }:

{
  programs.git = {
    enable = true;

    userName = "Sybrand Aarnoutse";
    userEmail = "sybrand@neuralcoding.com";

    delta = {
      enable = true;
      options = {
        number = true;
        syntax-theme = "Monokai Extended";
        file-style = "bright-yellow";
      };
    };

    aliases = {
      ci = "commit";
      st = "status";
      lg =
        "log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)%Creset' --abbrev-commit";
      graph =
        "log --graph --all --pretty=format:'%Cred%h%Creset %ad | [%C(bold blue)%an%Creset] %Cgreen%d%Creset %s' --date=iso";
    };

    extraConfig = {
      pull.ff = "only";
      init.defaultBranch = "main";

      # https://qsantos.fr/2024/05/01/git-super-power-the-three-way-merge/
      merge.conflictstyle = "diff3";

      credential.helper = let
        dotfile = pkgs.writeText "pass-git-helper-config" ''
          [github.com*]
          target=github-access-token
          skip_username=10

          [gitlab.science.ru.nl*]
          target=science.ru.nl
          skip_username=10
        '';
      in "${pkgs.gitAndTools.pass-git-helper}/bin/pass-git-helper -m ${dotfile}";

      commit.template = builtins.toFile "git-commit-template" ''


        # Title goes up here, remember to keep it short! Further comments go in the body below.

      '';
    };
  };
}
