{ fetchFromGitHub, vimUtils }:

vimUtils.buildVimPluginFrom2Nix {
  name = "completion-nvim";

  src = fetchFromGitHub {
    owner = "nvim-lua";
    repo = "completion-nvim";
    rev = "3b6774ed1c1b4720efe3385f06883483f5e16884";
    sha256 = "1vldm13lbfmphim946lnyl30276chw4gnnnq2hxnf67k8a9x8ssc";
  };
}
