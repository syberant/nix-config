{ pkgs, ... }:

# TODO: syntax checking with syntastic
{
  plugins = with pkgs.vimPlugins; [ rust-vim ];

  code = ''
    let g:rustfmt_autosave = 1
    let g:rustfmt_command = '${pkgs.rustfmt}/bin/rustfmt'
  '';
}
