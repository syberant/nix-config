{ ... }:

{
  imports = [ "${(import ../../nix/sources.nix).sops-nix}/modules/sops" ];

  sops.defaultSopsFile = let path = /secrets/nixos-configuration/secrets.yaml;
  in assert builtins.pathExists path; path;

  sops.secrets.freedns = { };
}
