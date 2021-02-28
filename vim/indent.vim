augroup MyIndentSettingsByFiletype
  autocmd!

  autocmd Filetype vim,sh,bash,zsh
              \ setlocal shiftwidth=2 softtabstop=2 tabstop=2
  autocmd Filetype tsv
              \ setlocal shiftwidth=16 tabstop=16 softtabstop=16 noexpandtab
augroup END

