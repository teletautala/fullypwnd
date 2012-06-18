#!/usr/bin/python
import sys
import os
from datetime import date
import subprocess

#global variables
workingFilename = ""
archiveDir = "./archive/"
debugLevel = 0

usage = '''
[*] Usage: %s <filename> [-v]" % sys.argv[0]
  This script receives the file to be backed up and
  the optional verbosity level."
'''

# Be friendly and give message if a file isn't given
if len(sys.argv) < 2:
    print usage 
    sys.exit(1)

if len(sys.argv) > 3:
    print "[*] You have exceeded the allowable amount of arguments."
    print usage
    sys.exit(1)

# store filename
fileFound = False
for arg in sys.argv:
    if arg == "-v":
        debugLevel = 1
    if os.path.exists(arg):
        workingFilename = arg
        fileFound = True

# check to see if file exists
if fileFound:
    base, extension = os.path.splitext(workingFilename)
    today = date.today().isoformat()
    newBase = base + "-" + today + extension	
    newPath = archiveDir + newBase
    # this is where the copy happens
    subprocess.call(["cp", "-p", workingFilename, newPath])
    if debugLevel == 1:
        subprocess.call(["ls", "-l", workingFilename])
        subprocess.call(["ls", "-l", newPath])
else:
    print "Could not find %s." % filename
    sys.exit(1)
