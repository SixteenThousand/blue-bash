# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
    source /etc/bashrc
fi
# -------------------------

# Prevent doublesourcing
if [ -z "$SIXTEENBASHRCSOURCED" ]
then
	SIXTEENBASHRCSOURCED=Y

	# User specific environment
	# path
	if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]; then
		PATH="$HOME/.local/bin:$HOME/bin:$PATH"
	fi
	export PATH
	# history
	export HISTCONTROL="$HISTCONTROL:erasedups"
	export HISTFILESIZE=1000
	export HISTIGNORE="$HISTIGNORE:z *:&:stale:nv *"
	export HISTTIMEFORMAT='%b-%d %H:%M:%S | '
		# Only change this VERY CAREFULLY. It is used in the stale function
		# in functions.sh
	# github
	export MYGITHUB='https://github.com/SixteenThousand'
	export GITHUB='https://github.com'
	

	# see if we're interactive or not
	if [[ "$-" == *i* ]]
	then
		# User specific aliases and functions
		if [ -d ~/.config/bash ]; then
			for rc in ~/.config/bash/*; do
				if [ -f "$rc" ]; then
					. "$rc"
				fi
			done
		fi
		unset rc
		shopt -s autocd
		shopt -s checkjobs # doesn't do anything when in a multiplexer
		# shopt -s failglob # globs that don't match anything throw an error
	fi
	unset command_not_found_handle

	# Without this, CTRL-S would stop you being able to type!
	# If using another shell without this in its config, use CTRL-C or CTRL-Q to
	# let the shell start accepting input again.
	# This is called "Software Flow Control".
	stty -ixon
fi
