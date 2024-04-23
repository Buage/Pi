#!/bin/bash

# Set the URL of the webpage you want to stream
URL="http://example.com"

# Set the output resolution (e.g., 1080x1920 for a 9:16 aspect ratio)
RESOLUTION="1080x1920"

# Set the output frame rate (e.g., 24 fps)
FRAMERATE="24"

# Use ffmpeg to capture the webpage content and stream it
ffmpeg -i "$URL" -vf "scale=$RESOLUTION" -r "$FRAMERATE" -f mpegts udp://192.168.1.90:400
