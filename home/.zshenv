# ignore system zsh
IGNORE_SYSTEM_ZSH=1


# unique path... and put my stuff first
typeset -U path
path=(~/bin ~/local/bin ~/local/sbin /usr/local/bin /usr/local/sbin /usr/bin /usr/X11R6/bin /bin /usr/sbin /sbin /usr/games)

### environment
export PAGER=less
export RSYNC_RSH=ssh
export CVS_RSH=ssh
#export CVSROOT=/home/cvs

[ -f $HOME/.environment ] && . $HOME/.environment

# Load asdf
if [ type brew &> /dev/null ]; then
  . $(brew --prefix asdf)/asdf.sh
else 
  . ~/.asdf/asdf.sh
fi

[ -e $HOME/.nix-profile/etc/profile.d/nix.sh ] && . $HOME/.nix-profile/etc/profile.d/nix.sh

