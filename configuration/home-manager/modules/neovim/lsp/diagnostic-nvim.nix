{ fetchFromGitHub, vimUtils }:

vimUtils.buildVimPluginFrom2Nix {
  name = "diagnostic-nvim";

  src = fetchFromGitHub {
    owner = "nvim-lua";
    repo = "diagnostic-nvim";
    rev = "bef1c6140563cb6416081b2517ae9953cd4e05ab";
    sha256 = "05f2hr3229zph3x9lhmabb9rzdf61r92f3ybj2gs40hfbak0c3pb";
  };
}
