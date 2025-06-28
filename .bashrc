if [[ $(ps --no-header --pid=$PPID --format=comm) != "fish" && -z ${BASH_EXECUTION_STRING} && ${SHLVL} == 1 ]]
then
	shopt -q login_shell && LOGIN_OPTION='--login' || LOGIN_OPTION=''
	exec fish $LOGIN_OPTION
fi
. "$HOME/.cargo/env"

[ -f "/home/brian/.ghcup/env" ] && . "/home/brian/.ghcup/env" # ghcup-env

# dune
source $HOME/.local/share/dune/env/env.bash

# Added by LM Studio CLI (lms)
export PATH="$PATH:/home/brian/.lmstudio/bin"
