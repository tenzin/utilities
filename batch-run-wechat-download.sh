#!/bin/bash
# Script to batch download from wechat using a text file with urls as input
# usage: batch-run-wechat-download.sh input_file 
# input_file contains all the urls - one url per line

while IFS= read -r line; do
   ./download-from-wechat.sh "$line"
done < $1
