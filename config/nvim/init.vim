"===============================
" .vimrc and neovim's init.vim
"===============================

" Encodings
set encoding=utf-8
set fileencodings=ucs-bom,utf-8,euc-jp,iso-2022-jp,cp932,sjis,latin1
set fileformats=unix,dos,mac

" This .vimrc's encoding (NOTE: This must be written after `set encoding=...`)
scriptencoding utf-8

source ~/.config/nvim/rc/base.vim

source ~/.config/nvim/rc/keymappings.vim

source ~/.config/nvim/rc/functions.vim

source ~/.config/nvim/rc/load-dein.vim

source ~/.config/nvim/autoload/template-setter.vim

try
  colorscheme onedark
catch
endtry
