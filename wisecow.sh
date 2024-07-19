#!/bin/bash

# Create a directory for the HTTP server
mkdir -p /usr/src/app
cd /usr/src/app

# Create an index.html file that will display the output of fortune | cowsay
while true; do
    if [ $# -eq 0 ]; then
        echo "<html><body><pre>$(/usr/games/fortune | /usr/games/cowsay)</pre></body></html>" > index.html
    else
        echo "<html><body><pre>$(/usr/games/cowsay "$@")</pre></body></html>" > index.html
    fi
    # Serve the directory with a simple HTTP server
    python3 -m http.server 4499
done

