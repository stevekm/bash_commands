#!/bin/bash
# https://www.youtube.com/watch?v=OhJtyblE_D0

# preview the segment
mplayer -ao null -loop 0 -ss 0:0:33 -endpos 2 eagles.avi

# output frames
mplayer -ao null -ss 0:0:33 -endpos 2 eagles.avi -vo jpeg:outdir=animated_gif

# preview entire frame sequence in GIMP and figure out which frames to drop, delete them from dir

# copy only some frames to reduce framerate, save file size
cp *[02468].jpg even_frames/

# use even frames, use cp *[02468].jpg /evenfolder/

# crop but try to center face, use morgify
mogrify -crop 608x328+0+119 *.jpg
mogrify -crop 476x272+0+0 *.jpg

# resize frames
# http://www.imagemagick.org/script/mogrify.php
mogrify -resize 50% rose.jpg

# open As Layers in GIMP

# with even frames use 40ms frame delay, maybe 50ms, if using evenframes only

# reverse order in GIMP; Layer>Stack>Reverse Stack Order

# optimize at least twice but only after setting frame order
# no don't optimize nevermind

# scale 50% or as needed to get sub 2MB, 
# but reduce # of frames and crop frames first before scaling

# Export gif
# no comment
# as animation
# loop forever
# "x"ms frame delay
# use delay for all frames
