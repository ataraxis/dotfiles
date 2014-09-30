# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# User specific environment and startup programs

if [ -f ~/.local_profile ]; then
	. ~/.local_profile
fi

PATH=$PATH:$HOME/.local/bin:$HOME/bin:/sbin:/usr/sbin
export PATH

export SBT_OPTS="-Xdebug -Xrunjdwp:transport=dt_socket,server=y,suspend=n,address=5005"

export AGENT_HOME=~/agent
export KIOSK_NUMBER=1337

export VAGRANT_DEFAULT_PROVIDER=lxc

export MAN_POSIXLY_CORRECT=1
