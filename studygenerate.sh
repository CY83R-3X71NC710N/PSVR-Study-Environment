#!/bin/bash

# We are now using bash with ffmpeg due to the fact it is better suited to this task than python.
# Bash is a command line interpreter that is commonly used in Linux and other Unix-like operating systems.

# Interestingly the more I use this video editing setup the more I want to avoid GUI programs. This is faster and more efficient.
# Using a command-line interface (CLI) instead of a graphical user interface (GUI) can provide faster and more efficient video editing capabilities.

# Overlay a non-360 clip onto a 360 VR video
ffmpeg -y -i vr.mp4 \
       -i non360.mp4 \
       -filter_complex "[1:v]scale=250:-1[tmp];[0][tmp]overlay=shortest=1:x=(main_w/2)-(w/2):y=(main_h/2)-(h/2)" \
       -c:a copy \
       -cpu-used 0 \
       -threads 1 \
       -strict -2 \
       -preset veryslow \
       -movflags +faststart \
       -maxrate 4M \
       -bufsize 4M \
       -rtbufsize 4M \
       -f mp4 \
       -fs 4000M \
       output_overlay.mp4

# Convert the non-360 clip to a 360 format
ffmpeg -y -i non360.mp4 \
       -c copy \
       -metadata:s:v:0 projection=spherical \
       -metadata:s:v:0 stereo_mode=mono \
       -cpu-used 0 \
       -threads 1 \
       -strict -2 \
       -preset veryslow \
       -movflags +faststart \
       -maxrate 4M \
       -bufsize 4M \
       -rtbufsize 4M \
       -f mp4 \
       -fs 4000M \
       non360_360.mp4

# Overlay the 360 non-360 clip onto the 360 VR video
ffmpeg -y -i vr.mp4 \
       -i non360_360.mp4 \
       -filter_complex "[1:v]rotate=-yaw:ow=rotw(-yaw):oh=roth(-yaw)[tmp1];[tmp1]rotate=-pitch:ow=rotw(-pitch):oh=roth(-pitch)[tmp2];[tmp2]rotate=-roll:ow=rotw(-roll):oh=roth(-roll)[tmp3];[0:v][tmp3]overlay=x=(main_w/2)-(w/2):y=(main_h/2)-(h/2)" \
       -c:a copy \
       -cpu-used 0 \
       -threads 1 \
       -strict -2 \
       -preset veryslow \
       -movflags +faststart \
       -maxrate 4M \
       -bufsize 4M \
       -rtbufsize 4M \
       -f mp4 \
       -fs 4000M \
       output_final.mp4

# Let's test this now on my PSVR using the overlay to a VR file.
