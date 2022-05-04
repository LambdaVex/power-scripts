# linux-playground
A repository that includes helpful tips for linux


### System Information Tool

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
# Go to the beginning of a command
Ctrl + A
# Go to the end of a command
Ctrl + E
# Clear screen
Ctrl + L
```
