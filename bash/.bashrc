set -o vi

export PS1="\$(git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/') \[$(tput bold)\]\W\[$(tput sgr0)\] \\$ \[$(tput sgr0)\]"

export TERM=xterm-256color
export EDITOR="nvim"
export SVN_EDITOR="nvim"
export CLICOLOR=1
export LANG=en_US.UTF-8

HISTFILE=~/.bash_history
HISTSIZE=10000
SAVEHIST=10000

# aliases
# os
alias shutdown="sudo shutdown -f now"
alias suspend="sudo systemctl suspend"
alias reboot="sudo reboot"

# vim
alias v="nvim"
alias vi="nvim"
alias vim="nvim"

# python
alias py="python3"
alias python="python3"

# git
alias ga="git add"
alias gr="git rm"
alias gc="git commit"
alias gd="git diff"
alias gs="git status"
alias gl="git log --oneline"
alias gp="git push"
alias gpl="git pull"

# nix tools
alias mv="mv -i"
alias cp="cp -i -v"
alias ls="ls -l --color=auto --group-directories-first"
alias l="ls -l --color=auto --group-directories-first"
alias ll="ls -al --color=auto --group-directories-first"
alias grep="grep --color=auto"
alias diff="diff --color=auto"
alias pdf="google-chrome-stable"
alias pbcopy="xclip -selection clipboard"
alias pbpaste="xclip -selection clipboard -o"

# neat func to calc directly on the term
calc() { s=$(HISTTIMEFORMAT='' history 1);  # recover last command line.
     s=${s#*[ ]};                           # remove initial spaces.
     s=${s#*[0-9]};                         # remove history line number.
     s=${s#*[ ]+};                          # remove more spaces.
     eval 'bc -l <<<"'"$s"'"';              # calculate the line.
}
alias +='calc #'

# os
alias c="clear"
alias '..'="cd .."

alias sb="source ~/.bashrc"
alias vb="vim ~/.bashrc"

# fzf folders
alias cdf='cd $(fdfind --type d --exclude .git --exclude node_module --exclude .cache --exclude .npm --exclude .mozilla --exclude .meteor --exclude .nv --exclude Trash | fzf)'

# fzf md files
alias cdfe='vim $(fdfind -e md --exclude .git --exclude node_module --exclude .cache --exclude .npm --exclude .mozilla --exclude .meteor --exclude .nv --exclude Trash | fzf)'

alias gip="curl ifconfig.me"

# general path
export PATH=$PATH:$HOME/.bin:$HOME/bin:$HOME/.local/bin

# snapd path
export PATH=$PATH:/var/lib/snapd/bin

# ansible host key checking for Mikrotik SSH connection
export ANSIBLE_HOST_KEY_CHECKING=False

# golang path
export GOROOT=/usr/local/go
export GOPATH=$HOME/.golang
export PATH=$GOPATH/bin:$GOROOT/bin:$PATH

alias air="~/.golang/bin/air"

# rust
. "$HOME/.cargo/env"

# source ssh completion
. /etc/profile.d/bash_completion.sh

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
if [ -f "/home/cvargas/.config/fabric/fabric-bootstrap.inc" ]; then . "/home/cvargas/.config/fabric/fabric-bootstrap.inc"; fi

# ladybird
alias lb-build-run="ninja -C $HOME/personal/ladybird/Build/ladybird && $HOME/personal/ladybird/Build/ladybird/bin/Ladybird"
alias lb-run="$HOME/personal/ladybird/Build/ladybird/bin/Ladybird"
