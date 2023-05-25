#!/bin/bash

file="./data/new_config.conf"
chmod +x "./code/config.sh" "./code/create.sh" "new-project.desktop"

#!/bin/bash

desktop_dir="$HOME/Desktop"
new_project_dir="new-project.desktop"

# Move the new-project directory to /Desktop
mv "$new_project_dir" "$desktop_dir/"

if [ -s "$file" ]; then
    # Si le fichier n'est pas vide, exécuter une commande
    ./code/create.sh
else
    # Si le fichier est vide, exécuter une autre commande
    ./code/config.sh
    ./code/create.sh
fi
