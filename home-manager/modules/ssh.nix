{ super, ... }:

let
  ip-homeserver = "100.69.232.99";
  ip-macbook = "100.73.233.50";
  ip-desktop = "100.90.83.22";
  ip-thinkpad = "100.109.178.81";
in {
  programs.ssh = {
    enable = true;

    matchBlocks = {
      "lilo.science.ru.nl" = {
        user = "sybrandaarnoutse";
        hostname = "lilo.science.ru.nl";
      };

      "nixos-desktop" = {
        user = "sybrand";
        hostname = ip-desktop;
        identityFile = [ super.sops.secrets.desktop-ssh-key.path ];
        identitiesOnly = true;
      };

      "nixos-macbook" = {
        user = "sybrand";
        hostname = ip-macbook;
        identityFile = [ super.sops.secrets.desktop-ssh-key.path ];
        identitiesOnly = true;
      };

      "nixos-thinkpad" = {
        user = "sybrand";
        hostname = ip-thinkpad;
        identityFile = [ super.sops.secrets.desktop-ssh-key.path ];
        identitiesOnly = true;
      };

      "homeserver" = {
        user = "sybrand";
        hostname = ip-homeserver;
      };
    };
  };
}
