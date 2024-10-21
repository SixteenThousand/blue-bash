# scripts that either can't be separate files or are just too small to be

function mvt {
	source $XDG_CONFIG_HOME/.bashrc.d/lazy/mvt.sh $@
}

function book {
	cd ~/Documents/Books-and-Things
	xdg-open $(fzf)
}

function jsonp {
	TEMP=$(mktemp jsonp.XXX)
	cat $1 | jq . > $TEMP
	trash $1
	mv $1.tmp $1
}

function stale {
	STALE_CMD=$(cat $HOME/.bash_history* | fzf)
	if [ -z "$STALE_CMD" ]
	then
		return
	fi
	read -p "About to run >>$STALE_CMD<<. Proceed (y/N)? " PPROCEED
	if [ "$PPROCEED" = 'y' ]
	then
		eval $STALE_CMD
	else
		echo "...well, I guess we're not doing that then"
	fi
}

function gclone {
	REPO=$1
	shift 1
	git clone https://github.com/SixteenThousand/$REPO.git $@
}

function woman {
	nvim -c ":Man $@ | wincmd j | quit"
}
