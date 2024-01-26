#!/bin/bash

src_dir="../root"
dst_dir="/"

if [ "$EUID" -ne 0 ]; then
	echo "Please run as root"
	exit
fi

amount=0

function create_hard_links() {
	local src_path="$1"
	local dst_path="$2"
	
	for item in "$src_path"/* "$src_path"/.[^.]*; do
		if [ -d "$item" ]; then
			mkdir -p "${dst_path}${item#$src_path}/"
			create_hard_links "$item" "${dst_path}${item#$src_path}/"
		elif [ -f "$item" ] && [[ ! "$item" =~ \.enc$ ]]; then
			ln -f "$item" "${dst_path}${item#$src_path}"
			amount=$((amount+1))
		fi
	done
}

create_hard_links "$src_dir" "$dst_dir"

echo "Hard links created: $amount"