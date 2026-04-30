#!/bin/bash
set -e

directory=$(pwd)
cd /tmp
wget "https://web.archive.org/web/20240309015235if_/https://majicdave.com/share/blockheads_server171.tar.gz" -O blockheads_server171.tar.gz
tar xzvf blockheads_server171.tar.gz

patchelf --replace-needed libgnustep-base.so.1.24 libgnustep-base.so.1.31 blockheads_server171
patchelf --replace-needed libobjc.so.4.6 libobjc.so.4 blockheads_server171
patchelf --replace-needed libgnutls.so.26 libgnutls.so.30 blockheads_server171
patchelf --replace-needed libgcrypt.so.11 libgcrypt.so.20 blockheads_server171
patchelf --replace-needed libxml2.so.2 libxml2.so.16 blockheads_server171
patchelf --replace-needed libffi.so.6 libffi.so.8 blockheads_server171
patchelf --replace-needed libicui18n.so.48 libicui18n.so.78 blockheads_server171
patchelf --replace-needed libicuuc.so.48 libicuuc.so.78 blockheads_server171
patchelf --replace-needed libicudata.so.48 libicudata.so.78 blockheads_server171
patchelf --replace-needed libdispatch.so libdispatch.so.0 blockheads_server171

mkdir -p ~/.local/bin
mv blockheads_server171 ~/.local/bin

cd $directory
