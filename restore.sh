#!/bin/bash
export BORG_PASSPHRASE=
export BORG_REPO=

export BORG_UNKNOWN_UNENCRYPTED_REPO_ACCESS_IS_OK=yes
export BORG_RELOCATED_REPO_ACCESS_IS_OK=yes

LATEST_ARCHIVE=$(borg list | awk 'END {print $1}')

borg export-tar --list ::$LATEST_ARCHIVE latest.tar.gz
