# Setup for NixOS containers, inactive for now

{
  # Don't manage nixos-container interfaces
  networking.networkmanager.unmanaged = [ "interface-name:ve-*" ];

  networking.nat = {
    # Enable NAT to give nixos-containers access to the internet
    enable = true;
    internalInterfaces = [ "ve-+" ];
    externalInterface = "enp5s0";

    forwardPorts = [{
      destination = "10.233.1.2:53";
      proto = "udp";
      sourcePort = "10.233.1.2:53";
    }];
  };
}
