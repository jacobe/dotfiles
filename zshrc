# ZSH configuration file

if [ $CODESPACES ]; then
  DOTFILES_DIR="/workspaces/.codespaces/.persistedshare/dotfiles"
else
  DOTFILES_DIR="$HOME/dotfiles"
fi

source $DOTFILES_DIR/env
source $DOTFILES_DIR/aliases

# Initialize version managers
if [ -x "$(command -v nodenv)" ]; then
  eval "$(nodenv init -)"
fi
if [ -x "$(command -v rbenv)" ]; then
  eval "$(rbenv init -)"
fi
if [ -x "$(command -v pyenv)" ]; then
  eval "$(pyenv init -)"
fi

# Install direnv
eval "$(direnv hook zsh)"

# Configure oh-my-zsh
export ZSH=$HOME/.oh-my-zsh
ZSH_THEME="agnoster"
plugins=(z zsh-autosuggestions zsh-syntax-highlighting)
autoload -U compinit
compinit -i

# Configure custom keyboard mappings
bindkey "^[D" backward-word
bindkey "^[C" forward-word

# Allow for local ZSH overrides
if [ -f ~/.zshrc_local ]; then
  source ~/.zshrc_local
fi

source $ZSH/oh-my-zsh.sh
