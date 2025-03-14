# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=10000
HISTFILESIZE=20000

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

source /etc/bash_completion.d/git-prompt
export GIT_PS1_SHOWDIRTYSTATE=1

if [ $(id -u) -eq 0 ];
  then #root
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;31m\]\u\[\033[01;37m\]@\[\033[01;33m\]\h\[\033[00m\]:\[\033[01;34m\]\w\[\e[1;31m\]$(__git_ps1 "(%s)")\[\033[00m\]\$ '
  else #normal
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u\[\033[01;37m\]@\[\033[01;33m\]\h\[\033[00m\]:\[\033[01;34m\]\w\n\[\e[1;31m\]$(__git_ps1 "(%s)")\[\033[00m\]\$ '
fi
#unset color_prompt force_color_prompt

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

# colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias gst='git status'
alias gd='git diff'
alias gup='git pull --rebase'
alias gds='git diff --staged'
alias gsh='git show'
alias glog="git log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ad) %C(bold blue)<%an>%Creset'"
alias gcp='git cherry-pick'
alias gcpa='git cherry-pick --abort'
alias gcpc='git cherry-pick --continue'
alias grba='git rebase --abort'
alias grbc='git rebase --continue'
alias gba='git branch -a'
alias gb='git branch'
alias gsm='git checkout main'
alias lg='lazygit'
alias vim='nvim'

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
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# Qt 4.7 installed from Git
#export PATH=/usr/local/Trolltech/Qt-4.7.0/bin:$PATH

# Qt for Symbian development
#export PATH=/home/afonso/gnupoc/bin:/home/afonso/gnupoc/qt_4.7.0/bin:$PATH
#export EPOCROOT=/home/afonso/gnupoc/sdk_5.0/ # trailing "/" is required!
#unset  QMAKESPEC    # make sure there is no QMAKESPEC variable set

#Save all sessions history
history -a

#Exclude some dirs from Grep
# export GREP_OPTIONS="-I --exclude-dir=.svn --exclude-dir=.cache --exclude-dir=moc"

#Debian packages vars
export DEBFULLNAME="Afonso R. Costa Jr."
export DEBEMAIL=arabelo@gmail.com

#Set SVN editor
export SVN_EDITOR=vim

#Set Git editor
export GIT_EDITOR=nvim

#Set main editor
export EDITOR=nvim
