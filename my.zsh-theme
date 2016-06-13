# Set main color
MCOLOR='magenta'
NOCOLOR=''

local ret_status="%(?:%{$fg_bold[$MCOLOR]%}➜ :%{$fg_bold[red]%}➜ )"

# RIGHT SIDE
# Show username in square brackets and bold green
RPROMPT='%{$fg[$NOCOLOR]%}[%{$reset_color%}%{$fg[$MCOLOR]%}%n%{$reset_color%}'
# Followed by @-sign 
RPROMPT+='%{$fg[$NOCOLOR]%}@%{$reset_color%}'
# and hostname of the machine
RPROMPT+='%{$fg[$MCOLOR]%}%m%{$reset_color%}%{$fg[$NOCOLOR]%}]%{$reset_color%}'

# LEFT SIDE
# Show return status arrow
PROMPT='${ret_status}%{$reset_color%} '
# Show working directory
PROMPT+='%{$fg[$NOCOLOR]%}%c%{$reset_color%}'
# and some git info
PROMPT+=' $(git_prompt_info)'

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[$MCOLOR]%}git:(%{$reset_color%}%{$fg[$NOCOLOR]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$reset_color%}%{$fg[$MCOLOR]%}) %{$fg[$NOCOLOR]%}✗"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$reset_color%}%{$fg[$MCOLOR]%})%{$reset_color%}"
