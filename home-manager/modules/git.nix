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

      # https://qsantos.fr/2024/05/01/git-super-power-the-three-way-merge/
      merge.conflictstyle = "zdiff3";

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

      # From: https://blog.gitbutler.com/how-git-core-devs-configure-git/
      # Clearly makes git better
      column.ui = "auto";
      branch.sort = "-committerdate";
      tag.sort = "version:refname";
      init.defaultBranch = "main";
      diff = {
        algorithm = "histogram";
        colorMoved = "plain";
        mnemonicPrefix = true;
        renames = true;
      };
      push = {
        default = "simple";
        autoSetupRemote = true;
        followTags = true;
      };
      fetch = {
        prune = true;
        pruneTags = true;
        all = true;
      };

      # Why the hell not?
      help.autocorrect = "prompt";
      commit.verbose = true;
      rebase = {
        autoSquash = true;
        autoStash = true;
        updateRefs = true;
      };
    };
  };
}
