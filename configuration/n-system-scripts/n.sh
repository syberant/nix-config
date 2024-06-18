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
    "impermanence")
        # What will I lose if I completely wipe the root directory on reboot?
        # TODO: bindmounts are still included
        sudo zfs diff -FH rpool/root@blank |
            sed -e '/^.\t@\t.*$/d' | # Remove symlinks as these are likely auto-generated by NixOS (`@` means a symlink)
            sed -e '/^.\t\/\t.*$/d' | # Ignore directories (`/` means a directory)
            cut -f3 -d$'\t' |
            sort |
            bat
                    ;;
    *)
        echo "Didn't recognise subcommand. Did you make a typo?"
        exit 1
        ;;
esac
