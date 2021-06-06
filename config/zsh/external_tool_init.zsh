
#======================================================================================
# External tool initialization
#======================================================================================

(command -v pyenv > /dev/null 2>&1) && eval "$(pyenv init -)"
(command -v direnv > /dev/null 2>&1) && eval "$(direnv hook zsh)"
(command -v starship > /dev/null 2>&1) && eval "$(starship init zsh)"
