#!/bin/bash

# List of folder names to search
directory_list=("Projects" "Project" "project" "projects")
project_response=y
# Counter initialized to zero
counter=0

# Variable to store folder path if found
directory_path=""

# While loop until folder is found and all items in list have been searched
while [[ -z "$directory_path" && $counter -lt ${#directory_list[@]} ]]
do
    # Get the current directory name to search
    current_directory=${directory_list[$counter]}

    # Use the `find` command to search for the folder in the entire computer
    directory_path=$(find /home -type d -name "$current_directory" 2>/dev/null)

    ((counter++))
done

if [[ -n "$directory_path" ]]; then
    echo -n "Is this the folder that contains your projects?: $directory_path, Y/n: "
    read project_response

    if [[ $project_response == "Y" || $project_response == "y" ]]; then
        # Do something if the project folder is found
        echo "Project folder found!"

    elif [[ $project_response == "N" || $project_response == "n" ]]; then
        echo -n "Please enter the path to your projects folder following this pattern \"/home/your/directory/path\": "
        read directory_response
        # Do something else if the project folder is not found
    fi
else
    echo "None of the listed folders were found in the entire computer, or all items in the list were searched."
    echo -n "Please enter the path to your projects folder following this pattern \"/home/your/directory/path\": "
    read directory_response
    # Do something else if no folder is found
fi

code_choice=""
while [[ $code_choice != "s" && $code_choice != "S" && $code_choice != "v" && $code_choice != "V" ]]; do
    echo "Quel éditeur utilisez-vous ?"
    read -p "Sublime Text (s) ou Visual Studio Code (v) ? " code_choice

    if [[ $code_choice == "s" || $code_choice == "S" || $code_choice == "sublimetext" || $code_choice == "SublimeText" ]]; then
        code_choice="subl"
        break
    elif [[ $code_choice == "v" || $code_choice == "V" || $code_choice == "vscode" || $code_choice == "Vscode" ]]; then
        code_choice="code"
        break
    else
        echo "Choix invalide. Veuillez sélectionner 's' pour Sublime Text ou 'v' pour Visual Studio Code."
    fi
done



# Save the directory path and code choice to the configuration file
echo "code_choice=\"$code_choice\"" >> ./data/new_config.conf
echo "directory_path=\"$directory_path\"" >> ./data/new_config.conf



