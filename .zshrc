# If you come from bash you might have to change your $PATH.
export PATH=/opt/homebrew/Cellar/ruby/3.3.0/bin:/usr/local/opt/php/bin:/opt/homebrew/sbin:/opt/homebrew/bin:/usr/local/sbin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/Users/nexxai/.composer/vendor/bin:/usr/local/share/dotnet:/Users/nexxai/scripts:/Users/nexxai/go/bin:/Users/nexxai/.cargo/bin/Users/nexxai/.composer/vendor/bin
export HOMEBREW_NO_ENV_HINTS=1

# zsh-completions
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
autoload -Uz compinit && compinit
eval "$(zoxide init zsh --cmd cd)"

export CLICOLOR=1
export LSCOLORS=ExGxBxDxCxEgEdxbxgxcxd

alias pico="nvim"
alias vi="nvim"
alias vim="nvim"

alias p="vendor/bin/pest --parallel"
alias phpunit="vendor/bin/phpunit"
alias gcm="git checkout master"
alias fsrm="ssh justinsmith@184.70.101.122"
alias ploi="ssh ploi@138.68.247.10"
alias personal="ssh nexxai@138.68.247.10"
alias flushdns="sudo dscacheutil -flushcache; sudo killall -HUP mDNSResponder"
alias irc="ssh nexxai@secure.divide0.net"
alias art="php artisan"
alias youtube-dl="yt-dlp"
alias bu="brew upgrade"
alias zshrc="vim ~/.zshrc ; source ~/.zshrc"
alias whatismyip="curl ipv4.icanhazip.com ; curl ipv6.icanhazip.com"
alias cat="bat"
alias ls="eza"
alias python="python3"

alias gc="git clone"
alias gcm="git checkout master ; git pull"
alias gcmn="git checkout main ; git pull"
alias gcb="git checkout -b"
alias gco="git checkout"
alias gp="git pull"
alias gs="git stash"
alias gsa="git stash apply"
alias grd="git stash ; gcm ; git stash apply"
alias gbda="git branch | grep -v "main" | xargs git branch -D"


# ASSOCIATE SUFFIXES WITH APP
alias -s md=code
alias -s json=code
alias -s php=code


function git-search() {
	git log -S"$1" --no-merges -c --pretty=format:'%h %s [%an]'
}

function tweets() {
	cd ~/code/tweetopenai
	python3 sn.py
}

export FUNCTIONS_CORE_TOOLS_TELEMETRY_OPTOUT=true

export EDITOR=nvim

source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

eval "$(starship init zsh)"

# Herd injected NVM configuration
export NVM_DIR="/Users/nexxai/Library/Application Support/Herd/config/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

[[ -f "/Applications/Herd.app/Contents/Resources/config/shell/zshrc.zsh" ]] && builtin source "/Applications/Herd.app/Contents/Resources/config/shell/zshrc.zsh"

# Herd injected PHP 8.3 configuration.
export HERD_PHP_83_INI_SCAN_DIR="/Users/nexxai/Library/Application Support/Herd/config/php/83/"


# Herd injected PHP binary.
export PATH="/Users/nexxai/Library/Application Support/Herd/bin/":$PATH

# bun completions
[ -s "/Users/nexxai/.bun/_bun" ] && source "/Users/nexxai/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"


