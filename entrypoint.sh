#!/bin/sh -l
msg=$(ls -la)
echo ::set-output name=msg::$msg
