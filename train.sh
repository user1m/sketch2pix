#! /bin/bash
if [ "$1" != "--data-root" ]; then
    echo "error: --data-root needed"
    echo "if --data-root is a relative path then should be relative as if starting from the pix2pix folder"
    echo "usage: ./train.sh --data-root ../dataset/celebfaces/face2edge --name edge2face_generation --direction BtoA"
    exit 1;
elif [ "$3" != "--name" ]; then
    echo "error: --name needed"
    echo "usage: ./train.sh --data-root ../dataset/celebfaces/face2edge --name edge2face_generation --direction BtoA"
    exit 1;
 elif [ "$5" != "--direction" ] ; then
    echo "error: --direction needed"
    echo "usage: ./train.sh --data-root ../dataset/celebfaces/face2edge --name edge2face_generation --direction BtoA"
    exit 1;
fi

parent_path=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )
cd $parent_path/pix2pix

time (DATA_ROOT=$2 name=$4 which_direction=$6 th train.lua)
#DATA_ROOT=../dataset/celebfaces/face2edge name=edge2face_generation which_direction=BtoA checkpoint_dir=checkpoints th train.lua

