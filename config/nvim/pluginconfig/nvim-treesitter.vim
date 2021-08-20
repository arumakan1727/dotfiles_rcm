lua << EOF
require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
    disable = { "vim" },
  },
  indent = {
    enable = true,
    disable = { "python", "html", "htmldjango" },
  }
}
EOF

set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()
