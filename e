#!/bin/bash

# Set the URL of the webpage you want to stream
URL="http://example.com"

# Set the output resolution (e.g., 1080x1920 for a 9:16 aspect ratio)
RESOLUTION="1080x1920"

# Set the output frame rate (e.g., 24 fps)
FRAMERATE="24"

# Set the desired port for streaming
DEST_PORT="8554"

# Get the IP address of the Raspberry Pi
IP_ADDRESS=$(hostname -I | cut -d' ' -f1)

# Use ffmpeg to capture the webpage content and stream it via UDP
ffmpeg -i "$URL" -vf "scale=$RESOLUTION" -r "$FRAMERATE" -f mpegts "udp://$IP_ADDRESS:$DEST_PORT"

echo "Streaming webpage content from $URL via UDP on $IP_ADDRESS:$DEST_PORT"
