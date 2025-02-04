#!/bin/bash

# Set the source and destination directories
source_dir="/Users/cesarkylecasil/Desktop/pngcompressnresize/"
destination_dir="/Users/cesarkylecasil/Desktop/pngcompressnresize/webp"

# Create the destination directory if it doesn't exist (good practice)
mkdir -p "$destination_dir"

# Use find for more efficient file processing and globbing
find "$source_dir" -maxdepth 1 -type f \( -name "*.png" -o -name "*.jpg" -o -name "*.jpeg" -o -name "*.PNG" -o -name "*.JPG" \) -print0 | while IFS= read -r -d $'\0' file; do
  filename=$(basename "$file")
  base="${filename%.*}"

  # Use a case statement for cleaner prefix checking
  case "$base" in
    1600-*)
      echo "Skipping $filename"
      continue # Skip to the next file
      ;;
    *)
      output_file="$destination_dir/$base.webp"
      echo "Converting $filename to $output_file"

      #  Check if the output file already exists.  Avoids unnecessary processing.
      if [[ ! -f "$output_file" ]]; then
        magick "$file" "$output_file"
      else
        echo "$output_file already exists. Skipping."
      fi
      ;;
  esac
done