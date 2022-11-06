#!/bin/bash
docker build -f Dockerfile.jeus --no-cache --force-rm -t centos/jeus8.5:b266025 .
