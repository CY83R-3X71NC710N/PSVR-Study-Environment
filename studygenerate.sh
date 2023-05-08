#!/bin/bash

# We are now using bash due to the fact it is better suited to this task than python.
ffmpeg -i vr.mp4 -i test.mp4 \
-filter_complex "[1:v]setpts=PTS-10/TB[a]; \
                 [0:v][a]overlay=enable=gte(t\,5):shortest=1[out]" \
-map [out] -map 0:a \
-c:v libx264 -crf 18 -pix_fmt yuv420p \
-c:a copy \
output.mp4
