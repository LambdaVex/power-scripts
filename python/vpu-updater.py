import os
import subprocess
import time

class bcolors:
    HEADER = '\033[95m'
    OKBLUE = '\033[94m'
    OKCYAN = '\033[96m'
    OKGREEN = '\033[92m'
    WARNING = '\033[93m'
    FAIL = '\033[91m'
    ENDC = '\033[0m'
    BOLD = '\033[1m'
    UNDERLINE = '\033[4m'

def show(mode,text):
    print(mode + "############################################################################################################ > "+ text + bcolors.ENDC)

# True or False
build_workspace = True
init_dir = os.getcwdb()

def command(project, command):
    os.chdir(project)
    result = subprocess.check_output(command, shell=True).decode("utf-8").strip('\n')
    if("BUILD SUCCESS" in result):
        print(project+" >> BUILD SUCCESS")
    else:
        print(project+" >> BUILD FAIL")
    retreat()

def generateSources(project):
    os.chdir(project)
    os.system("mvn generate-sources")
    retreat()

def clean(project):
    os.chdir(project)
    os.system("mvn clean")
    retreat()

def build(project):
    os.chdir(project)
    show(bcolors.WARNING, "Updating > "+os.getcwdb().decode("utf-8"))

    if(build_workspace):
        show(bcolors.WARNING,"Building > "+os.getcwdb().decode("utf-8"))
        os.system("mvn clean install -P development -U -T 4C -DskipTests")

    show(bcolors.WARNING,"Update is complete > " + os.getcwdb().decode("utf-8"))
    retreat()

def update(project):
    os.chdir(project)
    show(bcolors.WARNING,"Updating > "+os.getcwdb().decode("utf-8"))

    os.system("git pull")

    if(build_workspace):
        show("Building > "+os.getcwdb().decode("utf-8"))
        os.system("mvn clean install -P development -U -T 2C -DskipTests")

    show(bcolors.WARNING,"Update is complete > " + os.getcwdb().decode("utf-8"))
    retreat()

def upgrade(project):
    os.chdir(project)
    show(bcolors.WARNING,"Updating > "+os.getcwdb().decode("utf-8"))

    upstream_repo = subprocess.check_output("git config --get remote.origin.url", shell=True).decode("utf-8").strip('\n')
    current_branch = subprocess.check_output("git rev-parse --abbrev-ref HEAD", shell=True).decode("utf-8").strip('\n')

    if(current_branch == "develop"):
        show(bcolors.WARNING,"Pulling from Develop")
        os.system("git pull "+upstream_repo+" develop")
    else:
        show(bcolors.WARNING,"Pulling from "+current_branch)
        os.system("git pull")
        show(bcolors.WARNING,"Pulling from Develop")
        os.system("git pull "+upstream_repo+" develop")

    if(build_workspace):
        show(bcolors.WARNING,"Building > "+os.getcwdb().decode("utf-8"))
        os.system("mvn clean install -P development -U -T 2C -DskipTests")

    show(bcolors.WARNING,"Update is complete > " + os.getcwdb().decode("utf-8"))
    retreat()

def silentUpgrade(project):
    os.chdir(project)
    show(bcolors.WARNING,"Updating > "+os.getcwdb().decode("utf-8"))

    upstream_repo = subprocess.check_output("git config --get remote.origin.url", shell=True).decode("utf-8").strip('\n')
    current_branch = subprocess.check_output("git rev-parse --abbrev-ref HEAD", shell=True).decode("utf-8").strip('\n')

    if(current_branch == "develop"):
        show(bcolors.WARNING,"Pulling from Develop")
        os.system("git pull "+upstream_repo+" develop")
    else:
        show(bcolors.WARNING,"Pulling from "+current_branch)
        os.system("git pull")
        show(bcolors.WARNING,"Pulling from Develop")
        os.system("git pull "+upstream_repo+" develop")

    if(build_workspace):
        show(bcolors.WARNING,"Building > "+os.getcwdb().decode("utf-8"))
        command = "mvn clean install -P development -U -T 2C -DskipTests"

        try:
            result = subprocess.check_output(command, shell=True,stderr=subprocess.DEVNULL).decode("utf-8").strip('\n')
        except subprocess.CalledProcessError as e:
            result  = ""
            err = str(e.output)

        if("BUILD SUCCESS" in result):
            show(bcolors.OKGREEN,project+" > BUILD SUCCESS")
        else:
            show(bcolors.FAIL,project+" > BUILD FAIL")
            result = err
        
    show(bcolors.OKGREEN,"Update is complete > " + os.getcwdb().decode("utf-8"))
    retreat()
    log(project, result)

def retreat():
    os.chdir(init_dir)
    print("_________________________________________________________________________________________________________________________________________________\n")

def log(project, text):
    whitelist = set('abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ')
    myStr = project
    answer = ''.join(filter(whitelist.__contains__, myStr))
    file = open("Log_"+answer+".txt", "w")
    file.write(text)
    file.close

start = time.time()
show(bcolors.HEADER,"Script Started")

projects = ["project1", "project2", "project3", "project4", "project5"]

for project in projects:
   silentUpgrade(project)
   show(bcolors.OKCYAN,"Switching to the next Goal")

end = time.time()
hours, rem = divmod(end-start, 3600)
minutes, seconds = divmod(rem, 60)

print("Workspace build in:")
print("{:0>2}:{:0>2}:{:05.2f}".format(int(hours),int(minutes),seconds))
show(bcolors.HEADER,"Script Finished")
