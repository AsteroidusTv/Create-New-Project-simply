#!/bin/bash

echo -n "Name for project: "
read name

# Move to the parent directory of where the script is executed
cd ..

# Create the directory for the project in the Html directory
mkdir -p Html/"$name"

# Move to the project directory
cd Html/"$name"

# Create the index.html and style.css files
touch index.html style.css

# Write the content of index.html
echo "<!DOCTYPE html>
<html>
<head>
    <meta charset=\"utf-8\">
    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">
    <link rel=\"stylesheet\" type=\"text/css\" href=\"style.css\">
    <title>$name</title>
</head>
<body>

</body>
</html>" > index.html

# Open Sublime Text with index.html and style.css files
subl index.html style.css

# Open file explorer
xdg-open .
y
