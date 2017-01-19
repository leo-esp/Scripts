# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

export PATH=$PATH:/home/leonardo.esposito/MyScripts/Scripts

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
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

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

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
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi
alias cdw='cd ~/Workspace'

alias cdccb='cd ~/Workspace/corretora-core-back'
alias cdccf='cd ~/Workspace/corretora-core-front'
alias cdcct='cd ~/Workspace/corretora-core-trusted'
alias cdpv='cd ~/Workspace/portal-valemobi'
alias cdvc='cd ~/Workspace/valebroker-coldfusion'
alias cdvct='cd ~/Workspace/valebroker-coldfusion-trusted'
alias cdvfe='cd ~/Workspace/valebroker-flex-extras'
alias cdvfw='cd ~/Workspace/valebroker-flex-web'
alias cdvh='cd ~/Workspace/valebroker-html'
alias cdvhw='cd ~/Workspace/valebroker-html-web'

alias installccb='git clone git@github.com:Valemobi/corretora-core-back.git'
alias installccf='git clone git@github.com:Valemobi/corretora-core-front.git'
alias installcct='git clone git@github.com:Valemobi/corretora-core-trusted.git'
alias installpv='git clone git@github.com:Valemobi/portal-valemobi.git'
alias installvc='git clone git@github.com:Valemobi/valebroker-coldfusion.git'
alias installvct='git clone git@github.com:Valemobi/valebroker-coldfusion-trusted.git'
alias installvfe='git clone git@github.com:Valemobi/valebroker-flex-extras.git'
alias installvfw='git clone git@github.com:Valemobi/valebroker-flex-web.git'
alias installvh='git clone git@github.com:Valemobi/valebroker-html.git'
alias installvhw='git clone git@github.com:Valemobi/valebroker-html-web.git'

alias letsgo='code ~/Workspace && 1all'
alias sql='code ~/MyScripts/Valemobi/'
alias fu='fuck.sh'
alias commit='commit.sh'
alias jira='jira.sh'
alias push='push.sh'
alias d0='git checkout andbank_dev'
alias h0='git checkout andbank_homolog'
alias m0='git checkout master'
alias 1='git status'
alias 2='git add .'
alias 3='git commit -am'
alias 4='git pull'
alias 5='git push'
alias 6='git stash'
alias 7='git stash pop'
alias merge='git merge andbank_dev'
alias 1all='find . -mindepth 1 -maxdepth 1 -not -path "*/\.*" -type d -exec echo "------------------------------------------------------------------------------->PROJECT: "{} \; -exec git --git-dir={}/.git --work-tree=$PWD/{} status \;'
alias 1alls='find . -mindepth 1 -maxdepth 1 -not -path "*/\.*" -type d -exec echo "------------------------------------------------------------------------------->PROJECT: "{} \; -exec git --git-dir={}/.git --work-tree=$PWD/{} status -s \;'
alias 2all='find . -mindepth 1 -maxdepth 1 -not -path "*/\.*" -type d -exec git --git-dir={}/.git --work-tree=$PWD/{} add . \; && 1all'
alias 4all='find . -mindepth 1 -maxdepth 1 -not -path "*/\.*" -type d -exec echo "------------------------------------------------------------------------------->PROJECT: "{} \; -exec git --git-dir={}/.git --work-tree=$PWD/{} pull \;'
alias rall='find . -mindepth 1 -maxdepth 1 -not -path "*/\.*" -type d -exec echo "------------------------------------------------------------------------------->PROJECT: "{} \; -exec git --git-dir={}/.git --work-tree=$PWD/{} reset \;'
alias hdiff='find . -mindepth 1 -maxdepth 1 -not -path "*/\.*" -type d -exec echo "------------------------------------------------------------------------------->PROJECT: "{} \; -exec git --git-dir={}/.git --work-tree=$PWD/{} diff --name-only andbank_homolog \;'
alias ddiff='find . -mindepth 1 -maxdepth 1 -not -path "*/\.*" -type d -exec echo "------------------------------------------------------------------------------->PROJECT: "{} \; -exec git --git-dir={}/.git --work-tree=$PWD/{} diff --name-only andbank_dev \;'
alias dall='find . -mindepth 1 -maxdepth 1 -not -path "*/\.*" -type d -exec echo "------------------------------------------------------------------------------->PROJECT: "{} \; -exec git --git-dir={}/.git --work-tree=$PWD/{} checkout andbank_dev \;'
alias hall='find . -mindepth 1 -maxdepth 1 -not -path "*/\.*" -type d -exec echo "------------------------------------------------------------------------------->PROJECT: "{} \; -exec git --git-dir={}/.git --work-tree=$PWD/{} checkout andbank_homolog \;'
alias fall='for dir in ~/Workspace/*; do (cd "$dir" && fu && sleep 0.5s); done'
alias fudiffall='for dir in ~/Workspace/*; do (cd "$dir" && fudiff && sleep 0.5s); done'
alias fudiff='foca $(git diff --name-only --diff-filter=d andbank_dev)'
alias editbash='code ~/.bashrc'
alias leologs='find . -mindepth 1 -maxdepth 1 -not -path "*/\.*" -type d -exec echo "------------------------------------------------------------------------------->PROJECT: "{} \; -exec git --git-dir={}/.git --work-tree=$PWD/{} log --stat --author=leo-esp > ~/Desktop/Logs/log.log \;'

alias ccbf='cdccb && fu'
alias ccff='cdccf && fu'
alias cctf='cdcct && fu'
alias pvf='cdpv && fu'
alias vcf='cdvc && fu'
alias vctf='cdvct && fu'
alias vfef='cdvfe && fu'
alias vfwf='cdvfw && fu'
alias vhf='cdvh && fu'
alias vhwf='cdvhw && fu'

export FLEX_HOME=/opt/flex_sdks/default
export PATH=${PATH}:${FLEX_HOME}/bin
export PATH=${PATH}:/opt/java/bin
export PATH=${PATH}:/opt/ant/bin

export PATH="/home/leonardo.esposito/.bin:${PATH}" #bindir

complete -C 'foca __complete__' foca #focacomplete