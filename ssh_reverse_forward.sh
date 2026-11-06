#!/bin/bash
ssh mango 'rm -fv /home/users/uqklam5/sock'
ssh -R /home/users/uqklam5/sock:localhost:22 mango -N -T
