# For a specific user, just add 'umask 022' in the ~/.bashrc
# If you want to change the system wide view mask, create the following script /etc/profile.d/umask.sh

#check the ID of the user who is logged-in, if it is greater or equal to 1000 then set the umask to 022

if [ "$UID" -ge 1000] ;then
        umask 022
fi
