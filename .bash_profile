# .bash_profile

# The distinction between bash_profile and basrc has to do wth the difference
# between login shells and new windows. Theoretically. The profile is sourced
# only on logins and the rc file is sourced on new windows. However, on Macs,
# Terminal.app will source the profile even on new windows.
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# Prevent file overwrite on stdout redirection
set -o noclobber

# Update window size after every command
shopt -s checkwinsize

################################################
## SMARTER TAB-COMPLETION (Readline bindings) ##
# Perform file completion in a case insensitive fashion
bind "set completion-ignore-case on"

# Treat hyphens and underscores as equivalent
bind "set completion-map-case on"

# Display matches for ambiguous patterns at first tab press
bind "set show-all-if-ambiguous on"

## SANE HISTORY DEFAULTS ##

# Append to the history file, don't overwrite it
shopt -s histappend

# Save multi-line commands as one command
shopt -s cmdhist

# Record each line as it gets issued
PROMPT_COMMAND='history -a'

# Huge history. Doesn't always seem to work. Sometimes my history gets
# truncated to 500 lines.
HISTSIZE=500000
HISTFILESIZE=100000

# Avoid duplicate entries
HISTCONTROL="erasedups:ignoreboth"

# Don't record some commands
export HISTIGNORE="&:[ ]*:ls:bg:fg:history"

# Useful timestamp format
HISTTIMEFORMAT='%F %T '

#################################
## BETTER DIRECTORY NAVIGATION ##
# Prepend cd to directory names automatically
# shopt -s autocd
# Correct spelling errors during tab-completion
shopt -s dirspell
# Correct spelling errors in arguments supplied to cd
shopt -s cdspell

# This defines where cd looks for targets
# Add the directories you want to have fast access to, separated by colon
# Ex: CDPATH=".:~:~/projects" will look for targets in the current working
# directory, in home and in the ~/projects folder
CDPATH="."


# User specific environment and startup programs
source ~/bin/git-completion.bash

PATH=/usr/local/bin:$PATH:$HOME/bin:$HOME/src
export PATH
