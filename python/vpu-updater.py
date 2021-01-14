import os
import subprocess
import time

# True or False
build_workspace = False
init_dir = os.getcwdb()

def show(text):
    print("############################################################################################################ > "+ text)

def upgrade(project):
    os.chdir(project)
    show("Updating > "+os.getcwdb().decode("utf-8"))

    upstream_repo = subprocess.check_output("git config --get remote.origin.url", shell=True).decode("utf-8").strip('\n')
    current_branch = subprocess.check_output("git rev-parse --abbrev-ref HEAD", shell=True).decode("utf-8").strip('\n')

    if(current_branch == "develop"):
        show("Pulling from Develop")
        os.system("git pull "+upstream_repo+" develop")
    else:
        show("Pulling from "+current_branch)
        os.system("git pull")
        show("Pulling from Develop")
        os.system("git pull "+upstream_repo+" develop")

    if(build_workspace):
        show("Building > "+os.getcwdb().decode("utf-8"))
        os.system("mvn clean install -P development -U -T 1C -DskipTests")

    show("Update is complete > " + os.getcwdb().decode("utf-8"))
    retreat()

def retreat():
    os.chdir(init_dir)
    print("_________________________________________________________________________________________________________________________________________________\n")

start = time.time()

upgrade("project1")
upgrade("project2")
upgrade("project3")
upgrade("project4")
upgrade("project5")
upgrade("project6")

end = time.time()
hours, rem = divmod(end-start, 3600)
minutes, seconds = divmod(rem, 60)

print("Workspace build in:")
print("{:0>2}:{:0>2}:{:05.2f}".format(int(hours),int(minutes),seconds))
