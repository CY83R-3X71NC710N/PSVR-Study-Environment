#!/bin/bash

# Specify input and output files
INPUT_VIDEO="vr.mp4"         # 360 VR video
OVERLAY_VIDEO="non360.mp4"   # non-360 VR video that will be converted to 360 VR format
OUTPUT_VIDEO="output.mp4"    # 360 VR video with the converted overlay added in the center

# Check the integrity of the input files
if ! ffprobe -v error -i "$INPUT_VIDEO" -show_format -show_streams -count_frames -pretty -hide_banner; then
    echo "Error: input file $INPUT_VIDEO is corrupted"
    exit 1
fi

if ! ffprobe -v error -i "$OVERLAY_VIDEO" -show_format -show_streams -count_frames -pretty -hide_banner; then
    echo "Error: input file $OVERLAY_VIDEO is corrupted"
    exit 1
fi

# Specify video dimensions
VIDEO_WIDTH=3840               # width of the 360 VR video
VIDEO_HEIGHT=1920              # height of the 360 VR video
OVERLAY_WIDTH=1920             # width of the overlay video
OVERLAY_HEIGHT=1080            # height of the overlay video

# Specify output encoding parameters
VIDEO_CODEC="libx264"          # video codec
VIDEO_BITRATE="8M"             # video bitrate
VIDEO_FRAMERATE="30"           # video frame rate

# Set low priority for CPU usage
renice -5 $$

# Convert the overlay video to a 360 VR format
ffmpeg -i "$OVERLAY_VIDEO" -c:v libx264 -preset ultrafast -qp 18 -c:a copy -vf "v360=eac:equirect" -b:v 4M -s "${VIDEO_WIDTH}x${VIDEO_HEIGHT}" -y overlay_360.mp4

# Add the converted overlay to the center of the 360 VR video
ffmpeg -i "$INPUT_VIDEO" -i "$OVERLAY_VIDEO" -filter_complex "[1:v]scale=w=ih*16/9:h=ih[v1];[0:v][v1]overlay=W/4:0[v];[v]scale=w=1920:h=1080,format=yuv420p,setsar=1[v_scaled];[0:a][1:a]amerge=inputs=2[a]" -map "[v_scaled]" -map "[a]" -c:v libx264 -b:v "$VIDEO_BITRATE" -r "$VIDEO_FRAMERATE" -c:a aac -b:a 192k -y "$OUTPUT_VIDEO"


