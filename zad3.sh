#!/bin/bash

for file in $(find "$1" -type f)
do
    cat "$file" >> /tmp/temp
done

printf "%-5s \t%-5s\n" "#files" "word"
for word in $(cat /tmp/temp | tr '[[:space:]]' "\n" | grep -v "^[[:space:]]*$" | sort | uniq)
do
    printf "%5s \t%5s\n" $(grep -wlr "$word" "$1" | wc -l) "$word"
done
rm /tmp/temp
