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

export AGENT_HOME=~/agent
export KIOSK_NUMBER=K11001

export VAGRANT_DEFAULT_PROVIDER=docker

export MAN_POSIXLY_CORRECT=1

export NVIM_GTK_NO_WINDOW_DECORATION=1

#AWSume alias to source the AWSume script
alias awsume=". awsume"

#Auto-Complete function for AWSume
_awsume() {
    local cur prev opts
    COMPREPLY=()
    cur="${COMP_WORDS[COMP_CWORD]}"
    prev="${COMP_WORDS[COMP_CWORD-1]}"
    opts=$(awsume-autocomplete)
    COMPREPLY=( $(compgen -W "${opts}" -- ${cur}) )
    return 0
}
complete -F _awsume awsume

#AWSume alias to source the AWSume script
alias awsume="source awsume"
