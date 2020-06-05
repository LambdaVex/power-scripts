 ```bash
  jlink --module-path <modulepath> \
    --add-modules <modules> \
    --limit-modules <modules> \
    --output <path>
 ```
 ```bash
 $ --module-path 
 ➥ where to find the modules
 ➥ including java SE modules which are usually in $JAVA_HOME
 ➥ forexample $JAVA_HOME/jmods:out, this specifies Java SE modules and our own modules in 'out'
 $ --add-modules
 ➥ add the modules we need
 ➥ usually the root module 
 $ --limit-modules
 ➥ limit the observable modules
 ➥ especially when you have lots of transetive dependencies 
 $ --output
 ➥ directory where the runtime image will be located 
 ```
 
* You can also add a launcher (optionl)
  ```bash
   $ --launcher myCoolLauncher=MODULE/PACKGE.MAIN 
   ➥ we can use this directive 'myCoolLauncher' to launch the app
  ```
 
