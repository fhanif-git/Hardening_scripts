#!/bin/bash
# manage_sudoer.sh
# This script checks if a user exists, adds the user to the sudoers group if they exist,
# or creates the user, prompts for a password, and then adds them to the sudoers group.

# Function to check if a user exists
user_exists() {
  id "$1" &>/dev/null
}

# Function to add a user to the sudoers group
add_to_sudoers() {
  sudo usermod -aG wheel "$1"
  echo "User $1 has been added to the sudoers group."
}

# Function to create a new user and prompt for a password
create_user() {
  read -p "Enter the username to create: " NEW_USER
  sudo adduser "$NEW_USER"
  sudo passwd "$NEW_USER"
  add_to_sudoers "$NEW_USER"
}

# Main script logic
read -p "Enter the username: " USERNAME

if user_exists "$USERNAME"; then
  echo "User $USERNAME exists."
  add_to_sudoers "$USERNAME"
else
  echo "User $USERNAME does not exist."
  create_user "$USERNAME"
fi
