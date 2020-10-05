#!/bin/bash

NETIF=enp0s3
TX_FILE="/sys/class/net/${NETIF}/statistics/tx_bytes"
RX_FILE="/sys/class/net/${NETIF}/statistics/rx_bytes"

while true
do
   TX_VAL=$(cat ${TX_FILE})
   RX_VAL=$(cat ${RX_FILE})
   echo "NET,IF=\"${NETIF}\" rx=${RX_VAL}i,tx=${TX_VAL}i" \
	| curl -i -XPOST http://127.1:8086/write?db=demo --data-binary @-
   sleep 30
done
