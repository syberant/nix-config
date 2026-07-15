{ ... }:

let
  ip-homeserver = "100.69.232.99";
  ip-macbook = "100.121.185.128";
  ip-desktop = "100.90.83.22";
  ip-thinkpad = "100.113.91.18";
in
{
  programs.ssh = {
    enable = true;
    enableDefaultConfig = false;

    matchBlocks = {
      "lilo.science.ru.nl" = {
        user = "sybrandaarnoutse";
        hostname = "lilo.science.ru.nl";
      };

      "nixos-desktop" = {
        user = "sybrand";
        hostname = ip-desktop;
      };

      "nixos-macbook" = {
        user = "sybrand";
        hostname = ip-macbook;
      };

      "nixos-thinkpad" = {
        user = "sybrand";
        hostname = ip-thinkpad;
      };

      "homeserver" = {
        user = "sybrand";
        hostname = ip-homeserver;
      };

      # Default config
      "*" = {
        forwardAgent = false;
        addKeysToAgent = "no";
        compression = false;
        serverAliveInterval = 0;
        serverAliveCountMax = 3;
        hashKnownHosts = false;
        userKnownHostsFile = "~/.ssh/known_hosts";
        controlMaster = "no";
        controlPath = "~/.ssh/master-%r@%n:%p";
        controlPersist = "no";
      };

    };
  };
}
