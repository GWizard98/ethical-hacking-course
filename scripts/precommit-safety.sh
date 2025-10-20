#!/usr/bin/env bash
set -euo pipefail

# Scan staged Markdown files for external URLs not in allowlist.
ROOT_DIR=$(git rev-parse --show-toplevel)
ALLOWS=$(jq -r '.allow[0]' "$ROOT_DIR/.safety-urls.json")

files=$(git diff --cached --name-only --diff-filter=ACM | grep -E '\.md$' || true)

fail=0
if [[ -n "$files" ]]; then
  while IFS= read -r f; do
    # Extract URLs
    if grep -Eo 'https?://[^ )">]+' "$f" | grep -Ev "$ALLOWS" >/dev/null; then
      echo "Unsafe URL(s) detected in $f. Only use authorized targets or approved resources." >&2
      grep -nEo 'https?://[^ )">]+' "$f" | grep -Ev "$ALLOWS" || true
      fail=1
    fi
  done <<< "$files"
fi

exit $fail
