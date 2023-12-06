{
  services.syncthing = rec {
    enable = true;
    user = "sybrand";

    dataDir = "/home/${user}";

    # declarative.cert = "";
    # declarative.key = "";

    settings = {
      devices.nixos-macbook.id =
        "ECDUSSX-C5OOXG6-RBIJK2F-377MBFH-WKCMJ5N-FVEOKG4-PC7A5RY-HUUMIQ7";
      devices.nixos-thinkpad.id =
        "EENKZIW-CXAZDYC-VN7JWIB-RULDRBF-ZCJ7AF2-OCDTG6W-NC2HOUO-AVBAOAP";

      folders = {
        "/home/${user}/Documents/Radboud_Universiteit_1".devices = [ "nixos-macbook" "nixos-thinkpad" ];
        "/home/${user}/Documents/Radboud_Universiteit_2".devices = [ "nixos-macbook" "nixos-thinkpad" ];
        "/home/${user}/Documents/Radboud_Universiteit_3".devices = [ "nixos-macbook" "nixos-thinkpad" ];
        "/home/${user}/Documents/CGU_5E".devices = [ "nixos-macbook" "nixos-thinkpad" ];
        "/home/${user}/Documents/CGU_6E".devices = [ "nixos-macbook" "nixos-thinkpad" ];
        "/home/${user}/Documents/Persoonlijk".devices = [ "nixos-macbook" "nixos-thinkpad" ];
        # TODO: declaratively configure "ignore patterns" instead of imperatively
        "/home/${user}/Documents/Programmeren".devices = [ "nixos-macbook" "nixos-thinkpad" ];
        "/home/${user}/Literatuur".devices = [ "nixos-macbook" "nixos-thinkpad" ];
        "/home/${user}/Media/Music".devices = [ "nixos-macbook" "nixos-thinkpad" ];
        "/home/${user}/.password-store".devices = [ "nixos-macbook" "nixos-thinkpad" ];
        "/home/${user}/Notities".devices = [ "nixos-macbook" "nixos-thinkpad" ];
        "/home/${user}/Agenda".devices = [ "nixos-macbook" "nixos-thinkpad" ];
      };
    };
  };
}
