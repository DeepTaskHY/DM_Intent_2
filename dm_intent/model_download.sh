#!/bin/bash
MODELPATH=$(dirname $(realpath $0))
FILEID="1O_lDMEUMSZ7F0MbDHlw0T6FhQ6m66rm0"
FILENAME="hyu_intent.zip"
sudo apt-get install -y unzip curl
echo "Model Download PATH : "${MODELPATH}
curl -c /tmp/cookie -s -L "https://drive.google.com/uc?export=download&id=${FILEID}" > /dev/null
curl -Lb /tmp/cookie "https://drive.google.com/uc?export=download&confirm=`awk '/download/ {print $NF}' /tmp/cookie`&id="${FILEID} -o ${FILENAME}
rm /tmp/cookie
rm -rf ckpt
unzip $FILENAME
mv hyu_intent/configuration.json ${MODELPATH}
mv hyu_intent/ckpt dm_intent/ ${MODELPATH}
rm -r hyu_intent
rm $FILENAME
echo "Modelfile Download Complete!!"
