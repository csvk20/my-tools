# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoredups:ignorespace

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi


#-------------------------- Added by Dhiva ----------------------------------
# GIT decorators to show branch name with git repositories
#TODO: If there is a slash after branch name, then select stuff after that.
function parse_git_branch {
        git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' | sed -e 's/[a-zA-Z0-9]*[/\]//g' | cut -c 1-2,3-17 | sed -e 's/* \(.*\)/\[\1\]/'
}

function proml {
  local        BLUE="\[\033[0;34m\]"
# OPTIONAL - if you want to use any of these other colors:
  local         RED="\[\033[0;31m\]"
  local   LIGHT_RED="\[\033[1;31m\]"
  local       GREEN="\[\033[0;32m\]"
  local LIGHT_GREEN="\[\033[1;32m\]"
  local       WHITE="\[\033[1;37m\]"
  local  LIGHT_GRAY="\[\033[0;37m\]"
# END OPTIONAL
  local     DEFAULT="\[\033[0m\]"
  PS1="$GREEN\u$DEFAULT@$GREEN\h:$BLUE\w $RED\$(parse_git_branch)$LIGHT_GREEN\$ $DEFAULT"
}
proml
#---------------------------------------------------------------

# For long History
export HISTCONTROL=ignoredups:erasedups  # no duplicate entries
export HISTSIZE=100000                   # big big history
export HISTFILESIZE=100000               # big big history
shopt -s histappend                      # append to history, don't overwrite it

# ------------- Aliases ---------------------
alias tmux='tmux -u'

# ---------- Alias to goto project directory ----------
goto() {
  case "$1" in
    prod)
      cd /home/dhivakar/projects/production/normal-abnormal-prod/
      ;;
    test)
      cd /home/dhivakar/projects/testing/
      ;;
    *)
      ;;
  esac
}

# Alias to open nautilus from current folder
alias nt='nautilus ./'

# Alias for Copying the working directory path
alias cpdir='printf `pwd` | xclip -selection c'

# Alias for custom written scripts
alias change_ext='bash ~/csvk20/sys/bin/change_ext'

# Alias for activating environment in current directory
alias activate_env='source venv_*/bin/activate'

# Alias for appending all csv files excluding the header
alias append_csv='awk "FNR > 1" *.csv > master.csv'

#--------------------Added by Siva-------------------------------------------
# NAavigation Shortcuts
alias ..='cl ..'
alias ...='cl ../../'
alias ....='cl ../../../'
alias .....='cl ../../../../'
alias ......='cl ../../../../'
alias .......='cl ../../../../../'
alias ........='cl ../../../../../../'
alias home='clear && cd ~ && ll'                                                # Home directory
alias downloads='clear && cd ~/Downloads && ll'                                 # Downloads directory
cs() { cd "$@" &&  ls; }                                                        # Enter directory and list contents with ls
cl() { cd "$@" && ll; }                                                         # Enter directory and list contents with ll
site() { clear && cl $HOME/sites/"$@"; }                                        # Access site folders easier
wp-theme() { clear && cl $HOME/sites/"$@"/content/themes/"$@"; }                # Access a site theme folders easier
project() { clear && cl $HOME/projects/"$@"; }                                  # Access project folders easier
email() { clear && cl $HOME/projects/emails/"$@"; }                             # Access email folders easier
