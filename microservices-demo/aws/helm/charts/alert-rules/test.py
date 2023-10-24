#!/usr/bin/env python 

import pandas as pd

with open('all_events.txt') as f:
  last = [line.split()[1] for line in f] 
  f.close() 

with open('all_events.txt') as f:
  level = [line.split()[2] for line in f] 
  f.close()

level = pd.DataFrame({'level':level}) 
level['last'] = pd.DataFrame({'last':last})

print(level[1::])
