self: super: {
  nur = import (builtins.fetchTarball
    (let rev = "518bb7cb3a967bd14c8970c5ba9650f7d410f9d9";
    in {
      url = "https://github.com/nix-community/NUR/archive/${rev}.tar.gz";
      sha256 = "0ds5s2wzzj25gyibjigm00nc0xymgn03mwxn1gcsj6j3jsfyflpp";
    })
    ) {
      pkgs = super;
      #repoOverrides = { syberant = import /home/sybrand/Documents/Programmeren/Nix/nur-packages { pkgs = super; }; };
    };
}
