###############
### .bashrc ###
###############
# echo $HISTFILE && echo $HISTSIZE

# command line init `.bashrc`
export HISTCONTROL=ignoreboth
export HISTSIZE=100000
export HISTFILESIZE=100000
export HISTIGNORE="pwd:history"

alias ll="ls -lhpi"
alias la="ls -lhpia"

export PS1='\[\033[1;36m\]\u\[\033[0m\]@\[\033[1;95m\]\h\[\033[0m\] \[\033[1;33m\]\w\[\033[0m\] \[\033[1;31m\]\$\[\033[0m\] '

# as root /etc/profile
HOSTNAME='/bin/hostname'

# Colors
LS_COLORS=$LS_COLORS:'di=1;36:'; export LS_COLORS
LS_COLORS=$LS_COLORS:'di=1;33:'; export LS_COLORS