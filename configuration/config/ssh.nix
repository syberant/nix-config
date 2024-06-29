{ secrets, ... }:

{
  services.openssh = {
    # Enable the OpenSSH daemon.
    enable = true;

    # Don't use keys in ~/.ssh/authorized_keys
    authorizedKeysInHomedir = false;

    # Don't open a port in the firewall.
    # WARN: This means you can't SSH into a computer without a VPN!
    # See: https://fzakaria.com/2020/09/17/tailscale-is-magic-even-more-so-with-nixos.html
    # I use Tailscale for this.
    openFirewall = false;

    settings = {
      # Don't allow logging in as root!
      # Standard hardening procedure.
      PermitRootLogin = "no";

      # Only allow logging in regular users
      AllowGroups = [ "users" ];

      # Disallow password authentication.
      PasswordAuthentication = false;
    };
  };

  # Always allow login with this key
  users.users.sybrand.openssh.authorizedKeys.keys = [
    # Public SSH Key
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAILbqV8qdwBEBk1NFbIDI5xNbM6lycFrWsw8NIHLHx8Ka sybrand@nixos-thinkpad"
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIAnmVeGskBS2u4SpwIJVYli6w5ZjTbLfXAyhaxTu2pLR sybrand@nixos-desktop"
  ];
}
