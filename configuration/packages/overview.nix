{ lib, pkgs, nixpkgs-git, ... }:

with lib;

let
  recurse = p: list: let h = p.${head list}; t = tail list; in if (t == [ ]) then h else recurse h t;
  getPkg = packages: string: recurse packages (splitString "." string);
  fromList = { file, packages }:
    map (getPkg packages) (fromTOML (readFile file)).packages;
in {
  environment.systemPackages = flatten (map fromList [
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

  # Configuration for certain programs via NixOS modules
  programs = {
    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
    };
  };
}
