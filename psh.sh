#!/bin/bash

ssh -q root@r510   $1             >&1 2>&1|sed "s/^/"`echo R510|cut -f 1 -d '.'|cut -c -13`:" /g"


~
