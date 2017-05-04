#!/bin/env python

import os
import glob

for filename in glob.iglob('/home/jeffreyxiao/dotfiles/weechat/**'):
    print filename
