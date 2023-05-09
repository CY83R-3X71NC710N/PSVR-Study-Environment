# PSVR-Study-Environment
Custom PSVR study environment mp4 generator

# Issue
PSVR has absolutely no study environments, I found this to be an issue when I wanted to study in VR therefore I created this project allowing you to create your very own custom studyspace with custom learning resources using PSVR.

Simply find a 360 VR study environment you want to use on youtube, download using youtubedl-gui then get a recording of the resources you wish to study in mp4 format. Provide both of these to the bash script.

# What exactly does this project do?

What this project does is take two mp4 files, the study environment and the learning resources you recorded on your computer. I take these and merge them together, the learning resource goes in the center of the study environment. After we generate the new mp4 file you should put the file on a USB stick and use PSVR media player with VR option ticked on in order to study in your study environment, you can pause/play/fast-forward as needed to get the learning resources in your head. Essentially what htis project does is combine a 360 video and adds a study overlay at center to the 360 video.

The con to this is you cannot actively work on assignments but rather only record the desktop and study. hence why this is a study environment and not a workspace due to playstation limitations.

I suggest you loop the video using playstations autoplay feature in it's own special folder

# Todo:
```
Create input menu allowing users to specify location of files as well as tick options on/off
Build Base Working Project.
Implement SRS
Implement Loci Memory Palace
guide to upload mp4 to private youtube for use with the PSVR youtubeVR app
Auto resolution/encoding
Custom music
Auto youtube-dl fetch
requirements.txt (including movie.py library, etc.)
warning asking if the user would like to cut the video to make it shorter and less file size
Guide on how to record overlay
Add download video menu that allows to download youtube 360 videos directly from the tool
Add input that allows you to start a desktop record directly from the menu.
Add a warning that states 1920x1080 1080p 60fps videos are the standard and going below may result in a bad experience
To find videos sort by 360 and 4-20 minutes go above if you cannot find what you are looking for. 
```
# Thanks To:
```
https://aur.archlinux.org/packages/kazam
https://www.youtube.com/@AmbientRenders/videos
https://www.youtube.com/watch?v=JA4z8P_B2B0 (Figure out how to automate this and center)
https://www.youtube.com/watch?v=dCSZvP5IAqc (Perhaps we could convert the video to pictures and then use this method?)
https://www.youtube.com/watch?v=kLVajtkrG_4 (VR Test)
https://stackoverflow.com/questions/68389529/overlay-video-on-video-in-moviepy
https://www.oodlestechnologies.com/blogs/PICTURE-IN-PICTURE-effect-using-FFMPEG/ (I will opt for a picture in picture setup)
https://superuser.com/questions/1093507/loop-a-video-overlay-with-ffmpeg
https://superuser.com/questions/1689522/ffmpeg-how-to-make-the-overlay-loop-till-the-end-of-the-main-video (The real question is if we need to add the vr effect to the overlay or if we can keep it)
```
