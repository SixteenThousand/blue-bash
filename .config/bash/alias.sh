alias ls="ls --color=always --group-directories-first --almost-all"
alias lsn="ls --color=never"
alias gitroot='cd $(git rev-parse --show-toplevel)'
alias nv="nvim"
alias ff="clifm"
alias py="python"
alias code="codium"
alias tma="tmux attach || tmux"
alias tmd="tmux detach"
alias sbcl="rlwrap sbcl"
alias shell="rlwrap xargs -L 1"
alias yg='yona -s grep -Rn'
alias ysh='yona -s'
alias zathura='zathura --fork'
if ! which rg 2>&1 1>/dev/null
then
	alias rg='grep -RnH --exclude-dir=.git --exclude-dir=node_modules \
		-I --color=always'
fi
alias xcopy='xclip -selection clipboard'