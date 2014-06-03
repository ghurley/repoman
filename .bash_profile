# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# User specific environment and startup programs
source ~/bin/git-completion.bash

PATH=/usr/local/bin:$PATH:$HOME/bin:$HOME/src
export PATH
