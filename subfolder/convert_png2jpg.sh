#!/bin/bash
cd /Users/cesarkylecasil/Desktop/imagetest;
SAVEIFS=$IFS;
IFS=$(echo -en "\n\b");
for i in $(ls | egrep -i '.png$'); do
    j=${i}
    FNAME=$(echo "$j" | sed -e 's/\..*$//')
    convert "$i" -quality 100% "$FNAME".jpg
done;
IFS=$SAVEIFS;