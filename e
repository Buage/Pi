#!/bin/bash

# Set the URL of the webpage you want to stream
URL="https://youtube.com"

# Set the output resolution (e.g., 1080x1920 for a 9:16 aspect ratio)
RESOLUTION="1080x1920"

# Set the output frame rate (e.g., 24 fps)
FRAMERATE="24"

# Generate a random port number between 10000 and 65535
PORT=$(shuf -i 10000-65535 -n 1)

# Get the IP address of the Raspberry Pi
IP_ADDRESS=$(hostname -I | cut -d' ' -f1)

# Use ffmpeg to capture the webpage content and stream it
ffmpeg -i "$URL" -vf "scale=$RESOLUTION" -r "$FRAMERATE" -f mpegts "udp://$IP_ADDRESS:$PORT"

echo "Streaming webpage content from $URL on port $PORT. Access it at udp://$IP_ADDRESS:$PORT"
