self: super: {
  nur = import (builtins.fetchTarball
    (let rev = "4bd81468c6203e19c71576f89a9b356ac79646c4";
    in {
      url = "https://github.com/nix-community/NUR/archive/${rev}.tar.gz";
      sha256 = "04nwssxiiagkzz2gqm75wlk8qm3y2ra4fl9lczgbzkz7k8ih6d8v";
    })
    ) {
      pkgs = super;
      #repoOverrides = { syberant = import /home/sybrand/Documents/Programmeren/Nix/nur-packages { pkgs = super; }; };
    };
}
