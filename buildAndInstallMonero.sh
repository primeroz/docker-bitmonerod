#!/usr/bin/env bash
git clone https://github.com/monero-project/bitmonero.git
cd bitmonero
git checkout v0.8.8.6
NUM_CORES="$(grep -c ^processor /proc/cpuinfo)"
echo $('Building with ' $NUM_CORES ' cores')
make -j $NUM_CORES