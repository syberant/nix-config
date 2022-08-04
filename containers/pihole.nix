{ config, lib, pkgs, ... }:

let
  basicInstall = pkgs.fetchurl {
    url = "https://install.pi-hole.net";
    sha256 = "sha256-U6ys0IRR5ZkLr/QIi1hvIPFuto7iPfoca6Xgot2si6s=";
  };
  ftl = pkgs.stdenv.mkDerivation rec {
    pname = "pihole-FTL";
    version = "5.15";

    src = pkgs.fetchFromGitHub {
      owner = "pi-hole";
      repo = "FTL";
      rev = "v${version}";
      sha256 = "sha256-1GZcMaMHV8prUz8beHiXdLxs5WnbRQeZNHZmg9Fp3AY=";
    };

    nativeBuildInputs = with pkgs; [ cmake ];
    buildInputs = with pkgs; [ gmp libidn nettle readline ];

    patchPhase = ''
      # Disable turning warnings into errors to get rid of an error
      sed -i 's/-Werror //g' ./src/CMakeLists.txt

      # Disable readline support for sqlite part, fixes linker error
      sed -i 's/ -DHAVE_READLINE//g' ./src/CMakeLists.txt
    '';
  };
in {
  boot.isContainer = true;
  networking.hostName = lib.mkDefault "piholetest";
  networking.useDHCP = false;

  networking.firewall = {
    # Allow webpage to be reached
    allowedTCPPorts = [ 80 ];

    # Allow DNS to be reached
    allowedUDPPorts = [ 53 ];
  };


  environment.extraInit = ''
    # To use the pihole script
    export PATH="/usr/bin:$PATH"

    # To use the pihole-FTL binary
    export PATH="/usr/local/bin:$PATH"
  '';

  users.users.pihole = {
    group = "pihole";
    isSystemUser = true;
  };

  # Allow apache to `sudo pihole` stuff
  security.sudo.extraRules = [{
    users = [ config.services.httpd.user ];
    commands = [{
      command = "/usr/local/bin/pihole";
      options = [ "NOPASSWD" ];
    }];
  }];


  services.httpd = {
    enable = true;
    enablePHP = true;
    adminAddr = "admin@example.com";

    virtualHosts.pihole = { documentRoot = "/var/www/html"; };
  };

  # For running automated setup with `/etc/pihole-install.sh --unattended`
  environment.etc."pihole/setupVars.conf" = {
    mode = "0600";
    text = ''
      PIHOLE_INTERFACE=eth0
      IPV4_ADDRESS=10.233.1.2/32
      IPV6_ADDRESS=
      PIHOLE_DNS_1=208.67.222.222
      PIHOLE_DNS_2=208.67.220.220
      QUERY_LOGGING=true
      INSTALL_WEB_SERVER=false
      INSTALL_WEB_INTERFACE=true
      LIGHTTPD_ENABLED=false
    '';
  };

  # Create our own systemd service file for pihole-FTL
  # See: https://github.com/pi-hole/pi-hole/pull/4236#issuecomment-886100978
  systemd.services.pihole-FTL = {
    enable = true;
    description = "Enable service provided by pihole-FTL daemon";

    after = [ "network.target" ];
    wantedBy = ["multi-user.target"];

    path = [
      (pkgs.writeScriptBin "is_running" ''
        #!/usr/bin/env sh

        pgrep -xo "pihole-FTL" > /dev/null
      '')
    ];

    preStart = ''
      touch /var/log/pihole-FTL.log /run/pihole-FTL.pid /run/pihole-FTL.port /var/log/pihole.log /etc/pihole/dhcp.leases
      chown pihole:pihole /etc/pihole /etc/pihole/dhcp.leases
      mkdir -p /var/run/pihole /var/log/pihole
      chown pihole:pihole /var/run/pihole /var/log/pihole
      # rm /var/run/pihole/FTL.sock
      chown pihole:pihole /var/log/pihole-FTL.log /run/pihole-FTL.pid /run/pihole-FTL.port /var/log/pihole.log
      chmod 0644 /var/log/pihole-FTL.log /run/pihole-FTL.pid /run/pihole-FTL.port /var/log/pihole.log
    '';

    serviceConfig = rec {
      # User = "pihole";
      # Group = "pihole";
      # PermissionsStartOnly = true;

      Type = "forking";
      PIDFile = "/run/pihole-FTL.pid";

      ExecStart = "/usr/bin/pihole-FTL";
      ExecReload = "kill -HUP $MAINPID";

      # ProtectSystem = "full";
      # ReadWriteDirectories = "/etc/pihole";

    };
  };

  environment.systemPackages = with pkgs; [
    # OS_CHECK_DEPS
    gnugrep
    dnsutils

    # INSTALLER_DEPS
    git
    iproute2
    cacert
    newt

    # PIHOLE_DEPS
    cron
    psmisc
    unzip
    dns-root-data
    netcat-openbsd

    # PIHOLE_WEB_DEPS

    # personal preferences
    vim
  ];

  environment.etc."pihole-install.sh".mode = "0700";
  environment.etc."pihole-install.sh".source =
    pkgs.runCommandLocal "patched-pihole-install.sh" { } ''
      cat <<EOF > $out
        # Create necessary install locations
        mkdir /opt
        mkdir -p /usr/local/bin
        mkdir -p /var/www/html
        mkdir /etc/init.d

        FTLinstall() {
          local str="Installing patched FTL..."
          printf "  %b %s..." "\''${INFO}" "\''${str}"

          # Move into the temp ftl directory
          pushd "\$(mktemp -d)" > /dev/null || { printf "Unable to make temporary directory for FTL binary download\\n"; return 1; }

          # Always replace pihole-FTL.service
          install -T -m 0755 "\''${PI_HOLE_LOCAL_REPO}/advanced/Templates/pihole-FTL.service" "/etc/init.d/pihole-FTL"

          local ftlBranch
          local url

          if [[ -f "/etc/pihole/ftlbranch" ]];then
              ftlBranch=$(</etc/pihole/ftlbranch)
          else
              ftlBranch="master"
          fi

          local binary
          binary="\''${1}"

          cp ${ftl}/bin/pihole-FTL "\''${binary}"

          printf "transferred... "

          # Before stopping FTL, we download the macvendor database
          curl -sSL "https://ftl.pi-hole.net/macvendor.db" -o "\''${PI_HOLE_CONFIG_DIR}/macvendor.db" || true

          # Stop pihole-FTL service if available
          stop_service pihole-FTL &> /dev/null

          # Install the new version with the correct permissions
          install -T -m 0755 "\''${binary}" /usr/bin/pihole-FTL

          # Move back into the original directory the user was in
          popd > /dev/null || { printf "Unable to return to original directory after FTL binary download.\\n"; return 1; }

          # Installed the FTL service
          printf "%b  %b %s\\n" "\''${OVER}" "\''${TICK}" "\''${str}"
          return 0
        }

        # SET SOME VARIABLES

        # Skip the OS check as we're on an unsupported OS
        PIHOLE_SKIP_OS_CHECK=true

        # Misleading name, is actually set to apache user and group
        LIGHTTPD_USER=wwwrun
        LIGHTTPD_GROUP=wwwrun

        # BEGINNING OF NORMAL INSTALL SCRIPT
      EOF

      cat ${basicInstall} >> $out

      # Disable package_manager_detect because...
      # we don't have a package manager here (let alone a supported one)
      sed -i 's/package_manager_detect$//g' $out

      # We added our own FTLinstall function above, disable the original
      sed -i 's/^FTLinstall()/originalFTLinstall()/g' $out
    '';
}
