#!/bin/bash

command -v docker > /dev/null || {
    echo "Docker is needed to run this script"
    exit 1
}

docker build -t dotfiles_test -f test/Dockerfile .
docker run -it --rm dotfiles_test
docker rmi dotfiles_test