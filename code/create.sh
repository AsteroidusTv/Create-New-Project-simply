#!/bin/bash
config_file="./data/new_config.conf"
code_choice=$(grep "code_choice" "$config_file" | cut -d'=' -f2 | tr -d ' ' | tr -d '"')
directory_path=$(grep "directory_path" "$config_file" | cut -d'=' -f2 | tr -d ' ' | tr -d '"')
current_dir=$(dirname "$(readlink -f "$0")")
cd "$directory_path"

folder_exists=false

while [ "$folder_exists" = false ]; do
  read -p "Enter the name of a parent folder (Ex. html, rust, go) : " folder_name

  if [ -d "$folder_name" ]; then
    echo "Folder exists."
    cd "$folder_name"
    folder_exists=true
  else
    choice="r"
    read -p "Folder does not exist. Do you want to enter another name or create the folder? (Retry [r]/Create [c]/Cancel [ca]) " choice

    case "$choice" in
      r|R|Retry)
        continue
        ;;
      c|C|Create)
        mkdir "$folder_name"
        echo "Folder \"$folder_name\" has been created."
        cd "$folder_name"
        folder_exists=true
        ;;
      ca|CA|Cancel)
        echo "Operation cancelled. No folder selected."
        exit 0
        ;;
      *)
        echo "Invalid choice."
        ;;
    esac
  fi
done

# Convert the path to lowercase for comparison
lowercase_folder_name=$(echo "$folder_name" | tr '[:upper:]' '[:lower:]')
  
# Check if the current directory is "html" or "Html"
cd "$current_dir"
echo "file=\"$folder_name\"" >> ../data/new_config.conf
if [ -f "./languages/$lowercase_folder_name.sh" ]; then
  ./languages/"$lowercase_folder_name.sh"
else
  echo "Script ./languages/$lowercase_folder_name.sh not found."
fi

# Supprimer la troisième ligne du fichier de configuration
sed -i '3d' "../data/new_config.conf"

