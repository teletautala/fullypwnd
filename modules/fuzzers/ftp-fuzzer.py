#!/usr/bin/python
import socket
import re
import os
import sys
import getopt
# This code gets the grandparent directory (../..).
# This is a loop so I can use it in other places.
# The levels of embedding may change and this is 
# flexible enough for me.  There may be a better way
# but it will work for now.

counter = 1
working_dir = "."
while (counter <= 2):
    working_dir = os.path.dirname(os.path.abspath(working_dir))
    counter += 1
base_dir = working_dir
os.sys.path.insert(0,base_dir)

from debug import Debug

options = ('t', 'p', 'u', 'v', 'vv', 'vvv', 'd', 'dd')
long_options = ('port=') 
ip = '127.0.0.1'
port = 21
receive_bytes = 1024
username = 'mbishop'
password = 'sneakers2012'

debug = Debug()
debug.level = 0

root_msg = """
You must have root privileges to run this script!
"""

usage = """
[*] Usage: %s -t <target ip> --port <port> -u <username> -p <password> [other options]
    -d debug level 1
    -dd debug level 2
""" % sys.argv[0]

# Create an array of 30 buffers, from 100 to 2000, with increments of 100.
buffer=["A"]
counter=100
while len(buffer) <= 30:
    buffer.append("A"*counter)
    counter = counter + 100

# Define the FTP commands to be fuzzed
commands = ["MKD", "CWD", "STOR"]

def fuzz_ftp(ip, port, username, password):
    # Run the fuzzing loop
    for command in commands:
        for string in buffer:
            print "Fuzzing " + command + " with length: " + str(len(string))
            s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
            connect = s.connect((ip, port)) # this needs to be a two element list
            banner = s.recv(receive_bytes) # receive up to receive_bytes bytes
            s.send('USER ' + username + '\r\n') # initiate login sequence
            s.recv(receive_bytes)
            s.send('PASS ' + password + '\r\n')
            login_msg = s.recv(receive_bytes)
            pattern = re.compile('230')
            if re.match(pattern, login_msg):
                s.send(command + ' ' + string + '\r\n') # evil buffer
                s.recv(receive_bytes)
                s.send('QUIT\r\n')
                s.close()
            else:
                print "login failed. :("
                break 

def test_login(ip, port, username, password):
    s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    connect = s.connect((ip, port))
    banner = s.recv(receive_bytes)
    print banner
    s.send('USER ' + username + '\r\n')
    s.recv(receive_bytes)
    s.send('PASS ' + password + '\r\n')
    login_msg = s.recv(receive_bytes)
    pattern = re.compile('230')
    if re.match(pattern, login_msg):
        fuzz_ftp(ip, port, username, password)
    else:
        print "Invalid username/password pair: " + username + ":" + password

def main():
    if debug.level > 0:
        debug.msg
    
    flags, other = getopt.getopt(sys.argv[1:], options, long_options)
    for flag in flags:
        if flag in ('-t'):
            ip = value
        elif flag in ('-d'):
            debug.level = 1
        elif flag in ('-dd'):
            debug.level = 2
        elif flag in ('--port'):
            port = value
        elif flag in ('-u'):
            username = value
        elif flag in ('-p'):
            password = value
    
    if ip is not None and port is not None and username is not None and password is not None:
        test_login(ip, port, username, password)
    else:
        print usage
        sys.exit(1)
        
if __name__ == "__main__":
    if os.getuid() == 0:
        main()
    else:
        print root_msg
        sys.exit(1)
