{ neovim-unwrapped, fetchFromGitHub, tree-sitter }:

neovim-unwrapped.overrideAttrs (old: {
  version = "0.5.0";
  src = fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "432f3240f171e857beb3d1a554cbd8a649bb38ae";
    sha256 = "1drgaxnaazbv086pmy63254xm2madh8gl50kaynhbdwrrkxwcfzh";
  };
  # buildInputs = old.buildInputs ++ [ tree-sitter ];
})
