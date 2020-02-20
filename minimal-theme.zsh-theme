#!/usr/bin/env zsh

DEPENDENCES_ZSH+=( zpm-zsh/pr-is-root zpm-zsh/pr-user )
DEPENDENCES_ZSH+=( zpm-zsh/pr-return zpm-zsh/pr-exec-time zpm-zsh/pr-git zpm-zsh/pr-cwd )
DEPENDENCES_ZSH+=( zpm-zsh/pr-php zpm-zsh/pr-rust zpm-zsh/pr-node )
DEPENDENCES_ZSH+=( zpm-zsh/pr-2 )
DEPENDENCES_ZSH+=( zpm-zsh/pr-eol )
DEPENDENCES_ZSH+=( zpm-zsh/title )

if (( $+functions[zpm] )); then
  zpm                                 \
    zpm-zsh/pr-is-root,inline         \
    zpm-zsh/pr-user,inline            \
    zpm-zsh/pr-return,inline          \
    zpm-zsh/pr-exec-time,async,inline \
    zpm-zsh/pr-git,async,inline       \
    zpm-zsh/pr-cwd,inline             \
    zpm-zsh/pr-php,async,inline       \
    zpm-zsh/pr-rust,async,inline      \
    zpm-zsh/pr-node,async,inline      \
    zpm-zsh/pr-2,async,inline         \
    zpm-zsh/pr-eol,async,inline       \
    zpm-zsh/title,inline              \
    zpm-zsh/pr-zcalc,async,inline     \
    zpm-zsh/pr-correct,async,inline   \

fi

# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v
bindkey -M command '^[' send-break
bindkey -M vicmd v edit-command-line
bindkey '^?' backward-delete-char
bindkey '^r' history-incremental-search-backward

export KEYTIMEOUT=1

MODE_CURSOR_VICMD="green block"
MODE_CURSOR_VIINS="#20d08a blinking bar"
MODE_CURSOR_SEARCH="#ff00ff steady underline"
MODE_INDICATOR_VIINS='%F{2}|<%F{2}I>|%f'
MODE_INDICATOR_VICMD='%F{1}|<%F{1}N>|%f'
MODE_INDICATOR_REPLACE='%F{1}|<%F{1}R>|%f'
MODE_INDICATOR_SEARCH='%F{5}|<%F{5}S>|%f'
MODE_INDICATOR_VISUAL='%F{4}|<%F{4}V>|%f'
MODE_INDICATOR_VLINE='%F{4}|<%F{4}V>|%f'
ZSH_AUTOSUGGEST_USE_ASYN=true

setopt prompt_subst
PROMPT="╭─${user_host}${current_dir}${rvm_ruby}${git_branch}${venv_prompt}
╰─%B${user_symbol}%b "
RPROMPT='${pr_return}${pr_exec_time}${pr_php}${pr_rust}${pr_node}${pr_git}${pr_cwd}'
PROMPT2='${pr_2}'
PROMPT_EOL_MARK='${pr_eol}'
PROMPT_TITLE='$USER@$HOST'
ZCALCPROMPT='${pr_zcalc} '
SPROMPT='${pr_correct}'
