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
plugins=(git github svn ruby rails3 bundler rvm heroku pip django osx brew deb ssh-agent npm drush vagrant knife)

# TODO: remove this when bug is fixed in oh-my-zsh
# Workaround for loading theme from $ZSH_CUSTOM
# Github issue: https://github.com/robbyrussell/oh-my-zsh/pull/1107
MY_ZSH_THEME=$ZSH_THEME; ZSH_THEME=''

# OH MY ZSH!
source $ZSH/oh-my-zsh.sh

# TODO: remove this when bug is fixed in oh-my-zsh
# Workaround for loading theme from $ZSH_CUSTOM
# Github issue: https://github.com/robbyrussell/oh-my-zsh/pull/1107
source "$ZSH_CUSTOM/$MY_ZSH_THEME.zsh-theme"

# Ruby / rvm
if [ -f "$HOME/.rvm/scripts/rvm" ]; then
  source "$HOME/.rvm/scripts/rvm"
  rvm 1.9.3
fi

# Python/ virtualenv
if [ -f /usr/local/bin/virtualenvwrapper.sh ]; then
    export WORKON_HOME=$HOME/.virtualenvs
    source /usr/local/bin/virtualenvwrapper.sh
fi

# Node / nvm
if [ -f "$HOME/.nvm/nvm.sh" ]; then
  source "$HOME/.nvm/nvm.sh"
fi

export LSCOLORS="ExGxFxdxCxDxDxhbadExEx"
