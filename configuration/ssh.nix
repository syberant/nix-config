{ secrets, ... }:

{
  services.openssh = {
    # Enable the OpenSSH daemon.
    enable = true;

    # Don't use keys in ~/.ssh/authorized_keys
    authorizedKeysInHomedir = false;

    # Disallow password authentication.
    # passwordAuthentication = false;
  };

  # Always allow login with this key
  users.users.sybrand.openssh.authorizedKeys.keyFiles = [
    # Public SSH Key
    (secrets + "/keys/nixos-desktop-ssh.asc")

    # GPG key, needs to be exported into ssh key first
    # (secrets + "/keys/personal-gpg.asc")
  ];
}
