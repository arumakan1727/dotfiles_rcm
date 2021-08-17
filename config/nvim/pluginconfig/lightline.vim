let g:lightline = {
      \ 'colorscheme': 'one',
      \ 'separator': { 'left': "\ue0b0", 'right': "\ue0b2" },
      \ 'subseparator': { 'left': "\ue0b1", 'right': "\ue0b3" },
      \ 'active': {
      \   'left': [['mode', 'paste'], ['readonly', 'filename', 'modified'], ['cocstatus']],
      \ },
      \ 'tabline': {
      \   'left': [['buffers']],
      \   'right': [['close']],
      \ },
      \ 'component_expand': {
      \   'buffers': 'lightline#bufferline#buffers',
      \ },
      \ 'component_type': {
      \   'buffers': 'tabsel'
      \ },
      \ 'component_function': {
      \   'cocstatus': 'coc#status',
      \   'filename': 'LightlineFilename',
      \ },
      \ }

function! LightlineFilename()
  return ('' != expand('%') ? expand('%') : '[No Name]')
endfunction

" Use auocmd to force lightline update.
autocmd! User CocStatusChange,CocDiagnosticChange call lightline#update()
autocmd BufWritePost,TextChanged,TextChangedI * call lightline#update()
