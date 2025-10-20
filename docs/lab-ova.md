# Prebuilt Lab OVA (Build, Sign, and Release)

This page describes how to build, verify, and publish a signed OVA of the lab VM.

## Build OVA (local)
- Requirements: Vagrant + VirtualBox
```sh path=null start=null
chmod +x scripts/build-ova.sh
scripts/build-ova.sh
```
Outputs under `dist/`:
- `ehc-lab-YYYYMMDD.ova`
- `ehc-lab-YYYYMMDD.ova.sha256`
- `ehc-lab-YYYYMMDD.ova.sig` (if `GPG_KEY_ID` is set and gpg installed)

## Verify
```sh path=null start=null
cd dist
sha256sum -c *.sha256  # or: shasum -a 256 -c *.sha256
```

## Publish (GitHub Release)
```sh path=null start=null
TAG=v1.0.1
gh release create "$TAG" --title "$TAG" --notes "Lab OVA release"
ASSETS=(dist/ehc-lab-*.ova dist/ehc-lab-*.sha256 dist/ehc-lab-*.sig)
for f in ${ASSETS[@]}; do gh release upload "$TAG" "$f"; done
```

## Download and Import
1) Download OVA and .sha256; verify checksum
2) Import OVA into VirtualBox; use NAT networking; snapshot before use
