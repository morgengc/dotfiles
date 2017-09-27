#!/usr/bin/env python
# -*- encoding: utf-8 -*-

"""
 Author: Saophalkun Ponlu (http://phalkunz.com)
 Contact: phalkunz@gmail.com
 Date: May 23, 2009
 Modified: June 15, 2009
 
 Additional modifications:
 Author: Phil Christensen (http://bubblehouse.org)
 Contact: phil@bubblehouse.org
 Date: February 22, 2010

 Author: Gao Chao
 Contact: gaochao.morgen@gmail.com
 Date: September 27, 2017
"""

import os, sys, re, subprocess

tabsize = 4

colorizedSubcommands = (
    'status',   # status
    'stat',     # status
    'st',       # status
    'add',      # add
    'delete',   # delete
    'del',      # delete
    'remove',   # delete
    'rm',       # delete
    'diff',     # diff
    'di',       # diff
)

statusColors = {
    "M"     : "31",     # red 
    "\?"    : "37",     # grey
    "A"     : "32",     # green
    "X"     : "33",     # yellow
    "C"     : "30;41",  # black on red
    "-"     : "31",     # red
    "D"     : "31;1",   # bold red
    "\+"    : "32",     # green
}

def colorize(line): 
    for color in statusColors:
        if re.match(color, line):
            return ''.join(('\033[01;', statusColors[color], 'm', line, '\033[00m'))
    else:
        return line

def escape(s):
    s = s.replace('$', r'\$')
    s = s.replace('"', r'\"')
    s = s.replace('`', r'\`')
    return s

passthru = lambda x: x
quoted = lambda x: '"%s"' % escape(x)

if __name__ == "__main__":
    cmd = ' '.join(['svn']+[(passthru, quoted)[' ' in arg](arg) for arg in sys.argv[1:]])
    print(cmd)
    output = subprocess.Popen(cmd, shell=True, stdout=subprocess.PIPE)
    cancelled = False
    for line in output.stdout:
        line = line.expandtabs(tabsize)
        if(sys.argv[1] in colorizedSubcommands):
            line = colorize(line)
        try:
            sys.stdout.write(line)
        except:
            sys.exit(1)
