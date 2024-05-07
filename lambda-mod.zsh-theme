#!/usr/bin/env zsh

local LAMBDA="%(?,%{$fg_bold[green]%}λ,%{$fg_bold[red]%}λ)"
if [[ "$USER" == "root" ]]; then USERCOLOR="red"; else USERCOLOR="yellow"; fi

function make_git_prompt_info() {
        echo "$(git_prompt_info) $(git_prompt_short_sha)
%{$fg_bold[cyan]%}→ "
}
NEWLINE=$'\n'
PROMPT=$NEWLINE$LAMBDA'\
 %{$fg_bold[$USERCOLOR]%}%n\
 %{$fg_no_bold[magenta]%}[%'${LAMBDA_MOD_N_DIR_LEVELS:-3}'~]\
 $(git_prompt_info) $(git_prompt_status) $(git_prompt_short_sha)'$NEWLINE'%{$fg_bold[cyan]%}→ \
%{$reset_color%}'

# RPROMPT=''

# Format for git_prompt_info()
ZSH_THEME_GIT_PROMPT_PREFIX="at %{$fg[yellow]%} "
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY=""
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg_bold[green]%} ✔"

# Format for git_prompt_status()
ZSH_THEME_GIT_PROMPT_ADDED="%{$fg_bold[green]%}+"
ZSH_THEME_GIT_PROMPT_MODIFIED="%{$fg_bold[blue]%}!"
ZSH_THEME_GIT_PROMPT_DELETED="%{$fg_bold[red]%}-"
ZSH_THEME_GIT_PROMPT_RENAMED="%{$fg_bold[magenta]%}>"
ZSH_THEME_GIT_PROMPT_UNMERGED="%{$fg_bold[yellow]%}#"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg_bold[cyan]%}?"

# Format for git_prompt_ahead()
ZSH_THEME_GIT_PROMPT_AHEAD=" %{$fg_bold[white]%}^"


# Format for git_prompt_long_sha() and git_prompt_short_sha()
ZSH_THEME_GIT_PROMPT_SHA_BEFORE=" %{$fg_bold[white]%}[%{$fg_bold[blue]%}"
ZSH_THEME_GIT_PROMPT_SHA_AFTER="%{$fg_bold[white]%}]"
