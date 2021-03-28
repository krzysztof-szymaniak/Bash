#!/bin/bash

for file in $(find "$1" -type f)
do
    cat "$file" >> /tmp/temp
done
printf "%5s %5s\n" "#occur" "word"
cat /tmp/temp | tr '[[:space:]]' "\n" | grep -v "^[[:space:]]*$" | sort | uniq -c | sort -nr

rm /tmp/temp
