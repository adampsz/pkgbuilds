#!/usr/bin/env bash
cd "$(dirname "$0")" || exit 1

fail() { >&2 echo "$@"; exit 1; }


clean() {
    git clean -ffdX
}


check() {
    [ $# -gt 0 ] && pkgs=("$@") || pkgs=(*)
    for pkg in "${pkgs[@]}"; do
        [ -f "$pkg/PKGBUILD" ] && namcap "$pkg/PKGBUILD"
        [ -f "$pkg/*.pkg.tar.zst" ] && namcap "$pkg/*.pkg.tar.zst"
    done
}


update() {
    urlwatch --urls urlwatch.yml --cache urlwatch.db
}


main() {
    [ $# -eq 0 ] && fail "Usage: help.sh [clean|update|check]"

    cmd="$1"; shift

    case "$cmd" in
        clean) clean;;
        update) update;;
        check) check "$@";;
        *) fail "Unknown command \`${cmd}\`";;
    esac
}

main "$@"
