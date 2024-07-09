#!/bin/bash
source_dir="/home/bhollan/code/acquire-games/"

# Use find to search for directories within the source directory
while IFS= read -r folder; do
  # Loop through each file in the folder
  for file in "$folder"/*
  do
    if [[ -f $file ]]; then
      filename=$(basename "$file")
      # Copy the file to the final folder with a name that includes the folder name
      cp "$file" "/home/bhollan/code/all_acquire_games/${folder##*/}-${filename}"
    fi
  done
done < <(find "$source_dir" -type d)

