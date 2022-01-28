# ZSH configuration file

source ~/dotfiles/env
source ~/dotfiles/aliases

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
