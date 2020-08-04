{ ... }:

{
  imports = [ "${(import ../../nix/sources.nix).sops-nix}/modules/sops" ];

  sops.defaultSopsFile = ./secrets.yaml;
  sops.secrets.freedns = { };
}
