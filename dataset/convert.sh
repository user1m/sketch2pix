#!/bin/bash

if [ "$1" != "--path" ]; then
    echo "error: --path missing" >&2;
    echo "info: --path should be name of the data folder in /dataset" >&2;
    echo "usage: ./convert.sh --path celebfaces --edge 2" >&2;
    exit 1;
elif [ "$3" != "--edge" ]; then
    echo "error: --edge missing" >&2;
    echo "usage: ./convert.sh --edge 2" >&2;
    exit 1;
fi

re='^[0-9]+$'
if ! [[ $4 =~ $re ]] ; then
    echo "error: --edge value is Not a number" >&2;
    exit 1;
fi

#system=$(uname -s)

parent_path=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )
cd $parent_path/$2/face
##cd $2
#echo $(pwd -P)

#for dir in *
#do
#    if [ -d $dir ] && [ $dir != "CUHKfaces" ]; then
#        cd $dir/face
#
        for dir in *
        do
            if [ -d $dir ]; then
                cd $dir
                for image_file in *.jpg
                do
#                    if  [ "$system" != "Darwin" ] || [ "$system" != "Linux" ]; then
                    magick convert $image_file  -colorspace Gray  -edge $4 -negate ../../edge/$dir/$image_file
#                    else
#                        convert $image_file  -colorspace Gray  -edge $4 -negate ../../edge/$dir/$image_file
#                    fi
                done
                cd ../
            fi
        done
#        cd ../../
#    fi
#done

