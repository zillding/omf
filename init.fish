# handy short cuts
alias c='clear'
alias cp='cp -i'
alias df='df -h'
alias du='du -h'
alias h='history'
alias j='jobs -l'
alias ln='ln -i'
alias mv='mv -i'
alias mkdir='mkdir -p'
alias ql='qlmanage -p'
alias rm='rm -i'

# Use a long listing format
alias ll='ls -lh'
alias lla='ls -lah'
alias lh='ls -h'
# Show hidden files
alias l.='ls -d .*'
alias la='ls -ah'

# a quick way to get out of current directory
alias ..='cd ..'
alias ...='cd ../../../'
alias ....='cd ../../../../'
alias .....='cd ../../../../'
alias .4='cd ../../../../'
alias .5='cd ../../../../..'

# Colorize the grep command output for ease of use (good for log files)
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

# Create a new set of commands
alias nowtime=now
alias nowdate='date +"%d-%m-%Y"'

# Control output of networking tool called ping
# Stop after sending count ECHO_REQUEST packets
alias ping='ping -c 5'
# Do not wait interval 1 second, go fast
alias fastping='ping -c 100 -s.2'

# Show open ports
alias ports='netstat -tulanp'

# become root
alias root='sudo -i'
alias su='sudo -i'

# git:
alias ga='git add'
alias gc='git commit'
alias gp='git push'
alias gl='git log --oneline --graph --all --decorate'
alias gf='git fetch -p'
alias gpull='git pull'
alias gh='git --help'
alias gs='git status -s'
alias gd='git diff'
function gb
	git checkout -b $argv master;
	git rebase origin/master
end

# npm
alias ni='npm install'
alias nid='npm install --save-dev'
alias nig='npm install --global'
alias nu='npm uninstall'
alias nug='npm uninstall --global'
alias nt='npm test'
alias nk='npm link'
alias nr='npm run'
alias ns='npm start'
# npm-run
alias r='npm-run'

# yarn
alias ya='yarn add'
alias yad='yarn add --dev'
alias yr='yarn remove'
alias yl='yarn list --pattern'

function _add_path_if_not_exist
	if test -d $argv;\
		and test 2 -lt (count (ls -a $argv));\
		and not contains $argv $PATH
		set -xg PATH $argv $PATH
	end
end

# homebrew
_add_path_if_not_exist /usr/local/sbin

# java
set jvm_dir /Library/Java/JavaVirtualMachines
if test -d $jvm_dir;\
	and test 0 -lt (count (ls $jvm_dir));\
	and command -sq /usr/libexec/java_home
	set -xg JAVA_HOME (/usr/libexec/java_home)
	_add_path_if_not_exist $JAVA_HOME/bin
end

# Android Studio
if test -d $HOME/Library/Android/sdk
	set -xg ANDROID_HOME $HOME/Library/Android/sdk
	for dir in tools tools/bin platform-tools emulator
		_add_path_if_not_exist $ANDROID_HOME/$dir
	end
end

# rbenv
if command -sq rbenv
	_add_path_if_not_exist $HOME/.rbenv/shims
end

# flutter
_add_path_if_not_exist $HOME/Developer/flutter/bin

# The next line updates PATH for the Google Cloud SDK.
if test -e $HOME/Developer/google-cloud-sdk/path.fish.inc
	. $HOME/Developer/google-cloud-sdk/path.fish.inc
end

# Start the shell editor in vim mode
fish_vi_key_bindings
