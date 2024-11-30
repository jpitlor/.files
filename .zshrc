export PATH=$HOME/bin:/usr/local/bin:$PATH
export ZSH="/usr/local/share/oh-my-zsh"
export KUBECONFIG="/etc/rancher/k3s/k3s.yaml"

alias tmux="tmux -2"

ZSH_THEME="headline"
CASE_SENSITIVE="true"
COMPLETION_WAITING_DOTS="true"
plugins=(git)

source $ZSH/oh-my-zsh.sh

if [ -z "$TMUX" ]
then
    tmux attach -t TMUX || tmux new -s TMUX
fi
