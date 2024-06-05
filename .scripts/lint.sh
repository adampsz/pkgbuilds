#!/bin/bash
cd "$(dirname "$0")/.." || exit 1
[ $# -gt 0 ] && pkgs=("$@") || pkgs=(*)

for pkg in "${pkgs[@]}"; do
    [ -f "$pkg/PKGBUILD" ] && namcap "$pkg/PKGBUILD"
    [ -f "$pkg/*.pkg.tar.zst" ] && namcap "$pkg/*.pkg.tar.zst"
done
