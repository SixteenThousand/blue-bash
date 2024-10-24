# stuff added by applications

# rust/rustup
if [ -f "$HOME/.cargo/env" ]
then
	source $HOME/.cargo/env
fi

# node version manager
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
	# This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
	# This loads nvm bash_completion

# thefuck
function fuck () {
	TF_PYTHONIOENCODING=$PYTHONIOENCODING;
	export TF_SHELL=bash;
	export TF_ALIAS=fuck;
	export TF_SHELL_ALIASES=$(alias);
	export TF_HISTORY=$(fc -ln -10);
	export PYTHONIOENCODING=utf-8;
	TF_CMD=$(
		thefuck THEFUCK_ARGUMENT_PLACEHOLDER "$@"
	) && eval "$TF_CMD";
	unset TF_HISTORY;
	export PYTHONIOENCODING=$TF_PYTHONIOENCODING;
	history -s $TF_CMD;
}

# sdkman
#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!! - supposedly
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

# zoxide
if which zoxide > /dev/null
then
	eval "$(zoxide init bash)"
fi
