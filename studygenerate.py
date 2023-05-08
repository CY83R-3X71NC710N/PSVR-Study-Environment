# add variables and ask statements.

# import statements
from moviepy.editor import *

vr_video_path = "vr.mp4"

# center this
def add_learn(fg_in_bg_avi):
    clip1 = VideoFileClip(fg_in_bg_avi)
    clip3 = VideoFileClip(zm_video_path, has_mask=True)
    video = CompositeVideoClip([clip1, clip3])
    name = 'Output'
    video.write_videofile(name, audio=False)  # No audio first
    video.close()
    return name


if __name__ == '__main__':
    video_have_zm = add_learn("background.mp4")
# I am still trying to figure out whether this overlay method will work with VR I don't want this only to work without VR.
