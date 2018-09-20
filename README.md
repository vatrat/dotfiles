# dotfiles
My personal dotfiles

I install using:

```
cd ~
git init .
git remote add -t \* -f origin <repository-url>
git checkout master
```

Currently, I use the edior Spacemacs, a configuration on top of emacs which is meant to integrate the functionality of the vim emulator evil-mode into the emacs as a whole. Previously, I have used vim and Neovim. I still use Neovim occasionally for quick edits in the terminal. My Neovim configuration remains in this repository.

I use gnome-terminal and tmux. My tmux keybindings are vim-inspired and mostly stolen from somewhere a long time ago.

I use xmonad and gnome. Gnome is trash in terms of functionality, but it's still the most usable for me (I prefer to only use the keyboard). I hope to transition at some point to i3, because it seems like it has better support. No idea if I'll ever do that. My xmonad keybindings are also vim-inspired but made by me.

My primary operating systems are OpenSUSE and Fedora. I have also used Manjaro at points, as well as Xubuntu.

My .bashrc is a mess.

My .ps1rc is, in my opinion, pretty neat. It's, again, copied from someone else. I've modified it, but I don't remember how exactly. If you care, just look at the commit history. Isn't git great?

I hope at some point to make a real system for my dotfiles so that I can just go to a new computer, clone this repository, and run a script. Ideally, this should work for at least OpenSUSE, Fedora, and Ubuntu, installing any necessary packages (like git; barebones necessities). If I can figure it out, I'd also like to be able to transfer installed packages, and compile things I use like DSView and Rofi.

My .bash_aliases has some useful commands for me, focusing on reducing the number of keystrokes necessary to do housekeeping tasks like searching for and installing packages.
