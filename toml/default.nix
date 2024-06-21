{ lib, pkgs, nixpkgs-git, ... }:

with lib;
with pkgs.nur.repos.syberant.lib;

{
  # TODO: Output generated configuration somewhere for transparency
  imports = map importToml (getTomlFiles ./config);

  environment.systemPackages = let
    ofPkgs = p: getAttrFromPath (splitString "." p) pkgs;
    fromList = { file, packages }:
      map ofPkgs (fromTOML (readFile file)).packages;
  in flatten (map fromList [
    {
      file = ./unstable.toml;
      packages = nixpkgs-git;
    }
  ]);
}
