#!/bin/bash
DIR="${PWD##*/}[V0]"
mkdir "$DIR"

#parallel-moreutils -i -j$(nproc) sox {} -G -C -0.2 {}.mp3 rate -v -L 44100 dither -- ./*.flac
parallel-moreutils -i -j$(nproc) ffmpeg -i {} -codec:a libmp3lame -compression_level 0 -qscale:a 0 -vcodec copy {}.mp3 -- ./*.flac
rename .flac.mp3 .mp3 ./*.mp3
mv *.mp3 "$DIR"

