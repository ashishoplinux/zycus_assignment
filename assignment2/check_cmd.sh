#!/bin/bash

path=/test/scripts
cd $path
hosts=($(cat $path/hosts.txt | sed 's/,/ /g'))
echo "Enter command to run on remote hosts followed by {ENTER}: "
read -e cmd

for key in "${hosts[@]}"
do
echo ;echo "output of your command '$cmd' on host '$key':"
ssh root@$key $cmd
done
