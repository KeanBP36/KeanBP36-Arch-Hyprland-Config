#!/bin/bash
# Capture, OCR, and notify
/usr/bin/grimblast save "$1" - | /usr/bin/tesseract - - | /usr/bin/wl-copy
/usr/bin/notify-send "OCR Complete" "Text from $1 copied to clipboard"
