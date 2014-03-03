#!/bin/bash

BASEDIR=$(dirname $(readlink -f $0))
IMAGE=$(basename $BASEDIR)
echo Building $IMAGE
docker build -t rook/$IMAGE ./build
