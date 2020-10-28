{ pkgs, ... }:

# TODO: syntax checking with syntastic
{
  plugins = with pkgs.vimPlugins; [ neoformat ];

  code = ''
    let g:neoformat_rust_rustfmt = {
      \ 'exe' : '${pkgs.rustfmt}/bin/rustfmt',
      \ 'stdin' : 1,
    \ }

    augroup rust
      autocmd!
      autocmd BufWritePre *.rs undojoin | Neoformat! rust
    augroup END
  '';
}
