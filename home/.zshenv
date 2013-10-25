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
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
