#!/usr/bin/env bash
#
# Make sure we have the ENV set correctly
#
pushd /src
echo "import of bgt started"
export PYTHONPATH=$PYTHONPATH:`pwd`
python fme/core.py
popd