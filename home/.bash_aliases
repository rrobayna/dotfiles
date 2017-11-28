# Easier navigation: .., ..., ...., ....., ~ and -
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ~="cd ~" # `cd` is probably faster to type though

# General
alias h='history'
alias open='see'

# Tmux
alias ltmux='if tmux has-session -t $USER; then tmux attach -t $USER; else tmux new -s $USER; fi'

# Git
alias g='git'
alias gs='git status -s; git submodule status'
alias gsl="git status --long; git submodule status"
alias gl='git log -m --simplify-merges --color --pretty=format:"%Cred%h%Creset %s %Cgreen(%cr) %Cblue%an <%ae>%Creset" --abbrev-commit --date=relative'
alias gsmp='git submodule foreach git pull'
alias gch='git checkout'
alias gb='git branch'
alias ga='git add'
alias gc='git commit'
alias gcm='git commit -m'
alias gd='git diff'
alias gds='git diff --staged'
alias gdh='git diff HEAD^'
alias gref='git reflog'
alias gsh='git show'
alias gball='for branch in `git branch -r | grep -v HEAD`;do echo -e `git show --format="%ci %cr" $branch | head -n 1` \\t$branch; done | sort -r'
alias gpom='git pull origin master'

# List all git repos under a directory
alias repos="find . -name .git -type d -prune"

# Docker
alias d='docker'
alias di='docker images'
alias dps='docker ps -a'
alias dh='docker history'
alias dl='docker ps -l -q'
alias dip='boot2docker ssh ip addr show dev eth1 | grep inet'
alias dsh='docker start -ai'

# mpd, mpc and ncmpcpp
alias m='ncmpcpp'
alias m.='mpc toggle --no-status'
alias m,='mpc next'
alias ml='mpc prev'

# vim
alias wiki='vim --cmd "cd ~" +VimwikiIndex'
alias todo='vim --cmd "cd ~" +Todo'
alias note='vim --cmd "cd ~" +Scratch'
alias today='vim --cmd "cd ~" +Today'

# bashmarks
alias bn='bashmarks new'
alias bd='bashmarks delete'
alias bl='bashmarks list'

# Detect which `ls` flavor is in use
if ls --color > /dev/null 2>&1; then # GNU `ls`
    colorflag="--color"
else # OS X `ls`
    colorflag="-G"
fi

# Always use color output for `ls`
alias ls="command ls ${colorflag}"
# List all files colorized in long format
alias l="ls -lF ${colorflag}"
# List all files colorized in long format, including dot files
alias ll="ls -laF ${colorflag}"
# List only directories
alias lsd="ls -lF ${colorflag} | grep --color=never '^d'"
# Show hidden
alias lsh='ls -ld .??*'

# Ecrypt fs
alias mp="ecryptfs-mount-private"
alias ump="ecryptfs-umount-private"

# Display the total size of a directory in MB
alias duh="du -d 1 -h | sort -gr"

# Stopwatch
alias timer='echo "Timer started. Stop with Ctrl-D." && date && time cat && date'

# IP addresses
alias myip="dig +short myip.opendns.com @resolver1.opendns.com"

# Weather
alias weather="ansiweather"

# View HTTP traffic
alias sniff="sudo ngrep -d 'en1' -t '^(GET|POST) '"
alias sniff80="sudo ngrep -d 'en1' -t '^(GET|POST) ' 'tcp and port 80'"
alias tcpd="sudo tcpdump -A -i en1"
alias httpdump="sudo tcpdump -i en1 -n -s 0 -w - | grep -a -o -E \"Host\: .*|GET \/.*\""

# Canonical hex dump; some systems have this symlinked
command -v hd > /dev/null || alias hd="hexdump -C"

# OS X has no `md5sum`, so use `md5` as a fallback
command -v md5sum > /dev/null || alias md5sum="md5"

# OS X has no `sha1sum`, so use `shasum` as a fallback
command -v sha1sum > /dev/null || alias sha1sum="shasum"

# URL-encode strings
alias urlencode='python -c "import sys, urllib as ul; print ul.quote_plus(sys.argv[1]);"'

# Sync ntp (useful when working with vms that get halted)
alias synctime="sudo ntpdate -s pool.ntp.org"

# Search using ddg and display in w3m browser
function ddg { search=""; bang=""; for term in $@; do if [[ "$term" =~ -([A-Za-z0-9._%+-]*) ]]; then bang="\!${BASH_REMATCH[1]}" ; else search="$search%20$term" ; fi ; done ; w3m "https://www.duckduckgo.com/?q=$bang$search" ;}

# OSX: Lookup definition in dictionary
function dict { open dict://"$@"; }

# OSX: Run OS updates manually
#alias update='sudo softwareupdate -i -a; brew update; brew upgrade; brew cleanup'
alias update='sudo apt-get update; sudo apt-get upgrade; vim +PluginUpdate +qall'

# OSX: Show/hide hidden files in Finder
alias show="defaults write com.apple.finder AppleShowAllFiles -bool true && killall Finder"
alias hide="defaults write com.apple.finder AppleShowAllFiles -bool false && killall Finder"

# OSX: Lock the screen (when going AFK)
alias afk="/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend"

# Reload the shell (i.e. invoke as a login shell)
alias reload="exec $SHELL -l"
