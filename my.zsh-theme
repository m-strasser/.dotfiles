local ret_status="%(?:➜ :%{$fg_bold[red]%}➜ )"

# Set main color
MCOLOR='magenta'

# RIGHT SIDE
# Show username in square brackets and bold green
RPROMPT='%{$fg[$MCOLOR]%}[%{$reset_color%}%n'
# Followed by @-sign 
RPROMPT+='%{$fg[$MCOLOR]%}@%{$reset_color%}'
# and hostname of the machine
RPROMPT+='%m%{$fg[$MCOLOR]%}]%{$reset_color%}'

# LEFT SIDE
# Show return status arrow
PROMPT='${ret_status} '
# Show working directory
PROMPT+='%{$fg[$MCOLOR]%}%c%{$reset_color%}'
# and some git info
PROMPT+=' $(git_prompt_info)'

ZSH_THEME_GIT_PROMPT_PREFIX="git:(%{$fg[$MCOLOR]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$reset_color%}) %{$fg[$MCOLOR]%}✗"
ZSH_THEME_GIT_PROMPT_CLEAN=")"
