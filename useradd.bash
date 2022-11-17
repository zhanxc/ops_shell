#!bin/bash

#定时删除日志文件
#输入参数：无
#输出参数：无

file="/home/kylincat/scritps/userlist.txt"
if [ -f $file ];then 
    echo "file exist"
else
    echo "file not exist"
    exit 1    
fi

username=
password=
bash=
homedir=
groupid=
expiredate=

while read userinfo
do
    echo $userinfo
    username=`echo $userinfo |awk '{print $1}'`
    password=`echo $userinfo |awk '{print $2}'`
    echo "当前用户名是$username"
    grep $username /etc/passwd
    # 先判断是否存在该用户
    if [ $? -eq 0 ];
        then echo "用户已存在"
        continue
    fi
    echo "开始创建用户"
    # 判断是否存在该用户
    # echo $isexist
    useradd $username -p $password
    # 创建命令是否正确执行
    if [ $? -eq 0 ];
        then "$username已创建"
    fi
done < $file