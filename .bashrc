# Load in the git branch prompt script.
source ~/bin/git-prompt.sh

CLICOLOR=""
export CLICOLOR

shopt -s histappend                 # shells append to history, don't overwrite
export PROMPT_COMMAND='history -a'  # flush history to file on each command

alias l='ls -lF'
alias l.='ls -AlF'
alias hg='history | grep $1'
alias pg='ps -ef | grep $1'

alias redisstart='sudo launchctl start io.redis.redis-server'
alias redisstop='sudo launchctl stop io.redis.redis-server'
alias rot13="tr '[A-Za-z]' '[N-ZA-Mn-za-m]'"

#PS1="\[\033[0;32m\][\t]mbp:\[\033[0;33m\]\w\e[0;35m\]\$(__git_ps1) \n%\[\033[0;37;00m\] "
PS1="\[\033[0;32m\][\t]mbp:\[\033[0;33m\]\w\e[0;35m\]\$(__git_ps1) \n👾  \[\033[0;37;00m\]"