#!/bin/bash
parallel-moreutils -i -j$(nproc) sox {} -G -C 320.2 {}.mp3 rate -v -L 44100 dither -- ./*.flac
#parallel-moreutils -i -j$(nproc) ffmpeg -i {} -codec:a libmp3lame -compression_level 0 -b:a 320k {}.mp3 -- ./*.flac
rename .flac.mp3 .mp3 ./*.mp3
