{ lib, ... }:

{
  # FIXME: This service fails on `nixos-rebuild switch` while everything is fine.
  # See https://github.com/NixOS/nixpkgs/issues/180175
  systemd.services.NetworkManager-wait-online.enable = lib.mkForce false;

  # Managed by NetworkManager instead.
  systemd.network.wait-online.enable = lib.mkForce false;
}
