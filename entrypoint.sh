#!/bin/sh -l

cd /github/workspace

msg=$( make test 2>&1)
