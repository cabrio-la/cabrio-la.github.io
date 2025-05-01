#!/bin/bash

# Create a backup directory
mkdir -p images/backup
cp images/*.jpeg images/backup/
cp images/*.jpg images/backup/

# Resize all product images to 800x800 while maintaining aspect ratio
for img in images/*.jpeg images/*.jpg; do
    if [ -f "$img" ]; then
        # Skip logo and header images
        if [[ "$img" != *"logo"* && "$img" != *"header"* ]]; then
            echo "Resizing $img..."
            magick "$img" -resize "800x800>" -background white -gravity center -extent 800x800 "$img"
        fi
    fi
done

echo "All product images have been resized to 800x800 pixels" 