{ pkgs, ... }:

{
services.tailscale.enable = true;

# Automate downloading Taildropped files.
# Requires you to have run `tailscale up --operator=$USER`
# See: https://github.com/tailscale/tailscale/issues/2312
# Inspired by https://github.com/davideger/blog/blob/e4eec177f2158278ea257c6c7769d91c74648117/setup_taildrop.sh
systemd.user.services.tailreceive = {
enable = true;
description = "Automatically download Taildropped files";

# FIXME: get this conversion from TOML working, then I don't need to have this as a nix file.
path = [ pkgs.tailscale ];
environment.TAILDROPDIR = "/home/sybrand/Downloads";
after = [ "network.target" ];
wantedBy = [ "default.target" ];

# serviceConfig.Type = "simple"
serviceConfig.UMask = "0077";
script = "tailscale file get --verbose --loop --conflict rename \"\${TAILDROPDIR}\"";
};
}
