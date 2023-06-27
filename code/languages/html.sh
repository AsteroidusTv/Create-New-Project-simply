config_file="../data/new_config.conf"
directory_path=$(grep "directory_path" "$config_file" | cut -d'=' -f2 | tr -d ' ' | tr -d '"')
cd "$directory_path"
git init

# Ask the user for the folder name
    
    read -p "Enter the folder name: " folder_name

    # Create the folder with the given name
    mkdir "$folder_name"

    # Move into the created folder
    cd "$folder_name"

    # Create the index.html file
    read -p "Do you want to include a JavaScript file? (yes [Y]/no [N]): " include_js

    if [[ "$include_js" =~ ^[Yy]$ ]]; then
        # Create the "script" folder
        mkdir "script"
        echo "Folder 'script' created."

        # Move into the "script" folder
        cd "script"

        # Create the "script.js" file
        touch "script.js"
        echo "// JavaScript code goes here" > "script.js"

        echo "File 'script.js' created inside the 'script' folder."

        cd ..
    

      echo "
      <!DOCTYPE html>
      <html lang="en">
      <head>
          <meta charset="UTF-8">
          <meta name="viewport" content="width=device-width, initial-scale=1.0">
          <link rel="stylesheet" type="text/css" href="./style/style.css">
          <script type="text/javascript" src="./script/script.js"></script>
          <script 
          <title>$folder_name</title>
      </head>
      <body>
          
      </body>
      </html>" > index.html
      mkdir style
      cd style
      # Create the style.css file
      echo "* {

      margin: 0;
      border: 0;
      padding: 0;

    }" > style.css
      cd ..

      # Display a confirmation message
      echo "Folder '$folder_name' created successfully."
      echo "Files 'index.html' and 'style.css' have been created inside."

      xdg-open .
      open $current_directory/$folder_name/index.html
  else 
    echo "
      <!DOCTYPE html>
      <html lang="en">
      <head>
          <meta charset="UTF-8">
          <meta name="viewport" content="width=device-width, initial-scale=1.0">
          <link rel="stylesheet" type="text/css" href="./style/style.css">
          <script 
          <title>$folder_name</title>
      </head>
      <body>
          
      </body>
      </html>" > index.html
      mkdir style
      cd style
      # Create the style.css file
      echo "* {

      margin: 0;
      border: 0;
      padding: 0;

    }" > style.css
      cd ..

      # Display a confirmation message
      echo "Folder '$folder_name' created successfully."
      echo "Files 'index.html' and 'style.css' have been created inside."

      open $current_directory/$folder_name/index.html
      xdg-open .
    fi