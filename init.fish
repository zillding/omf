##########################################
# Set up aliases
##########################################
alias ql='qlmanage -p'
alias rm='rm -i'
alias c='clear'

alias df='df -h'
alias du='du -h'
alias mkdir='mkdir -p'

## Use a long listing format ##
alias ll='ls -lh'
alias lla='ls -lah'
alias lh='ls -h'

## Show hidden files ##
alias l.='ls -d .*'
alias la='ls -ah'

## a quick way to get out of current directory ##
alias ..='cd ..'
alias ...='cd ../../../'
alias ....='cd ../../../../'
alias .....='cd ../../../../'
alias .4='cd ../../../../'
alias .5='cd ../../../../..'

## Colorize the grep command output for ease of use (good for log files)##
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

# handy short cuts #
alias h='history'
alias j='jobs -l'

# Create a new set of commands
alias nowtime=now
alias nowdate='date +"%d-%m-%Y"'

# Control output of networking tool called ping
# Stop after sending count ECHO_REQUEST packets #
alias ping='ping -c 5'
# Do not wait interval 1 second, go fast #
alias fastping='ping -c 100 -s.2'

# Show open ports
alias ports='netstat -tulanp'

# confirmation #
alias mv='mv -i'
alias cp='cp -i'
alias ln='ln -i'

# become root #
alias root='sudo -i'
alias su='sudo -i'

# Aliases -- Git:
alias ga='git add'
alias gc='git commit'
alias gp='git push'

alias gl='git log --oneline --graph --all --decorate'
alias gpull='git pull'
alias gh='git --help'
alias gs='git status -s'
alias gd='git diff'
alias go='git checkout'

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

##########################################
# Env variable
##########################################
if command -sq /usr/libexec/java_home
	set -xg JAVA_HOME (/usr/libexec/java_home)
end
# Android Studio
set -xg ANDROID_HOME $HOME/Library/Android/sdk

##########################################
# Update PATH
##########################################
function add_path_if_not_exist
	if not contains $argv $PATH
		set -xg PATH $PATH $argv
	end
end

add_path_if_not_exist $HOME/.rbenv/shims
add_path_if_not_exist $JAVA_HOME/bin

for dir in tools tools/bin platform-tools emulator
	add_path_if_not_exist $ANDROID_HOME/$dir
end

##########################################
# Start the shell editor in vim mode
##########################################
fish_vi_key_bindings
