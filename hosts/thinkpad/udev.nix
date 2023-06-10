{ pkgs, ... }:

# https://superuser.com/questions/357890/how-to-block-sites-with-iptables

let
  scriptAdd = pkgs.writeScript "usb-add" ''
    #!${pkgs.bash}/bin/bash

    ${pkgs.iptables}/bin/iptables -R distracting 1 -j ACCEPT
    echo "Custom USB key inserted, distracting websites allowed" > /dev/kmsg
  '';
  scriptRemove = pkgs.writeScript "usb-remove" ''
    #!${pkgs.bash}/bin/bash

    ${pkgs.iptables}/bin/iptables -R distracting 1 -j REJECT
    echo "Custom USB key removed, distracting websites blocked" > /dev/kmsg
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
  services.udev.extraRules = ''
    # Philips USB stick
    ACTION=="add", SUBSYSTEMS=="usb", ATTRS{manufacturer}=="Philips", ATTRS{idVendor}=="13fe", ATTRS{idProduct}=="5200", RUN+="${scriptAdd}"
    ACTION=="remove", SUBSYSTEMS=="usb", ENV{ID_VENDOR_ID}=="13fe", ENV{ID_MODEL_ID}=="5200", RUN+="${scriptRemove}"
  '';
}
