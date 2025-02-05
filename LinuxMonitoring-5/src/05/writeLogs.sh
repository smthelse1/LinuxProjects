#!/bin/bash

start_time=$(date +%s.%N)

echo "Total number of folders (including all nested ones) = $foldersQt"
echo -e "$fiveFolders"
echo  "Total number of files = $allFilesQt"
echo "Number of:"
echo "Configuration files (with the .conf extension) = $configFileQt"
echo "Text files = $txtFileQt"
echo "Executable files = $exeFileQt"
echo "Log files (with the extension .log) = $logFileQt"
echo "Archive files = $zipFileQt"
echo "Symbolic links = $SLFileQt"
echo "TOP 10 files of maximum size arranged in descending order (path, size and type): "
echo -e "$tenFiles"
echo "TOP 10 executable files of the maximum size arranged in descending order (path, size and MD5 hash of file): "
echo -e "$tenExecutableFiles"

end_time=$(date +%s.%N)
elapsed_time=$(echo "$end_time - $start_time" | bc)
printf "Script execution time (in seconds) = %.3f\n" "$elapsed_time"