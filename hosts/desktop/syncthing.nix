{ ... }:

{
  services.syncthing = rec {
    enable = true;
    user = "sybrand";

    dataDir = "/home/${user}";

    # declarative.cert = "";
    # declarative.key = "";

    # declarative.devices.nixos-macbook = {
      # id = "";
    # };

    declarative.folders = {
      "/home/${user}/Documents/Radboud_Universiteit_1" = { # devices = [ "nixos-macbook" ];
      };
      "/home/${user}/Documents/CGU_5E" = { # devices = [ "nixos-macbook" ];
      };
      "/home/${user}/Documents/CGU_6E" = { # devices = [ "nixos-macbook" ];
      };
      "/home/${user}/Documents/Persoonlijk" = { # devices = [ "nixos-macbook" ];
      };
      # TODO: declaratively configure "ignore patterns" instead of imperatively
      "/home/${user}/Documents/Programmeren" = {
        # devices = [ "nixos-macbook" ];
      };
      "/home/${user}/Literatuur" = { # devices = [ "nixos-macbook" ];
      };
      "/home/${user}/Media/Music" = { # devices = [ "nixos-macbook" ];
      };
      "/home/${user}/.password-store" = { # devices = [ "nixos-macbook" ];
      };
    };
  };
}
