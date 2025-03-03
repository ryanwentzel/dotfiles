# Path to Dotfiles
export DOTFILES="$HOME/dev/dotfiles"

#Default prompt
PS1="%n@%m %1~: "

# Adapted from https://github.com/mathiasbynens/dotfiles
# Load the shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`.
# * ~/.extra can be used for other settings you don’t want to commit.
for file in "$DOTFILES/"{path,exports,aliases,functions,extra}; do
    [ -r "$file" ] && [ -f "$file" ] && source "$file"
done
unset file
