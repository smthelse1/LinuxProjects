#!/bin/bash

chmod +x argumentCheck.sh
chmod +x logCreator.sh
chmod +x 1deleteMethod.sh
chmod +x 2deleteMethod.sh
chmod +x 3deleteMethod.sh

source argumentCheck.sh
source logCreator.sh

case $1 in 
    1)
        source 1deleteMethod.sh
        ;;
    2)
        source 2deleteMethod.sh
        ;;
    3)
        source 3deleteMethod.sh
        ;;
    *)
        echo "Invalid input. Please enter 1, 2, or 3."
        ;;
esac 

exit 0

