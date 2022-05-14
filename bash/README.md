### Can't run scripts?
```bash
Do you have the execute permission for your_script.sh

# You can verify this by running 
$ ls -l your_script.sh

# You can make it executable by running (add permission with + and remove it with -) [https://tldp.org/LDP/intro-linux/html/sect_03_04.html]
$ chmod u+x your_script.sh (+x for execute permission, u user permission (adding execute permission only to the user who owns this file))
# or
$ chmod a+x your_script.sh (a is for all)
# or
$ chmod +rx your_script.sh
```

### Running scripts anywhere (without using aliases which are limited):
```bash
# create a bin folder in your ~, and add your script there
$ mkdir bin
    # add or create a script, for example (greeter): 
    $ #!/bin/bash
    $ echo "Hi Awesome!"
$ chmod +x greeter
$ sudo nano ~/.bashrc

# scroll down to the bottom and add
PATH="$PATH:$HOME/bin"
$ echo $PATH

# now you should be able to execute your script from anywhere
$ greeter
```

### Debugging?
```bash
$ #!/bin/bash -v
# or
$ #!/bin/bash -x
```

### Check your script?
```bash
$ shellcheck your_script.sh
```
