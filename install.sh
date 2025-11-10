#!/usr/bin/env bash
set -euo pipefail

# Source repo (where files actually live)
SRC_OWNER="Sarthakzzzzz"
SRC_REPO="exams"
SRC_BRANCH="main"
SRC_SUBDIR="sql"
TARBALL_URL="https://codeload.github.com/${SRC_OWNER}/${SRC_REPO}/tar.gz/refs/heads/${SRC_BRANCH}"

# Destination (where to place files locally)
PREFIX="${HOME}/Documents/ubuntu"
QUIET=0
FORCE=0

usage() {
  cat <<EOF
Usage: install.sh [--prefix DIR] [--force] [--quiet] [-h|--help]

Downloads ${SRC_OWNER}/${SRC_REPO}/${SRC_SUBDIR} and copies files into DIR.
Defaults: DIR=\$HOME/Downloads/sql_practicals

Options:
  --prefix DIR  Install destination directory
  --force       Overwrite existing files
  --quiet       Suppress logs
  -h, --help    Show this help
EOF
}

log() { [ "$QUIET" -eq 1 ] || echo "$@"; }
need() { command -v "$1" >/dev/null 2>&1 || { echo "Missing dependency: $1" >&2; exit 1; }; }

# Parse args
while [ $# -gt 0 ]; do
  case "$1" in
    --prefix) PREFIX="$2"; shift 2 ;;
    --force)  FORCE=1; shift ;;
    --quiet)  QUIET=1; shift ;;
    -h|--help) usage; exit 0 ;;
    *) echo "Unknown option: $1" >&2; usage; exit 1 ;;
  esac
done

need curl
need tar
mkdir -p "$PREFIX"

# Workspace
TMPDIR="$(mktemp -d)"
trap 'rm -rf "$TMPDIR"' EXIT

ARCHIVE="$TMPDIR/src.tar.gz"
EXTRACT_DIR="$TMPDIR/extract"

log "⬇️  Downloading source tarball..."
curl -sSL "$TARBALL_URL" -o "$ARCHIVE"

log "📦 Extracting only ${SRC_SUBDIR}..."
mkdir -p "$EXTRACT_DIR"
tar -xzf "$ARCHIVE" -C "$EXTRACT_DIR" --strip-components=2 "${SRC_REPO}-${SRC_BRANCH}/${SRC_SUBDIR}"

log "📁 Installing into: $PREFIX"
if [ "$FORCE" -eq 1 ]; then
  cp -Rf "$EXTRACT_DIR"/. "$PREFIX"/
else
  cp -Rn "$EXTRACT_DIR"/. "$PREFIX"/
fi

log "✅ Done."
log "Files are in: $PREFIX"

