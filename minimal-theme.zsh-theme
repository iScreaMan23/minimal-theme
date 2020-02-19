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

setopt prompt_subst
PROMPT="╭─${user_host}${current_dir}${rvm_ruby}${git_branch}${venv_prompt}
╰─%B${user_symbol}%b "
RPROMPT='${pr_return}${pr_exec_time}${pr_php}${pr_rust}${pr_node}${pr_git}${pr_cwd}'
PROMPT2='${pr_2}'
PROMPT_EOL_MARK='${pr_eol}'
PROMPT_TITLE='$USER@$HOST'
ZCALCPROMPT='${pr_zcalc} '
SPROMPT='${pr_correct}'
