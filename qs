#!/bin/bash

QS_PATH=~/.quick-spaces
TOPICS_PATH=$QS_PATH/topics
LINKS_PATH=$QS_PATH/links

mkdir -p $LINKS_PATH
mkdir -p $TOPICS_PATH

if [ "$1" = "topic" ]; then
  if [ -d $TOPICS_PATH/"$2"/@dirs ]; then
    echo "Topic '$2' already exists"
  else
    mkdir -p $TOPICS_PATH/"$2"/@dirs
    echo "Added topic '$2'"
  fi

elif [ "$1" = "tree" ]; then
  tree $QS_PATH

elif [ "$1" = "create" ]; then
  DNAME=$(date -Is -u)
  if [ -d $TOPICS_PATH/"$2" ]; then
    if [ -d $TOPICS_PATH/"$2"/@template ]; then
      cp -r $TOPICS_PATH/"$2"/@template $TOPICS_PATH/"$2"/@dirs/"$DNAME"
    else
      mkdir $TOPICS_PATH/"$2"/@dirs/"$DNAME"
    fi
    if [ -L $LINKS_PATH/"$(basename "$2")" ]; then
      rm $LINKS_PATH/"$(basename "$2")"
    fi
    ln -s $TOPICS_PATH/"$2"/@dirs/"$DNAME" $LINKS_PATH/"$(basename "$2")"
    echo "Created new '$2' directory"
  else
    echo "Error: '$2' is not a topic"
  fi
fi
