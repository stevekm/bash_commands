#!/bin/bash
# https://www.youtube.com/watch?v=OhJtyblE_D0

# preview the segment
mplayer -ao null -loop 0 -ss 0:0:33 -endpos 2 eagles.avi

# output frames
mplayer -ao null -ss 0:0:33 -endpos 2 eagles.avi -vo jpeg:outdir=animated_gif

# copy only some frames
cp *[02468].jpg even_frames/
