# Path to your oh-my-zsh configuration.
export ZSH=$HOME/.oh-my-zsh

# Set to the name theme to load.
# Look in ~/.oh-my-zsh/themes/
export ZSH_THEME="walkah"

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
plugins=(extract command-not-found tmux tmuxinator timetrap git github git-flow ruby gem rvm rails bundler heroku ssh-agent npm nvm golang drush composer symfony2 vagrant knife docker docker-compose)

# Python/ virtualenv
if [ -f /usr/local/bin/virtualenvwrapper.sh ]; then
    export WORKON_HOME=$HOME/.virtualenvs
    plugins=($plugins virtualenvwrapper pip django fabric)
fi

# Platform specific settings
case "$OSTYPE" in
    darwin*)
        plugins=($plugins brew brew-cask osx)
        ;;
    linux*)
        plugins=($plugins deb)
        ;;
esac

UNBUNDLED_COMMANDS=(knife)

# OH MY ZSH!
source $ZSH/oh-my-zsh.sh

# phpbrew
if [ -f "$HOME/.phpbrew/bashrc" ]; then
  source "$HOME/.phpbrew/bashrc"
fi

# AWS CLI
if [ -f /usr/local/bin/aws_zsh_completer.sh ]; then
    source /usr/local/bin/aws_zsh_completer.sh
fi

if [ $TERM = "screen" ]; then
  export DISABLE_AUTO_TITLE="true"
fi
export EDITOR="vim"
export LSCOLORS="ExGxFxdxCxDxDxhbadExEx"
