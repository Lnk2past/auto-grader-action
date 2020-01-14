#!/bin/sh -l

cd /github/workspace

build_output=$( make 2>&1)
if [ $? -ne 1 ]
then
  exit 1
fi

test_output=$( make test 2>&1)
if [ $? -ne 1 ]
then
  exit 2
fi

exit 0
