#!/bin/sh -l

build_output=$( make 2>&1 )
if [ $? -ne 0 ]
then
  echo ::set-output name=build_output::$build_output
  echo ::set-output name=test_output::
  echo ::set-output name=score::'0'
  exit 0
fi

test_output=$( make test 2>&1 )
if [ $? -ne 0 ]
then
  echo ::set-output name=build_output::$build_output
  echo ::set-output name=test_output::$test_output
  echo ::set-output name=score::'7.5'
  exit 0
fi

echo ::set-output name=build_output::$build_output
echo ::set-output name=test_output::$test_output
echo ::set-output name=score::'15'
exit 0
