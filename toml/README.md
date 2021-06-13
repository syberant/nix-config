# Simplify the setup
A surprising amount of NixOS configuration is just enabling features and filling in values.
A full-blown Turing-complete language like Nix is very powerful and can do awesome stuff.
In this part of my configuration however I simplify things again... by using TOML!

All the TOML files in `toml/config` are automagically imported as sets and they get merged into the NixOS module system.
For example I need to fill in some personal details:
```toml
# config/personal-information.toml

# Set your time zone.
time.timeZone = "Europe/Amsterdam"

# My approximate location, used by redshift
[location]
latitude = 52.083333
longitude = 5.116667
```
This reads basically like a NixOS module!
It does (IMHO) have some readability benefits however because of [TOML tables](https://toml.io/en/v1.0.0#table) which allow for quick and elegant access to long options like `users.users.sybrand`.
It also gives me some peace of mind as I can worry less about these modules because they are *simple* and can't have crazy Turing-complete interactions with everything (although the options they enable still can).

## Pkgs
Unfortunately any usage of a derivation depends on the Nix language doing its magic.
The biggest use for this is `environment.systemPackages`, as a short term solution I import the `packages` attribute of `toml/stable.toml` (there's also `unstable.toml` and `nur.toml`) which defines a list of packages that will be installed:
```toml
# stable.toml

# Equivalent to: environment.systemPackages = with pkgs; [ vim emacs nano ];
packages = [ "vim", "emacs", "nano" ]
```

I am also experimenting with automatically mapping a list or singular string to an attribute of `pkgs` whenever the `type` of the NixOS option is `package` or `listOf package`.
This is currently working (though very hacky) and I'm very curious to see how well and what kind of problems pop up.
It allows you to do stuff like this:
```toml
# Equivalent to: fonts.fonts = with pkgs; [ source-code-pro ];
fonts.fonts = [ "source-code-pro" ]

# Equivalent to: nix.package = pkgs.nixFlakes;
[nix]
package = "nixFlakes"
```

UPDATE: First problem has popped up, this does not handle submodules currently so everything configured inside e.g. `users.users.<name>` can't be corrected.

## Error handling
Somewhat helpful error messages are offered (NixOS as a whole is, although improving, not doing too great at this and such an experimental setup is even worse).
This is done in 3 ways:
- `_file` is set to the source TOML file in the generated module (this allows the module system to point to the correct file in error messages)
- an error is thrown when any package specified by a TOML string doesn't exist
- some `lib.addErrorContext` is sprinkled in to give useful information in a trace (use the flag `--show-trace` to see the trace Nix generates).

<!-- TODO: Showcase error messages with real-world problems -->

## Hacking the NixOS module system
A solution to a lot of problems and general hackyness could be to use some sort of modified NixOS module system, I think for example `lib.types.package` could be overridden with an overlay to perhaps allow for strings as well.
Allowing `.toml` files to be imported just like normal `.nix` files (e.g. with `imports = [ some_file.toml ];`) is probably more work and I'm not even sure it's possible to modify the module system from the outside like this.

## Other config formats
Basically all that's needed here is a function that converts a file into a Nix set.
Nix comes presupplied with `fromTOML` and `fromJSON`, JSON doesn't *really* support comments (there are workarounds) so I went with TOML but also supporting JSON should be a piece of cake.

One gripe I have with TOML is that declaring long lists of packages isn't very elegant as you need quotation marks around every package, this would be needed for JSON too but maybe a `fromFORMAT` could be written (or perhaps is already written) for a better format.
In my mind that format would have to fulfill these conditions:
- have comments
- elegant way of listing packages, no quotation marks around strings?
- elegant way to support deep sets (like TOML tables)
- not be too niche/work well with other tools

Not really searching for it though because I like TOML quite a lot, just want to keep the door open to other formats.

## Automation
As these are much more standard formats than Nix files, other non-Nix tools could conceivably be made to read (or even write) them!
I don't have any usecase for this and likely never will but just wanted to point this out here because I think it's cool.

## Relevant material
- [PR I found merging basic TOML support into NixOS](https://github.com/NixOS/nixpkgs/pull/96641)
- [Wiki about module system](https://nixos.wiki/wiki/Module)
- [Discourse discussion about YAML as configuration language](https://discourse.nixos.org/t/why-not-use-yaml-for-configuration-and-package-declaration/1333)
- [Discourse discussion about alternative configuration formats](https://discourse.nixos.org/t/alternative-language/5218)
