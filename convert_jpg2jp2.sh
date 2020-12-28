#!/bin/bash
cd /Users/cesarkylecasil/Desktop/imagetest;
SAVEIFS=$IFS;
IFS=$(echo -en "\n\b");
for i in $(ls | egrep -i '.jpg$'); do
    j=${i}
    FNAME=$(echo "$j" | sed -e 's/\..*$//')
    convert "$i" -quality 100% "$FNAME".jp2
done;
IFS=$SAVEIFS;