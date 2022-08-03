#!/usr/bin/env bash

case $1 in
    "repl")
        nix run /etc/nixos#repl
        ;;
    "search")
        nix search nixpkgs $2;;
    *)
        echo "Didn't recognise subcommand. Did you make a typo?"
        exit 1
esac
