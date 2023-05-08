#!/bin/bash

# We are now using bash withg ffmpeg due to the fact it is better suited to this task than python.
ffmpeg -i vr.mp4 -i test.mp4 -filter_complex "[1]scale=iw/5:ih/5 [pip]; [0][pip] overlay=main_w-overlay_w-10:main_h-overlay_h-10" -profile:v main -level 3.1 -b:v 440k -ar 44100 -ab 128k -s 720x400 -vcodec h264 -acodec aac output.mp4
