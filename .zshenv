export ZDOTDIR=$HOME/.config/zsh
export STARSHIP_CONFIG=~/.config/starship/starship.toml

# opencode
export PATH=/Users/sszhikharev/.opencode/bin:$PATH

# secrets (not tracked in git)
[ -f "$HOME/.secrets" ] && source "$HOME/.secrets"
