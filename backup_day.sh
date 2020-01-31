#!/bin/bash
USER=borg
SERVER=10.128.0.6
REPOSITORY=$USER@$SERVER:BorgRepo
borg create -v --stats --list --compression lz4 $REPOSITORY::"etc-{now:%Y-%m-%d_%H:%M:%S}" /etc
borg prune -v --list --keep-daily=1 $REPOSITORY
