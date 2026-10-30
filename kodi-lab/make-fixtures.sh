#!/bin/sh
# The lab's fixture media: five tiny generated clips with fictional
# metadata in NFO files, so the local-information scraper has real
# work to do and no network is needed. Run from the folder that
# should hold the media library. Requires ffmpeg.
set -e
mkdir -p "Movies/The Clockwork Garden (2021)"
mkdir -p "Movies/A Field Guide to Clouds (2019)"
mkdir -p "Movies/Summer at the Observatory (2023)"
mkdir -p "TV/The Night Train (2022)/Season 01"
gen() { # file seconds tone-hz
    ffmpeg -hide_banner -loglevel error -y \
        -f lavfi -i "testsrc2=size=640x360:rate=25:duration=$2" \
        -f lavfi -i "sine=frequency=$3:duration=$2" \
        -c:v libx264 -pix_fmt yuv420p -c:a aac -shortest "$1"
}
gen "Movies/The Clockwork Garden (2021)/The Clockwork Garden (2021).mkv" 8 440
gen "Movies/A Field Guide to Clouds (2019)/A Field Guide to Clouds (2019).mkv" 8 520
gen "Movies/Summer at the Observatory (2023)/Summer at the Observatory (2023).mkv" 8 660
gen "TV/The Night Train (2022)/Season 01/The Night Train S01E01.mkv" 6 330
gen "TV/The Night Train (2022)/Season 01/The Night Train S01E02.mkv" 6 392
echo "Clips made. The .nfo files beside them are quoted in full in"
echo "chapter 7 of the guide (the-library.md)."
