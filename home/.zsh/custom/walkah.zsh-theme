# walkah ZSH Theme

if [ -z $SSH_CONNECTION ]; then HCOLOR="green"; else HCOLOR="blue"; fi
local return_code="%(?..%{$fg[red]%}%? ↵%{$reset_color%})"

function asdf_prompt() {
  echo $(asdf current $1|awk '{print $1}')
}

PROMPT='%{$fg[$HCOLOR]%}%m%{$reset_color%}:$(shrink_path -f) $(git_prompt_info)%{$fg[red]%}%(!.#.»)%{$reset_color%} '
PROMPT2='%{$fg[red]%}\ %{$reset_color%}'
if (( $+commands[asdf] )); then
	RPS1='%{$fg[cyan]%}(%{$fg[red]%}$(asdf_prompt ruby) %{$fg[green]%}$(asdf_prompt nodejs) %{$fg[blue]%}$(asdf_prompt python)%{$fg[cyan]%}) %{$reset_color%}${return_code}'
fi
ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[green]%}±%{$fg[yellow]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_CLEAN=""
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%}✗%{$reset_color%}"
