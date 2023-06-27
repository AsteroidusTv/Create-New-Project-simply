# Variables 
config_file="../data/new_config.conf"
directory_path=$(grep "directory_path" "$config_file" | cut -d'=' -f2 | tr -d ' ' | tr -d '"')
file_name=$(grep "file" "$config_file" | cut -d'=' -f2 | tr -d ' ' | tr -d '"')

cd "$directory_path/$file_name"

# Initialize git
git init

# Ask the user for the folder name
    
read -p "Enter the project name: " folder_name

# Create the folder with cargo     
mkdir $folder_name
cd $folder_name
go mod init $folder_name
mkdir src
touch src/main.go