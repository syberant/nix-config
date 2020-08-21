{ pkgs, ... }:

let home-manager = (import /etc/nixos/nix/sources.nix).home-manager;
in {
  imports = [ (import "${home-manager}/nixos") ];

  # TODO: use home-manager from nur XOR find out why that isn't possible...
  #imports = [ pkgs.nur.repos.rycee.modules.home-manager ];

  # Removes dependency on NIX_PATH
  home-manager.useGlobalPkgs = true;

  home-manager.users.sybrand = import ./home.nix;

  # Use .profile used by home-manager
  environment.loginShellInit = ''
    if [ -e $HOME/.profile ]
    then
        . $HOME/.profile
    fi
  '';
}
