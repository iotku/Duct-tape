#!/bin/bash
DIR="${PWD##*/}[320]"
mkdir "$DIR"
#parallel-moreutils -i -j$(nproc) sox {} -G -C 320.2 "320/{}.mp3" rate -v -L 44100 dither -- ./*.flac
parallel-moreutils -i -j$(nproc) ffmpeg -i {} -codec:a libmp3lame -compression_level 0 -b:a 320k -vcodec copy {}.mp3 -- ./*.flac
rename .flac.mp3 .mp3 ./*.mp3
mv *.mp3 "$DIR"
