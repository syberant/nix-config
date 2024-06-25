# https://github.com/splintah/xmonad-splintah/blob/master/xmonad-splintah/xmonad-splintah.nix
{ lib, mkDerivation, base, containers, process, stdenv, X11, xmonad, xmonad-contrib
, xmonad-extras }:

mkDerivation {
  pname = "xmonad-sybrand";
  version = "0.1.0.0";
  src = ./.;
  isLibrary = false;
  isExecutable = true;
  executableHaskellDepends =
    stdenv.initialPath ++ [ base containers process X11 xmonad xmonad-contrib xmonad-extras ];
  license = lib.licenses.agpl3Only;
}
