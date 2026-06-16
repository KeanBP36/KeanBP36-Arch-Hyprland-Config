#!/bin/bash

# GPU usage (%)
#usage=$(nvidia-smi --query-gpu=utilization.gpu --format=csv,noheader,nounits 2>/dev/null)

# GPU temperature
#temp=$(nvidia-smi --query-gpu=temperature.gpu --format=csv,noheader,nounits 2>/dev/null)

#echo "GPU ${usage}% | ${temp}°C"

#!/bin/bash

# Check if nvidia-smi exists and is working (NVIDIA)
if command -v nvidia-smi &> /dev/null && nvidia-smi --query-gpu=utilization.gpu --format=csv,noheader,nounits &> /dev/null; then
    usage=$(nvidia-smi --query-gpu=utilization.gpu --format=csv,noheader,nounits 2>/dev/null)
    temp=$(nvidia-smi --query-gpu=temperature.gpu --format=csv,noheader,nounits 2>/dev/null)
    echo "GPU ${usage}% | ${temp}°C"

# Fallback for AMD/Intel
else
    # You can customize these placeholders or use specific files like /sys/class/drm/card0/device/gpu_busy_percent
    echo "GPU N/A | --°C"
fi
