export PATH=$HOME/bin:/usr/local/bin:$PATH
export ZSH="/usr/local/share/oh-my-zsh"

alias tmux="tmux -2"

ZSH_THEME="powerlevel10k/powerlevel10k"
CASE_SENSITIVE="true"
COMPLETION_WAITING_DOTS="true"
plugins=(git)

source $ZSH/oh-my-zsh.sh

if [ -z "$TMUX" ]
then
    tmux attach -t TMUX || tmux new -s TMUX
fi
