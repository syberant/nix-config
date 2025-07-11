{ ... }:

{
  services.syncthing = rec {
    enable = true;
    user = "sybrand";

    dataDir = "/home/${user}";

    # TODO
    # declarative.cert = "";
    # declarative.key = "";

    settings.devices.nixos-desktop = {
      id = "MQI4ZSR-F3UWNCD-VNVB3K6-KLY7HDN-TCBFC7J-PRTSPS4-AMVYNRB-ZXYO5AN";
      introducer = true;
    };

    settings.devices.nixos-thinkpad = {
      autoAcceptFolders = true;
      id = "EENKZIW-CXAZDYC-VN7JWIB-RULDRBF-ZCJ7AF2-OCDTG6W-NC2HOUO-AVBAOAP";
    };

    # settings.folders = {
    #   "/home/${user}/Documents/Radboud_Universiteit_1" = {};
    #   "/home/${user}/Documents/Radboud_Universiteit_2" = {};
    #   "/home/${user}/Documents/Radboud_Universiteit_3" = {};
    #   "/home/${user}/Documents/CGU_5E" = {};
    #   "/home/${user}/Documents/CGU_6E" = {};
    #   "/home/${user}/Documents/Persoonlijk" = {};
    #   "/home/${user}/Documents/Programmeren" = {};
    #   "/home/${user}/Media/Literatuur" = {};
    #   "/home/${user}/Media/Music" = {};
    #   "/home/${user}/.password-store" = {};
    #   "/home/${user}/Notities" = {};
    #   "/home/${user}/Agenda" = {};
    # };
  };
}
