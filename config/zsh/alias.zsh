
#======================================================================================
# Aliases
#======================================================================================

alias mkdir="mkdir -p"
alias quit='exit'
alias rezsh='exec zsh'

# If command `gomi` is installed, replace `rm` with `gomi`
# gomi: https://github.com/b4b4r07/gomi
if builtin command -v gomi > /dev/null 2>&1; then
  alias rm='gomi'
else
  alias rm='rm -iv'
fi

alias mv='mv -iv'
alias cp='cp -iv'
alias ln='ln -v'

# ls
alias ls='ls -F --color=auto'
alias ll='ls -lh'
alias la='ls -a'
alias lla='ll -a'
alias ltr='ll -tr'
alias l.='ls -d .[a-zA-Z]*'

# chmod
alias 644='chmod 644'
alias 755='chmod 755'
alias 777='chmod 777'

# Pretty print the path
alias path='echo $PATH | tr -s ":" "\n"'

# Translate-shell
alias ja='trans :ja'
alias en='trans :en'

# Change directory to Parent Dir
alias ..='cd ..'
alias ...='cd ../..'

# Clipboard
alias pbcopy='xsel --input --clipboard'
alias pbpaste='xsel --output'

# Blank lines of half the height of the terminal
alias blanklines='tput cup $(($(stty size|cut -d " " -f 1))) 0 && tput ed'
