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
plugins=(autojump extract command-not-found tmux tmuxinator git github git-flow ssh-agent golang vagrant knife docker docker-compose mix mix-fast)

# ruby
plugins=($plugins ruby gem rbenv rails bundler heroku)
export RBENV_ROOT=$HOME/.rbenv

# node
plugins=($plugins nodenv npm yarn)
export NODENV_ROOT=$HOME/.nodenv

# python
plugins=($plugins pyenv pip)
export PYENV_ROOT=$HOME/.pyenv

# php / drupal
plugins=($plugins drush composer)

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

# AWS CLI
if [ -f /usr/local/bin/aws_zsh_completer.sh ]; then
    source /usr/local/bin/aws_zsh_completer.sh
fi

# gcloud
if [ -d /usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk ]; then
  source '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc'
  source '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc'
  source <(kubectl completion zsh)
fi

if [ $TERM = "screen" ]; then
  export DISABLE_AUTO_TITLE="true"
fi
export EDITOR="vim"
export LSCOLORS="ExGxFxdxCxDxDxhbadExEx"
