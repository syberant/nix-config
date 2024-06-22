{ secrets, ... }:

{
  services.openssh = {
    # Enable the OpenSSH daemon.
    enable = true;

    # Don't use keys in ~/.ssh/authorized_keys
    authorizedKeysInHomedir = false;

    # Disallow password authentication.
    # passwordAuthentication = false;

    # Don't open a port in the firewall.
    # WARN: This means you can't SSH into a computer without a VPN!
    # See: https://fzakaria.com/2020/09/17/tailscale-is-magic-even-more-so-with-nixos.html
    # I use Tailscale for this.
    # openFirewall = false;
  };

  # Always allow login with this key
  users.users.sybrand.openssh.authorizedKeys.keyFiles = [
    # Public SSH Key
    (secrets + "/keys/nixos-desktop-ssh.asc")

    # GPG key, needs to be exported into ssh key first
    # (secrets + "/keys/personal-gpg.asc")
  ];
}
