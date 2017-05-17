#!/bin/bash
parent_path=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )
cd $parent_path

DATA_ROOT=dataset/celebfaces/face2edge name=edge2face_generation which_direction=BtoA phase=val results_dir=pix2pix/results th pix2pix/test.lua
