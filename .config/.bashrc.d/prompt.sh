function prompt_vcs_info {
    if VCS_INFO_GIT=$(git branch --show-current 2>/dev/null)
    then
        VCS_INFO=" $VCS_INFO_GIT"
    else
        VCS_INFO=""
    fi
	history -a
}

PROMPT_COMMAND='prompt_vcs_info'

PS1='\[\e]133;A\e\\\]\[\e]133;P\007\]\
\[\e[33m\]\u\
\[\e[0m\]@\
\[\e[35m\]\H\
\[\e[0m\]+\
\[\e[36m\]bash.v\v\
\[\e[0m\] [\
\[\e[1;34m\]\w\
\[\e[0m\]] <\
\[\e[34m\]\j\
\[\e[0m\]> \
\[\e[3;32m\]$VCS_INFO\
\[\e[0m\]
\[\e[1;31m\] => \
\[\e[0m\e]133;B\007\]\
'

PS2='\[\e[1;33m\] -> \[\e[0m\]'
