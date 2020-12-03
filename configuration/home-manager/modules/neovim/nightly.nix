{ fetchFromGitHub }:

let
  nightly-overlay = fetchFromGitHub {
    owner = "mjlbach";
    repo = "neovim-nightly-overlay";
    rev = "ccd925476217ed251644fbc2f1e9e93b48c894f8";
    sha256 = "051q01l0gbf43vydra093nq3g1kijdhc2dymnd9rmxmn2ycbw6bb";
  };
in (import "${nightly-overlay}/default.nix" { } { }).neovim-nightly
