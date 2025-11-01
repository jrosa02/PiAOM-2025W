#!/bin/bash

SOURCE="."
DEST="/run/user/1000/gvfs/google-drive:host=gmail.com,user=jan.rosa02/0AKjW1LPzhjQVUk9PVA/17LvhrcB04IGEm-HJugHQSHzWMRZg11d-/1eOR_jQz3qRLZP4oE15cKSzWDrIvnKTxl"

echo "Copying files with directory structure..."

# Copy files and preserve directory structure up to depth 1
find "$SOURCE" -maxdepth 2 -type f \( -name "*.ipynb" -o -name "*.pth" \) -print0 | while IFS= read -r -d '' file; do
    rel_path="${file#./}"
    dest_path="$DEST/$rel_path"
    mkdir -p "$(dirname "$dest_path")"
    cp "$file" "$dest_path"
    echo "Copied: $rel_path"
done

echo "Copy completed!"