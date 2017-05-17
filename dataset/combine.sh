#!/bin/bash
parent_path=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )
cd $parent_path

for dir in *
do
    if [ -d $dir ]; then
        cd $dir
        rm -rf **/.DS_Store
        python ../../pix2pix/scripts/combine_A_and_B.py --fold_A face --fold_B edge --fold_AB face2edge
        cd ../
    fi
done


