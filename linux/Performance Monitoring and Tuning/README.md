#### Diagnosing and Managing CPU Load and Memory Issues

```bash
# important info about processors and system

$ cd /proc
# all about cpu
$ less cpuinfo
# number of processors
$ less cpuinfo | grep processor
```

#### CPU Usage
```bash
# knowing number of processors is important here
$ uptime gives you three averages -> capacity use over 1, 5 and 15 minutes

# if you have a single processor then
1.0 = 100% capacity
0.5 = 50% capacity

# if you have 4
1.0 = 25% capacity
2.0 = 50% capacity

# learn more about processes
$ top

# log entries
$ ps aux | grep Process_ID


$ sudo journalctl _PID=ID
```
##### Controlling Process Access to Resources
```bash
# Remember using ps for showing the processes for the current shell

# 'yes' is a tool that outputs the string 'y' over and over again until it is stopped
# /dev/null is a file that is instantly discarded and the & is for running in the background 
# run this 3 times then check using $ ps
$ yes > /dev/null &

# you can stop them
# Terminates processes based on process ID
$ kill ID
# Terminates processes based on application name  
$ killall yes

# other processes might be set to launch again when the computer next time boots  .. let's take mysql as an example
# if after running the following command, it shows to be enabled (the line of loaded) that means it will load everytime the system boots 
$ sudo systemctl status mysql
# to turn off the function
$ sudo systemctl disable mysql
```

##### Controlling Processes Using NICE
```bash
# NICE is a great way to control how much CPU action individual processes get, and in particular when you want a way to vary the share of resources an individual process gets

$ chmod +x stresser.sh
$ ./stresser.sh
# check using htop how this scrip is using the entire CPU 

# next copy the script and test again, the scripts will use 50/50 cpu or 2 cpus depending on ur pc
$ ./stresser.sh &
$ ./stresser1.sh 

# processes usually start with value of 0. we can make a script nice using a value like -19 and not nice using value like negative 19 (--19)
# there is a coloumn in top called NI that indicates this value
$ nice -19 ./stresser1.sh &

```

##### Controlling Processes Using cgroups
```bash
# The idea is that you can assign processes to groups whose system rights are then tracked and/or limited by the rules you set.
# Those rules will control members of the groups along with any new child processes spawned by the members
# (looks like cgroup-bin was replaced by cgroup-tools)
$ apt install cgroup-bin cgroup-lite cgroup-tools cgroupfs-mount libcgroup1 

# create a controlled group
$ cgreate -a ubuntu -g cpu:testgroup
$ cd /sys/fs/cgroup/
$ cd cpu

```

#### Memory Usage
```bash
* Physical Memory: Random Access Memory (RAM)
* Swap: Allocated disk space
* Disk Cashing: RAM capacity "Borrowed" for application use

$ less /proc/meminfo
$ free -h

# you can vmstat over hours or days (periodic snapshots of the state of your memory) 
# here we can see 4 pieces of 1 second intervals
$ vmstat 1 4
```
