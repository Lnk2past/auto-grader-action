#!/bin/sh -l

cd /github/workspace

msg=$( make 2>&1)
if [ $? -ne 1 ]
then
  echo "Score: 0/15" > report.txt
  echo "Build failure:" >> report.txt
  echo $msg >> report.txt
  exit 3
fi

msg=$( make test 2>&1)
if [ $? -ne 1 ]
then
  echo "Score: 7.5/15" > report.txt
  echo "Test failure:" >> report.txt
  echo $msg >> report.txt
  exit 4
fi

echo "Score: 15/15" > report.txt

exit 0
