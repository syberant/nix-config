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
    };
  };
}
