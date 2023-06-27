#!/usr/bin/env bash

directory=/home/achille/Documents/Projects/Bash/Create-New-Project-simply
cd $directory

# Variables
file="./data/new_config.conf"
app_dir="$HOME/.local/share/applications"
new_project_dir="new-project.desktop"


if [ -s "$file" ]; then
    # Execute create.sh
    ./code/create.sh

else
    # Make executable all 
    chmod -R +x .
    # Move the new-project directory to /Desktop
    mv "$new_project_dir" "$app_dir"
    # Execute confing.sh and create.sh
    ./code/config.sh
    ./code/create.sh
fi
