{ pkgs, ... }:

{
  environment.etc."gitconfig" = let
    helperConfigFile = pkgs.writeText "pass-git-helper-config" ''
      [github.com*]
      target=github.com
    '';
  in {
    enable = true;
    text = ''
      [user]
        name = Sybrand Aarnoutse
        email = sybrand@neuralcoding.com
      [core]
        editor = vi
      [credential]
        helper = "${pkgs.gitAndTools.pass-git-helper}/bin/pass-git-helper -m ${helperConfigFile}"
    '';
  };
}
