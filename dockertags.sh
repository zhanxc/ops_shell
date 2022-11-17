#!/bin/bash
# set -x
# 显示docker镜像的所有标签
function usage(){
    cat << HELP
    Usage:

    dockertags --list all tags about the image from remote docker registry

    dockertags image # list all tag
    dockertags images tag #list tags contains tag

    EXAMPLEs:
    显示所有关于busybox的标签
    dockertags busybox
    显示所有关于php并且包含apache标签
    dockertags php apache
    
HELP
}
if [[ $# -lt 1 ]]; then
    #statements
    usage
    exit
fi
image="$1"
tags=`wget -q https://registry.hub.docker.com/repositories/${image}/tags -O -  | sed -e 's/[][]//g' -e 's/"//g' -e 's/ //g' | tr '}' '\n'  | awk -F: '{print $3}'`
if [[ -n "$2" ]]; then
    #statements
    tags=`echo "{$tags}" |grep "$2"`
fi
echo "{$tags}"
