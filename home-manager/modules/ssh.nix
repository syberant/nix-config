{ super, ... }:

{
  programs.ssh = {
    enable = true;

    matchBlocks = {
      "lilo.science.ru.nl" = {
        user = "sybrandaarnoutse";
        hostname = "lilo.science.ru.nl";
      };

      "nixos-desktop" = {
        user = "sybrand";
        hostname = "100.90.83.22";
        identityFile = [ super.sops.secrets.desktop-ssh-key.path ];
        identitiesOnly = true;
      };

      "nixos-macbook" = {
        user = "sybrand";
        hostname = "100.73.233.50";
        identityFile = [ super.sops.secrets.desktop-ssh-key.path ];
        identitiesOnly = true;
      };

      "nixos-thinkpad" = {
        user = "sybrand";
        hostname = "100.109.178.81";
        identityFile = [ super.sops.secrets.desktop-ssh-key.path ];
        identitiesOnly = true;
      };

      "homeserver" = {
        user = "sybrand";
        hostname = "100.69.232.99";
      };
    };
  };
}
