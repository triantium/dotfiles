#!/usr/bin/env bash

shopt -s nullglob globstar
prefix=${PASSWORD_STORE_DIR:-$HOME/.password-store}

target_file="passwords_from_pass.md"
echo "Exporting passwords to $target_file"

current_dir=""

echo "# Passworter generiert am $(date)" > $target_file

current_top_folder=""

for file in "$prefix"/**/*.gpg; do
    # echo "${file}"
    file="${file/$prefix\//}"
    
    # Remove leading slash to get relative path (e.g., "Work/Email.gpg")
    rel_path="${file#/}"
    
    # Extract everything before the first slash
    top_folder="${rel_path%%/*}"

    # Print header only if we are inside a folder (path contains slash) and the top folder changed
    if [[ "$rel_path" == *"/"* ]] && [[ "$top_folder" != "$current_top_folder" ]]; then
        current_top_folder="$top_folder"
        echo "## Folder: $current_top_folder" >> "$target_file"
        echo "" >> "$target_file"
    fi

    #echo "${file}"
    printf "### %s\n\n" "${file%.*}" >> "$target_file"
    # Capture the content
    content=$(pass "${file%.*}")

    # Extract first line (Password)
    pass_line=$(echo "$content" | head -n 1)

    # Extract remaining lines (Metadata)
    meta_lines=$(echo "$content" | tail -n +2)

    # Print Password nicely
    # If password contains a backtick, wrap it in double backticks with spaces
    if [[ "$pass_line" == *'`'* ]]; then
        printf "**Password:** \`\` %s \`\`\n" "$pass_line" >> "$target_file"
    else
        printf "**Password:** \`%s\`\n" "$pass_line" >> "$target_file"
    fi

    # If there is metadata, escape special chars then format "key: value"
    if [ -n "$meta_lines" ]; then
        echo "" >> "$target_file"
        echo "$meta_lines" | \
        sed 's/\\/\\\\/g; s/_/\\_/g; s/\*/\\*/g; s/</\\</g; s/\[/\\[/g' | \
        sed 's/^\([^:]*\):/- **\1:**/' >> "$target_file"
    fi

    printf "\n\n" >> "$target_file"
done

pandoc "${target_file}" -o passwoerter.pdf
# remarkable looks better
