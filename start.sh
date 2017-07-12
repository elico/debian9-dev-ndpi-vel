#!/usr/bin/env bash

set -e

docker build -t local/debian9-ndpi .

rm ./destdir -rf

docker run -i -t -v `pwd`:/build/ local/debian9-ndpi

cd destdir
tar cvfJ xt_ndpi.tar.xz ./*
tar tvf xt_ndpi.tar.xz
cd -
