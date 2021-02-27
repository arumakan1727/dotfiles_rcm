
#======================================================================================
# Setup zinit
#======================================================================================

### Added by Zinit's installer
if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing %F{33}DHARMA%F{220} Initiative Plugin Manager (%F{33}zdharma/zinit%F{220})…%f"
    command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
    command git clone https://github.com/zdharma/zinit "$HOME/.zinit/bin" && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
        print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi

source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit
### End of Zinit's installer chunk

#======================================================================================
# Plugins
#======================================================================================

# コマンドラインの色付け
zinit light zdharma/fast-syntax-highlighting

# コマンドラインに入力されている文字列をもとに薄い色でコマンドを提案
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=236'
zinit ice wait'!0' lucid
zinit light zsh-users/zsh-autosuggestions

# Ctrl+x -> Ctrl+b で Git ブランチを表示してインタラクティブに絞り込みして切り替え
zinit ice wait'!0' lucid atload"bindkey '^x^b' anyframe-widget-checkout-git-branch"
zinit light mollifier/anyframe

zinit wait'!0' lucid light-mode for \
  zsh-users/zsh-completions \
  agkozak/zsh-z \
  zsh-users/zsh-history-substring-search

zinit wait'!2' lucid light-mode for \
  mollifier/cd-gitroot \
  paulirish/git-open \
  supercrabtree/k \
  Tarrasch/zsh-bd \
  zdharma/history-search-multi-word
