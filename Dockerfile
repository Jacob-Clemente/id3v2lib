# Build Stage
FROM --platform=linux/amd64 ubuntu:20.04 as builder

## Install build dependencies.
RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y cmake

## Add source code to the build stage.
ADD . /id3v2lib
WORKDIR /id3v2lib

## TODO: ADD YOUR BUILD INSTRUCTIONS HERE.
RUN gcc fuzz.c src/*.c -Iinclude -Iinclude/id3v2lib -o fuzz

#Package Stage
FROM --platform=linux/amd64 ubuntu:20.04

## TODO: Change <Path in Builder Stage>
COPY --from=builder /id3v2lib/fuzz /
