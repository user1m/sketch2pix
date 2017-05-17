#!/bin/bash

if [ "$1" != "--path" ]; then
    echo "error: --path missing" >&2;
    echo "info: --path should be name of the data folder in /dataset" >&2;
    echo "usage: ./combine.sh --path celebfaces" >&2;
    exit 1;
fi

parent_path=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )
cd $parent_path/$2

#for dir in *
#do
#    if [ -d $dir ]; then
#        cd $dir
        rm -rf **/.DS_Store
        for dir in *
        do
            if [ "$dir" != "face" ] && [ "$dir" != "edge" ] && [ "$dir" != "face2edge" ]; then
                echo "error: Please make sure your datasets contain the following folders only 'face' - collection of output images,  'edge' - collection of input images,  'face2edge' - folder where the combinations will be created. And within each of of those folders should be a  'test' and 'train' folder. For 'face2edge' the 'test' 'train' subfolders will be empty."
                exit 1;
            fi
        done

        cd face
        for dir in *
        do
            if [ -d $dir ]; then
                cd $dir
                for image in *.jpg
                do
                    magick convert +append $image ../../edge/$dir/$image ../../face2edge/$dir/$image
                done
                cd ../
            fi
        done
#        python ../../pix2pix/scripts/combine_A_and_B.py --fold_A face --fold_B edge --fold_AB face2edge
        cd ../
#    fi
#done


