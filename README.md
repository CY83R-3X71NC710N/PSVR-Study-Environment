# PSVR-Study-Environment
Custom PSVR study environment mp4 generator

# Issue
PSVR has absolutely no study environments, I found this to be an issue when I wanted to study in VR therefore I created this project allowing you to create your very own custom studyspace with custom learning resources using PSVR.

Simply find a 360 VR study environment you want to use on youtube, download using youtubedl-gui then get a recording of the resources you wish to study in mp4 format. Provide both of these to the python script.

# What exactly does this project do?

What this project does is take two mp4 files, the study environment and the learning resources you recorded on your computer. I take these and merge them together, the learning resource goes in the center of the study environment. After we generate the new mp4 file you should put the file on a USB stick and use PSVR media player with VR option ticked on in order to study in your study environment, you can pause/play/fast-forward as needed to get the learning resources in your head. Essentially what htis project does is combine a 360 video and adds a study overlay at center to the 360 video

# Todo:
Build Base Working Project.
Implement SRS
Implement Loci Memory Palace
guide to upload mp4 to private youtube for use with the PSVR youtubeVR app
Auto resolution/encoding
Custom music
Auto youtube-dl fetch
requirements.txt (including movie.py library, etc.)
warning asking if the user would like to cut the video to make it shorter and less file size

# Thanks To:
```
https://www.youtube.com/watch?v=JA4z8P_B2B0 (Figure out how to automate this and center)
https://www.youtube.com/watch?v=dCSZvP5IAqc (Perhaps we could convert the video to pictures and then use this method?)
https://www.youtube.com/watch?v=kLVajtkrG_4 (VR Test)
https://stackoverflow.com/questions/68389529/overlay-video-on-video-in-moviepy
```
