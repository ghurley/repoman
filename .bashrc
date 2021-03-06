# Load in the git branch prompt script.
source ~/bin/git-prompt.sh

CLICOLOR=""
export CLICOLOR
export GREP_OPTIONS='--color=auto'

alias l='ls -lF'
alias l.='ls -AlF'
alias hg='history | grep $1'
alias pg='ps -ef | grep $1'

alias rot13="tr '[A-Za-z]' '[N-ZA-Mn-za-m]'"
function hi { grep --color -E "($1|\$)" $2; }

#PS1="\[\033[0;32m\][\t]mbp:\[\033[0;33m\]\w\e[0;35m\]\$(__git_ps1) \n%\[\033[0;37;00m\] "
PS1="\[\033[0;32m\][\t]mbp:\[\033[0;33m\]\w\e[0;35m\]\$(__git_ps1) \n👾  \[\033[0;37;00m\]"
