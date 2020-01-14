#!/bin/sh -l
set +e
msg=$( ls -la )
echo ::set-output name=msg::
