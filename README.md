# Rafael’s dotfiles

This dotfiles repo contains:

- a collection of dotfiles (vim, bash, tmux...)
- shell scripts
- Brewfiles (install OS X libs and commandline tools)
- Caskfiles (install OS X apps using brew)
- OS X configuration script
- assorted extras

It also contains a bootstrap script to simplify installation and backup actions
for dotfiles and shell scripts.

## Installation

### Clone the repository

```bash
git clone https://github.com/rrobayna/dotfiles.git
```

**Warning: Using the bootstrap.sh script to install dotfiles will overwrite existing dotfiles and shell scripts. Proceed with caution! If you want to retain any of your personal dotfiles and scripts
you might want to perform a backup before installing.**


### Install dotfiles, scripts and vim plugins

```bash
cd dotfiles && ./bootstrap.sh install
```


### Add custom commands without creating a new fork

If `~/.extra` exists, it will be sourced along with the other files. You can use
this to add a few custom commands without the need to fork this entire repository,
or to add commands you don’t want to commit to a public repository.

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

This will install Homebrew and all the packages listed in the main Brewfile.

To install brew packages manually run:

```bash
brew bundle osx/Brewfile.home
```


### Installing OS X Applications using the Homebrew Cask bundler

```bash
brew bundle osx/Caskfile
```

This will install all the Apps listed in the Caskfile and link them to your
Applications directory. I've seperated additional packages for my home system
into Caskfile.home.


### Sensible OS X defaults

When setting up a new Mac, you may want to set some sensible OS X defaults:

```bash
./osx/defaults.osx
```

## Backup

### Using bootstrap.sh

To backup changes to you dotfiles and shell script:

```bash
./bootstrap.sh backup
```

This will only backup the files currently included in the projects home/ directory.
To add new dotfiles and scripts, just copy the file into the appropriate
directory.
If you want to add a new script or dotfile, copy it over to the repo's home or bin directory and it will be included in any future backups.


## Sources
This repo is primarily a modified fork of mathiasbynens' dotfiles repo:
https://github.com/mathiasbynens/dotfiles
Thanks to skwp for: ctags, gitignore
https://github.com/skwp/dotfiles

## Vim Resources
@todo add more resources here
Lots of useful bits vim bits were lifted from:

Vim Wikia 
https://vim.wikia.com

Steve Losh's amazing \"Learn Vim The Hard Way\"
http://learnvimscriptthehardway.stevelosh.com/