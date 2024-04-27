# Get the absolute path of the executing script
SCRIPT_PATH=$(readlink -f "$0")

# Define the alias name and command
ALIAS_NAME="myscript"
ALIAS_COMMAND="alias $ALIAS_NAME='$SCRIPT_PATH'"

# Check if the alias already exists in ~/.bashrc
if grep -Fxq "$ALIAS_COMMAND" ~/.bashrc; then
    echo "The alias '$ALIAS_NAME' already exists in ~/.bashrc."
else
    # Append the alias command to ~/.bashrc
    echo "$ALIAS_COMMAND" >> ~/.bashrc

    # Provide feedback
    echo "Alias added to ~/.bashrc: $ALIAS_COMMAND"
fi
