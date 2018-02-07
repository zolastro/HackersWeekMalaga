#!/bin/bash

if [[ ! -d "build" || ! -d "build/default" ]]; then
    echo "First, you must build the webpage with:"
    echo "    npm run build"
    exit 1
fi

cd build/default
sftp -P 2222 hackersweek@hackersweek.es <<- EOM
put index.html
put bower.json
put manifes.json
put service-worker.js
put -r bower_components
put -r images
put -r src
EOM