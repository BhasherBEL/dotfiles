#!/bin/bash

if [ -z "$1" ]; then
  echo "Usage: $(basename "$0") <file_path>"
  exit 1
fi

if [ ! -f "$1" ]; then
  echo "Error: File not found or not a regular file: $1"
  exit 1
fi

dir=$(dirname "$1")
base=$(basename "$1")

public_key_file="${2:-$PWD/key}"

openssl aes-256-cbc -e -a -salt -md md5 -pbkdf2 -kfile $public_key_file -out "$dir/${base}.enc" -in "$1"

echo "$1 -> $dir/${base}.enc"
