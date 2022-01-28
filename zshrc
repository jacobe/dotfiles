# ZSH configuration file

if [ $CODESPACES ]; then
  DOTFILES_DIR="/workspaces/.codespaces/.persistedshare/dotfiles"
else
  DOTFILES_DIR="$HOME/dotfiles"
fi

source $DOTFILES_DIR/env
source $DOTFILES_DIR/aliases

# Install version managers
eval "$(nodenv init -)"
eval "$(rbenv init -)"

# Install direnv
eval "$(direnv hook zsh)"

# Configure oh-my-zsh
export ZSH=$HOME/.oh-my-zsh
ZSH_THEME="agnoster"
plugins=(z zsh-autosuggestions zsh-syntax-highlighting)
autoload -U compinit
compinit -i

# Allow for local ZSH overrides
if [ -f ~/.zshrc_local ]; then
  source ~/.zshrc_local
fi

source $ZSH/oh-my-zsh.sh
