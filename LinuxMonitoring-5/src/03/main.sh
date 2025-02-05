#!/bin/bash

if [ $# -ne 4 ]; then
    kill $$
else 
    export First=$1
    export Second=$2
    export Third=$3
    export Fourth=$4

    chmod +x exportInf.sh
    ./exportInf.sh
fi