{ pkgs, ... }:

# https://superuser.com/questions/357890/how-to-block-sites-with-iptables

let
  # Make a script
  # TODO: Make a pure PATH?
  # TODO: Debounce for rapid repeated udev events?
  mkScript = name: text: pkgs.writeScript name ''
    #!${pkgs.bash}/bin/bash

    ${text}
  '';

  scriptAdd = mkScript "usb-add" ''
    ${wifiOn}

    ${pkgs.iptables}/bin/iptables -R distracting 1 -j ACCEPT
    echo "Custom USB key inserted, distracting websites allowed" > /dev/kmsg
  '';
  scriptRemove = mkScript "usb-remove" ''
    ${wifiOff}

    ${pkgs.iptables}/bin/iptables -R distracting 1 -j REJECT
    echo "Custom USB key removed, distracting websites blocked" > /dev/kmsg
  '';

  wifiOff = mkScript "wifi-off" ''
    echo "Custom USB key removed, turning wifi off" > /dev/kmsg
    rfkill block wlan
  '';
  wifiOn = mkScript "wifi-on" ''
    echo "Custom USB key inserted, turning wifi on" > /dev/kmsg
    rfkill unblock wlan
  '';
in {
  networking.firewall.extraCommands = ''
  # Delete any old rules for "distracting"
  iptables -F distracting 2> /dev/null || true
  iptables -X distracting 2> /dev/null || true

  # Send distracting sites to own chain for configurable blocking, block by default
  iptables -N distracting
  iptables -A distracting -j REJECT
  # List of websites
  iptables -A OUTPUT -p tcp -m string --string "reddit.com"      --algo kmp -j distracting
  iptables -A OUTPUT -p tcp -m string --string "youtube.com"     --algo kmp -j distracting
  iptables -A OUTPUT -p tcp -m string --string "nos.nl"          --algo kmp -j distracting
  iptables -A OUTPUT -p tcp -m string --string "bbc.com"         --algo kmp -j distracting
  iptables -A OUTPUT -p tcp -m string --string "arstechnica.com" --algo kmp -j distracting
  '';

  # Block wlan on startup
  boot.kernelParams = [ "rfkill.default_state=0" ];


  # Monitor udev events with `udevadm monitor --subsystem-match=usb --property --udev`
  # You can use this to find new vendor and model id's.
  services.udev.extraRules = ''
    # Philips USB stick
    ACTION=="add", SUBSYSTEMS=="usb", ATTRS{manufacturer}=="Philips", ATTRS{idVendor}=="13fe", ATTRS{idProduct}=="5200", RUN+="${scriptAdd}"
    ACTION=="remove", SUBSYSTEMS=="usb", ENV{ID_VENDOR_ID}=="13fe", ENV{ID_MODEL_ID}=="5200", RUN+="${scriptRemove}"

    # Kingston 4GB stick
    # ACTION=="add", SUBSYSTEMS=="usb", ATTRS{manufacturer}=="Kingston", ATTRS{idVendor}=="0951", ATTRS{idProduct}=="1642", RUN+="${wifiOn}"
    # ACTION=="remove", SUBSYSTEMS=="usb", ENV{ID_VENDOR_ID}=="0951", ENV{ID_MODEL_ID}=="1642", RUN+="${wifiOff}"

    # 8GB "radio" stick
    ACTION=="add", SUBSYSTEMS=="usb", ATTRS{idVendor}=="058f", ATTRS{idProduct}=="6387", RUN+="${wifiOn}"
    ACTION=="remove", SUBSYSTEMS=="usb", ENV{ID_VENDOR_ID}=="058f", ENV{ID_MODEL_ID}=="6387", RUN+="${wifiOff}"
  '';
}
