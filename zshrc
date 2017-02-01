# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory
unsetopt autocd beep
bindkey -e
# End of lines configured by zsh-newuser-install

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
export VIMDIR=$HOME/.vim
export VIMRC=$VIMDIR/vimrc
export CUSTOM_VIMRC=$VIMDIR/personal.vim
export GOPATH=$HOME/projects
export PATH=$GOPATH/bin:$PATH
export GITHUB=$HOME/github

alias cp='cp -i'
alias diff='colordiff'
alias dir='dir --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias grep='grep --color=auto'
#alias l='ls -CF'
#alias la='ls -A'
#alias ll='ls -alFh'
#alias ls='ls --color=auto'
alias mv='mv -i'
alias openports='netstat --all --numeric --programs --inet'
alias vdir='vdir --color=auto'
alias vimc='vim --servername SAMPLESERVER --remote-tab-silent'
alias vims='vim --servername SAMPLESERVER'
alias update_subs='git submodule foreach git pull origin master'
# Remove all vim swap files in a directory.
alias remove_swap='find ./ -type f -name "\.*sw[klmnop]" -delete'

# Save a smiley to a local variable if the last command exited with success.
local smiley="%(?,%{$fg[green]%}✓%{$reset_color%},%{$fg[red]%}✗%{$reset_color%})"

# Show Git branch in prompt.
source $GITHUB/vim345/zsh/plugins/zsh-git-prompt/zshrc.sh

# Prompt customization.
PROMPT='┌ %U%*%u - $(git_super_status) %{$fg[red]%}%n@%{$fg[green]%}%m - %{$reset_color%}%B[%~]%b
└→[${smiley}] ⚑⚑⚑ '

# Enable syntax highlighting.
source $GITHUB/vim345/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh

# Predictable SSH authentication socket location.
SOCK="/tmp/ssh-agent-$USER-screen"
if test $SSH_AUTH_SOCK && [ $SSH_AUTH_SOCK != $SOCK ]
then
    rm -f /tmp/ssh-agent-$USER-screen
    ln -sf $SSH_AUTH_SOCK $SOCK
    export SSH_AUTH_SOCK=$SOCK
fi

# Directory stacking.
DIRSTACKFILE="$HOME/.cache/zsh/dirs"
if [[ -f $DIRSTACKFILE ]] && [[ $#dirstack -eq 0 ]]; then
  dirstack=( ${(f)"$(< $DIRSTACKFILE)"} )
  [[ -d $dirstack[1] ]] && cd $dirstack[1]
fi
chpwd() {
  print -l $PWD ${(u)dirstack} >$DIRSTACKFILE
}

DIRSTACKSIZE=20

setopt autopushd pushdsilent pushdtohome

## Remove duplicate entries
setopt pushdignoredups

## This reverts the +/- operators.
setopt pushdminus
