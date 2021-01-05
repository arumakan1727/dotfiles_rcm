[[ -d ${HOME}/bin ]] && export PATH="${HOME}/bin:${PATH}"
[[ -d ${HOME}/.local/bin ]] && export PATH="${HOME}/.local/bin:${PATH}"
[[ -d ${HOME}/.nimble/bin ]] && export PATH="${HOME}/.nimble/bin:${PATH}"

export EDITOR=nvim

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="${HOME}/.sdkman"
[[ -s "${HOME}/.sdkman/bin/sdkman-init.sh" ]] && source "${HOME}/.sdkman/bin/sdkman-init.sh"

# Setup cargo
[[ -d ${HOME}/.cargo ]] && source "$HOME/.cargo/env"
