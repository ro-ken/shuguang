#!/bin/bash
name1="lowdemo"
oldname1=$name1
name2="highdemo"
oldname2=$name2

low_file="./yaml/low.yaml"
high_file="./yaml/high.yaml"

for ((i=1; i<=2; i++))
do
    index=$i
    newname1="$name1$index"
    sed -i 's/'"$oldname1"'/'"$newname1"'/g' $low_file
    kubectl create -f $low_file
    oldname1=$newname1
    sleep 1
done
# 名字替换回去
sed -i 's/'"$newname1"'/'"$name1"'/g' $low_file

sleep 5

for ((i=1; i<=2; i++))
do
    index=$i
    newname2="$name2$index"
    sed -i 's/'"$oldname2"'/'"$newname2"'/g' $high_file
    kubectl create -f  $high_file
    oldname2=$newname2
    sleep 1
done
# 名字替换回去
sed -i 's/'"$newname2"'/'"$name2"'/g' $high_file

#oldname1=$name1
#for ((i=6; i<=10; i++))
#do
#    index=$i
#    newname1="$name1$index"
#    sed -i 's/'"$oldname1"'/'"$newname1"'/g' $low_file
#    kubectl create -f $low_file
#    oldname1=$newname1
#    sleep 1
#done
# 名字替换回去
#sed -i 's/'"$newname1"'/'"$name1"'/g' $low_file

