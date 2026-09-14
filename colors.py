#!/usr/bin/env python3

import sys

with open(sys.argv[1], 'r') as f:
    for l in f:
        l = l.strip()
        xs = l.split('Color=', 1)
        if len(xs) == 2:
            r,g,b = [int(x) for x in xs[1].split(',')]
            print(f'#{r:02x}{g:02x}{b:02x}')
        elif l:
            print(l)
