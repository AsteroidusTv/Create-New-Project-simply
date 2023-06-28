# Variables 
config_file="../data/new_config.conf"
directory_path=$(grep "directory_path" "$config_file" | cut -d'=' -f2 | tr -d ' ' | tr -d '"')
file_name=$(grep "file" "$config_file" | cut -d'=' -f2 | tr -d ' ' | tr -d '"')

cd "$directory_path/$file_name"


# Ask the user for the folder name
read -p "Enter the project name: " folder_name

# Create the folder with cargo     
cargo new $folder_name
cd $folder_name

# Initialize git
git init

cargo build