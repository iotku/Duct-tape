#!/bin/bash
# Generate basic track listing from audio files in directory
mediainfo * | grep "Track name                               " | cut -c 44- | nl -s ". "

