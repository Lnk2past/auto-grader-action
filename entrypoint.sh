#!/bin/sh -l
msg=$(make 2>&1)
echo ::set-output name=msg::$msg
