#!/bin/bash

# Set the URL of the webpage you want to stream
URL="http://example.com"

# Set the output resolution (e.g., 1080x1920 for a 9:16 aspect ratio)
RESOLUTION="1080x1920"

# Set the output frame rate (e.g., 24 fps)
FRAMERATE="24"

# Generate a random port number between 10000 and 65535
PORT=$(shuf -i 10000-65535 -n 1)

# Get the IP address of the Raspberry Pi
IP_ADDRESS=$(hostname -I | cut -d' ' -f1)

# Use ffmpeg to capture the webpage content and stream it via RTSP
ffmpeg -i "$URL" -vf "scale=$RESOLUTION" -r "$FRAMERATE" -f rtsp rtsp://$IP_ADDRESS:$PORT/live.sdp

echo "Streaming webpage content from $URL via RTSP on port $PORT. Access it at rtsp://$IP_ADDRESS:$PORT/live.sdp"
