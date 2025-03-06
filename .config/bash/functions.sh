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
		-h|--help)
			cat <<- EOF
			stale, a shell history management tool
			
			Usage:
			    stale (no arguments)
			Fuzzy find a command in bash's history to run again
			    stale DIGIT
			Add command -DIGIT to bookmarks
			    stale -e|--edit
			Edit list of bookmarked commands in \$EDITOR
			    stale -b|--bookmarks
			Run a bookmarked command
			EOF
			return
			;;
		-e|--edit)
			$EDITOR "$SIXTEEN_DATA_DIR/stale-bookmarks" "$SIXTEEN_DATA_DIR/.bash_history"
			return
			;;
		-b|--bookmarks)
			local stale_cmd=$(cat "$SIXTEEN_DATA_DIR/stale-bookmarks" | \
				fzf --prompt='stale bookmark> ')
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
			local stale_cmd=$(history | fzf --prompt='stale> ')
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
		eval "$stale_cmd"
		history -s "$stale_cmd"
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

# Choose a file!
pick() {
	local hidden='-not -path */.*'
	local program=
	local fzf=
	for arg in $@
	do
		case $arg in
			-h|--help)
				cat <<- EOF
				Pick a file!
				Ignores hidden files/directories (files beginning with a .).
				Echoes file name to stdout by default if no PROGRAM is specified
				(see below).
				
				Usage:
				    pick -h|--help
				Show this message
				    pick -f|--fzf  [-.|--hidden] [PROGRAM]
				Fuzzy find a file (requires fzf). 
				Opens file with PROGRAM. --hidden causes hidden files to be included in 
				search list.
				    pick [-.|--hidden] [PROGRAM]
				Select a file from a numbered list. Options are same as with --fzf.
				EOF
				return 0
				;;
			-f|--fzf)
				fzf=1
				;;
			-.|--hidden)
				hidden=
				;;
			*)
				program="$arg"
				;;
		esac
	done
	local old_ps3="$PS3"
	PS3='[1;33mChoose a file> [0m'
	local choice
	if [ -n "$fzf" ]
	then
		choice="$(find -type f $hidden | fzf --prompt="$PS3")"
	else
		select file in $(find . -type f $hidden)
		do
			[ -z "$file" ] && return 1
			choice="$file"
			break
		done
	fi
	if [ -z "$choice" ]
	then
		echo -e "\e[1;33mGuess we're not doing that then...\e[0m"
		return 1
	fi
	if [ -n "$program" ]
	then
		$program "$choice"
	else
		echo "$choice"
	fi
	PS3="$old_ps3"
}
