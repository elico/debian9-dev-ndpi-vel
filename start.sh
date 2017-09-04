#!/usr/bin/env bash

set -e
set -x

if [ "$1" == "no-cache" ]; then
  docker build --no-cache -t local/debian9-ndpi .
else
  docker build -t local/debian9-ndpi .
fi

rm ./destdir -rf

docker run -i -t -v `pwd`:/build/ local/debian9-ndpi

cd destdir
tar cvfJ xt_ndpi.tar.xz ./*
tar tvf xt_ndpi.tar.xz
cd -

set +x
