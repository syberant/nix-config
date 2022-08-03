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
  ];
}
