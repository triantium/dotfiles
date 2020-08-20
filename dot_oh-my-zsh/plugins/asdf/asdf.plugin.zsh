# Find where ***REMOVED*** should be installed
ASDF_DIR="${ASDF_DIR:-$HOME/.***REMOVED***}"
ASDF_COMPLETIONS="$ASDF_DIR/completions"

# If not found, check for Homebrew package
if [[ ! -f "$ASDF_DIR/***REMOVED***.sh" || ! -f "$ASDF_COMPLETIONS/***REMOVED***.bash" ]] && (( $+commands[brew] )); then
   ASDF_DIR="$(brew --prefix ***REMOVED***)"
   ASDF_COMPLETIONS="$ASDF_DIR/etc/bash_completion.d"
fi

# Load command
if [[ -f "$ASDF_DIR/***REMOVED***.sh" ]]; then
    . "$ASDF_DIR/***REMOVED***.sh"

    # Load completions
    if [[ -f "$ASDF_COMPLETIONS/***REMOVED***.bash" ]]; then
        . "$ASDF_COMPLETIONS/***REMOVED***.bash"
    fi
fi
