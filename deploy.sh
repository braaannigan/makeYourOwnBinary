#!/bin/bash
#
#   Copyright (C) 2020 Liam Brannigan
#
#Target can be 'dev', 'lab' or 'app' to run with an open port for the notebook or streamlit apps
TARGET="dev"

DOCKER_BUILDKIT=1 docker build -t make-your-own-binary .
# Mount directory one level up to access data directory inside container
# Docker requires absolute path for mounts, so need absolute path on host machine

if [ "${TARGET}" == "dev" ]; then
docker run  -it --rm  -v $(pwd):/usr/src/app make-your-own-binary:latest /bin/bash
fi

if [ "${TARGET}" == "lab" ]; then
docker run -it --rm -p 8891:8888  -v ${parent_path}:/usr/src/app make-your-own-binary:latest /bin/bash
fi

if [ "${TARGET}" == "app" ]; then
docker run -it --rm -p 8501:8501  -v ${parent_path}:/usr/src/app make-your-own-binary:latest /bin/bash
fi
