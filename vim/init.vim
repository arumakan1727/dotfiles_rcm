"===============================
" .vimrc and neovim's init.vim
"===============================

" Encodings
set encoding=utf-8
set fileencodings=ucs-bom,utf-8,euc-jp,iso-2022-jp,cp932,sjis,latin1
set fileformats=unix,dos,mac

set sh=zsh

" This .vimrc's encoding (NOTE: This must be written after `set encoding=...`)
scriptencoding utf-8

" Base configuration
source ~/.vim/base.vim

" Key mappings
source ~/.vim/keymappings.vim

" Plugin install
if filereadable(expand('~/.vim/load-dein.vim'))
  source ~/.vim/load-dein.vim
endif

" Template for competitive programming
if filereadable(expand('~/.vim/template-set.vim'))
  source ~/.vim/template-set.vim
endif

try
  colorscheme gruvbox
catch
endtry
