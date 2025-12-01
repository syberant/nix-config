# Sybrand's [NixOS] configuration
I share most of my configuration across both of my hosts (a laptop and a desktop) but they do have host-specific configuraton in the [`hosts`](https://github.com/syberant/nix-config/tree/master/hosts) folder.

In this config I take advantage of the following projects:
- [Nix] and [NixOS] obviously
- [home-manager], fantastic for managing the dotfiles in your home directory, also contains many helpful modules
- [nixos-hardware], a surprisingly hard to find gem that contains hardware-specific configurations for many laptops
- [Nix User Repository (NUR)][NUR], provides an easy way to share unofficial packages
- [nix-neovim], my own toy project for configuring Neovim with Nix

## Overview of system
- Window Manager: [Niri](https://github.com/YaLTeR/niri)
- Additional keybindings: [sxhkd](https://github.com/baskerville/sxhkd)
- Status bar: [polybar](https://polybar.github.io/)
- PDF viewer: [zathura](https://pwmt.org/projects/zathura/)
- Password manager: [pass](https://www.passwordstore.org/)
- Terminal multiplexer: [tmux](https://github.com/tmux/tmux/wiki)
- Editor: [Neovim](https://neovim.io/)

[Nix]: https://nixos.org/manual/nix/stable/#chap-introduction
[NixOS]: https://nixos.org
[home-manager]: https://github.com/nix-community/home-manager
[nix-neovim]: https://github.com/syberant/nix-neovim
[nixos-hardware]: https://github.com/NixOS/nixos-hardware
[NUR]: https://github.com/nix-community/NUR
