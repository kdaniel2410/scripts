#!/bin/bash

source .env

borg prune --list --stats --keep-daily 7 --keep-weekly 4

borg create --list --stats ::cron-{now} ~/docker