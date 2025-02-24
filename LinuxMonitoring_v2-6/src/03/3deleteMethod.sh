#!/bin/bash

echo -e "script is running"


v=0

for url in $(find / -type d -regex ".*/[^/]*_[0-9]{6}" -exec rm -rf {} + 2>/dev/null)
	do
		((v++))
		echo "$url" >> 03.log
		rm -rf "$url";
	done