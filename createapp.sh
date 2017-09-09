#!/bin/bash
echo "this is my first shell script "
echo -n "enter the name of the applicationn folder: "
read fname

echo "copying  a folder"

cp -R _app  "$fname"

echo "$fname folder created successfully...." >> appinstallation.log

# echo "please enter to continue"
# read

echo "navigating into the to folder $fname..."
cd $fname

bundle install

echo "bundle install completed...." >> appinstallation.log
echo

echo "please enter the name of the database:"
read database

sed -i "s/_app/$database/g" config/database.yml

sudo service postgresql start

echo "postgresql started......." >> appinstallation.log

rails db:create

echo "database created....." >> appinstallation.log

echo "executing migration scripts"

rails db:migrate

echo "database schemas created " >> appinstallation.log

echo "executing db seed"

rails db:seed

echo "db seed complted" >> appinstallation.log

echo "install rspecs" 

rails generate rspec:install

echo "rspec intalled" >> appinstallation.log

echo "intialize gurard"

guard init

echo "guard init hooked up..." >> appinstallation.log

echo "start redis server"
sudo service redis-server start

echo "redis server started" >> appinstallation.log











