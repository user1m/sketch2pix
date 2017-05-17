#!/bin/bash
parent_path=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )
cd $parent_path/pix2pix

time
env DATA_ROOT=../dataset/celebfaces/face2edge phase=test name=edge2face_generation which_direction=BtoA results_dir=results th test.lua
