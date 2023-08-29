#!/bin/bash

nohup bash -c 'while true; do setxkbmap -option caps:swapescape; sleep 2; done' >/dev/null &
