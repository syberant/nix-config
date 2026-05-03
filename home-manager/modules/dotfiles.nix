{ config, pkgs, ... }:

let
  mkSource = file: { source = config.lib.file.mkOutOfStoreSymlink ("/etc/nixos/home-manager/linkFiles/" + file); };
in {
  home.file = pkgs.lib.listToAttrs (map (file: { name = file; value = mkSource file; }) [
    ".config/mimeapps.list"
    ".config/starship.toml"

    ".config/helix/config.toml" 
    ".config/lazygit/config.yml"
    ".config/elinks/elinks.conf"

    ".config/lf/lfrc"
    ".config/lf/preview"

    ".config/ncmpcpp/bindings"
    ".config/ncmpcpp/config"
    ".config/newsboat/config"

    ".gnupg/sshcontrol"

    ".XCompose"

    ".config/niri/config.kdl"

    ".config/waybar/config.jsonc"
    ".config/waybar/style.css"

    ".cargo/config.toml"
  ]);
}
