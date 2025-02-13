# scripts that either can't be separate files or are just too small to be

function mvt {
	source ~/.config/bash/lazy/mvt.sh $@
}

function book {
	local old_dir=$(pwd)
	cd ~/Documents/Books-and-Things
	local book=$(fzf)
	if [[ -n "$book" ]]
	then
		xdg-open "$book" & disown
	else
		echo "You don't like reading, do you?"
	fi
	cd $old_dir
}

function stale {
	# choose something
	case $1 in
		-e|--edit)
			$EDITOR "$SIXTEEN_DATA_DIR/stale-bookmarks" "$SIXTEEN_DATA_DIR/.bash_history"
			return
			;;
		-b|--bookmarks)
			local stale_cmd=$(cat "$SIXTEEN_DATA_DIR/stale-bookmarks" | fzf)
			;;
		?*)
			# add command -DIGIT to bookmarks
			local stale_cmd=$(fc -ln "-$1" "-$1")
			echo "About to add >>[1m$stale_cmd[0m<< to stale bookmarks."
			local proceed
			read -p "Proceed? (Y/n): " proceed
			if [ "$proceed" != n ] && [ "$proceed" != N ]
			then
				echo "$stale_cmd" >> "$SIXTEEN_DATA_DIR/stale-bookmarks"
			fi
			return
			;;
		*)
			# add stuff from current session
			history -a
			local stale_cmd=$(history | fzf)
			;;
	esac
	# check we actually chose something
	if [[ -z "$stale_cmd" ]]
	then
		echo 'Ok, back to the present I guess...'
		return
	fi
	# history should come with dates; see ~/.bashrc
	stale_cmd=${stale_cmd#*|}
	local proceed
	read -p "About to run >>[1m$stale_cmd[0m<<. Proceed (y/N)? " proceed
	if [ "$proceed" = y ] || [ "$proceed" = Y ]
	then
		eval $stale_cmd
	else
		echo "...well, I guess we're not doing that then"
	fi
}

function fq {
	local name=$1
	shift 1
	find . $@ -name "$name" 2>/dev/null
}

function checkpath {
	find $(echo $PATH | sed -e 's/:/ /g') -maxdepth 1 -type f 2>/dev/null |
		grep $@
}
