"整形オプション ( jp-reference: https://vim-jp.org/vimdoc-ja/change.html#fo-table )
augroup MyFormatOptionSetting
  autocmd!
  autocmd FileType * setlocal formatoptions=clmMrqj
augroup END
