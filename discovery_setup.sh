#! /usr/bin/bash

# Get the directory of this script
FILE_NAME="tb4-discovery.bash"
TARGET_DIR="/etc/turtlebot4_user"

echo "#!/bin/bash" > "$FILE_NAME"
echo "echo 'Fetching turtlebot 4 discovery server config file'" >> "$FILE_NAME"
echo "sudo wget -qO - https://raw.githubusercontent.com/turtlebot/turtlebot4_setup/humble/turtlebot4_discovery/configure_discovery.sh | bash <(cat) </dev/tty" >> "$FILE_NAME"

if [ ! -d "$TARGET_DIR" ]; then
   echo "Directory $TARGET_DIR does not exits. Creating $TARGET_DIR."
   echo mkdir -p "$TARGET_DIR"
   mkdir -p "$TARGET_DIR"
fi

echo "Moving $FILE_NAME to $TARGET_DIR"
sudo mv "$FILE_NAME" "$TARGET_DIR"

ALIAS_NAME="tb4-discovery"
ALIAS_FILE="$HOME/.bash_aliases"
ALIAS_COMMAND="alias $ALIAS_NAME='bash $TARGET_DIR/$FILE_NAME'"

sudo chmod +x "$TARGET_DIR/$FILE_NAME"

if grep -q "^alias $ALIAS_NAME=" "$ALIAS_FILE"; then
  echo "Alias '$ALIAS_NAME' already exists in $ALIAS_FILE"
else
  echo "Adding alias to $ALIAS_FILE"
  echo "$ALIAS_COMMAND"  >> "$ALIAS_FILE"
  echo "Alias added. You can now use '$ALIAS_NAME' to run your script."
fi


