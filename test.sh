#!/bin/bash
parent_path=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )
cd $parent_path/pix2pix

time
DATA_ROOT=../dataset/celebfaces/face2edge name=edge2face_generation which_direction=BtoA phase=val results_dir=results th test.lua
