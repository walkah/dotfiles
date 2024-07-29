# Path to your oh-my-zsh configuration.
export ZSH=$HOME/.oh-my-zsh

# Set to the name theme to load.
# Look in ~/.oh-my-zsh/themes/
# export ZSH_THEME="walkah"

# My custom directory
export ZSH_CUSTOM=$HOME/.zsh/custom

# Set to this to use case-sensitive completion
# export CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# export DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# export DISABLE_LS_COLORS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(1password bundler direnv docker docker-compose git golang mix rails tmux)

# OH MY ZSH!
source $ZSH/oh-my-zsh.sh

# Android Studio
if [ -d ~/Library/Android/sdk ]; then
  export ANDROID_SDK=~/Library/Android/sdk
  export PATH=~/Library/Android/sdk/platform-tools:$PATH
fi

# zsh autosuggestions
if command -v brew &> /dev/null; then
  zsh_autosuggestions=$(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
  if [ -f $zsh_autosuggestions ]; then
    source $zsh_autosuggestions
  fi
fi

if [ $TERM = "screen" ]; then
  export DISABLE_AUTO_TITLE="true"
fi
export EDITOR="vim"

eval "$(starship init zsh)"

# Aliases
alias -- 'cat'='bat'
alias -- 'eza'='eza '\''--git'\'' '\''--header'\'''
alias -- 'la'='eza -a'
alias -- 'll'='eza -l'
alias -- 'lla'='eza -la'
alias -- 'ls'='eza'
alias -- 'lt'='eza --tree'