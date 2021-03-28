#!/bin/bash

for file in $(find "$1" -type f)
do
    cat "$file" >> /tmp/temp
done

echo -e "word\tfile\tline\n"
for word in $(cat /tmp/temp | tr '[[:space:]]' "\n" | grep -v "^[[:space:]]*$" | sort | uniq -c | grep -vw "^[[:space:]]*1" | sed "s/^[[:space:]]*//" | cut -d " " -f 2)
do
    x=$(grep -rw $word "$1")
    echo "$word:${x##*/}" | tr ':' '\t'    
done

rm /tmp/temp
