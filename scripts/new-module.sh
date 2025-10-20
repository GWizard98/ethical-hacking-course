#!/usr/bin/env bash
set -euo pipefail

if [[ ${1:-} == "" ]]; then
  echo "Usage: $0 <slug> [Title words...]" >&2
  exit 1
fi

slug="$1"; shift || true
# Title: if provided, use it; else derive from slug
if [[ $# -gt 0 ]]; then
  title="$*"
else
  # Convert slug to Title Case
  title=$(echo "$slug" | tr '-' ' ' | awk '{for(i=1;i<=NF;i++){ $i=toupper(substr($i,1,1)) substr($i,2) }}1')
fi

mkdir -p modules
# Find next index
next_idx="00"
if compgen -G "modules/[0-9][0-9]-*" > /dev/null; then
  max=$(ls -1 modules | sed -E 's/^([0-9]{2}).*/\1/' | sort -n | tail -1)
  next=$(printf "%02d" $((10#$max + 1)))
  next_idx="$next"
fi

mod_dir="modules/${next_idx}-${slug}"
mkdir -p "$mod_dir"

cat > "$mod_dir/README.md" <<EOF
# ${next_idx} — ${title}

Objectives
- ...

Exercises
- ...

Deliverables
- ...

---
Navigation: [Course README](../../README.md) • [Outline](../../docs/outline.md)
EOF

echo "Created: $mod_dir/README.md"