autocmd FileType markdown :hi markdownItalic gui=italic
augroup pandoc_syntax
    au! BufNewFile,BufFilePre,BufRead *.md set filetype=markdown.pandoc
augroup END
