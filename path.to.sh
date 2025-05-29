#!/usr/bin/env sh
#
# This shell script will:
#
# - remove all symlinks in the base directory point to files that do not exist
# - create new symlinks to files that match the search pattern
#
# Usage of this script:
#
#   ./path.to.sh models /mnt/drive1/models /mnt/drive2/models "*.gguf"
#   ./path.to.sh llama-server /mnt/drive1/servers "llama-server-*"
#

# Check minimum arguments
if [ $# -lt 3 ]; then
    echo "Error: Insufficient arguments"
    echo "Usage: $0 BASEDIR SEARCH_PATH... PATTERN"
    exit 1
fi

# Get base directory and ensure it exists
base_dir="to/$1"
shift
if [ ! -d "$base_dir" ]; then
    mkdir -p "$base_dir"
fi

# Extract pattern (last argument)
pattern=""
search_paths=""
while [ $# -gt 1 ]; do
    search_paths="$search_paths $1"
    shift
done
pattern="$1"

# Remove broken symlinks in base directory
echo "1. Removing broken symlinks in '$base_dir'"
find "$base_dir" -maxdepth 1 -type l | while IFS= read -r link; do
    if [ ! -e "$link" ]; then
        echo "  - removing: $link"
        rm -- "$link"
    fi
done

# Create new symlinks for found files
echo "2. Searching for files matching pattern: $pattern"
for path in $search_paths; do
    if [ ! -d "$path" ]; then
        echo "  - Warning: Search path '$path' is not a directory, skipping" >&2
        continue
    fi

    find "$path" -name "$pattern" 2>/dev/null -exec sh -c '
        base_dir="$1"
        shift
        for file do
            filename=$(basename -- "$file")
            target="$base_dir/$filename"

            if [ ! -e "$target" ] && [ ! -L "$target" ]; then
                echo "  - Linking: $file"
                ln -s "$file" "$target"
            fi
        done
    ' sh "$base_dir" {} +
done
