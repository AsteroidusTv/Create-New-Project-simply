#!/usr/bin/env bash

directory=/home/achille/Documents/Projects/Create-New-Project-simply
cd $directory

# Variables
file="./data/new_config.conf"
app_dir="$HOME/.local/share/applications"


if [ -s "$file" ]; then
    # Execute create.sh
    ./code/create.sh

else
    # Make executable all 
    chmod -R +x .
    # Execute confing.sh and create.sh
    ./code/config.sh
    ./code/create.sh
fi
