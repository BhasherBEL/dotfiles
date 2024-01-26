#!/bin/bash


public_key_file="${1:-key}"

find "../root" -type f -name "*.enc" | while read -r file; do
	dir=$(dirname "$file")
	base=$(basename "$file" .enc)

	openssl aes-256-cbc -d -a -md md5 -pbkdf2 -kfile $public_key_file -out "$dir/$base" -in "$file"

	echo "$file -> $dir/$base"
done

amount=$(find "../root" -type f -name "*.enc" | wc -l)

echo ""
echo "$amount files decrypted."