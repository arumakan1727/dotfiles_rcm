
#======================================================================================
# External tool initialization
#======================================================================================

(command -v pyenv > /dev/null 2>&1) && eval "$(pyenv init --path)"
(command -v direnv > /dev/null 2>&1) && eval "$(direnv hook zsh)"
(command -v starship > /dev/null 2>&1) && eval "$(starship init zsh)"
(command -v rebenv > /dev/null 2>&1) && eval "$(rbenv init -)"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
