#!/usr/bin/env bash

case $1 in
    "repl")
        nix run /etc/nixos#repl
        ;;
    "search")
        nix search nixpkgs $2;;
    "update")
        cd /etc/nixos
        case $2 in
            "stable")
                nix flake lock --update-input nixpkgs --update-input nixos-hardware --update-input home-manager
                ;;
            "unstable")
                nix flake lock --update-input nixpkgs-git
                ;;
            "nur")
                nix flake lock --update-input NUR
                ;;
            "misc")
                nix flake lock --update-input sops-nix --update-input flake-utils --update-input hosts
                ;;
            "own-deps")
                nix flake lock --update-input secrets --update-input xmonad-sybrand --update-input nix-neovim
                ;;
            *)
                # TODO: Maybe interpret this as a specific dependency and update it?
                echo "n update: Didn't recognise argument, what should be updated?"
                exit 1
        esac
        ;;
    *)
        echo "Didn't recognise subcommand. Did you make a typo?"
        exit 1
        ;;
esac
