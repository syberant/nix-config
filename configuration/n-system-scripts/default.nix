{ pkgs, ... }:

{
  environment.systemPackages = [
    (pkgs.stdenv.mkDerivation {
      name = "n-system-shortcuts";
      src = ./.;
      nativeBuildInputs = with pkgs; [ installShellFiles ];
      installPhase = ''
        mkdir -p $out/bin
        cp ${./n.sh} $out/bin/n

        installShellCompletion --bash --name n.bash ${./n-completion.bash}
      '';
    })
    (pkgs.stdenv.mkDerivation {
      name = "simple-user-scripts";
      src = ./simple;
      nativeBuildInputs = with pkgs; [];
      installPhase = ''
        mkdir -p $out
        cp -r $src $out/bin
        chmod +x $out/bin/*
      '';
    })
  ];
}
