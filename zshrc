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
plugins=(extract tmux tmuxinator git github git-flow svn ruby rails3 bundler rvm heroku pip django fabric osx brew deb ssh-agent npm drush composer symfony2 vagrant knife)

# Python/ virtualenv
if [ -f /usr/local/bin/virtualenvwrapper.sh ]; then
    export WORKON_HOME=$HOME/.virtualenvs
    plugins=($plugins virtualenvwrapper)
fi

# OH MY ZSH!
source $ZSH/oh-my-zsh.sh

# Node / nvm
if [ -f "$HOME/.nvm/nvm.sh" ]; then
  source "$HOME/.nvm/nvm.sh"
fi

# phpbrew
if [ -f "$HOME/.phpbrew/bashrc" ]; then
  source "$HOME/.phpbrew/bashrc"
fi

# Ruby / rvm
if [ -f "$HOME/.rvm/scripts/rvm" ]; then
  source "$HOME/.rvm/scripts/rvm"
  rvm 2.0.0
fi

export DISABLE_AUTO_TITLE="true"
export EDITOR="vim"
export LSCOLORS="ExGxFxdxCxDxDxhbadExEx"
