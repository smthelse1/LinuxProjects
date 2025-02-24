#!/bin/bash

if [ $# != 0 ] ; then
    echo "error. usage: $0"
else
    goaccess ../04/*.log --log-format=COMBINED --real-time-html > index.html
fi