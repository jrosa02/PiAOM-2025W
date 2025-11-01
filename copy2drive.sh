#!/bin/bash

SOURCE_DIR="."
DEST_DIR="google-drive://jan.rosa02@gmail.com/0AKjW1LPzhjQVUk9PVA/17LvhrcB04IGEm-HJugHQSHzWMRZg11d-/1eOR_jQz3qRLZP4oE15cKSzWDrIvnKTxl"

# Check if source directory exists
if [ ! -d "$SOURCE_DIR" ]; then
    echo "Error: Source directory '$SOURCE_DIR' does not exist"
    exit 1
fi

# Create destination directory if it doesn't exist
mkdir -p "$DEST_DIR"

# Use rsync to copy files with depth 1
# --include='*/' includes directories up to depth 1
# --include='*.ipynb' and --include='*.pth' include our target files
# --exclude='*' excludes everything else
# --prune-empty-dirs removes empty directories
rsync -avm \
    --include='*/' \
    --include='*.ipynb' \
    --include='*.pth' \
    --exclude='*' \
    "$SOURCE_DIR/" "$DEST_DIR/"

echo "Copy operation completed!"