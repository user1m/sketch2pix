#!/bin/bash

if [ "$1" != "--image-path" ]; then
    echo "error: --image-path missing" >&2;
    echo "usage: ./sketch.sh --image-path ./data-sets/sample/images/ --face-path ./data-sets/sample/face/ --sketch-path ./data-sets/sample/sketch/" >&2;
    exit 1;
elif [ "$3" != "--face-path" ]; then
    echo "error: --face-path missing" >&2;
    echo "usage: ./sketch.sh --image-path ./data-sets/sample/images/ --face-path ./data-sets/sample/face/ --sketch-path ./data-sets/sample/sketch/" >&2;
    exit 1;
elif [ "$5" != "--sketch-path" ]; then
    echo "error: --sketch-path missing" >&2;
    echo "usage: ./sketch.sh --image-path ./data-sets/sample/images/ --face-path ./data-sets/sample/face/ --sketch-path ./data-sets/sample/sketch/" >&2;
    exit 1;
fi

parent_path=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )
cd $parent_path/PencilSketch

#python sketch.py ../data-sets/sample/images/ ../data-sets/sample/face-sketch/ ../data-sets/sample/sketch/
python sketch.py $2 $4 $6
