# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
alias emacs='emacs -nw'

# screen settings
#if [ "$TERM" = "xterm-256color" ]; then
#    screen
#fi

# Color settings
function EXT_COLOR () { echo -ne "\[\033[38;5;$1m\]"; }
NO_COLOUR="\[\033[0m\]"
GRAY="\[\033[1;30m\]"
LIGHTBLUE=`EXT_COLOR 32`
WHITE=`EXT_COLOR 225`

# set a fancy prompt
export PS1="${LIGHTBLUE}[ ${WHITE}\u${LIGHTBLUE}@${WHITE}\h \W ${LIGHTBLUE}]\$ ${WHITE}"
