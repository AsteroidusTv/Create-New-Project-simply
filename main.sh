#!/bin/bash

file="./data/new_config.conf"
chmod +x "./code/config.sh" "./code/create.sh" "new-project.desktop"

app_dir="$HOME/.local/share/applications"
new_project_dir="new-project.desktop"


if [ -s "$file" ]; then
    # Execute create.sh
    ./code/create.sh
    

else
    # Execute confing.sh and create.sh
    # Move the new-project directory to /Desktop
    mv "$new_project_dir" "$desktop_dir/"
    ./code/config.sh
    ./code/create.sh
fi
