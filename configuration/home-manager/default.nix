{ pkgs, ... }:

let home-manager = (import /etc/nixos/nix/sources.nix).home-manager;
in {
  imports = [ (import "${home-manager}/nixos") ./firefox.nix ./dotfiles.nix ];

  # TODO: use home-manager from nur XOR find out why that isn't possible...
  #imports = [ pkgs.nur.repos.rycee.modules.home-manager ];
}
