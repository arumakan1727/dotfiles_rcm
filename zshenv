
#===============================================================
# Environment variables
#===============================================================

export XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"
export XDG_DATA_HOME="${XDG_DATA_HOME:-$HOME/.local/share}"

typeset -U path PATH manpath sudo_path
typeset -xT SUDO_PATH sudo_path

path=(
  $HOME/.bin(N-/)
  $HOME/bin(N-/)
  $HOME/.local/bin(N-/)

  $HOME/.pyenv/bin(N-/)
  $HOME/go/bin(N-/)
  $HOME/.go/bin(N-/)
  $HOME/.nimble/bin(N-/)
  $HOME/.yarn/bin(N-/)
  $HOME/.config/yarn/global/node_modules/.bin(N-/)
  $HOME/.deno/bin(N-/)
  $path
)

## SHELL
if SHELL=$(builtin command -v zsh); then
  export SHELL
else
  unset SHELL
fi

## EDITOR
if builtin command -v nvim > /dev/null 2>&1; then
  export EDITOR=nvim
else
  export EDITOR=vim
fi

## LESS
export PAGER=less
export LESS='--no-init --quit-if-one-screen -R --LONG-PROMPT -i --shift 4 --jump-target=3'

## Language tools
export GOPATH=$HOME/.go
export PYENV_ROOT=$HOME/.pyenv
export SDKMAN_DIR="$HOME/.sdkman"

[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && \
  source "$HOME/.sdkman/bin/sdkman-init.sh"

[[ -s "$HOME/.cargo/env" ]] && \
  source "$HOME/.cargo/env"
