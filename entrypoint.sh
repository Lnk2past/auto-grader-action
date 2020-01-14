#!/bin/sh -l

 > report.txt

build_output=$( make 2>&1)
if [ $? -ne 1 ]
then
  echo "Score: 0/15" > report.txt
  echo "Build failure:" >> report.txt
  echo $build_output >> report.txt
  exit 1
fi

test_output=$( make test 2>&1)
if [ $? -ne 1 ]
then
  echo "Score: 7.5/15" > report.txt
  echo "Test failure:" >> report.txt
  echo $test_output >> report.txt
  exit 2
fi

echo "Score: 15/15" > report.txt

exit 0
