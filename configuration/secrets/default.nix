{ config, ... }:

let
  secretsPath = /secrets/nixos-configuration/secrets;
  user = config.users.users.sybrand.name;
in {
  imports = [ "${(import ../../nix/sources.nix).sops-nix}/modules/sops" ];

  sops.defaultSopsFile = let path = secretsPath + "/../secrets.yaml";
  in assert builtins.pathExists path; path;

  # Allow user to read keys
  users.users.sybrand.extraGroups = [ config.users.groups.keys.name ];

  sops.secrets.freedns = { };
  sops.secrets.desktop-ssh-key = {
    format = "binary";
    sopsFile = secretsPath + "/secret-desktop-ssh-key";
    owner = user;
  };
}
