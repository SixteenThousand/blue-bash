alias ls="ls --color=always --group-directories-first --almost-all"
alias lsn="ls --color=never"
alias gitroot='cd $(git rev-parse --show-toplevel)'
alias vv=$EDITOR
alias ff="clifm"
alias py="python"
alias code="codium"
alias tma="tmux attach || tmux"
alias tmd="tmux detach"
alias sbcl="rlwrap sbcl"
alias shell="rlwrap xargs -L 1"
alias zathura='zathura --fork'
alias yg='grep -RnH --exclude-dir=.git --exclude-dir=node_modules \
	-I --color=always'
alias xcopy='xclip -selection clipboard'
alias te='tree -a -I .git -I node_modules'
