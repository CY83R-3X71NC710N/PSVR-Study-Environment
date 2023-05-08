from moviepy.editor import *

output_path="output.mp4"

video_clip = VideoFileClip((video_view), target_resolution=(1080, 1920)) #b .mp4 file

overlay_clip = VideoFileClip((animeeer), has_mask=True, target_resolution=(1080, 1920)) #.mov file with alpha channel

final_video = mp.CompositeVideoClip([video_clip, overlay_clip])  

final_video.write_videofile(
    output_path,
    fps=30,
    remove_temp=True,
    codec="libx264",
    audio_codec="aac",
    threads = 6,
)
