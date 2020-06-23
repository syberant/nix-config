self: super: {
  nur = import (builtins.fetchTarball
    (let rev = "d0468eaa0066a011f87122bbfb13d3ba619e742f";
    in {
      url = "https://github.com/nix-community/NUR/archive/${rev}.tar.gz";
      sha256 = "0zzjhff2nmykwc31ryaa3gcff6pp0cx4zf5am4569gh3a3mwplsr";
    })
  ) { pkgs = super; };
}
