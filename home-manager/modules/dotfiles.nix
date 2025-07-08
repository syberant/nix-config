{ config, ... }:

let
  mkSource = file: { source = config.lib.file.mkOutOfStoreSymlink ("/etc/nixos/home-manager/linkFiles/" + file); };
in {
  home.file = {
    ".config/mimeapps.list" = mkSource ".config/mimeapps.list";
    ".config/starship.toml" = mkSource ".config/starship.toml";

    ".config/lf/lfrc" = mkSource ".config/lf/lfrc";
    ".config/lf/preview" = mkSource ".config/lf/preview";

    ".config/ncmpcpp/bindings" = mkSource ".config/ncmpcpp/bindings";
    ".config/ncmpcpp/config" = mkSource ".config/ncmpcpp/config";

    ".gnupg/sshcontrol" = mkSource ".gnupg/sshcontrol";
  };
}
