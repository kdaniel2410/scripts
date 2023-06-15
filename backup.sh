#!/bin/bash
export BORG_PASSPHRASE=
export BORG_REPO=

export BORG_UNKNOWN_UNENCRYPTED_REPO_ACCESS_IS_OK=yes
export BORG_RELOCATED_REPO_ACCESS_IS_OK=yes

borg prune --list --stats --keep-daily 7 --keep-weekly 4

borg create --list --stats ::{now} ~/docker
