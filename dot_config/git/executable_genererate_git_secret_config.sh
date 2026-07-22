
# dconf.ini hash: {{ include "dot_config/git/template/hooks/executable_post-commit" | sha256sum }}
# dconf.ini hash: {{ include "dot_config/git/template/hooks/executable_pre-commit" | sha256sum }}

secret_file="${HOME}/.config/git/secrets-patterns"
TEMP_FILE=$(mktemp)

echo "Generating Git Secrets File $TEMP_FILE"

echo '[secrets]' > "${TEMP_FILE}"

function generateFromPass() {
    if command -v gopass &> /dev/null; then
        # Get all gopass entries and extract potential patterns
        gopass ls --flat | while read -r entry; do
            if [ -n "$entry" ]; then
              # echo "reading $entry"
                password=$(pass "$entry" | head -n 1 | tr -d '\n' | tr -d ' ')
                # Check if password is not empty and doesn't start with -----
                if [ -n "$password" ] && [[ "$password" != -----* ]] && [[ "$password" != apiVersion* ]]; then
                    # Add a generic pattern for any entry
                    git config set --append -f "$TEMP_FILE" 'secrets.patterns' "$password"
                fi
            fi
        done
    fi

}

generateFromPass

# Move the temp file to the correct location
echo "Writing to $secret_file"
mv "$TEMP_FILE" "$secret_file"
