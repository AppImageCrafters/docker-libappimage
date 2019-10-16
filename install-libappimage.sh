#!/usr/bin/env bash

set -ex

git clone https://github.com/AppImage/libappimage.git --depth=1 --recursive
pushd libappimage
  cmake -DCMAKE_INSTALL_PREFIX=/usr/local -DCMAKE_BUILD_TYPE=Release -DBUILD_TESTING:bool=False
  make -j `nproc` install
popd

# clean up
rm -rf libappimage