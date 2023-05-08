from moviepy.editor import *

video_file = VideoFileClip('vr.mp4')

def position(t):
    return (45*t, 0*t)

add_text = TextClip("www.YouTube.com",fontsize=30,color="red").set_position(position).set_duration(video_file.duration)

final = CompositeVideoClip([video_file,add_text])

final.write_videofile("test.mp4")
