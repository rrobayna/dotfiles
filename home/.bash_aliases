# Easier navigation: .., ..., ...., ....., ~ and -
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ~="cd ~" # `cd` is probably faster to type though
alias -- -="cd -"

# General
alias h="history"

# Tmux
#alias tmux="TERM=screen-256color-bce tmux"
alias ltmux="if tmux has-session -t $USER; then tmux attach -t $USER; else tmux new -s $USER; fi"

# Docker
alias d="docker"
alias dl="docker ps -l -q"
alias dip="boot2docker ssh ip addr show dev eth1 | grep inet"
alias di="docker images"
alias dps="docker ps -a"

# Git Aliases
alias gs='git status -s; git submodule status'
alias gp='git pull'
alias ga='git add'
alias gd='git diff'
alias gl='git log'
alias glo='git log --oneline'
alias gsh='git show'
alias gc='git commit'
alias gb='git branch'
alias gch='git checkout'
alias gsh='git show'
alias gd1='echo "git diff HEAD"; git diff HEAD'
alias gd2='echo "git diff HEAD^"; git diff HEAD^'
alias grmall="git status | grep 'deleted:' | awk '{print \$3}' | xargs git rm -f"

# Detect which `ls` flavor is in use
if ls --color > /dev/null 2>&1; then # GNU `ls`
    colorflag="--color"
else # OS X `ls`
    colorflag="-G"
fi

# List all files colorized in long format
alias l="ls -lF ${colorflag}"
# List all files colorized in long format, including dot files
alias la="ls -laF ${colorflag}"
# List only directories
alias lsd="ls -lF ${colorflag} | grep --color=never '^d'"
# Always use color output for `ls`
alias ls="command ls ${colorflag}"
# Show hidden
alias lh='ls -ld .??*'

# Stopwatch
alias timer='echo "Timer started. Stop with Ctrl-D." && date && time cat && date'

# Get OS X Software Updates, and update installed Ruby gems, Homebrew, npm, and their installed packages
alias update='sudo softwareupdate -i -a; sudo brew update; sudo brew upgrade; sudo brew cleanup'
#alias update='sudo softwareupdate -i -a; sudo brew update; sudo brew upgrade; sudo brew cleanup; sudo npm update npm -g; sudo npm update -g'

# IP addresses
alias myip="dig +short myip.opendns.com @resolver1.opendns.com"

# View HTTP traffic
alias sniff="sudo ngrep -d 'en1' -t '^(GET|POST) '"
alias sniff2="sudo ngrep -d 'en1' -t '^(GET|POST) ' 'tcp and port 80'"
alias httpdump="sudo tcpdump -A -i en1"
alias httpdump="sudo tcpdump -i en1 -n -s 0 -w - | grep -a -o -E \"Host\: .*|GET \/.*\""

# Canonical hex dump; some systems have this symlinked
command -v hd > /dev/null || alias hd="hexdump -C"

# OS X has no `md5sum`, so use `md5` as a fallback
command -v md5sum > /dev/null || alias md5sum="md5"

# OS X has no `sha1sum`, so use `shasum` as a fallback
command -v sha1sum > /dev/null || alias sha1sum="shasum"

# Show/hide hidden files in Finder
alias show="defaults write com.apple.finder AppleShowAllFiles -bool true && killall Finder"
alias hide="defaults write com.apple.finder AppleShowAllFiles -bool false && killall Finder"

# URL-encode strings
alias urlencode='python -c "import sys, urllib as ul; print ul.quote_plus(sys.argv[1]);"'

# Lock the screen (when going AFK)
alias afk="/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend"

# Reload the shell (i.e. invoke as a login shell)
alias reload="exec $SHELL -l"
alias rr="source $HOME/.bashrc"
