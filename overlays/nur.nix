self: super: {
  nur = import (import ../nix/sources.nix).NUR {
    pkgs = super;
    #repoOverrides = { syberant = import /home/sybrand/Documents/Programmeren/Nix/nur-packages { pkgs = super; }; };
  };
}
