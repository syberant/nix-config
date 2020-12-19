{ config, secrets, ... }:

let
  # secretsPath = /secrets/nixos-configuration/secrets;
  user = config.users.users.sybrand.name;
in {
  sops.validateSopsFiles = false;

  sops.defaultSopsFile = secrets + "/secrets.yaml";

  # Allow user to read keys
  users.users.sybrand.extraGroups = [ config.users.groups.keys.name ];

  sops.secrets.freedns = { };
  sops.secrets.desktop-ssh-key = {
    format = "binary";
    # sopsFile = secretsPath + "/secret-desktop-ssh-key";
    sopsFile = secrets + "/secrets/secret-desktop-ssh-key";
    owner = user;
  };
}
