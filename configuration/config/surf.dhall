-- surf, the suckless browser!
-- An experiment with Dhall.

let
    Package = Text -- FIXME: Use actual package type
in \(arguments : { pkgs : { surf : Package }}) ->

let pkgs = arguments.pkgs
in {
    environment.systemPackages = [ pkgs.surf ],

    -- Fixes surf bug, see https://github.com/NixOS/nixpkgs/issues/32580
    environment.variables.WEBKIT_DISABLE_COMPOSITING_MODE = 1,
}
