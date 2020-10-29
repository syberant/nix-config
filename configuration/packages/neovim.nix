{ pkgs, ... }:

{
  languages = {
    nix.enable = true;
    haskell.enable = true;
    rust.enable = true;
  };
  neoformat.enable = true;
  lightline.enable = true;
  colourscheme.gruvbox.enable = true;

  output.config_file = ''
    " wrapping settings
    set wrap lbr
    noremap <buffer> <silent> k gk
    noremap <buffer> <silent> j gj
    noremap <buffer> <silent> 0 g0
    noremap <buffer> <silent> $ g$

    " Better escaping? Don't exactly know why this is here.
    tnoremap <Esc> <c-\><c-n>
    inoremap <Esc> <Esc><Esc>
  '';
}
