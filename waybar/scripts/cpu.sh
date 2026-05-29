#!/bin/bash

# CPU usage (%)
usage=$(grep 'cpu ' /proc/stat)
prev_idle=$(echo "$usage" | awk '{print $5}')
prev_total=$(echo "$usage" | awk '{sum=0; for(i=2;i<=NF;i++) sum+=$i; print sum}')

sleep 0.5

usage2=$(grep 'cpu ' /proc/stat)
idle=$(echo "$usage2" | awk '{print $5}')
total=$(echo "$usage2" | awk '{sum=0; for(i=2;i<=NF;i++) sum+=$i; print sum}')

diff_idle=$((idle - prev_idle))
diff_total=$((total - prev_total))
diff_usage=$((100 * (diff_total - diff_idle) / diff_total))

# CPU temp (remove +)
temp=$(sensors k10temp-pci-00c3 | awk '/Tctl/ {print $2}' | tr -d '+')

echo "CPU ${diff_usage}% |  ${temp}"
