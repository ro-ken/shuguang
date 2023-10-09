#!/bin/bash
name="demo"
cpu=("500m" "600m" "700m" "800m" "900m" "1000m" "500m")
memory=("500Mi" "600Mi" "700Mi" "800Mi" "900Mi" "1Gi" "500Mi")
storage=("1Gi" "2Gi" "3Gi" "4Gi" "5Gi" "6Gi" "1Gi")

oldname=$name
oldcpu=${cpu[0]}
oldmemory=${memory[0]}
oldstorage=${storage[0]}

file="./yaml/different.yaml"

for ((i=1; i<=6; i++))
do
    for((j=1; j<=5; j++ ))
    do
        index=$(((i - 1) * 5 + j))
        newname="$name$index"
        sed -i 's/'"$oldname"'/'"$newname"'/g' $file
        kubectl create -f $file
        oldname=$newname
        sleep 1
    done
    newcpu=${cpu[$i]}
    newmemory=${memory[$i]}
    newstorage=${storage[$i]}
    # 替换cpu 内存 外存 信息
    sed -i  's/'"$oldcpu"'/'"$newcpu"'/g;s/'"$oldmemory"'/'"$newmemory"'/g;s/'"$oldstorage"'/'"$newstorage"'/g' $file
    oldcpu=$newcpu
    oldmemory=$newmemory
    oldstorage=$newstorage
done
   # 名字替换回去
   sed -i 's/'"$newname"'/'"$name"'/g' $file
