#!/bin/bash

n1=100
n2=200

timestamp=$(date)
echo "Script executed at $timestamp"

echo "sum of 2 numbers is = $sum"

echo "if you want all variables passed to script: $@"
echo "number of variables passed: $#"
echo "script name: $0"
echo "present working directory: $PWD"
echo "home directory of the user who is running the script: $HOME"
echo "which user is running the script: $USER"
echo "PID of the current script: $$"
echo "sleep 10 &"
echo "PID of the last command running in background: $!"
