# Install command-line tools using Homebrew
# Usage: `brew bundle Brewfile`

# Make sure we’re using the latest Homebrew
update

# Upgrade any already-installed formulae
upgrade

# Install GNU core utilities (those that come with OS X are outdated)
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
install coreutils
# Install some other useful utilities like `sponge`
install moreutils
# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed
install findutils
# Install GNU `sed`, overwriting the built-in `sed`
install gnu-sed --default-names
# Install Bash 4
# Note: don’t forget to add `/usr/local/bin/bash` to `/etc/shells` before running `chsh`.
install bash
install bash-completion
# Install wget with IRI support
install wget --enable-iri
# Install more recent versions of some OS X tools
install vim --override-system-vi
install homebrew/dupes/grep
install homebrew/php/php55 --with-gmp

# Install other useful binaries
install node
install maven
install jsawk
install automake
install autoconf
install ctags
install atk
install ack
install bfg
install git
install imagemagick --with-webp
install lynx
install node # This installs `npm` too using the recommended installation method
install p7zip
install rename
install tree
install webkit2png
install xpdf
install tmux
install watch
install xz

#install fuse
install osxfuse
install sshfs

#install network tools
install tcpflow
install nmap
install htop-osx
install iftop

# ffmpeg
install ffmpeg
install x264
install xvid
install webp
install flac
install lame
install faac
install libpng
install jpeg
install libogg
install libtiff
install libvorbis

# Remove outdated versions from the cellar
cleanup