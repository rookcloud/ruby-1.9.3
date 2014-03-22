#!/bin/bash
set -e
IMAGE=ruby-1.9.3
echo Building $IMAGE
exec docker build -t rook/$IMAGE ./build
