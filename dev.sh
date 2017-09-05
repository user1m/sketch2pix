#!/bin/bash
system=$(uname -s)
echo $system
if  [ "$system" == "Darwin" ]; then
    echo $system
else
    echo "Not Darwin"
fi
#if [ "$1" != "--path" ]; then
#    echo "error: --path needed"
#    exit 0;
#elif [ "$3" != "--name" ]; then
#    echo "error: --name needed"
#    exit 0;
#else
#cd $2
#echo $(pwd -P)
#    echo "--path and --name found";
#fi
