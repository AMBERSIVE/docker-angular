#!/bin/bash

unset DEPLOY
unset VERSION

usage()
{
  echo "Usage: $0 [ -d DEPLOY ] [ -v VERSIONNUMBER ]"
  exit 2
}

IMAGENAME=angular

while getopts 'd:v:h' c
do
  case $c in
    d) DEPLOY=$OPTARG;;
    v) VERSION=$OPTARG;;
    h|?) usage ;;
  esac
done

docker build --rm -f "dockerfile" -t ambersive/$IMAGENAME:latest "."

if [[ "$DEPLOY" == "true" ]] ; then
   echo "Deploy the latest image version."
   docker push ambersive/$IMAGENAME:latest   
fi

# Build the application in a seperate version
echo "Build ${VERSION} of the application."
if [[ "$VERSION" != "" ]] ; then
    echo "Build ${VERSION} of the application."
    docker build --rm -f "dockerfile" -t ambersive/$IMAGENAME:$VERSION "."
    if [[ "$DEPLOY" == "true" ]] ; then
        docker push ambersive/$IMAGENAME:$VERSION
    fi
fi