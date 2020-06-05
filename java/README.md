Ways to run Java scripts
------------------------
```bash
$ ./listfiles [directory]
➥ or just use jshell
# or
$ java --source 11 listfiles [directory]
➥ in case you didn't specify the shebang 
# or
$ java ListFiles.java [directory]
➥ structure of file should be a normal Java class. the compliation will happen in memory then it will be executed. 
```

Java dependency analysis tool [jdeps]
------------------------
```bash
$ jdeps --jdk-internals jar/class
➥ Find uses of JDK-internal APIs

$ jdeps jar/class
➥ Find dependencies

$ jdeps --generate-module-info jar
➥ Generate module-info.java file

# Extra (java9 modules)
$ jre/bin/java --list-modules
➥ List used modules
```
