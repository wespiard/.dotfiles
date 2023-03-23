# My Custom Dotfiles

## Summary

To copy these configurations to a new system, one needs __git__ and __stow__ to be installed. 

## Installation

1. Clone this repository into home directory.

```
git clone https://github.com/wespiard/.dotfiles.git ~/.dotfiles
```

2. Enter repository directory and call stow.

```
cd ~/.dotfiles
stow */
```

Stow creates symlinks in the parent directory of where it is called, which in this case would be the $HOME directory.
