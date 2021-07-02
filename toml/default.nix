{ lib, pkgs, nixpkgs-git, ... }:

with lib;
with pkgs.nur.repos.syberant.lib;

{
  # TODO: Output generated configuration somewhere for transparency
  imports = map importToml (getTomlFiles ./config);

  environment.systemPackages = let
    recurse = p: list:
      let
        h = p.${head list};
        t = tail list;
      in if (t == [ ]) then h else recurse h t;
    getPkg = packages: string: recurse packages (splitString "." string);
    fromList = { file, packages }:
      map (getPkg packages) (fromTOML (readFile file)).packages;
  in flatten (map fromList [
    {
      file = ./stable.toml;
      packages = pkgs;
    }
    {
      file = ./unstable.toml;
      packages = nixpkgs-git;
    }
    {
      file = ./nur.toml;
      packages = pkgs.nur;
    }
  ]);
}
