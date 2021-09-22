### Can't run scripts?
```bash
Do you have the execute permission for your_script.sh

# You can verify this by running 
$ ls -l your_script.sh

# You can make it executable by running
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