#!/bin/bash

if [ "$1" != "--edge" ]; then
    echo "error: --edge missing"
    echo "usage: ./convert.sh --edge 2"
    exit 1;
fi

re='^[0-9]+$'
if ! [[ $2 =~ $re ]] ; then
    echo "error: Not a number" >&2;
    exit 1;
fi

parent_path=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )
cd $parent_path

for dir in *
do
    if [ -d $dir ] && [ $dir != "CUHKfaces" ]; then
        cd $dir/face

        for dir in *
        do
            if [ -d $dir ]; then
                cd $dir
                for image_file in *.jpg
                do
                    convert $image_file  -colorspace Gray  -edge $2 -negate ../../edge/$dir/$image_file
                done
                cd ../
            fi
        done
        cd ../../
    fi
done

