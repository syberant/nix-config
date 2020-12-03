{ fetchFromGitHub, vimUtils }:

vimUtils.buildVimPluginFrom2Nix {
  name = "completion-nvim";

  src = fetchFromGitHub {
    owner = "nvim-lua";
    repo = "completion-nvim";
    rev = "936bbd17577101a4ffb07ea7f860f77dd8007d43";
    sha256 = "1z399q3v36hx2ipj1fhxcc051pi4q0lifyglmclxi5zkbmm0z6a7";
  };
}
