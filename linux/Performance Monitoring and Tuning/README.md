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

#### Memory Usage
```bash
* Physical Memory: Random Access Memory (RAM)
* Swap: Allocated disk space
* Disk Cashing: RAM capacity "Borrowed" for application use

$ less /proc/meminfo
$ free -h
```
