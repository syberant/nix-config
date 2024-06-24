#/usr/bin/env bash

_n_completions() {
    case "${#COMP_WORDS[@]}" in
        "1" | "2")
            COMPREPLY=($(compgen -W "repl search test switch boot analyse-size update impermanence" "${COMP_WORDS[1]}"))
            ;;
        "3")
            case "${COMP_WORDS[1]}" in
                "update")
                    COMPREPLY=($(compgen -W "stable unstable nur misc own-deps" "${COMP_WORDS[2]}"))
                    ;;
            esac
            ;;
    esac
}

complete -F _n_completions n
