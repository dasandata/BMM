#!/bin/bash

MEMINFO=`cat /proc/meminfo | grep 'MemTotal\|MemFree\|Buffers\|Cached'`
MEMTOTAL=`echo $MEMINFO | awk '{print $2}'`
MEMUSED=`echo $MEMINFO | awk '{print ($2-$5-$8-$11)}'`
MEMFREE=`echo $MEMINFO | awk '{print ($5+$8+$11)}'`

## 실질 여유 메모리 %
MEMPER=`echo $MEMUSED $MEMFREE | awk '{printf "%.1f\n", $1/($1+$2)*100}'`

echo "MEMTOTAL=$MEMTOTAL / MEMUSED=$MEMUSED / MEMFREE=$MEMFREE / MEMPER=${MEMPER}%"
