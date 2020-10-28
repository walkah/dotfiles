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
plugins=(asdf aws gcloud extract command-not-found tmux git github ssh-agent docker docker-compose mix)

# ruby
if [ -x ruby ]; then
	plugins=($plugins ruby gem rails bundler heroku)
fi

# node
plugins=($plugins npm yarn react-native)

# python
plugins=($plugins pip pipenv)

# Platform specific settings
case "$OSTYPE" in
  darwin*)
    plugins=($plugins osx)
    ;;
  linux*)
    plugins=($plugins debian)
    ;;
esac

# OH MY ZSH!
source $ZSH/oh-my-zsh.sh

# Android Studio
if [ -d ~/Library/Android/sdk ]; then
  export ANDROID_SDK=~/Library/Android/sdk
  export PATH=~/Library/Android/sdk/platform-tools:$PATH
fi

# zsh autosuggestions
zsh_autosuggestions=$(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
if [ -f $zsh_autosuggestions ]; then
  source $zsh_autosuggestions
fi

if [ $TERM = "screen" ]; then
  export DISABLE_AUTO_TITLE="true"
fi
export EDITOR="vim"
export LSCOLORS="ExGxFxdxCxDxDxhbadExEx"

eval "$(starship init zsh)"
