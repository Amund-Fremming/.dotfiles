NEWLINE=$'\n'
DATE=$( date +"[%Y-%m-%d %H:%M:%S]" )
PROMPT="${NEWLINE}%F{yellow}${DATE} %(!.%F{red}.%F{white})%n%F{cyan}@%m %F{yellow}%d${NEWLINE}%F{reset}> "
export PATH="/usr/local/sbin:$PATH"
