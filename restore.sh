#!/bin/bash
export BORG_PASSPHRASE=
export BORG_REPO=

LATEST_ARCHIVE=$(borg list | awk 'END {print $1}')

borg export-tar --list ::$LATEST_ARCHIVE latest.tar.gz