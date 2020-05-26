parse_git() {
	local unknown untracked stash clean ahead behind staged dirty diverged
	unknown='0;34'      # blue
	untracked='0;32'    # green
	stash='0;32'        # green
	clean='0;32'        # green
	ahead='0;33'        # yellow
	behind='0;33'       # yellow
	staged='0;96'       # cyan
	dirty='0;31'        # red
	diverged='0;31'     # red

	if [[ $TERM = *256color ]]; then
		unknown='38;5;20'     # dark blue
		untracked='38;5;76'   # mid lime-green
		stash='38;5;76'       # mid lime-green
		clean='38;5;82'       # brighter green
		ahead='38;5;226'      # bright yellow
		behind='38;5;142'     # darker yellow-orange
		staged='38;5;214'     # orangey yellow
		dirty='38;5;202'      # orange
		diverged='38;5;196'   # red
	fi

	git_branch=$(git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/')
	git_status=$(git status 2> /dev/null)
	if [[ $git_branch == "" ]];then
		return 0
	fi
  printf "$git_branch/"  
	if [[ $git_status =~ '您的分支领先' ]]; then
		color=$ahead
		st="ahead"
		printf "\033[%sm%s " "$color" "$st"
	fi
	if [[ $git_status =~ '无文件要提交，干净的工作区' ]]; then
		color=$clean
		st="clean"
		printf "\033[%sm%s " "$color" "$st"
	fi
	if [[ $git_status =~ '尚未暂存以备提交的变更' ]]; then
		color=$dirty
		st="dirty"
		printf "\033[%sm%s " "$color" "$st"
	fi
	if [[ $git_status =~ '要提交的变更' ]]; then
		color=$staged
		st="staged"
		printf "\033[%sm%s " "$color" "$st"
	fi
	if [[ $git_status =~ '您在执行拣选提交' ]]; then
		color=$unknown
		st="cherry-picking"
		printf "\033[%sm%s " "$color" "$st"
	fi
	if [[ $git_status =~ '您的分支落后' ]]; then
		color=$behind
		st="behind"
		printf "\033[%sm%s " "$color" "$st"
	fi
	if [[ $git_status =~ '未跟踪的文件' ]]; then
		color=$untracked
		st="untracked"
		printf "\033[%sm%s " "$color" "$st"
	fi
	return 0
}
    PS1='\n\[\033[01;34m\]\w \[\033[01;32m\]\u \[\033[01;31m\]$(parse_git)\[\033[00m\]\n'
