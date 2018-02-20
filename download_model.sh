#!/bin/bash

# md5sum b1527543a0ee22c23fca44cefdf48531
# sha1sum 4206897fd900b6a5509491900a2c6fb521bf272e

FILENAME="completionnet_places2.t7"
FILEURL="http://hi.cs.waseda.ac.jp/~iizuka/data/completionnet_places2.t7"
FILEMD5="b1527543a0ee22c23fca44cefdf48531"

echo "Downloading the completion model (47M)..."
wget --continue -O "$FILENAME" -- "$FILEURL"

echo "Checking integrity (md5sum)..."
OS=`uname -s`
if [ "$OS" = "Darwin" ]; then
  CHECKSUM=`cat $FILENAME | md5`
else
  CHECKSUM=`md5sum $FILENAME | awk '{ print $1 }'`
fi

if [ "$CHECKSUM" != "$FILEMD5" ]; then
  echo "Integrity check failed. File is corrupt!"
  echo "Try running this script again and if it fails remove '$FILENAME' before trying again."
  exit 1
fi 
echo -e "Download finished successfully!"
