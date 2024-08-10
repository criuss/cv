#!/bin/bash

inotifywait . -mr -e close_write --format '%w%f' |
while read -r closed_file; do
  if [[ "${closed_file}" =~ template.tex$ || "${closed_file}" =~ example.md$ ]]; then
    make
  fi
done
