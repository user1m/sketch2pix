#!/bin/bash
parent_path=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )
cd $parent_path

DATA_ROOT=dataset/celebfaces/face2edge name=edge2face_generation which_direction=BtoA checkpoint_dir=pix2pix/checkpoints th pix2pix/train.lua
