# Enable colors
autoload -Uz colors
colors

# Delimiters of words (non-alphanumeric chars)
export WORDCHARS='*?_[]~!#$%^'

# Emacs like なキーバインドを使用
bindkey -e 

setopt auto_cd      # ディレクトリ名のみ入力時にそこへcd
setopt auto_list    # 補完候補が複数あるときに一覧表示
setopt auto_menu    # タブで補完候補を表示
setopt auto_pushd   # cdしたときに自動でディレクトリスタックへプッシュ
setopt bsd_echo     # BSD互換のecho (デフォルトではエスケープシーケンスは解釈しない)
setopt equals       # =command を $(which command) と同じ処理にする
setopt ignore_eof   # Ctrl+D でexitするのを防ぐ
setopt mark_dirs    # ディレクトリ名展開時に末尾の'/'を残す
setopt no_beep      # ビープ音を鳴らさない
setopt no_listbeep  # 補完候補の表示時にビープ音を鳴らさない
setopt magic_equal_subst # 引数での=以降も保管 (--prefix=/usr など)
setopt no_flow_control   # C-s/C-q によるstop/resumeを無効化
setopt print_exit_value  # 終了ステータスが0以外の場合にステータスを表示する
setopt pushd_ignore_dups # ディレクトリスタックに重複するものは古い方を削除

# History settings
export HISTSIZE=32768  # メモリに保存される履歴の件数 (保存数だけ履歴を検索できる)
export SAVEHIST=100000 # HISTFILE に保存される履歴の件数
export HISTFILE=~/.zsh_history
setopt extended_history   # 履歴に実行時間も保存する
setopt hist_expand        # 補完時に履歴を自動的に展開
setopt hist_ignore_dups   # 直前と同じコマンドは履歴に追加しない (似たやつに hist_ignore_all_dups もある)
setopt hist_save_no_dups  # 直前と同じコマンドがある場合は古い方を削除する
setopt hist_ignore_space  # 空白で始まるコマンドは履歴に追加しない
setopt hist_no_store      # historyコマンドは履歴に登録しない
setopt hist_reduce_blanks # 余分なスペースを削除して履歴に保存する
setopt share_history      # 他のシェルのヒストリをリアルタイムで共有する

# Use modern completion system
autoload -Uz compinit
compinit

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl true
zstyle ':completion:*' verbose true

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

(command -v pip3 &> /dev/null) && eval "$(pip3 completion --zsh)"
(command -v direnv &> /dev/null) && eval "$(direnv hook zsh)"

bindkey '^[[Z' reverse-menu-complete


####################################################################################################
# Plugin setup
[[ -d ~/.zplug ]] || curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh

source ~/.zplug/init.zsh

zplug "mollifier/cd-gitroot"
zplug "supercrabtree/k"
zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-history-substring-search"
zplug "zsh-users/zsh-syntax-highlighting", defer:2
zplug "b4b4r07/enhancd", use:init.sh

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

# Then, source plugins and add commands to $PATH
zplug load --verbose


####################################################################################################
# aliases
[[ -f ~/.aliases ]] && source ~/.aliases


####################################################################################################
# starship
eval "$(starship init zsh)"

####################################################################################################
# pyenv
# https://github.com/pyenv/pyenv
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi
