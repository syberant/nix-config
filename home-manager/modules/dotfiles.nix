{ config, ... }:

let
  mkSource = file: { source = config.lib.file.mkOutOfStoreSymlink ("/etc/nixos/home-manager/linkFiles/" + file); };
in {
  home.file = {
    ".config/mimeapps.list" = mkSource ".config/mimeapps.list";
    ".config/starship.toml" = mkSource ".config/starship.toml";

    ".config/helix/config.toml" = mkSource ".config/helix/config.toml";
    ".config/lazygit/config.yml" = mkSource ".config/lazygit/config.yml";
    ".config/elinks/elinks.conf" = mkSource ".config/elinks/elinks.conf";

    ".config/lf/lfrc" = mkSource ".config/lf/lfrc";
    ".config/lf/preview" = mkSource ".config/lf/preview";

    ".config/ncmpcpp/bindings" = mkSource ".config/ncmpcpp/bindings";
    ".config/ncmpcpp/config" = mkSource ".config/ncmpcpp/config";

    ".gnupg/sshcontrol" = mkSource ".gnupg/sshcontrol";

    ".config/niri/config.kdl" = mkSource ".config/niri/config.kdl";

    ".config/waybar/config.jsonc" = mkSource ".config/waybar/config.jsonc";
    ".config/waybar/style.css" = mkSource ".config/waybar/style.css";
  };
}
