#!/bin/bash

# GPU usage (%)
usage=$(nvidia-smi --query-gpu=utilization.gpu --format=csv,noheader,nounits 2>/dev/null)

# GPU temperature
temp=$(nvidia-smi --query-gpu=temperature.gpu --format=csv,noheader,nounits 2>/dev/null)

echo "GPU ${usage}% | ${temp}°C"
