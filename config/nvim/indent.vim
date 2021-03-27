augroup MyIndentSettingsByFiletype
  autocmd!

  autocmd Filetype vim,sh,bash,zsh
        \ setlocal shiftwidth=2 softtabstop=2 tabstop=2
  autocmd Filetype tsv
        \ setlocal shiftwidth=16 tabstop=16 softtabstop=16 noexpandtab
  autocmd Filetype yaml
        \ setlocal shiftwidth=2 softtabstop=2 tabstop=2 expandtab
  autocmd Filetype json
        \ setlocal shiftwidth=2 softtabstop=2 tabstop=2
  autocmd Filetype gitconfig
        \ setlocal shiftwidth=2 softtabstop=2 tabstop=2
augroup END
