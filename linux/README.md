# linux-playground
A repository that includes helpful tips for linux

Refer also to https://github.com/AliDenno/power-scripts/tree/master/bash

### System Information Tool
```sh
:~$ hostnamectl
```

```sh
screenfetch

:~$ sudo apt install screenfetch
:~$ screenfetch -v
:~$ screenfetch -n

:~$ neofetch
```
  
```sh
lsb_release

:~$ sudo apt-get update && sudo apt-get install lsb-core
:~$ lsb_release -v
:~$ lsb_release -a
```

### System Update
```sh
:~$ sudo apt-get update && sudo apt-get upgrade && sudo apt-get dist-upgrade  && sudo apt autoremove && sudo apt autoclean && sudo apt clean && sudo apt update && sudo apt autoremove -y && sudo apt autoclean && sudo apt full-upgrade -y && sudo apt-get clean && sudo apt-get autoclean && sudo apt-get autoremove
```

### Installing and starting Apps
```sh
# ^ start of string & end of string
$ sudo apt search ^zsh$
$ sudo apt show ^zsh$

# tip: to reconfigre zsh
$ zsh-newuser-install

# to know how an app is started (let's say chrome)
$ ps aux | grep chrome
```

### Repositories and PPAs (Be sure to backup this directory)
```sh
:~$ ll /etc/apt/sources.list.d/
:~$ grep ^ /etc/apt/sources.list /etc/apt/sources.list.d/*
```

### i3wm
```sh
:~$ sudo apt update
:~$ sudo apt show i3
:~$ sudo apt install i3

> https://i3wm.org/docs/refcard.html
```
```sh
# Open a terminal
:~$ $mod + ENTER
# Launching system applications via the dmenu
:~$ $mod + d
# Enter a fullscreen mode on and off
:~$ $mod + f
# Closing an application window
:~$ $mod + Shift + q
# Restarting i3
:~$ $mod + Shift + r
# Exiting i3 windows manager
:~$ $mod + Shift + e

> https://kifarunix.com/install-i3-windows-manager-on-ubuntu/
```

### Useful Commands
```sh
# Home directory
:~$ cd ~
# Previous directory
:~$ cd -
# Go to directory and save current (This works as a stack)
:~$ pushd /var
# Return to saved directory
:~$ popd
# Reset Shell
:~$ reset

# Go to the beginning of a command
Ctrl + A
# Go to the end of a command
Ctrl + E
# Clear screen by moving the command prompt to the top of the screen (history still there)
Ctrl + L

# Send something to the background without closing it (Vim, Htop, etc.)
Ctrl + Z
# Bring it back again (foreground)
:~$ fg

# update indecies
:~$ apt update
# you need sudo to perform that
# !! -> last command you ran
:~$ sudo !! 

# check previous commands
:~$ ctrl r -> type something -> ctrl r again and again 
# or
:~$ history
# find all commands, find the one you want and then 
:~$ !wishedCommandNumber
# you can use the following command to show the time when invoking the command above (you can set it permenantly in the ~/.bashrc file)
:~$ HISTTIMEFORMAT="%Y-%m-%d %T "
```

### Tips
```sh
# Using Tab as shortcut in the terminal
$ gsettings set org.gnome.Terminal.Legacy.Keybindings:/org/gnome/terminal/legacy/keybindings/ next-tab '<Primary>Tab'
$ gsettings set org.gnome.Terminal.Legacy.Keybindings:/org/gnome/terminal/legacy/keybindings/ prev-tab '<Primary><Shift>Tab'
```

> which command in Linux is a command which is used to locate the executable file associated with the given command by searching it in the path environment variable. It has 3 return status

> :~$ cmatrix
