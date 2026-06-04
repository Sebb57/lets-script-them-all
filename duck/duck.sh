#!/bin/bash

for i in {1..100}; do
  url=$(curl -s https://random-d.uk/api/v2/random | jq -r '.url')
  file=$(mktemp --suffix=.jpg)
  curl -L "$url" -o "$file"
  xdg-open "$file"
done
