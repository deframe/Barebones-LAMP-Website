################################################################################
# NOTE: This provisioning script will only work in a Vagrant VM built using a  #
# LAMP basebox! [https://github.com/deframe/Vagrant-Baseboxes]                 #
################################################################################

# Import VM settings and set project-specific variables

if [ -f /etc/vm-settings.sh ]; then
    source /etc/vm-settings.sh
else
    echo "This script is not being run in the correct environment!"
    exit
fi

project_location=/web/default
project_database_name=website

# Initialize the working copy of the project.

cd $project_location
phing init-working-copy -Ddatabase.host=localhost -Ddatabase.username=$vm_mysql_standard_user_username -Ddatabase.password=$vm_mysql_standard_user_password -Ddatabase.name=$project_database_name

# Update default vhost document root and restart Apache

if ! grep -q "$project_location/web" /etc/apache2/sites-available/default; then
    sed -i "s#$project_location#$project_location/web#g" /etc/apache2/sites-available/default
    service apache2 restart
fi