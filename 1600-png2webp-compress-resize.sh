#!/bin/bash
# cd /var/www/Products;
SAVEIFS=$IFS;
IFS=$(echo -en "\n\b");
for i in $(ls | egrep -i '^1600\-(.*)+\_[0-9][0-9]\.png$'); do
    j=${i:5}
    FNAME=$(echo "$j" | sed -e 's/\..*$//')
    INAME=${FNAME:0:${#FNAME}-3}
    convert "$i" -resize 1024 base-"$j"
    convert base-"$j" -trim +repage 1024-"$j"
    convert "$i" -define filter:blur=0.4 -filter Gaussian -resize 800 -flatten -quality 90% 800-"$FNAME".webp
    convert "$i" -define filter:blur=0.4 -filter Gaussian -resize 480 -flatten -quality 90% 480-"$FNAME".webp
    convert "$i" -resize 180 180-"$j"
    convert 180-"$j" -gravity center +repage -extent 200x200 +repage -flatten -quality 90% "$FNAME".webp
    # mv "$i" /mnt/backup/product_img_1600/;
    rm -f  base-"$j";
    rm -f 180-"$j";
    if [ -f "$INAME"_01.webp ]
    then
        /bin/cp "$INAME"_01.webp "$INAME"_00.webp;
    fi
    pngquant 1024-"$j" --ext .webp --force;
done;
IFS=$SAVEIFS;

