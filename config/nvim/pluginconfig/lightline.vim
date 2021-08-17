let g:lightline = {
      \ 'colorscheme': 'default',
      \ 'separator': { 'left': "\ue0b0", 'right': "\ue0b2" },
      \ 'subseparator': { 'left': "\ue0b1", 'right': "\ue0b3" },
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'cocstatus', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'cocstatus': 'coc#status',
      \   'filename': 'LightlineFilename',
      \ },
      \ }

function! LightlineFilename()
  return ('' != expand('%') ? expand('%') : '[No Name]')
endfunction

let g:lightline.tab = {
    \ 'active': ['tabnum', 'filename', 'modified'],
    \ 'inactive': ['tabnum', 'filename', 'modified'],
    \ }

let g:lightline.tab_component_function = {
      \ 'filename': 'LightlineTabFilename',
      \ 'modified': 'lightline#tab#modified',
      \ 'readonly': 'lightline#tab#readonly',
      \ 'tabnum': 'lightline#tab#tabnum' }

function! LightlineTabFilename(n) abort
  let buflist = tabpagebuflist(a:n)
  let winnr = tabpagewinnr(a:n)
  let _ = expand('#'.buflist[winnr - 1].':h:t').'/'.expand('#'.buflist[winnr - 1].':t')
  return _ !=# '' ? _ : '[No Name]'
endfunction

" Use auocmd to force lightline update.
autocmd! User CocStatusChange,CocDiagnosticChange call lightline#update()
