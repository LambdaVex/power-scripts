### Can't run scripts?
> Do you have the execute permission for your_script.sh
```bash
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
```
# different way using export:
> $PATH includes all folders where bash searches for commands that you run (if you say 'ls' bash will look in the path variable and search all the directories in the variable for an executable called ls

$ tail ~/.bashrc
$ nano ~/.bashrc
# add something like:
export PATH="$HOME/bin/:$PATH"
export my_file="$HOME/my_data.csv"

# result:
> if you create a bin folder in your Home and add a script there (The script is located in one of the folders listed on the $PATH), then you will be able to call it anywhere also without a slash, in addition for the variable that was defined (my_file)

```

### Debugging?
```bash
$ #!/bin/bash -v
# or
$ #!/bin/bash -x

# if your shell is at /usr/bin/env
$ #!/usr/bin/env zsh
$ set -x
```

### Check your script?
```bash
$ shellcheck your_script.sh
```

### Tips?
```bash
# use the printf instead of echo .. safer and more powerful
$ printf "I am %s and my shell is %s\n" $USER $SHELL

# always qoute and use braces when you have concatenated variables (concatenation between variables or and strings etc.):
$ grep -- "$container" file.csv > "$directory/${container}_report.csv"

# you can use Export, to export a variable to child processes
$ my_file=test.txt
$ export my_file
# Next you can define the variable in the init files (.bashrc or .zshrc)
# add the line
$ export my_file="$HOME/data.csv"
```

### Conditionals
> Return values are 0:success 1:error
> if testcode; then successcode; else failcode; fi
```bash
$ if ls c; then echo "ok"; else echo "ups"; fi
$ if mkdir a; then echo "ok"; else echo "error"; fi

# check the script and its returl values
$ if your_script.sh; then echo "Success"; else echo "Error"; fi

# example in script
$ if [[ ! $1 ]]; then
$     echo "Error: missing parameter: first argument"
$     exit 1
$ fi
```

### Best practices
> Quote Your Variables
```bash
# Use "$x" instead of $x so that there is no surprises when input contains spaces.
# Use double quotes to keep meaning of dollar sign intact
# Zsh is different. Zsh does not split variables in words and  the Behaviour is configurable
```
> Braces
```bash
# Where does your variable name end?
$ echo  "${foo}bar"
    * prints value of var foo
    * followed by string "bar"
$ echo "$foobar"
    * prints value of foobar
```
> Taking Arguments
```bash
# Your script can acces input from argumets. Inside the script, the arguments are available as special numbered variables.
$ create_report.sh A5 myfolder
$ container="$1" # The first argument
$ directory="$2" # Second argument 
$ third_arg="$3" # etc.
```
> End of Options
```bash
# If your input might start with a - then Use -- (end of options)
$ grep -- "$user_input"
$ rm -- "$file_to_delete"
# Some commands don't support this
# Use printf instead of echo
$ printf "I will delete the file: $s\n" "$file_to_delete" 
```
