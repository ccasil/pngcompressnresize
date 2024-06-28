#!/bin/bash

# Set the source and destination directories
source_dir="/Users/cesarkylecasil/Desktop/pngcompressnresize/"
destination_dir="/Users/cesarkylecasil/Desktop/pngcompressnresize/webp"

# Convert PNG and JPG files to WebP
for file in "$source_dir"/*.{png,jpg,jpeg,PNG,JPG}; do
    if [[ -f "$file" ]]; then
        filename=$(basename "$file")
        base="${filename%.*}"

        # Check if the filename starts with "1600-" or "1024-"
        if [ "$base" == "1600-"*]; then
            echo "Skipping $filename"
        else
            output_file="$destination_dir/$base.webp"
            echo "Converting $filename to $output_file"
            magick convert "$file" "$output_file"
        fi
    fi
done


# Convert PNG files to WebP
# for file in "$source_dir"/*.png; do
#     filename=$(basename "$file")
#     base="${filename%.*}"
    
#     # Check if the filename starts with "1600-" or "1024-"
#     if [[ "$base" == "1600-"* || "$base" == "1024-"* ]]; then
#         echo "Skipping $filename"
#     else
#         output_file="$destination_dir/$base.webp"
#         echo "Converting $filename to $output_file"
#         magick convert "$file" "$output_file"
#     fi
# done

# # Convert JPG files to WebP
# for file in "$source_dir"/*.jpg; do
#     filename=$(basename "$file")
#     base="${filename%.*}"
    
#     # Check if the filename starts with "1600-" or "1024-"
#     if [[ "$base" == "1600-"* || "$base" == "1024-"* ]]; then
#         echo "Skipping $filename"
#     else
#         output_file="$destination_dir/$base.webp"
#         echo "Converting $filename to $output_file"
#         magick convert "$file" "$output_file"
#     fi
# done
