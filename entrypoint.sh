#!/bin/sh -l
msg=$(make)
echo ::set-output name=msg::$msg
