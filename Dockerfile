# Build Stage
FROM --platform=linux/amd64 ubuntu:20.04 as builder

## Install build dependencies.
RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y cmake

## Add source code to the build stage.
ADD . /id3v2lib
WORKDIR /id3v2lib

## TODO: ADD YOUR BUILD INSTRUCTIONS HERE.
RUN gcc  id3v2lib-fuzz.c src/*.c -Iinclude -Iinclude/id3v2lib -o id3v2lib-fuzz

#Package Stage
FROM --platform=linux/amd64 ubuntu:20.04

## TODO: Change <Path in Builder Stage>
COPY --from=builder /id3v2lib/id3v2lib-fuzz /
