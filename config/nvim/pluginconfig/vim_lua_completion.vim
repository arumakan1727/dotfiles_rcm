set completeopt=menuone,noinsert,noselect
set shortmess+=c

augroup MyLuaCompletionSetting
  autocmd!
  autocmd FileType * lua require'completion'.on_attach()
augroup end

inoremap <expr> <Tab>   pumvisible() ? "\<Down>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<Up>"   : "\<S-Tab>"

let g:completion_confirm_key = ""
imap <expr> <cr>  pumvisible() ? complete_info()["selected"] != "-1" ?
      \ "\<Plug>(completion_confirm_completion)"  : "\<c-e>\<CR>" :  "\<CR>"


"map <c-n> to manually trigger completion
imap <silent> <C-Space> <Plug>(completion_trigger)

let g:completion_enable_auto_popup = 1
let g:completion_enable_auto_hover = 1
let g:completion_enable_auto_signature = 1
let g:completion_sorting = "length"
let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy', 'all']
let g:completion_matching_ignore_case = 1
let g:completion_matching_smart_case = 0
let g:completion_trigger_keyword_length = 2  " default = 1

let g:completion_chain_complete_list = [
      \{'complete_items': ['lsp', 'path', 'snippet', 'buffers']},
      \{'mode': '<c-p>'},
      \{'mode': '<c-n>'}
\]

augroup CompletionTriggerCharacter
    autocmd!
    autocmd FileType * let g:completion_trigger_character = ['.']
    autocmd BufEnter c,cpp let g:completion_trigger_character = ['.', '::']
augroup end

