{ pkgs, nixpkgs-git, nix-neovim, ... }:

let myNeovim = nix-neovim.buildNeovim { configuration = ./configuration.nix; };
in {
  home.packages = [
    myNeovim

    # Override necessary here
    # Commented for now to try out neovide
    # (pkgs.neovim-qt.override { neovim = myNeovim; })

    nixpkgs-git.neovide
  ];
}
