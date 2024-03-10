if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="powerlevel10k/powerlevel10k"

zstyle ':omz:update' mode auto

plugins=(git sudo zsh-autosuggestions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

export EDITOR='nvim'

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Custom

alias ip="ip -c"
alias ls="ls -A --color"
alias sl="sl -adew5F"
alias ccat="pygmentize -g"
alias beep="sh -c 'speaker-test -t sine -f 600 > /dev/null & sleep .5 && pkill speaker-test'"
alias nv="nvim"

cat() {
    for arg in "$@"; do
        if [[ $arg == *.md ]]; then
            mdcat "$arg"
        else
            command cat "$arg"
        fi
    done
}

unsetopt BEEP


SCONFIG_PATH="~/Documents/sync/.config"

alias config_sync="sh -c 'cd $SCONFIG_PATH/scripts && sudo ./sync.sh'"

config_cp() {
  src_dir=$(realpath "$1")
  dest_dir="$SCONFIG_PATH/root$src_dir"
  num_files=$(find "$src_dir" -type f | wc -l)

  read "REPLY?About to copy $num_files files from $src_dir -> $dest_dir. Proceed? (Y/n) "
  if [[ $REPLY =~ ^[Yy]$ ]]
  then
    mkdir -p "$(dirname "$dest_dir")"
    cp -R "$src_dir" "$dest_dir"
    if [ $? -eq 0 ]
    then
      echo "OK"
    fi
  fi
}
