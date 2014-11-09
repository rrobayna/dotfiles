# Install command-line tools using Homebrew
# Usage: `brew bundle Brewfile`

# Make sure we’re using the latest Homebrew
brew update

# Upgrade any already-installed formulae
brew upgrade

#brew install gcc
# Install GNU core utilities (those that come with OS X are outdated)
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils
# Install some other useful utilities like `sponge`
brew install moreutils
# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed
brew install findutils
# Install GNU `sed`, overwriting the built-in `sed`
brew install gnu-sed --default-names
# Install Bash 4
# Note: don’t forget to add `/usr/local/bin/bash` to `/etc/shells` before running `chsh`.
brew install bash
brew install bash-completion
# Install wget with IRI support
brew install wget --enable-iri
# Install more recent versions of some OS X tools
brew install vim --with-lua --with-python3 --override-system-vi
brew install grep
brew install php56
# PHP Tools
brew install phpunit
brew install php-code-sniffer
# Other useful binaries
brew install git
brew install tmux
brew install maven
brew install node
brew install ctags
brew install automake
brew install autoconf
brew install ack
brew install bfg
brew install imagemagick --with-webp
brew install p7zip
brew install rename
brew install tree
brew install webkit2png
brew install xpdf
brew install watch
brew install xz
# Fuse
#brew install osxfuse
#brew install sshfs
# Network Tools
brew install tcpflow
brew install nmap
brew install ngrep
brew install htop-osx
brew install iftop
brew install w3m
# Local Cache and Proxies
brew install dnsmasq
brew install squid
brew install privoxy
# Email
brew install mutt
brew install urlview
# Brew tools
brew install brew-cask

# Remove outdated versions from the cellar
brew cleanup
