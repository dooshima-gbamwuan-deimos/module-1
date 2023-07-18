#!/bin/bash

# we will use this script to add user to the group
GROUP_NAME="ourGroup"
USER_NAME="newbie"

# Add group
sudo addgroup $GROUP_NAME

# create new user and add to group
sudo adduser -m -g $GROUP_NAME $USER_NAME

# Set password for the user
read -s -p "Enter password for $USER_NAME: " PASSWORD
echo "$USER_NAME:$PASSWORD" | sudo chpasswd

# Switch to new user
su $USER_NAME
