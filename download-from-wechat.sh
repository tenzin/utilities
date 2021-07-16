#!/bin/bash

+x 
# Input URL ($1) would be something like this: https://mp.weixin.qq.com/mp/audio?scene=105&__biz=MzA5MTkwMTkzMw==&mid=2655963005&idx=1&voice_id=MzA5MTkwMTkzM18yNjU1OTYzMDA0&sn=85499a3d2f3634cdaca84e6cf10d2690
# This script will convert above Input URL to something like this and call it DOWNLOAD_URL: https://res.wx.qq.com/voice/getvoice?mediaid=MzA5MTkwMTkzM18yNjU1OTYzMDA0

URL=$1
MEDIA_ID=`echo $URL | cut -d \& -f 6 | cut -d = -f 2`
DOWNLOAD_URL="https://res.wx.qq.com/voice/getvoice?mediaid=$MEDIA_ID"

#added new code to get filename automatically
CONTENT=$(wget -O - "$URL")
#echo "Content is: $CONTENT"

FILE_NAME=$(echo "$CONTENT" | grep og:title | cut -d '"' -f 4 | tr -d '[:space:]')
OUTPUT_FILE_NAME="$FILE_NAME.mp3" #Add .mp3 extension

#echo "URL is: $URL"
#echo "Download URL is: $DOWNLOAD_URL"
#echo "Output File Name is: $OUTPUT_FILE_NAME"

wget -c $DOWNLOAD_URL -O $OUTPUT_FILE_NAME
