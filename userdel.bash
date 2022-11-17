#!/bin/bash

# 读取文件删除用户
# 输入参数：无
# 输出参数：无

# 判断用户是否存在
# grep $1 /etc/passwd
# if [  $? -eq 0 ];then 
#     echo "$1 exist"
#     # 删除用户同时删除用户家目录
#     echo "$1 start to delete"
#     userdel -rf $1
#     # 删除确认
#     grep $1 /etc/passwd
#     if [ $? -eq 1 ] && [ -d "/home/$1" ];then
#         echo "user deleted"
#     fi
# else
#     # echo "user deleted"
#     echo "user not exist"
#     exit 1
# fi

for x in "$@"
do
    echo $x
    grep $x /etc/passwd
    if [ $? -eq 0 ];then
        echo "user exist"
        echo "user to delete"
        userdel -rf $x
        # 删除确认
        grep $x /etc/passwd
        if



done


# 遍历所有的文件
function search{}


