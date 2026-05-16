#!/usr/bin/env bash
set -euo pipefail

OWNER="${OWNER:-Hermess}"
REPO="${REPO:-picturebook-maker}"
REF="${REF:-main}"
SKILL_NAME="${SKILL_NAME:-picturebook-maker}"
CODEX_SKILLS_DIR="${CODEX_SKILLS_DIR:-$HOME/.codex/skills}"
DEST="$CODEX_SKILLS_DIR/$SKILL_NAME"

need_cmd() {
  if ! command -v "$1" >/dev/null 2>&1; then
    echo "Missing required command: $1" >&2
    exit 1
  fi
}

need_cmd curl
need_cmd unzip

TMP_DIR="$(mktemp -d)"
cleanup() {
  rm -rf "$TMP_DIR"
}
trap cleanup EXIT

ZIP_PATH="$TMP_DIR/$REPO.zip"
DOWNLOAD_URL="https://codeload.github.com/$OWNER/$REPO/zip/refs/heads/$REF"

echo "Downloading $OWNER/$REPO@$REF..."
curl -fsSL "$DOWNLOAD_URL" -o "$ZIP_PATH"
unzip -q "$ZIP_PATH" -d "$TMP_DIR"

SRC="$TMP_DIR/$REPO-$REF/$SKILL_NAME"
if [[ ! -d "$SRC" ]]; then
  SRC="$(find "$TMP_DIR" -type d -path "*/$SKILL_NAME" | head -n 1 || true)"
fi

if [[ -z "${SRC:-}" || ! -d "$SRC" ]]; then
  echo "Could not find skill folder: $SKILL_NAME" >&2
  exit 1
fi

mkdir -p "$CODEX_SKILLS_DIR"
rm -rf "$DEST.tmp"
cp -R "$SRC" "$DEST.tmp"
rm -rf "$DEST"
mv "$DEST.tmp" "$DEST"

echo "Installed $SKILL_NAME to $DEST"
echo "Try: 使用 picturebook-maker 技能，帮我做一个儿童绘本……"
