# .bashrc

# ++++++++++++ DO NOT TOUCH! ++++++++++++
# Source global definitions
if [ -f /etc/bashrc ]; then
    source /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]; then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH
# ++++++++++++++++++++++++


# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
# NOTE: replaced ~/.bashrc.d with ~/.config/.bashrc.d
if [ -d ~/.config/.bashrc.d ]; then
    for rc in ~/.config/.bashrc.d/*; do
        if [ -f "$rc" ]; then
            . "$rc"
        fi
    done
fi
unset rc

# add my own stuff to $PATH
PATH="$PATH:$HOME/path-extras"

# see if we're interactive or not
if [ -n "$PS1" ]
then
	shopt -s autocd
	shopt -s checkjobs # doesn't do anything when in a multiplexer
	# shopt -s failglob # globs that don't match anything throw an error
fi
unset command_not_found_handle
