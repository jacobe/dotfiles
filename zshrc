# ZSH configuration file
if [ $CODESPACES ]; then
  DOTFILES_DIR="/workspaces/.codespaces/.persistedshare/dotfiles"
else
  DOTFILES_DIR="$HOME/dotfiles"
fi

source $DOTFILES_DIR/env
source $DOTFILES_DIR/aliases

# Install nodenv
eval "$(nodenv init -)"

# Install rbenv
eval "$(rbenv init -)"

# Install direnv
eval "$(direnv hook zsh)"

# Install shell completions
eval $(gh completion --shell zsh)
eval $(npm completion)

# Install autosuggestions
source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# Allow for local overrides
if [ -f ~/.zshrc_local ]; then
    source ~/.zshrc_local
fi
