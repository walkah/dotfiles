# walkah ZSH Theme

if [ -z $SSH_CONNECTION ]; then HCOLOR="green"; else HCOLOR="blue"; fi
local return_code="%(?..%{$fg[red]%}%? ↵%{$reset_color%})"

ZSH_THEME_RVM_PROMPT_PREFIX="("
ZSH_THEME_RVM_PROMPT_SUFFIX="/"
ZSH_THEME_NVM_PROMPT_PREFIX=""
ZSH_THEME_NVM_PROMPT_SUFFIX=")"

PROMPT='%{$fg[$HCOLOR]%}%m%{$reset_color%}:%c \
$(git_prompt_info)%{$fg[red]%}%(!.#.»)%{$reset_color%} '
PROMPT2='%{$fg[red]%}\ %{$reset_color%}'
RPS1='%{$fg[cyan]%}$(ruby_prompt_info)node-$(nvm_prompt_info) %{$reset_color%}${return_code}'

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[green]%}±%{$fg[yellow]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_CLEAN=""
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%}✗%{$reset_color%}"
