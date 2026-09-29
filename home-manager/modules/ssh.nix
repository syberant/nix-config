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

    settings = {
      "lilo.science.ru.nl" = {
        User = "sybrandaarnoutse";
        HostName = "lilo.science.ru.nl";
      };

      "nixos-desktop" = {
        User = "sybrand";
        HostName = ip-desktop;
      };

      "nixos-macbook" = {
        User = "sybrand";
        HostName = ip-macbook;
      };

      "nixos-thinkpad" = {
        User = "sybrand";
        HostName = ip-thinkpad;
      };

      "homeserver" = {
        User = "sybrand";
        HostName = ip-homeserver;
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
