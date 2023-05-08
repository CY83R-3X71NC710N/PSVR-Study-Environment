#!/bin/bash

# We are now using bash withg ffmpeg due to the fact it is better suited to this task than python.

# Interestingly the more I use this video editing setup the more I want to avoid GUI programs. This is faster and more efficient.
ffmpeg -y -i vr.mp4 \
    -stream_loop -1 -i test.mp4 \
    -filter_complex \
    "[1:v]scale=250:-1[tmp];[0][tmp]overlay=shortest=1:x=(main_w/2)-(w/2):y=(main_h/2)-(h/2)" \
     output.mp4 # Make sure that the second clip and the first clip match length or make sure that the overlay loops and the first clip is longer than the second clip.

# Let's test this now on my PSVR using the overlay to a vr file
