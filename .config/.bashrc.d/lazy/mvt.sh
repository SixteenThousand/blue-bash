declare -A FLAGS
FLAGS[depth]='7'
FLAGS['search-directory']='/'

function argparse() {
	function setflag() {
		if [ -n "$UNSET_FLAG" ]
		then
			FLAGS[$UNSET_FLAG]=$1
		fi
	}
	for arg in $@
	do
		case $arg in
			-c|--cwd) FLAGS[cwd]='TRUE';;
			-d|--depth) UNSET_FLAG='depth';;
			-h|--help) FLAGS['help']='TRUE';;
			-s|--search-directory) UNSET_FLAG='search-directory';;
			*) setflag $arg;;
		esac
	done
}


# MAIN
argparse $@

if [ -n "${FLAGS[cwd]}" ]
then
	FLAGS['search-directory']=$(pwd)
fi

if [ "${FLAGS['help']}" = 'TRUE' ]
then
	cat <<- EOF
	Move To! v1.3 (bash)
	Options:
	   -h,--help   - show this help message
	   -d,--depth  - Specify how deep within the directory tree you want to 
					 search.
	   -c,--cwd    - Search within the current working directory only
	   -s,--search-directory
				   - Specify the directory to search within. Can be relative 
					 to pwd.
	EOF
else
	NEW_DIR=$(find ${FLAGS['search-directory']} -maxdepth ${FLAGS[depth]} -type d \
		2>/dev/null | fzf)
	# check fzf wasn't cancelled before changing directory
	cd ${NEW_DIR:-$PWD}
fi


unset UNSET_FLAG FLAGS NEW_DIR
unset -f argparse showhelp setflag
