#!/usr/bin/bash



function IfDirecExist(){
    for filename in  `ls ${1}`; do
        if [[ -d  ${filename##*.} ]]; then
            return 10   # Dir exists
        else
            return 20   # Dir not exists
        fi
    done
}



declare -i status=0


for filename in  `ls ${1}`; do
if [[ -f $filename ]] ; then
    `IfDirecExist ${1}`
    status=$?
    #echo $status
    if [ $status = 20 ] ;then
        mkdir "${1}${filename##*.}"
    elif [ $status = 10 ] ;then
        mv $filename "${1}${filename##*.}"
    fi 
elif [[ -d $filename ]]; then
    echo "$filename is a directory"
fi
done