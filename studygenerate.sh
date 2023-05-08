#!/bin/bash

# We are now using bash withg ffmpeg due to the fact it is better suited to this task than python.

# Interestingly the more I use this video editing setup the more I want to avoid GUI programs. This is faster and more efficient.

ffmpeg -stream_loop -i vr.mp4 -i test.mp4 -filter_complex "[1]scale=iw/5:ih/5 [pip]; [0][pip] overlay=main_w-overlay_w-10:main_h-overlay_h-10" -profile:v main -level 3.1 -b:v 440k -ar 44100 -ab 128k -s 1920x1080 -vcodec h264 -acodec aac output.mp4
# Make sure that the second clip and the first clip match length or make sure that the overlay loops and the first clip is longer than the second clip.

# Let's test this now on my PSVR using the overlay to a vr file
