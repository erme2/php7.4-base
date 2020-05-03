#!/usr/bin/env bash

IMAGENAME="php7.4-base"
DOCKERUSER="erme2"

docker build -t $IMAGENAME .
docker tag $IMAGENAME $DOCKERUSER/$IMAGENAME
docker push $DOCKERUSER/$IMAGENAME
