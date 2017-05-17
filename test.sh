#!/bin/bash
if [ "$1" != "--data-root" ]; then
    echo "error: --data-root missing"
    echo "if --data-root is a relative path then should be relative as if starting from the pix2pix folder"
    echo "usage: ./test.sh --data-root ../dataset/celebfaces/face2edge --phase test --name edge2face_generation --direction BtoA"
    exit 1;
elif [ "$3" != "--phase" ]; then
    echo "error: --phase missing"
    echo "usage: ./test.sh --data-root ../dataset/celebfaces/face2edge --phase test --name edge2face_generation --direction BtoA"
    exit 1;
elif [ "$5" != "--name" ]; then
    echo "error: --name missing"
    echo "usage: ./test.sh --data-root ../dataset/celebfaces/face2edge --phase test --name edge2face_generation --direction BtoA"
    exit 1;
elif [ "$7" != "--direction" ] ; then
    echo "error: --direction missing"
    echo "usage: ./test.sh --data-root ../dataset/celebfaces/face2edge --phase test --name edge2face_generation --direction BtoA"
    exit 1;
fi
        
parent_path=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )
cd $parent_path/pix2pix

time
env DATA_ROOT=$2 phase=$4 name=$6 which_direction=$8 th test.lua
#env DATA_ROOT=../dataset/celebfaces/face2edge phase=test name=edge2face_generation which_direction=BtoA results_dir=results th test.lua
