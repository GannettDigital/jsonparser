#!/usr/bin/env bash
set -e
echo "" > coverage.txt
for d in $(go list ./... | grep -v vendor); do
    go test -v -race -parallel 4 -coverprofile=profile.out -covermode=atomic -coverpkg=github.com/GannettDigital/jsonparser $d
    if [ -f profile.out ]; then
        cat profile.out >> coverage.txt
        rm profile.out
    fi
done