#!/bin/bash
cd /var/www/Products;
SAVEIFS=$IFS;
IFS=$(echo -en "\n\b");
for i in $(ls | egrep -i '^1600\-(.*)+\_[0-9][0-9]\.png$'); do
    j=${i:5}
    FNAME=$(echo "$j" | sed -e 's/\..*$//')
    INAME=${FNAME:0:${#FNAME}-3}
    convert "$i" -resize 1024 base-"$j"
    convert base-"$j" -trim +repage 1024-"$j"
    convert "$i" -define filter:blur=0.4 -filter Gaussian -resize 800 -flatten -quality 90% 800-"$FNAME".jpg
    # convert "$i" -define filter:blur=0.4 -filter Gaussian -resize 640 -flatten -quality 90% 640-"$FNAME".jpg
    convert "$i" -define filter:blur=0.4 -filter Gaussian -resize 480 -flatten -quality 90% 480-"$FNAME".jpg
    # convert "$i" -define filter:blur=0.4 -filter Gaussian -resize 320 -flatten -quality 90% 320-"$FNAME".jpg
    # convert "$i" -define filter:blur=0.4 -filter Gaussian -resize 200 -flatten -quality 90% 200-"$FNAME".jpg
    convert "$i" -resize 180 180-"$j"
    convert 180-"$j" -gravity center +repage -extent 200x200 +repage -flatten -quality 90% "$FNAME".jpg
    mv "$i" /mnt/backup/product_img_1600/;
    rm -f  base-"$j";
    rm -f 180-"$j";
    if [ -f "$INAME"_01.jpg ]
    then
        /bin/cp "$INAME"_01.jpg "$INAME"_00.jpg;
    fi
    pngquant 1024-"$j" --ext .png --force;
done;
IFS=$SAVEIFS;

