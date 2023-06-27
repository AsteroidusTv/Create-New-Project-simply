config_file="../data/new_config.conf"
directory_path=$(grep "directory_path" "$config_file" | cut -d'=' -f2 | tr -d ' ' | tr -d '"')
cd "$directory_path"
git init

# Ask the user for the folder name
    
read -p "Enter the folder name: " folder_name

# Create the folder with cargo     
cargo new $folder_name
cd $folder_name
cargo build