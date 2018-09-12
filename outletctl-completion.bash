#!/usr/bin/env bash

_outletctl_completions() {
    COMPREPLY=()

    local cur="${COMP_WORDS[COMP_CWORD]}"
    local opts=""

    local outlets="1 2 3 4 5 6 7 8"
    local actions="on off toggle"

    if [[ ${#COMP_WORDS[@]} == 2 ]]; then
        opts="${outlets}"
        mapfile -t COMPREPLY < <(compgen -W "${opts}" -- "${cur}")
        return 0
    elif [[ ${#COMP_WORDS[@]} == 3 ]]; then
        opts="${actions}"
        mapfile -t COMPREPLY < <(compgen -W "${opts}" -- "${cur}")
        return 0
    else
        mapfile -t COMPREPLY < <(compgen -W "${opts}" -- "${cur}")
        return 0
    fi
}

complete -F _outletctl_completions outletctl
