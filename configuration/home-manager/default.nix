{ pkgs, ... }:

let home-manager = (import /etc/nixos/nix/sources.nix).home-manager;
in {
  imports = [
    (import "${home-manager}/nixos")
    ./dotfiles.nix

    ./bash.nix
    ./shell.nix
    ./firefox.nix
    ./fzf.nix
    ./git.nix
  ];

  # TODO: use home-manager from nur XOR find out why that isn't possible...
  #imports = [ pkgs.nur.repos.rycee.modules.home-manager ];

  # Remove dependency on NIX_PATH
  home-manager.useGlobalPkgs = true;

  home-manager.users.sybrand.xdg.enable = true;

  # Use .profile used by home-manager
  environment.loginShellInit = ''
    if [ -e $HOME/.profile ]
    then
        . $HOME/.profile
    fi
  '';
}
