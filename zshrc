# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory
unsetopt autocd beep
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/usr/local/google/home/mohammadm/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# Format tab completion.
zstyle ':completion:*:descriptions' format '%U%B%d%b%u'
zstyle ':completion:*:warnings' format '%BSorry, no matches for: %d%b'

# Ignore duplicate lines in the history.
setopt HIST_IGNORE_DUPS

# Colors
autoload -U colors
colors
setopt prompt_subst

# Env Variables.
export EDITOR=vim
export VIMDIR=$HOME/.vim/
export VIMRC=$VIMDIR/vimrc
export CUSTOM_VIMRC=$VIMDIR/skillit.vim
export CUSTOM_VIMRC=$VIMDIR/skillit.vim
export GOPATH=$HOME/projects
export PATH=$GOPATH/bin:$PATH

alias cp='cp -i'
alias diff='colordiff'
alias dir='dir --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias grep='grep --color=auto'
alias l='ls -CF'
alias la='ls -A'
alias ll='ls -alFh'
alias ls='ls --color=auto'
alias mv='mv -i'
alias openports='netstat --all --numeric --programs --inet'
alias vdir='vdir --color=auto'
alias vimc='vim --servername SAMPLESERVER --remote-tab-silent'
alias vims='vim --servername SAMPLESERVER'

# Save a smiley to a local variable if the last command exited with success.
local smiley="%(?,%{$fg[green]%}✓%{$reset_color%},%{$fg[red]%}✗%{$reset_color%})"

# Show Git branch in prompt.
source /usr/local/google/home/mohammadm/github/zsh-git-prompt/zshrc.sh

# Prompt customization.
PROMPT='┌ %U%*%u - $(git_super_status) %{$fg[red]%}%n@%{$fg[green]%}%m - %{$reset_color%}%B[%~]%b
└→[${smiley}] ⚑⚑⚑ '

# Enable syntax highlighting.
source ~/github/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh

# Predictable SSH authentication socket location.
SOCK="/tmp/ssh-agent-$USER-screen"
if test $SSH_AUTH_SOCK && [ $SSH_AUTH_SOCK != $SOCK ]
then
    rm -f /tmp/ssh-agent-$USER-screen
    ln -sf $SSH_AUTH_SOCK $SOCK
    export SSH_AUTH_SOCK=$SOCK
fi
