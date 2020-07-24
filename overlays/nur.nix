self: super: {
  nur = import (builtins.fetchTarball
    (let rev = "01b7524159b1be16b74b26a0dd5af782e1325cd1";
    in {
      url = "https://github.com/nix-community/NUR/archive/${rev}.tar.gz";
      sha256 = "0x8fx8ykxx9sjgxm3minizhv6vrawysgdxbjh08qbjiah2znh010";
    })
    ) {
      pkgs = super;
      #repoOverrides = { syberant = import /home/sybrand/Documents/Programmeren/Nix/nur-packages { pkgs = super; }; };
    };
}
