#!/bin/bash
config_file="./data/new_config.conf"
code_choice=$(grep "code_choice" "$config_file" | cut -d'=' -f2 | tr -d ' ' | tr -d '"')
directory_path=$(grep "directory_path" "$config_file" | cut -d'=' -f2 | tr -d ' ' | tr -d '"')

cd "$directory_path"

folder_exists=false

while [ "$folder_exists" = false ]; do
  read -p "Enter a folder name: " folder_name

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

# Get the absolute path of the current directory
current_directory=$(pwd)

# Convert the path to lowercase for comparison
lowercase_directory=$(echo "$current_directory" | tr '[:upper:]' '[:lower:]')

# Check if the current directory is "html" or "Html"
if [[ "$lowercase_directory" == *"html"* ]]; then
    # Ask the user for the folder name
    read -p "Enter the folder name: " folder_name

    # Create the folder with the given name
    mkdir "$folder_name"

    # Move into the created folder
    cd "$folder_name"

    # Create the index.html file
    echo "<html>
    <head>
        <link rel='stylesheet' type='text/css' href='style.css'>
    </head>
    <body>
        <h1>My index.html file</h1>
    </body>
    </html>" > index.html

    # Create the style.css file
    echo "/* CSS Styles */" > style.css

    # Display a confirmation message
    echo "Folder '$folder_name' created successfully."
    echo "Files 'index.html' and 'style.css' have been created inside."

    xdg-open .
    open $current_directory/$folder_name/index.html
else
   cd $current_directory 
   # Ask the user for the folder name
    read -p "Enter the folder name: " folder_name

    # Create the folder with the given name
    mkdir "$folder_name"

    # Move into the created folder
    cd "$folder_name"

    # Create a file
    touch $folder_name

    echo "Folder '$folder_name' and file '$folder_name' created successfully."
    xdg-open .

    eval $code_choice
fi
