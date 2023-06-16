#!/bin/bash
export HEALTHCHECK_DF_THRESHHOLD=10
export HEALTHCHECK_FREE_THRESHHOLD=128
export HEALTHCHECK_LOAD_THRESHHOLD=3
export NTFY_TOPIC_URL=ntfy.sh/aISasQp

available_mem=$(free -m | awk '/^Mem/ {print $7}')
if [ $available_mem -lt $HEALTHCHECK_FREE_THRESHHOLD ]; then
  curl \
    -d "Only $available_mem MB available." \
    -H "Title: Low free memory on $(hostname)" \
    -H "Tags: warning" \
    $NTFY_TOPIC_URL
fi

load_avg=$(cat /proc/loadavg | awk '{print $2}')
if [ $load_avg \> $HEALTHCHECK_LOAD_THRESHHOLD ]; then
  curl \
    -d "Load average $load_avg over past 10 minutes." \
    -H "Title: High load average on $(hostname)" \
    -H "Tags: warning" \
    $NTFY_TOPIC_URL
fi

free_space=$(df -h | awk '$NF=="/"{printf "%d", $4}')
if [ $free_space -lt $HEALTHCHECK_DF_THRESHHOLD ]; then
  curl \
    -d "Only $free_space GB remaining on root storage path." \
    -H "Title: Low disk space on $(hostname)" \
    -H "Tags: warning" \
    $NTFY_TOPIC_URL
fi
