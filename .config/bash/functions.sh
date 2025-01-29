# scripts that either can't be separate files or are just too small to be

function mvt {
	source ~/.config/bash/lazy/mvt.sh $@
}

function book {
	old_dir=$(pwd)
	cd ~/Documents/Books-and-Things
	book=$(fzf)
	if [[ -n "$book" ]]
	then
		xdg-open "$book" & disown
	else
		echo "You don't like reading, do you?"
	fi
	cd $old_dir
	unset old_dir book
}

function stale {
	# add stuff from current session
	history -a
	# choose something
	stale_cmd=$(history | fzf)
	# check we actually chose something
	if [[ -z "$stale_cmd" ]]
	then
		echo 'Ok, back to the present I guess...'
		return
	fi
	# history should come with dates; see ~/.bashrc
	stale_cmd=${stale_cmd#*|}
	read -p "About to run >>[1m$stale_cmd[0m<<. Proceed (y/N)? " proceed
	if [[ "$proceed" = 'y' ]]
	then
		eval $stale_cmd
	else
		echo "...well, I guess we're not doing that then"
	fi
	unset stale_cmd proceed
}

function fq {
	name=$1
	shift 1
	find . $@ -name "$name" 2>/dev/null
	unset name
}
