let n = import <nixpkgs> {};
in { stdenv ? n.stdenv, fetchurl ? n.fetchurl }:

stdenv.mkDerivation rec {
  version = "1.11";
  name    = "rupa_z-${version}";

  src = fetchurl {
    url    = "https://raw.githubusercontent.com/rupa/z/v${version}/z.sh";
    sha256 = "f24e0791ba10f6a8301461da3fc50333eee2e009a19e5d0e9f3661f0d0446767";
  };

  phases = "installPhase";

  installPhase = ''
    mkdir -p $out/bin
    cp ${src} $out/bin/rupa_z_init
    chmod +x $out/bin/rupa_z_init
  '';
}
