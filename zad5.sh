#!/bin/bash
for file in $(find "$1" -type f)
do
    sed -i 's/a/A/g' "$file"
done

    
