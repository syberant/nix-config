self: super: {
    rupa_z = super.callPackage ./rupa_z {};
    myNeovim = import ./neovim { pkgs=super; };
}