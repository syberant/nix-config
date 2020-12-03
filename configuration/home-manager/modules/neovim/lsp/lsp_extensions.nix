{ fetchFromGitHub, vimUtils }:

vimUtils.buildVimPluginFrom2Nix {
  name = "lsp_extensions.nvim";

  src = fetchFromGitHub {
    owner = "nvim-lua";
    repo = "lsp_extensions.nvim";
    rev = "25951aca067b3a22f303f59d8eac2101d861850a";
    sha256 = "0bl7y9xpvlmisizyyykjskxmrg01s6p7nkgdfskx14dv2f8dmv8q";
  };
}
