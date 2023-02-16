#!/bin/bash

rm -rf dist
docker run -it -v ${PWD}:/project -w /project --rm --user $(id -u) --name node-devenv node:14 ./build.sh
