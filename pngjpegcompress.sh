#!/bin/bash

# Set the source and destination directories
source_dir="/Users/cesarkylecasil/Desktop/pngcompressnresize/"
destination_dir="/Users/cesarkylecasil/Desktop/pngcompressnresize/webp"

# Convert PNG and JPG files to WebP
for file in "$source_dir"/*.{png,jpg,jpeg}; do
    if [[ -f "$file" ]]; then
        filename=$(basename "$file")
        base="${filename%.*}"

        # Check if the filename starts with "1600-" or "1024-"
        if [[ "$base" == "1600-"* || "$base" == "1024-"* ]]; then
            echo "Skipping $filename"
        else
            output_file="$destination_dir/$base.jpg"
            echo "Converting $filename to $output_file"
            magick convert "$file" -background white -alpha remove -alpha off -quality 80 "$output_file"
        fi
    fi
done