self: super: {
  nur = import (builtins.fetchTarball
    (let rev = "12e5d21e28281ffd11b4ce9346c45811c3393fcf";
    in {
      url = "https://github.com/nix-community/NUR/archive/${rev}.tar.gz";
      sha256 = "0j2w2g7ly13a0ykikaz135l9rmgd4k6lw5m38qpjbd9440m70shp";
    })
    ) {
      pkgs = super;
      #repoOverrides = { syberant = import /home/sybrand/Documents/Programmeren/Nix/nur-packages { pkgs = super; }; };
    };
}
