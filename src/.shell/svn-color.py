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

import sys, subprocess

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
    'M'     : "31",     # red
    '?'     : "37",     # grey
    'A'     : "32",     # green
    'X'     : "33",     # yellow
    'C'     : "30;41",  # black on red
    '-'     : "31",     # red
    'D'     : "31;1",   # bold red
    '+'     : "32",     # green
}

def colorize(line):
    for status in statusColors:
        if line.startswith(status):
            return ''.join(("\033[", statusColors[status], "m", line, "\033[m"))
    else:
        return line

if __name__ == '__main__':
    command = sys.argv
    command[0] = '/usr/bin/svn'
    subcommand = '' if len(command) < 2 else command[1]
    if subcommand in colorizedSubcommands and sys.stdout.isatty():
        task = subprocess.Popen(command, stdout=subprocess.PIPE)
        for line in task.stdout:
            sys.stdout.write(colorize(line))
    else:
        task = subprocess.Popen(command)
    task.communicate()
    sys.exit(task.returncode)
