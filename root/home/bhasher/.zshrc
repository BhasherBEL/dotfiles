if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="powerlevel10k/powerlevel10k"

zstyle ':omz:update' mode auto

plugins=(git sudo zsh-autosuggestions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

export EDITOR='vim'

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Custom

alias ip="ip -c"

cat() {
    for arg in "$@"; do
        if [[ $arg == *.md ]]; then
            mdcat "$arg"
        else
            command cat "$arg"
        fi
    done
}
