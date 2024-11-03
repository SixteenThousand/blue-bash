# stuff added by applications

# zoxide
if which zoxide 2>&1 1>/dev/null
then
    if [ -f /etc/debian_version ]
    then
        source $XDG_CONFIG_HOME/.bashrc.d/lazy/zoxide-debian.sh
    elif :
    then
        source $XDG_CONFIG_HOME/.bashrc.d/lazy/zoxide-fedora.sh
    fi
fi

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

# sdkman
#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!! - supposedly
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
