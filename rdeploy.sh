#!/bin/bash

if [[ ! -d "build" || ! -d "build/default" ]]; then
    echo "First, you must build the webpage with:"
    echo "    npm run build"
    exit 1
fi

cd build/default
chmod -R g+r ./
chmod -R u+r ./
sftp -P 2222 hackersweek@hackersweek.es <<- EOM
put -p index.html
put -p bower.json
put -p manifest.json
put -p service-worker.js
put -p -r bower_components
put -p -r images
put -p -r src
EOM
