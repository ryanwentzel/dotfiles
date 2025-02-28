# dotfiles

```
# * look for files in specified location
for file in $dotfiles_dir {path,bash_prompt,exports,aliases,functions,extra}; do
    [ -r "$file" ] && [ -f "$file" ] && source "$file"
done
unset file
```
