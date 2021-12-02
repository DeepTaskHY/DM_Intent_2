#!/bin/bash

if [ ! -d dm_intent/ckpt ]; then
  sudo apt-get install unzip
  sudo apt-get install curl
  echo "Model Download PATH : "pwd
  FILEID='1O_lDMEUMSZ7F0MbDHlw0T6FhQ6m66rm0'
  FILENAME='hyu_intent.zip'
  curl -c /tmp/cookie -s -L "https://drive.google.com/uc?export=download&id=${FILEID}" > /dev/null
  curl -Lb /tmp/cookie "https://drive.google.com/uc?export=download&confirm=`awk '/download/ {print $NF}' /tmp/cookie`&id="${FILEID} -o ${FILENAME}
  rm /tmp/cookie
  rm -rf ckpt
  unzip $FILENAME
  mv hyu_intent/configuration.json .
  mv hyu_intent/ckpt .
  rm -r hyu_intent
  rm $FILENAME
  echo "Modelfile Download Complete!!"
fi

