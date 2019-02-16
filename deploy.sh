#!/bin/bash
set -x

commitMSG=$1

hugo && git commit -am "$commitMSG" && git push origin master && cd public && git add . && git commit -am "$commitMSG" && git push origin gh-pages && cd ..
