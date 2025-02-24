#!/bin/bash

methods=("GET" "POST" "PUT" "PATCH" "DELETE")
method=${methods[$RANDOM % ${#methods[@]}]}