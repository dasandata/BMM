#!/bin/bash

# Copyright (c) 2018 by Dasandata Corp.
# run as a root

ROOT_UID=0

if [ "$UID" != "$ROOT_UID" ]; then
  echo "Must be a root to run this script."
  exit 1
fi


if [ -z $1 ]; then
  echo "Usage: bash racadm_node_all.sh getniccfg"
  exit 1
fi


for NUM in 1 2 3
do echo "NODE $NUM"
racadm --nocertwarn -r node$NUM.idrac -u root -p calvin $1
done

echo "End"
