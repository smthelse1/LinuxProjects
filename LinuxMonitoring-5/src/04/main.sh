#!/bin/bash

if [ $# -ne 0 ]; then
    kill $$
else 
    source config.txt
    export First=$column1_background
    export Second=$column1_font_color
    export Third=$column2_background
    export Fourth=$column2_font_color 

    chmod +x exportInf.sh
    ./exportInf.sh
fi