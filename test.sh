#!/bin/bash
# 
function ping_subnet {
    # 测试网段主机连通性
    net=192.168.1
    for i in $(seq 254); do
        #statements
        ping -c2 -i0.2 -w1 $net.$i &>/dev/null
        if [[ $? -eq 0 ]]; then
            #statements
            echo $net.$i ok
        else
            echo $net.$i fail
        fi
    done
}

function double_nine {
    for (( i = 1; i <= 9; i++ )); do
        #statements
        for (( j = 1; j <= i; j++ )); do
            #statements
            echo $i*$j=$[ $i*$j ]
        done
        echo
    done
    echo
}

function net_dev {
    count=0
    # devs=$(ip link |grep mtu |awk -F: '{print $2}')
    net_devs=$(ip addr |grep -w inet |awk '{print $NF}')
    net_dev_ips=$(ip addr |grep -w inet |awk '{print $2}')
    for ip in $net_dev_ips; do
        #statements
        echo $ip
        count=$[ $count+1 ]
    done
    echo $count
}

function sysinfo {
    local max_mem=$( free -m |grep Mem|awk '{print2}')
    # local max_homefs
    # local max_rootfs
    # local max_swapfs
    local max_load
    local max_cpu

    # 系统时间
    now=$(date +'%y%m%d %H:%M:S%')
    # 登录用户数
    login_user_nums=$(who |wc -l)
    # 可用内存
    now_avaiable_mem=$( free -m |grep Mem|awk '{print$NF}')
    now_free_swap=$(free -m |grep Swap|awk '{print$4}')
    # now_homefs=$()
    # 根目录磁盘使用率
    now_rootfs=$(df / -h |awk '{print$5}'|tail -n1)
    # 系统15分钟系统负载
    now_load=$()
    # CPU使用率
    now_cpu=$()
    sys_time=$()
    user_time=$()


    for i in {1..3}; do
        #statements
        # 取值三次

    done

    if [[ $now_avaiable_mem >= $max_mem || $ ]]; then
        #statements
    fi

}


function main {
    # ping_subnet
    # double_nine
    net_dev
}

main