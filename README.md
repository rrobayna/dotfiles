# Rafael’s dotfiles

This dotfiles repo contains:
- a collection of dotfiles (vim, bash, tmux...)
- bash scripts
- Brewfiles (for installing commandline tools in OS X)
- Caskfiles (for installing apps in OS X using brew)
- OS X configs
- assorted extras

It also contains a dotfiles bootstrap script to simplify installation and backups of dotfiles and bash scripts.


## Installation

### Clone the repository

```bash
git clone https://github.com/rrobayna/dotfiles.git
```

### Install dotfiles, bash scripts and vim plugins

**Warning: This operation with overwrite existing dotfiles and bash scripts.**

```bash
cd dotfiles && ./bootstrap.sh install
```

This will copy over all the dotfiles from the repos home/ directory to your ~/.  It will also copy all the bash scripts in the repos bin/ directory to your ~/bin and will install all the vim plugins in the .vimrc using Vundle magic.


### Add custom commands without creating a new fork

If `~/.extra` exists, it will be sourced along with the other files. You can use this to add a few custom commands without the need to fork this entire repository, or to add commands you don’t want to commit to a public repository.

My `~/.extra` looks something like this:

```bash
# Git credentials
# Not in the repository, to prevent people from accidentally committing under my name
GIT_AUTHOR_NAME="Rafael Robayna"
GIT_COMMITTER_NAME="$GIT_AUTHOR_NAME"
git config --global user.name "$GIT_AUTHOR_NAME"
GIT_AUTHOR_EMAIL="rrobayna@gmail.com"
GIT_COMMITTER_EMAIL="$GIT_AUTHOR_EMAIL"
git config --global user.email "$GIT_AUTHOR_EMAIL"
```


### Installing Homebrew and the Brewfile

```bash
./bootstrap brew
```

This will install Homebrew if it's not already installed and install all the packages listed in the main Brewfile.

To install the additional packages listed in Brewfile.home just run:

```bash
brew bundle osx/Brewfile.home
```


### Installing OS X Applications using the Homebrew Cask bundler

```bash
brew bundle osx/Caskfile
```

This will install all the apps listed in the Caskfile and link them to your Applications directory. Again, I've seperated additional packages for my home system into Caskfile.home.


### Sensible OS X defaults

When setting up a new Mac, you may want to set some sensible OS X defaults:

```bash
./.osx
```

## Backing Up

### Using bootstrap.sh

Once you've made changes to your dotfiles and bash script, you can run:

```bash
./bootstrap.sh backup
```

from the repo's home folder to backup all your updates. If you want to add a new script or dotfile, copy it over to the repo's home or bin directory and it will be included in any future backups.


## Sources
This repo is primarily a modified fork of mathiasbynens' dootfiles repo:
https://github.com/mathiasbynens/dotfiles
Thanks to skwp for: ctags, gitignore
https://github.com/skwp/dotfiles

## Vim Resources
Lots of useful bits vim bits were lifted from:
- Vim Wikia (https://vim.wikia.com)
- Steve Losh's amazing \"Learn Vim The Hard Way\"
http://learnvimscriptthehardway.stevelosh.com/
