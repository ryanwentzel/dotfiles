#!/bin/sh

# Install dotfiles on a new system (or update an existing system)
# Adapted from https://github.com/lewagon/dotfiles/blob/master/install.sh

# Rename a `target` file to `target.backup` if the file
# exists and if it's a 'real' file, ie not a symlink
function backup () {
  target=$1
  if [ -e "$target" ]; then
    if [ ! -L "$target" ]; then
      mv "$target" "$target.backup"
      echo "-----> Moved your old $target config file to $target.backup"
    fi
  fi
}

function symlink () {
  file=$1
  link=$2
  if [ ! -e "$link" ]; then
    echo "-----> Symlinking your new $link"
    ln -s $file $link
  fi
}

# For all files, backup the target file located at `~/.$file` and symlink `$file` to `~/.$file`
for file in "zshrc"; do
  if [ -r "$file" ] && [ -f "$file" ]; then
    target="$HOME/.$file"
    backup $target
    symlink $PWD/$file $target
  fi
done
unset file