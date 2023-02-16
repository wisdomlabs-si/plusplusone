#!/bin/bash

ROOT_DIR=/usr/share/nginx/html/designer

# Replace env vars in JavaScript files
echo "Replacing env constants in JS"
cp -f $ROOT_DIR/index.orig.html $ROOT_DIR/index.html
sed -i 's|%API_GRAPH_DESIGNER_SERVICE%|'${API_GRAPH_DESIGNER_SERVICE}'|g' $ROOT_DIR/index.html

echo "Starting Nginx"
nginx -g 'daemon off;'