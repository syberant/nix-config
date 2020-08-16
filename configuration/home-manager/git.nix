{ pkgs, ... }:

{
  home-manager.users.sybrand.programs.git = {
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

    extraConfig = {
      pull.ff = "only";

      credential.helper = let
        dotfile = pkgs.writeText "pass-git-helper-config" ''
          [github.com*]
          target=github.com
        '';
      in "${pkgs.gitAndTools.pass-git-helper}/bin/pass-git-helper -m ${dotfile}";

      commit.template = builtins.toFile "git-commit-template" ''


        # Title goes up here, remember to keep it short! Further comments go in the body below.

      '';
    };
  };
}
