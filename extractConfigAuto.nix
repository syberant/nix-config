{ flakePath ? "/etc/nixos", hostname }:

with builtins;

let
  # Load flake
  computer = (getFlake flakePath).nixosConfigurations.${hostname};

  config = import ./extractConfig.nix {
    lib = computer.pkgs.lib;
    config = computer.config;
  };
in config
