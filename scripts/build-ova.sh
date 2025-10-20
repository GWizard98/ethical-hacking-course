#!/usr/bin/env bash
set -euo pipefail
# Build an OVA from the Vagrant VM using VirtualBox.
# Requirements: Vagrant, VirtualBox, sha256sum (or shasum), optionally gpg.

VM_NAME=${VM_NAME:-"ehc-lab_default_$(id -u)"}
OUT_DIR=${OUT_DIR:-dist}
DATE=$(date +%Y%m%d)
OUT_BASE="ehc-lab-${DATE}"
mkdir -p "$OUT_DIR"

# Ensure VM exists
vagrant up

# Determine actual VM name if default guess fails
if ! VBoxManage showvminfo "$VM_NAME" >/dev/null 2>&1; then
  # pick the most recent VM containing 'ehc-lab'
  VM_NAME=$(VBoxManage list vms | grep -i ehc-lab | tail -n1 | awk -F '"' '{print $2}')
fi

# Export OVA
OVA_PATH="$OUT_DIR/${OUT_BASE}.ova"
VBoxManage export "$VM_NAME" --output "$OVA_PATH"

# Checksums
if command -v sha256sum >/dev/null 2>&1; then
  sha256sum "$OVA_PATH" > "$OVA_PATH.sha256"
else
  shasum -a 256 "$OVA_PATH" > "$OVA_PATH.sha256"
fi

# Optional GPG sign (detached)
if command -v gpg >/dev/null 2>&1 && [[ -n "${GPG_KEY_ID:-}" ]]; then
  gpg --batch --yes --local-user "$GPG_KEY_ID" --output "$OVA_PATH.sig" --detach-sign "$OVA_PATH"
fi

echo "Built: $OVA_PATH"
echo "Checksum: $OVA_PATH.sha256"
