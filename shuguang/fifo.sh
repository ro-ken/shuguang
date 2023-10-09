#!/bin/bash


name="demo"
oldname=$name
file="./yaml/fifo.yaml"
for ((i=1; i<=10; i++))
do
    index=$i
    newname="$name$index"
    sed -i 's/'"$oldname"'/'"$newname"'/g' $file
    kubectl create -f $file
    oldname=$newname
    sleep 2
done

# 名字替换回去
sed -i 's/'"$newname"'/'"$name"'/g' $file
