# linux-playground
A repository that includes helpful tips for linux

Refer also to https://github.com/AliDenno/power-scripts/tree/master/bash

<details><summary><b>Terminal Basics</b></summary>

> Relative path: starting from my current location, I navigate to another folder 

> Absolute path: what "pwd" shows, in other words the path starting from the root 

> Remember that when you want to access the folder "Ali Folder" you need to perform "$ cd Ali\ Folder"

Command | Description |  
---------- | ------ | 
pwd | print working directory | 
ls | list items | 
dir | list items |
cd or cd ~ | home directory | 
cd / | root directory | 
cls | clear command prompt | 
ctrl + l | clear command prompt by moving down | 
echo text > name(.type) | create file | 
mkdir foldername | create directory | 
del file | delete file | 
rmdir folder | delete folder | 
cp | copy file | 
mv | move file or folder | 
touch | create or touch file |
</details>

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

### Watch regular time intervals [WATCH]
```sh
watch -n 2 'curl -v --silent LINK 2>&1 | grep TEXT'
```

### System Update
```sh
sudo apt-get update && sudo apt-get upgrade && sudo apt-get dist-upgrade  && sudo apt autoremove && sudo apt autoclean && sudo apt clean && sudo apt update && sudo apt autoremove -y && sudo apt autoclean && sudo apt full-upgrade -y && sudo apt-get clean && sudo apt-get autoclean && sudo apt-get autoremove
```

> Solution for being stuck with: The following packages have been kept back
```sh
sudo apt-get install aptitude -y ; sudo aptitude safe-upgrade
```
```sh
# helpful commands
:~$ sudo apt install apt-show-versions
:~$ apt list --upgradable
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

### Effective commandline experience
```sh
# Go to the beginning of a command
Ctrl + A
# Go to the end of a command
Ctrl + E
# Clear screen by moving the command prompt to the top of the screen (history still there)
Ctrl + L
# If you have a long command and you want to delete it ... you can delete all on line 
Ctrl + U

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
# so set the property and run history again
:~$ HISTTIMEFORMAT="%Y-%m-%d %T "
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
```

### Tips
```sh
# Using Tab as shortcut in the terminal
$ gsettings set org.gnome.Terminal.Legacy.Keybindings:/org/gnome/terminal/legacy/keybindings/ next-tab '<Primary>Tab'
$ gsettings set org.gnome.Terminal.Legacy.Keybindings:/org/gnome/terminal/legacy/keybindings/ prev-tab '<Primary><Shift>Tab'
```

> snapstore update
```sh
$ killall snap-store
$ snap refresh
```
> spot and kill stuck apps
```sh
# Spot
$ xprop _NET_WM_PID | sed 's/_NET_WM_PID(CARDINAL) = //' | ps `cat`
# or
$ xprop | grep PID

# Kill
$ kill -9 pid
$ killall -9 appname
```


> which command in Linux is a command which is used to locate the executable file associated with the given command by searching it in the path environment variable. It has 3 return status
---
> :~$ cmatrix
---
> reset helps you when you mess up certain terminal settings
---
> ls -l; echo "hellow world" .. and .. ls -l && echo "hellow world" 
> - in case of first variation, if the first command failed, the second will still execute unlike the second variation (try ls a directory that doesn't exist .. the second command won't run)
---
> tail -f /var/log/syslog
> - monitor actions on your system 
---
> truncate -s 0 file1.txt
> - Empty the file 
---
> mount | column -t
> show jumbled output in columns
---
