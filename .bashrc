if [[ $(ps --no-header --pid=$PPID --format=comm) != "fish" && -z ${BASH_EXECUTION_STRING} && ${SHLVL} == 1 ]]
then
	shopt -q login_shell && LOGIN_OPTION='--login' || LOGIN_OPTION=''
	exec fish $LOGIN_OPTION
fi
. "$HOME/.cargo/env"

[ -f "/home/brian/.ghcup/env" ] && . "/home/brian/.ghcup/env" # ghcup-env