{ pkgs, lib, ... }:

with lib;
with builtins;

let 
  getFiles = { dir, suffix ? null, allow_default ? true }:
    let
      hasDefault = d: hasAttr "default.nix" (readDir (dir + "/${d}"));
      isImportable = name: kind:
        if kind == "directory" then
          allow_default && hasDefault name
        else
          suffix == null || hasSuffix suffix name;
      files = attrNames (filterAttrs isImportable (readDir dir));
    in map (f: dir + "/${f}") files;

  getNixFiles = dir:
    getFiles {
      inherit dir;
      suffix = "nix";
    };
in {
  imports = getNixFiles ./modules;

  languages = {
    nix.enable = true;
    haskell.enable = true;
    rust.enable = true;
  };
  neoformat.enable = true;
  lightline.enable = true;
  colourscheme.gruvbox.enable = true;
  nerdcommenter.enable = true;
  gitgutter.enable = true;
  vim-surround.enable = true;
  treesitter.enable = true;

  vim-tmux-navigator.enable = true;

  vim.opt = {
    wrap = true;
    lbr = true;
    timeoutlen = 400;
  };

  # base = {
    # search.enable = true;
    # wrapping.enable = true;
    # files.enable = true;
  # };

  # output.plugins = with pkgs.vimPlugins; [];

  output.path.style = "impure";
  output.makeWrapper = "--set LUA_PATH '${./modules/lua}/?.lua;;'";
  output.path.path = with pkgs; [ xclip ];

  output.extraConfig = ''
    " Keybindings
    :lua require'keybindings'

    " TODO: Set clipboard tool with g:clipboard
  '';
}
