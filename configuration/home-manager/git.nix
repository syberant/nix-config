{ pkgs, ... }:

{
  home-manager.users.sybrand.programs.git = {
    enable = true;

    userName = "Sybrand Aarnoutse";
    userEmail = "sybrand@neuralcoding.com";

    extraConfig = {
      credential.helper = let
        dotfile = pkgs.writeText "pass-git-helper-config" ''
          [github.com*]
          target=github.com
        '';
      in "${pkgs.gitAndTools.pass-git-helper}/bin/pass-git-helper -m ${dotfile}";
    };
  };
}
