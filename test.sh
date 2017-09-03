#!/bin/bash
if [ "$1" != "--data-root" ]; then
    echo "error: --data-root missing"
    echo "if --data-root is a relative path then should be relative as if starting from the pix2pix folder"
    echo "usage: ./test.sh --data-root ../dataset/celebfaces/face2edge --name edge2face_generation --direction BtoA --torch /root/torch/install/bin/th [--custom_image_dir my_named_gen]"
    exit 1;
#elif [ "$3" != "--phase" ]; then
#    echo "error: --phase missing"
#    echo "usage: ./test.sh --data-root ../dataset/celebfaces/face2edge --name edge2face_generation --direction BtoA --torch /root/torch/install/bin/th [--custom_image_dir my_named_gen]"
#    exit 1;
elif [ "$3" != "--name" ]; then
    echo "error: --name missing"
    echo "usage: ./test.sh --data-root ../dataset/celebfaces/face2edge --name edge2face_generation --direction BtoA --torch /root/torch/install/bin/th [--custom_image_dir my_named_gen]"
    exit 1;
elif [ "$5" != "--direction" ] ; then
    echo "error: --direction missing"
    echo "usage: ./test.sh --data-root ../dataset/celebfaces/face2edge --name edge2face_generation --direction BtoA --torch /root/torch/install/bin/th [--custom_image_dir my_named_gen]"
    exit 1;
elif [ "$7" != "--torch" ] ; then
    echo "error: --torch missing"
    echo "usage: ./test.sh --data-root ../dataset/celebfaces/face2edge --name edge2face_generation --direction BtoA --torch /root/torch/install/bin/th [--custom_image_dir my_named_gen]"
    exit 1;
elif [ "$9" != "--custom_image_dir" ] ; then
    echo "error: --custom_image_dir missing"
    echo "usage: ./test.sh --data-root ../dataset/celebfaces/face2edge --name edge2face_generation --direction BtoA --torch /root/torch/install/bin/th [--custom_image_dir my_named_gen]"
    exit 1;
fi

parent_path=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )
cd $parent_path/pix2pix

time (env DATA_ROOT=$2 name=$4 which_direction=$6 custom_image_dir=$10 $8 test.lua)
#env DATA_ROOT=../dataset/celebfaces/face2edge phase=test name=edge2face_generation which_direction=BtoA results_dir=results th test.lua
