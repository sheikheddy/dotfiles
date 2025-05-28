#!/bin/bash

# Input arguments
email=${1:-"sheikheddy@gmail.com"}
name=${2:-"Sheikh Abdur Raheem Ali"}
github_url=${3:-"https://github.com/sheikheddy"}

# Setup git
git config --global user.email "$email"
git config --global user.name "$name"

# Optional: Store credentials
git config --global credential.helper store