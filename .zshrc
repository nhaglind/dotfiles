# Ruby version manager
source /opt/homebrew/opt/chruby/share/chruby/chruby.sh
source /opt/homebrew/opt/chruby/share/chruby/auto.sh

# Starship prompt
eval "$(starship init zsh)"

# Alias
alias vim="nvim"
alias cat="bat -p"
alias ls="eza -lh --group-directories-first --icons --hyperlink --no-user"
alias lsa="ls -a"
alias lt="eza --tree --level=2 --long --icons --git"
alias lta="lt -a"
alias lzd="lazydocker"
