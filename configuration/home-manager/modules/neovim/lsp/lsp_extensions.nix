{ fetchFromGitHub, vimUtils }:

vimUtils.buildVimPluginFrom2Nix {
  name = "lsp_extensions.nvim";

  src = fetchFromGitHub {
    owner = "nvim-lua";
    repo = "lsp_extensions.nvim";
    rev = "eaa389f8a80d9700cc2c3bce787b00b61761a0f0";
    sha256 = "0zndlyn3xgzxwshjk79yfva5914xchzg9v8qimfgn7jlmn5ljhwm";
  };
}
