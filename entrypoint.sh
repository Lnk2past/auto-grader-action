#!/bin/sh -l
set +e
msg=$( make test 2>&1)
