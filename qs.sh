qs() {
  local QS_PATH=~/.quick-spaces
  local TOPICS_PATH=$QS_PATH/topics
  local LINKS_PATH=$QS_PATH/links

  mkdir -p $LINKS_PATH
  mkdir -p $TOPICS_PATH

  if [ "$1" = "topic" ]; then
    if [ "$2" = "add" ]; then
      if [ -d $TOPICS_PATH/$3/@dirs ]; then 
        echo "Topic '$3' already exists"
      else 
        mkdir -p $TOPICS_PATH/$3/@dirs
        echo "Added topic '$3'"
      fi
    fi
  elif [ "$1" = "template" ]; then
    if [ "$2" = "copy" ]; then
      if [ -d $3 ]; then
        rm -r $TOPICS_PATH/$4/@template
        mkdir -p $TOPICS_PATH/$4/@template
        cp -r $3/* $TOPICS_PATH/$4/@template
        echo "Copied '$3' to '$4' template"
      else
        echo "Error: $3 is not a directory"
      fi
    fi
  elif [ "$1" = "create" ]; then
    local DNAME=$(date -Is -u)
    if [ -d $TOPICS_PATH/$2 ]; then
      if [ -d $TOPICS_PATH/$2/@template ]; then
        cp -r $TOPICS_PATH/$2/@template $TOPICS_PATH/$2/@dirs/$DNAME
      else 
        mkdir $TOPICS_PATH/$2/@dirs/$DNAME
      fi
      if [ -L $LINKS_PATH/$(basename $2) ]; then
        rm $LINKS_PATH/$(basename $2)
      fi
      ln -s $TOPICS_PATH/$2/@dirs/$DNAME $LINKS_PATH/$(basename $2)     
      echo "Created new '$2' directory"
    else
      echo "Error: '$2' is not a topic"
    fi
  fi
}
