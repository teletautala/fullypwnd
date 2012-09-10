--
-- PostgreSQL database dump
--

-- Started on 2012-09-10 15:56:31 MDT

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = off;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET escape_string_warning = off;

SET search_path = public, pg_catalog;

--
-- TOC entry 1895 (class 0 OID 0)
-- Dependencies: 141
-- Name: host_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('host_id_seq', 21, true);


--
-- TOC entry 1896 (class 0 OID 0)
-- Dependencies: 143
-- Name: host_service_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('host_service_id_seq', 191, true);


--
-- TOC entry 1897 (class 0 OID 0)
-- Dependencies: 155
-- Name: nmap_service_alias_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('nmap_service_alias_id_seq', 3, true);


--
-- TOC entry 1898 (class 0 OID 0)
-- Dependencies: 145
-- Name: os_signature_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('os_signature_id_seq', 1, false);


--
-- TOC entry 1899 (class 0 OID 0)
-- Dependencies: 157
-- Name: product_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('product_id_seq', 1, true);


--
-- TOC entry 1900 (class 0 OID 0)
-- Dependencies: 160
-- Name: scan_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('scan_id_seq', 1, false);


--
-- TOC entry 1901 (class 0 OID 0)
-- Dependencies: 147
-- Name: service_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('service_id_seq', 1, true);


--
-- TOC entry 1902 (class 0 OID 0)
-- Dependencies: 149
-- Name: service_script_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('service_script_id_seq', 20, true);


--
-- TOC entry 1903 (class 0 OID 0)
-- Dependencies: 151
-- Name: working_exploit_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('working_exploit_id_seq', 675, true);


--
-- TOC entry 1889 (class 0 OID 25007)
-- Dependencies: 153
-- Data for Name: exploit; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY exploit (exploit_sha1, exploit_githash, preliminary_function, source_file) FROM stdin;
f167861ff88b8db8d6803042dbde95f62326054a 	522cd2b6f979958181d6ccd78f18a37388bd81ed 	\N	./exploitdb/platforms/windows/remote/2223.c
d5ad116d9d86beffce9df26cad6538a76ca7fc10 	161ffd1302b363edcd707979cf3aaeb039fb9ec0 	\N	./exploitdb/platforms/windows/remote/9303.c
a4749616f61a69aeb196541900fe5af6fbe4f014 	54d3c52bb88e253c5c76160b7ced3d4f8a4fe756 	\N	./exploitdb/platforms/windows/remote/1180.c
fe8e057e84ec95b79284b7edff39adcaa2457620 	1925aa47511c44ffaea40830d703af37e0428289 	\N	./exploitdb/platforms/windows/remote/1179.c
d37825b9b438c79b9b936c608168fd316c70a945 	42e6b78f19bbd52fb77551c77394556c8b232f97 	\N	./exploitdb/platforms/windows/remote/1149.c
9f3d5e09a83033d8864e18a0a2b53bb14fbc0373 	e68d9fed5b32646a4b161197f4b54f48838acb4c 	\N	./exploitdb/platforms/windows/remote/7132.py
ac55a73ddbfed03283bcf5c8c32084881ecc0c00 	da7140d993f77c121f0af9ee8e76a5084ad3faae 	\N	./exploitdb/platforms/windows/remote/9816.py
259b1ab372ef9bfb313b41d2c109472b44cc2403 	3b731c283cbec84276a2c28b2bb3b931c5c5ebd7 	\N	./exploitdb/platforms/windows/remote/9318.py
c096d6d09b501e704bf068b88d8682022bf783ab 	d8e9bbd680007febca45eb199a2ffc0aa378fa3a 	\N	./exploitdb/platforms/windows/remote/18535.py
6de705d56ab5b3aaa6485318527c3f440c6bf033 	c831b08c02c11995ef763401c5e1e7fd4bce723b 	\N	./exploitdb/platforms/windows/local/11787.py
59daaae7fb253ef1aeb85c35939ffa92c06a87ab 	2e5992393f25645274d48f2f906aa53bae91400b 	\N	./exploitdb/platforms/windows/remote/76.c
e6e8ca7649bbd38bc95904d7c849f8993aa45646 	1c8fcd4e39a36aecb41f793b146f1a6b112ab63d 	\N	./exploitdb/platforms/windows/remote/668.c
51357f34f9cea7c8e5be26632d05446726a1949c 	2d4bc15729e9f2175a7cf280f7235bc8cbcfc9a1 	\N	./exploitdb/platforms/windows/remote/1330.c
5a8e4a71479ef86296c2d964654649db36a3c8b6 	76eee4edd53f84ef5f573e5dd09c79171f5aece9 	\N	./exploitdb/platforms/windows/remote/1313.c
2e783ad8ad2afef8765f173df81ce523e816b040 	ae9d80b6038fc197d30caf619566fa48ad200253 	\N	./exploitdb/platforms/windows/remote/66.c
7c33fcfb5cc1f8aac06c3e6af94691344517bdac 	a27456896429d2123d3f471b9dc80a36fe94f864 	\N	./exploitdb/platforms/windows/remote/190.c
82339143e0961746d273b56731a4d9e09ee001db 	ab37349f2707c11f6618181b4c93083e711bb63e 	\N	./exploitdb/platforms/windows/remote/670.c
3fe361bfffe8e8fcd1ffb03c9e1051aa769aac5d 	3d2b2b643f4b6e027ea89c666eccf719ea7bd0d8 	\N	./exploitdb/platforms/windows/remote/3616.py
3c705e668973460f9154584d5db041c0b76762ae 	a995ffdc923612c7ffd05e375a4c77ffbf3a7243 	\N	./exploitdb/platforms/windows/remote/4027.py
5e154bbe4cdca316faf2feac3098768ee9a20368 	2a86201b22900b67f6ca36f12073df2de59e04a7 	\N	./exploitdb/platforms/windows/remote/8934.py
e42ef446725eeb29485959e4bb348ad652ac0f75 	30bc12aa1d005640abdda58fb77f48ffee2831c6 	\N	./exploitdb/platforms/windows/remote/8354.py
99653444b894cf915a25dd825f031510239b8d04 	67389225fc67b32498b2f86cceb289cfd21322df 	\N	./exploitdb/platforms/windows/remote/3531.py
93a014ba4da4cbbdd4dc7f67daa079c84d19fff4 	60742b4e6169e2d51f79d8fd93d351f6b75cf738 	\N	./exploitdb/platforms/windows/remote/4866.py
ec9624ca1be99c05bee38adfe8b3bb9835e6f0a8 	37437384f5d9215d59ca83ab3ce7102046201007 	\N	./exploitdb/platforms/windows/remote/10394.py
d6490fbb0d6d1e3ca6b541df196b932f9dab6122 	d57560f2dbfb5cf86b4f6763dd39e93ab64a3095 	\N	./exploitdb/platforms/windows/remote/3737.py
6fc4f35f532560af91cf5f35224532fdbc1a3425 	c0ba21775337387aa010d1e5819266b28111ddfa 	\N	./exploitdb/platforms/windows/local/14576.c
278fda6ebc195d552e553d5f42b5f1caf2845e8f 	e6957bbb61e4e475aed548005cf5ea3de91e758c 	\N	./exploitdb/platforms/windows/local/2872.c
a99547c0278985346b5d9e66eb46269770895ba8 	76d215dd35bdf13d52be09dfefaa24a6657f6e3c 	\N	./exploitdb/platforms/windows/local/10745.c
1243c4a540fa2564ad0884f577c124483d470970 	b9c848f42239f89d438b0c5dc8d2d3650ba84769 	\N	./exploitdb/platforms/windows/local/10646.c
d7720335674db641e73c449c8d2b6758570341db 	45182f99b457043c9f4e2c9c7c163a1e435df5ea 	\N	./exploitdb/platforms/windows/local/11112.c
aad00c381894aa85ff557fdc4422c31b1bc981cc 	01b06ef0023d70de1a5ef5aa698f1a11c5dbf75d 	\N	./exploitdb/platforms/windows/local/11139.c
182cf3ff83f24387568f39f561ffc4f115085677 	2759ef96cfcee54fc662310bc2d6fb8684b5f71f 	\N	./exploitdb/platforms/windows/local/10787.py
3e6b974aeb73d08f7dba407cf5737fb154a3530e 	44f251d49bf6fe507cdc6d7ecc937c9bab1b9eca 	\N	./exploitdb/platforms/windows/local/11872.py
dde04983ddb8d86ab2b8caa1a810a928e1b68f24 	6332218530aced485b8fe673ec8b7398fb96031d 	\N	./exploitdb/platforms/windows/local/11797.py
fe3684acd8eaa216a481d07a53624cc8595a407a 	439a92be29d1f1f129e0651e8fcce30282bd623f 	\N	./exploitdb/platforms/windows/local/11834.py
60c989b4aa2f50c65c14298d6a46f9f7e3b56017 	bdd71aaa0da9dce4ba11303f17084fae7ab1a67a 	\N	./exploitdb/platforms/windows/local/9865.py
6b12bf3e5ee7c4e4e74a5f8f457667b88e77c318 	82aab79efbeb82e89c961f8fffae88280a7077e2 	\N	./exploitdb/platforms/windows/local/15287.py
c130be307b0eafcabc39cc394b8fab2562f29a36 	6fbaeba14b86619ca2049cfa757534bf13d8f662 	\N	./exploitdb/platforms/windows/local/17732.py
214c4846f6a58cf9c16fcfa2e499f27f088b1498 	a3212c659a30cedbb56c8956f78f5cd082d29948 	\N	./exploitdb/platforms/windows/local/11682.py
7d159010efebe4ab3a42ce8c95f00fcf004d1b00 	387d2bb553fd2e47b1f3df32b64fb30f105f8314 	\N	./exploitdb/platforms/windows/local/8662.py
1d9c496bdf7d0d8e16dadd4c714d9af1b18067e1 	5ecb63be7fbc35f6fa7fc4a302678c55b08da5a4 	\N	./exploitdb/platforms/windows/remote/158.c
eec2b6a53273842c4950191c75401d05c6890113 	dee58d0736da612183e6d37712b6c72463a0ad15 	\N	./exploitdb/platforms/windows/remote/4053.c
fe22c71b7a859ff9a1a3d911414727b24eb6418c 	fe96731dc829be09f247efd55faf061e169070d0 	\N	./exploitdb/platforms/windows/remote/618.c
304e85dd889eef15be611f6d5b036d7c8c1a7346 	cd96712e33bd597e5ec81b7e8895e7803cf5c83c 	\N	./exploitdb/platforms/windows/remote/2753.c
33934dce1de9b9295ce8f1d2c3a2cc7623722fbb 	89bf77b83f14a680df29cf1416a4143411951c31 	\N	./exploitdb/platforms/windows/remote/2358.c
4dd369e92fc3c5de0ef16416166f2ebbd35eda2b 	59283fe81822536b76c8887c8202498acd0e7e93 	\N	./exploitdb/platforms/windows/remote/3893.c
c5fafdced373383866c0d0b7c964ac08bf1be71a 	6e667c756891419e55628ddecfd0231644e39cca 	\N	./exploitdb/platforms/windows/remote/8283.c
0de58013d23cf6d19f0234a2cf304df10852716a 	2e18e54aa63ecd7b3a0b253f99661149b2ab3338 	\N	./exploitdb/platforms/windows/remote/2460.c
5dc5e69d9982f29a263ef31063921af05082c3a9 	0ea4ae5816aec8d65bd60a5f32ad4ad1fa075460 	\N	./exploitdb/platforms/windows/remote/822.c
e216cc3589b4e4778e0fdc4718f8a5faeb5bba64 	3ea472a4ea806880a3b67a0b9d2003deec3fdeca 	\N	./exploitdb/platforms/windows/remote/827.c
79fee06649910a5b13ba649630f4cf6531d151c1 	4cddb42ba4413b92e15cd88a53163e312a889846 	\N	./exploitdb/platforms/windows/remote/4052.c
882a0e96e19523befb030400c7418b290be220c8 	9503255594ba5a584e6404a6acad126b651746ae 	\N	./exploitdb/platforms/windows/remote/297.c
aa22774f7a113e4a4029d4f668807b58087a6f0b 	b24a533ac69aac110f926943272ba4dee66ad48c 	\N	./exploitdb/platforms/windows/remote/1118.c
9e189df1156fc3b18c79ef996bbfa35bcec2b8ae 	8b2af6aaf95e1a92b248509508a53d36ba84deb8 	\N	./exploitdb/platforms/windows/remote/17550.py
d7f8f7b5a0829257cc46cb6ad30f4c4b2070a149 	f3ac59182570801a8c392e54757a0fcd4150cd6d 	\N	./exploitdb/platforms/windows/remote/663.py
758d21b83b753d5ffcc7c0b64ed8f5460b15469a 	7161b3b584352239c9d336ffb3fc3f13212b9963 	\N	./exploitdb/platforms/windows/remote/2530.py
920b15bb344fb84bddb65bc743570185b910033f 	b83ab16a17d334d489cf2cc30c7e1d19ad37d667 	\N	./exploitdb/platforms/windows/remote/14400.py
f57cfd649923d515d8167b9341ed39fb119b295b 	d748a6d8616f3b6709bfb3959c32c90dd95d0d0e 	\N	./exploitdb/platforms/windows/remote/16101.py
a481d45012a4b3ffbd87e530acbcaf3a6c41e1a6 	d62a9a1c201362748c6d0ce725ff6bf07779125e 	\N	./exploitdb/platforms/windows/remote/14402.py
a8692a83e53fe8ffdc774fbee49a4a86de1a2542 	e3ad6cca07f2b8461bfc0e1e6c979b19264affd5 	\N	./exploitdb/platforms/windows/remote/11468.py
f9aff42644a6d7746d4c4754ac04ecc2e02cefc5 	1fa5f8f0c11596ea8ae9bd0bd6abb420ead52369 	\N	./exploitdb/platforms/windows/remote/5314.py
b7a734b143c340e43c95fc069b8da4f5a0212c8b 	8fb74e1b58c0994a425275f4cee1894f1af10afa 	\N	./exploitdb/platforms/windows/remote/11500.py
34ed9aa415afd220273b1957885b1d83917e9477 	7fe9cbba87db86f764283698420216ae3e1de66c 	\N	./exploitdb/platforms/windows/remote/3954.py
507b836610b2dc94d56083eff8c8bb86aa1d744e 	c737a798c6fa276817a02f84c978e6ca9862bba1 	\N	./exploitdb/platforms/windows/remote/11877.py
0715cf57f0af7881c99b038d4f6a74ba3d133c4b 	96fea8736928243d874a6f88d72e4ee324b42173 	\N	./exploitdb/platforms/windows/remote/14399.py
e61ee4139f5b532278430c1312637c4e0b79470d 	ff43c273b4a761c522a16270c822b8150eb819a2 	\N	./exploitdb/platforms/windows/remote/588.py
58e5da4935233e852bc67383c85fce3f455c5248 	6de12caebf9db1207ac2a4b47f709d094d64dbdb 	\N	./exploitdb/platforms/windows/remote/9817.py
5ff40304ac044ca77ccf3fb162d95346d1657a28 	a0d5d9a126ed60052004d53cb98bd14b9d72cd83 	\N	./exploitdb/platforms/windows/remote/11420.py
5926e6d7ad8979f9709bc2a9167ed463ac7f5f5c 	d4b83553cc9c2e2a3b9383e7613bcbee24396b7a 	\N	./exploitdb/platforms/windows/remote/11293.py
3b6662a2a2e52d99ebad613dfc5a869a5b7c9ab8 	def654531bac6429da97baf3ee42af6cec3e5a94 	\N	./exploitdb/platforms/windows/remote/955.py
479986156312bc01ea87391ce654c14f294adef5 	1a1e43ab73253ebaa0e36a7871a30997723fe1db 	\N	./exploitdb/platforms/windows/remote/18345.py
c0d26c7777892ea8c9136888808c852a5e8c5e50 	393b5de04bb372ce6566d6aa3fb4f3c127c97d0e 	\N	./exploitdb/platforms/windows/remote/8621.py
254e6e112de04f2ace17e2f8d848683dce04432c 	6cad6f31b11c898232c41bbe8589246583f26da3 	\N	./exploitdb/platforms/windows/remote/11539.py
9e0dc37711af0735752266894862a45edc5a50a8 	1bcddddc33f290abf745098eb25026a3952de35a 	\N	./exploitdb/platforms/windows/remote/14604.py
33b4d143bf81ae95af2ab1717b03d6eb4c7313fe 	e47b3f92f9f9f2bc7903a6563f5cce1b15776562 	\N	./exploitdb/platforms/windows/remote/13932.py
b362aca3f15aa7be54627146d08c83cee2e310e9 	1ce98c6717db2340ae74830b2005759b383fc286 	\N	./exploitdb/platforms/windows/remote/5315.py
5cf416c6b856a85e1eab59d4e41a6e956cc5d8bc 	7ef9e8b8e348b082f4f8fa7901dd3b30db134d49 	\N	./exploitdb/platforms/windows/remote/1378.py
28e8bdc6136d731fabb54ea9f9e96158595c65dc 	59bf1cd2ee636561f40fc0d0c128849fc053c163 	\N	./exploitdb/platforms/windows/remote/11328.py
76f9bfeded3dbfb316393f7a43f8d673920b857a 	89d1004a4980fe2ca89cc7bf32b57f4510b46a89 	\N	./exploitdb/platforms/windows/remote/15689.py
468088e42ce44b6be92d11d064d74fb837e320e9 	5df910a0e69e1821b650263801a4f544b0ec52ea 	\N	./exploitdb/platforms/windows/remote/3474.py
5bcb814125476343d1d83e8894990c80d11db1e6 	959984169db178f59100871ac68173f36afe996e 	\N	./exploitdb/platforms/windows/remote/8732.py
5414b87d41eca6067c2d4d10423d1ea63505e99f 	c649fd65898b259d5246a46469f21197aa00a16e 	\N	./exploitdb/platforms/windows/remote/9468.py
80abf0cd4ae3eab5b1e96fce90f7be2ca676dbc0 	0af8d67bccf0a48865380c711b1bc19f7123ad02 	\N	./exploitdb/platforms/windows/remote/18534.py
c5249e3f234525df25e76a4ae23084ab5c28bfec 	d1a431e27f71b7db3b492c95e16bebccb4355d1c 	\N	./exploitdb/platforms/windows/remote/12834.py
29bbf63d81ccbfa3056e307c21604dbf1d1c16b6 	a941781a79b62e1da729f5af26ceb809cef8f356 	\N	./exploitdb/platforms/windows/remote/17546.py
f00485bbec7ceb3177475beda3a558773d169a64 	20f242cedded84685a8c627515830ce31faf2ce6 	\N	./exploitdb/platforms/windows/remote/10073.py
0f689a3698a23ac40eb796b3f0ebcca02716276c 	6975266e2549c7231d65c6d612787965060320e1 	\N	./exploitdb/platforms/windows/remote/975.py
5cd262d66f896303a9c345da80fce48d61ca6ed4 	5b05e81aaf1c684aa01c94b30142cd125dda6eee 	\N	./exploitdb/platforms/windows/remote/17519.py
ef6dda7a786d37f3182fcfaea4b20d5a5fe56259 	03b74dc98b998ea07732705f5ee9c1947b7c20e3 	\N	./exploitdb/platforms/windows/remote/17876.py
d5e815e53464635c9ecbefd5143cbe0cba6d4c00 	b7e1946a8c6cc6b301bec271dc6872c28f48a12c 	\N	./exploitdb/platforms/windows/remote/17819.py
61d93811e69dba4f7dc757f9a14305c95fe8540f 	8fb84f9f5eb5fcdc25f91a01645482bf4dfddd95 	\N	./exploitdb/platforms/windows/remote/17619.py
fbf51aa2c8a15998947d7048945f5b15a0108966 	653ba1b28345ee3e7b020ac869c05b2a2604b15b 	\N	./exploitdb/platforms/windows/remote/9815.py
737b324846c9d079b177dd002e1df537e333509e 	343aea462740196c4614b8942f9931457ea8bc9e 	\N	./exploitdb/platforms/windows/remote/14623.py
89ba491e27cd06fd0b68dfc40207ca048ae8bed2 	6a711f5be4d46a924a48b61eb096286c2391ba92 	\N	./exploitdb/platforms/windows/remote/9613.py
9b69381e3591c6c8f58f40e99764651fd064dc73 	da7ad5d966aefffe2d31b0bc4220e2e4a2e725fb 	\N	./exploitdb/platforms/windows/remote/17354.py
0f71c60985d0218419e5c576472cc1584acc0f1c 	e919e8ea6d182bfc48935ea3f942131d118c6a00 	\N	./exploitdb/platforms/windows/local/3649.c
b2c75f6f3557b2916542c73a5c1a2acdef62a9ee 	81c9c42ea3f740d2370c31e7b6fc3266572818fb 	\N	./exploitdb/platforms/windows/local/7492.py
0189bf44634f254727ccb890174ef9d266abcaf3 	2be7845a9d329bbbde894dcb439ef1d3eeb1e095 	\N	./exploitdb/platforms/windows/local/17166.py
4e278a5ce381534f2c4de03251241b7563ed3b3c 	c9045b139a7031bd03811fbc3e0ede5eeeec109c 	\N	./exploitdb/platforms/windows/local/16153.py
0f6c4c6d254578c06c38d05d84db425a8679fab9 	2b8181d267651a6a3eda66d900e1c06774975f91 	\N	./exploitdb/platforms/windows/local/11314.py
287d143b84b68b7ca6cce3c052cbd5a2e2a45b26 	ddb78a578f6d90128ff4768060c44eea7e3e3f8c 	\N	./exploitdb/platforms/windows/local/14532.py
0fa73666aae5655c3443801d2c6d3a7fadb4fb47 	1fcb3ce92092873cd052e7bd3a46e4de7c0aeecf 	\N	./exploitdb/platforms/windows/local/15729.py
113ba1f821953e79df48ac50aa8b9de6e1059d87 	99df05a42dcfce5eeffcb9b66754d4cf80a62207 	\N	./exploitdb/platforms/windows/local/17664.py
33943f483ad5e154377a8c04d43c0b36a19476a1 	af67b88b452a425830380db7567a61ddc83b3678 	\N	./exploitdb/platforms/linux/remote/4478.c
bf4970dca8e2e9890b07ae4a388ef2c339ee604b 	e58676b4aeb3adc32eefa45ce9e84a893650880d 	\N	./exploitdb/platforms/linux/remote/89.c
598b0370efd0bf5762d9ebf6e22b38f706bad51c 	2f4e234dd7fa0492781c7fda8ce70a05bf76ab79 	\N	./exploitdb/platforms/linux/remote/3609.py
ad8761b367922e29de28f83ad7cb5b105061bf77 	b327ec3d6cdf7f83003ca48af186812e7f02e9bf 	\N	./exploitdb/platforms/linux/remote/387.c
72fb29adcccd2d659d6388985ae8311666f537fa 	7b2966315e53adef947e88aed411b2958e423f92 	\N	./exploitdb/platforms/linux/remote/812.c
c830704eb04205c5783037c1fd076272ffabf62d 	cdb812e30e725d873fa41d7bb0ee0879a19129e7 	\N	./exploitdb/platforms/linux/remote/25.c
53e77f1d7696124b9ace709f0c5e6b58c9e12410 	68e93ecd4cfb67363aa266ceada15498b1563710 	\N	./exploitdb/platforms/linux/remote/5720.py
e64084050e62257748c4413c845cf69740743694 	39aa6064cf02e62f99f04e955123045ee8e66bac 	\N	./exploitdb/platforms/linux/local/3213.c
72cec2fcbc2706226a16cbda6741e253e8cdf579 	c7b91ec2bd28615fcd02a0dd861c2909c21603e2 	\N	./exploitdb/platforms/windows/local/16169.py
5f889f43766b5b5b131b0dde8b1a343fa091c83a 	a83300e6c92de7bf20b5d512c5f3d96047b66c14 	\N	./exploitdb/platforms/windows/local/10321.py
2eb0210e986088171291991129334a812426099a 	6e526d11a4ca7cbc039a8fd99dc8f0a892c3d337 	\N	./exploitdb/platforms/windows/local/10664.py
d30bd239e4ecdac46bc84e73c1b51956b6625fe5 	a76c68b1f68125b75d7cf8f5e5ebe42762f94842 	\N	./exploitdb/platforms/windows/local/7329.py
bd9999919020e73d761599e557765b25f777d58a 	74ed3e49a2a2a7af6f74bd2cf349c67fbcc7a138 	\N	./exploitdb/platforms/windows/local/10322.py
eca48ef787586ba6724c6783087d1130773fb12f 	0fb634d9edae93c8b1b259b060155bd4a01e725b 	\N	./exploitdb/platforms/windows/local/8126.py
0a97f82214c289ff85904375d5dd701b5d35411d 	60de84876ece1f3562f9a5b2fdb530b56c72c1f1 	\N	./exploitdb/platforms/windows/local/11958.py
610122e02240b9264393916dcc5920180247b1a7 	ae334c3081c14d67ed7f30460cd3fcf4f123a83e 	\N	./exploitdb/platforms/windows/local/12406.py
f5bb68338ed630ffeffdb5db62f8a5979f175cf9 	abcd6cbe71d73e0979681abdf5daf334e74d1957 	\N	./exploitdb/platforms/windows/local/10320.py
\.


--
-- TOC entry 1888 (class 0 OID 24969)
-- Dependencies: 152 1889
-- Data for Name: exploit_parameter; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY exploit_parameter (parameter, function, exploit_sha1) FROM stdin;
-h	get_host	53e77f1d7696124b9ace709f0c5e6b58c9e12410 
\.


--
-- TOC entry 1882 (class 0 OID 24848)
-- Dependencies: 140
-- Data for Name: host; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY host (date_modified, ip, id, state, reason, hostname, os_type, os_vendor, os_family, os_gen, osclass_accuracy, uptime, osmatch_name, osmatch_accuracy, elapsed, lastboot, finished, fingerprint) FROM stdin;
2012-08-08 12:45:37.750295-06	127.0.0.1/32	10	up	localhost-response	localhost	general purpose	Linux	Linux	2.6.X	98	5747		0	120.05	Wed Aug  8 11:11:50 2012	Wed Aug  8 12:47:37 2012	
2012-09-07 16:03:06.87222-06	192.168.122.198/32	21	up	arp-response		general purpose	Microsoft	Windows	XP	100	0	Microsoft Windows XP SP2 or SP3, or Windows Server 2003	100	44.67		Fri Sep  7 16:03:51 2012	
\.


--
-- TOC entry 1883 (class 0 OID 24856)
-- Dependencies: 142 1882
-- Data for Name: host_service; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY host_service (port_id, protocol, service_name, reason, date_modified, ip, id, state, reason_ttl, product, version, extrainfo, ostype, method, conf) FROM stdin;
902	tcp	vmware-auth	syn-ack	2012-08-08 12:45:37.752147	127.0.0.1/32	86	open	64	VMware Authentication Daemon	1.10	Uses VNC, SOAP	\N	probed	10
5432	tcp	postgresql	syn-ack	2012-08-08 12:45:37.752147	127.0.0.1/32	87	open	64	PostgreSQL DB	\N	\N	\N	probed	10
7378	tcp	unknown	syn-ack	2012-08-08 12:45:37.752147	127.0.0.1/32	88	open	64	\N	\N	\N	\N	table	0
8307	tcp	http	syn-ack	2012-08-08 12:45:37.752147	127.0.0.1/32	89	open	64	VMWare hostd httpd	\N	\N	\N	probed	10
8787	tcp	unknown	syn-ack	2012-08-08 12:45:37.752147	127.0.0.1/32	90	open	64	\N	\N	\N	\N	table	0
8888	tcp	unknown	syn-ack	2012-08-08 12:45:37.752147	127.0.0.1/32	91	open	64	\N	\N	\N	\N	table	0
11211	tcp	memcache	syn-ack	2012-08-08 12:45:37.752147	127.0.0.1/32	92	open	64	memcached	\N	\N	\N	probed	10
22	tcp	ssh	syn-ack	2012-08-08 12:45:37.752147	127.0.0.1/32	83	open	64	OpenSSH	5.8p1 Debian 1ubuntu3	protocol 2.0	Linux	probed	10
25	tcp	smtp	syn-ack	2012-08-08 12:45:37.752147	127.0.0.1/32	84	open	64	Postfix smtpd	\N	\N	\N	probed	10
631	tcp	ipp	syn-ack	2012-08-08 12:45:37.752147	127.0.0.1/32	85	open	64	CUPS	1.4	\N	\N	probed	10
135	tcp	msrpc	syn-ack	2012-09-07 16:03:06.8742	192.168.122.198/32	183	open	128	Microsoft Windows RPC	\N	\N	Windows	probed	10
139	tcp	netbios-ssn	syn-ack	2012-09-07 16:03:06.8742	192.168.122.198/32	184	open	128	\N	\N	\N	\N	probed	10
445	tcp	microsoft-ds	syn-ack	2012-09-07 16:03:06.8742	192.168.122.198/32	185	open	128	Microsoft Windows XP microsoft-ds	\N	\N	Windows	probed	10
1040	tcp	tcpwrapped	syn-ack	2012-09-07 16:03:06.8742	192.168.122.198/32	186	open	128	\N	\N	\N	\N	table	8
1041	tcp	sophos	syn-ack	2012-09-07 16:03:06.8742	192.168.122.198/32	187	open	128	Sophos Message Router	\N	\N	\N	probed	10
3389	tcp	microsoft-rdp	syn-ack	2012-09-07 16:03:06.8742	192.168.122.198/32	188	open	128	Microsoft Terminal Service	\N	\N	Windows	probed	10
8192	tcp	sophos	syn-ack	2012-09-07 16:03:06.8742	192.168.122.198/32	189	open	128	Sophos Message Router	\N	Interroperable Object Reference Service	\N	probed	10
8193	tcp	tcpwrapped	syn-ack	2012-09-07 16:03:06.8742	192.168.122.198/32	190	open	128	\N	\N	\N	\N	table	8
8194	tcp	sophos	syn-ack	2012-09-07 16:03:06.8742	192.168.122.198/32	191	open	128	Sophos Message Router	\N	\N	\N	probed	10
\.


--
-- TOC entry 1890 (class 0 OID 25107)
-- Dependencies: 156
-- Data for Name: nmap_service_alias; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY nmap_service_alias (id, nmap_service, service_alias, date_modified) FROM stdin;
1	microsoft-ds	smb	2012-09-10 11:03:06.387904
2	msrpc	smb	2012-09-10 11:03:16.179401
3	netbios-ssn	smb	2012-09-10 11:03:23.721287
\.


--
-- TOC entry 1884 (class 0 OID 24869)
-- Dependencies: 144
-- Data for Name: os_signature; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY os_signature (id, os_signature, os_signature_source, os_vendor, os_name, os_version, os_release, date_modified) FROM stdin;
\.


--
-- TOC entry 1891 (class 0 OID 25117)
-- Dependencies: 158
-- Data for Name: product; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY product (id, product_name, version, date_modified, default_port, vendor, default_admin_username, default_admin_password, password_constraints, ostype, service_name, extrainfo) FROM stdin;
1	Microsoft Windows XP microsoft-ds	microsoft-ds	2012-09-10 11:25:31.706502	\N	Microsoft	\N	\N	\N	Windows	\N	\N
\.


--
-- TOC entry 1892 (class 0 OID 25134)
-- Dependencies: 159
-- Data for Name: scan; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY scan (id, scanner, args, start, startstr, type, protocol, numservices, state, state_reason) FROM stdin;
\.


--
-- TOC entry 1885 (class 0 OID 24877)
-- Dependencies: 146
-- Data for Name: service; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY service (service, default_port, id, servicedesc, date_modified, protocol, product, version, extrainfo, os_family) FROM stdin;
microsoft-ds	445	1	\N	2012-09-10 11:09:41.884717-06	\N	\N	\N	\N	Windows
\.


--
-- TOC entry 1887 (class 0 OID 24890)
-- Dependencies: 150 1889
-- Data for Name: service_exploit; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY service_exploit (id, os_vendor, os_type, os_family, os_gen, service_name, product, version, exploit_path, exploit_sha1, exploit_source, preliminary_function, date_modified) FROM stdin;
556	\N	\N	Windows	\N	smb	\N	\N	./exploits/windows/smb/2223.o	f167861ff88b8db8d6803042dbde95f62326054a	exploitdb	\N	2012-07-13 15:18:51.021879
557	\N	\N	Windows	\N	smb	\N	\N	./exploits/windows/smb/9303.o	d5ad116d9d86beffce9df26cad6538a76ca7fc10	exploitdb	\N	2012-07-13 15:18:51.021879
558	\N	\N	Windows	\N	smb	\N	\N	./exploits/windows/smb/1180.o	a4749616f61a69aeb196541900fe5af6fbe4f014	exploitdb	\N	2012-07-13 15:18:51.021879
559	\N	\N	Windows	\N	smb	\N	\N	./exploits/windows/smb/1179.o	fe8e057e84ec95b79284b7edff39adcaa2457620	exploitdb	\N	2012-07-13 15:18:51.021879
560	\N	\N	Windows	\N	smb	\N	\N	./exploits/windows/smb/1149.o	d37825b9b438c79b9b936c608168fd316c70a945	exploitdb	\N	2012-07-13 15:18:51.021879
561	\N	\N	Windows	\N	smb	\N	\N	./exploits/windows/smb/7132.py	9f3d5e09a83033d8864e18a0a2b53bb14fbc0373	exploitdb	\N	2012-07-13 15:18:51.021879
562	\N	\N	Windows	\N	smb	\N	\N	./exploits/windows/smb/9816.py	ac55a73ddbfed03283bcf5c8c32084881ecc0c00	exploitdb	\N	2012-07-13 15:18:51.021879
563	\N	\N	Windows	\N	smb	\N	\N	./exploits/windows/smb/9318.py	259b1ab372ef9bfb313b41d2c109472b44cc2403	exploitdb	\N	2012-07-13 15:18:51.021879
564	\N	\N	Windows	\N	ssh	\N	\N	./exploits/windows/ssh/18535.py	c096d6d09b501e704bf068b88d8682022bf783ab	exploitdb	\N	2012-07-13 15:18:51.021879
565	\N	\N	Windows	\N	ssh	\N	\N	./exploits/windows/ssh/11787.py	6de705d56ab5b3aaa6485318527c3f440c6bf033	exploitdb	\N	2012-07-13 15:18:51.021879
566	\N	\N	Windows	\N	ipp	\N	\N	./exploits/windows/ipp/76.o	59daaae7fb253ef1aeb85c35939ffa92c06a87ab	exploitdb	\N	2012-07-13 15:18:51.021879
567	\N	\N	Windows	\N	ipp	\N	\N	./exploits/windows/ipp/668.o	e6e8ca7649bbd38bc95904d7c849f8993aa45646	exploitdb	\N	2012-07-13 15:18:51.021879
568	\N	\N	Windows	\N	ipp	\N	\N	./exploits/windows/ipp/1330.o	51357f34f9cea7c8e5be26632d05446726a1949c	exploitdb	\N	2012-07-13 15:18:51.021879
569	\N	\N	Windows	\N	ipp	\N	\N	./exploits/windows/ipp/1313.o	5a8e4a71479ef86296c2d964654649db36a3c8b6	exploitdb	\N	2012-07-13 15:18:51.021879
570	\N	\N	Windows	\N	ipp	\N	\N	./exploits/windows/ipp/66.o	2e783ad8ad2afef8765f173df81ce523e816b040	exploitdb	\N	2012-07-13 15:18:51.021879
571	\N	\N	Windows	\N	ipp	\N	\N	./exploits/windows/ipp/190.o	7c33fcfb5cc1f8aac06c3e6af94691344517bdac	exploitdb	\N	2012-07-13 15:18:51.021879
572	\N	\N	Windows	\N	ipp	\N	\N	./exploits/windows/ipp/670.o	82339143e0961746d273b56731a4d9e09ee001db	exploitdb	\N	2012-07-13 15:18:51.021879
573	\N	\N	Windows	\N	ipp	\N	\N	./exploits/windows/ipp/3616.py	3fe361bfffe8e8fcd1ffb03c9e1051aa769aac5d	exploitdb	\N	2012-07-13 15:18:51.021879
574	\N	\N	Windows	\N	ipp	\N	\N	./exploits/windows/ipp/4027.py	3c705e668973460f9154584d5db041c0b76762ae	exploitdb	\N	2012-07-13 15:18:51.021879
575	\N	\N	Windows	\N	ipp	\N	\N	./exploits/windows/ipp/8934.py	5e154bbe4cdca316faf2feac3098768ee9a20368	exploitdb	\N	2012-07-13 15:18:51.021879
576	\N	\N	Windows	\N	ipp	\N	\N	./exploits/windows/ipp/8354.py	e42ef446725eeb29485959e4bb348ad652ac0f75	exploitdb	\N	2012-07-13 15:18:51.021879
577	\N	\N	Windows	\N	ipp	\N	\N	./exploits/windows/ipp/3531.py	99653444b894cf915a25dd825f031510239b8d04	exploitdb	\N	2012-07-13 15:18:51.021879
578	\N	\N	Windows	\N	ipp	\N	\N	./exploits/windows/ipp/4866.py	93a014ba4da4cbbdd4dc7f67daa079c84d19fff4	exploitdb	\N	2012-07-13 15:18:51.021879
579	\N	\N	Windows	\N	ipp	\N	\N	./exploits/windows/ipp/10394.py	ec9624ca1be99c05bee38adfe8b3bb9835e6f0a8	exploitdb	\N	2012-07-13 15:18:51.021879
580	\N	\N	Windows	\N	ipp	\N	\N	./exploits/windows/ipp/3737.py	d6490fbb0d6d1e3ca6b541df196b932f9dab6122	exploitdb	\N	2012-07-13 15:18:51.021879
581	\N	\N	Windows	\N	ipp	\N	\N	./exploits/windows/ipp/14576.o	6fc4f35f532560af91cf5f35224532fdbc1a3425	exploitdb	\N	2012-07-13 15:18:51.021879
582	\N	\N	Windows	\N	ipp	\N	\N	./exploits/windows/ipp/2872.o	278fda6ebc195d552e553d5f42b5f1caf2845e8f	exploitdb	\N	2012-07-13 15:18:51.021879
583	\N	\N	Windows	\N	ipp	\N	\N	./exploits/windows/ipp/10745.o	a99547c0278985346b5d9e66eb46269770895ba8	exploitdb	\N	2012-07-13 15:18:51.021879
584	\N	\N	Windows	\N	ipp	\N	\N	./exploits/windows/ipp/10646.o	1243c4a540fa2564ad0884f577c124483d470970	exploitdb	\N	2012-07-13 15:18:51.021879
585	\N	\N	Windows	\N	ipp	\N	\N	./exploits/windows/ipp/11112.o	d7720335674db641e73c449c8d2b6758570341db	exploitdb	\N	2012-07-13 15:18:51.021879
586	\N	\N	Windows	\N	ipp	\N	\N	./exploits/windows/ipp/11139.o	aad00c381894aa85ff557fdc4422c31b1bc981cc	exploitdb	\N	2012-07-13 15:18:51.021879
587	\N	\N	Windows	\N	ipp	\N	\N	./exploits/windows/ipp/10787.py	182cf3ff83f24387568f39f561ffc4f115085677	exploitdb	\N	2012-07-13 15:18:51.021879
588	\N	\N	Windows	\N	ipp	\N	\N	./exploits/windows/ipp/11872.py	3e6b974aeb73d08f7dba407cf5737fb154a3530e	exploitdb	\N	2012-07-13 15:18:51.021879
589	\N	\N	Windows	\N	ipp	\N	\N	./exploits/windows/ipp/11797.py	dde04983ddb8d86ab2b8caa1a810a928e1b68f24	exploitdb	\N	2012-07-13 15:18:51.021879
590	\N	\N	Windows	\N	ipp	\N	\N	./exploits/windows/ipp/11834.py	fe3684acd8eaa216a481d07a53624cc8595a407a	exploitdb	\N	2012-07-13 15:18:51.021879
591	\N	\N	Windows	\N	ipp	\N	\N	./exploits/windows/ipp/9865.py	60c989b4aa2f50c65c14298d6a46f9f7e3b56017	exploitdb	\N	2012-07-13 15:18:51.021879
592	\N	\N	Windows	\N	ipp	\N	\N	./exploits/windows/ipp/15287.py	6b12bf3e5ee7c4e4e74a5f8f457667b88e77c318	exploitdb	\N	2012-07-13 15:18:51.021879
593	\N	\N	Windows	\N	ipp	\N	\N	./exploits/windows/ipp/17732.py	c130be307b0eafcabc39cc394b8fab2562f29a36	exploitdb	\N	2012-07-13 15:18:51.021879
594	\N	\N	Windows	\N	ipp	\N	\N	./exploits/windows/ipp/11682.py	214c4846f6a58cf9c16fcfa2e499f27f088b1498	exploitdb	\N	2012-07-13 15:18:51.021879
595	\N	\N	Windows	\N	ipp	\N	\N	./exploits/windows/ipp/8662.py	7d159010efebe4ab3a42ce8c95f00fcf004d1b00	exploitdb	\N	2012-07-13 15:18:51.021879
596	\N	\N	Windows	\N	ftp	\N	\N	./exploits/windows/ftp/158.o	1d9c496bdf7d0d8e16dadd4c714d9af1b18067e1	exploitdb	\N	2012-07-13 15:18:51.021879
597	\N	\N	Windows	\N	ftp	\N	\N	./exploits/windows/ftp/4053.o	eec2b6a53273842c4950191c75401d05c6890113	exploitdb	\N	2012-07-13 15:18:51.021879
598	\N	\N	Windows	\N	ftp	\N	\N	./exploits/windows/ftp/618.o	fe22c71b7a859ff9a1a3d911414727b24eb6418c	exploitdb	\N	2012-07-13 15:18:51.021879
599	\N	\N	Windows	\N	ftp	\N	\N	./exploits/windows/ftp/2753.o	304e85dd889eef15be611f6d5b036d7c8c1a7346	exploitdb	\N	2012-07-13 15:18:51.021879
600	\N	\N	Windows	\N	ftp	\N	\N	./exploits/windows/ftp/2358.o	33934dce1de9b9295ce8f1d2c3a2cc7623722fbb	exploitdb	\N	2012-07-13 15:18:51.021879
601	\N	\N	Windows	\N	ftp	\N	\N	./exploits/windows/ftp/3893.o	4dd369e92fc3c5de0ef16416166f2ebbd35eda2b	exploitdb	\N	2012-07-13 15:18:51.021879
602	\N	\N	Windows	\N	ftp	\N	\N	./exploits/windows/ftp/8283.o	c5fafdced373383866c0d0b7c964ac08bf1be71a	exploitdb	\N	2012-07-13 15:18:51.021879
603	\N	\N	Windows	\N	ftp	\N	\N	./exploits/windows/ftp/2460.o	0de58013d23cf6d19f0234a2cf304df10852716a	exploitdb	\N	2012-07-13 15:18:51.021879
604	\N	\N	Windows	\N	ftp	\N	\N	./exploits/windows/ftp/822.o	5dc5e69d9982f29a263ef31063921af05082c3a9	exploitdb	\N	2012-07-13 15:18:51.021879
605	\N	\N	Windows	\N	ftp	\N	\N	./exploits/windows/ftp/827.o	e216cc3589b4e4778e0fdc4718f8a5faeb5bba64	exploitdb	\N	2012-07-13 15:18:51.021879
606	\N	\N	Windows	\N	ftp	\N	\N	./exploits/windows/ftp/4052.o	79fee06649910a5b13ba649630f4cf6531d151c1	exploitdb	\N	2012-07-13 15:18:51.021879
607	\N	\N	Windows	\N	ftp	\N	\N	./exploits/windows/ftp/297.o	882a0e96e19523befb030400c7418b290be220c8	exploitdb	\N	2012-07-13 15:18:51.021879
608	\N	\N	Windows	\N	ftp	\N	\N	./exploits/windows/ftp/1118.o	aa22774f7a113e4a4029d4f668807b58087a6f0b	exploitdb	\N	2012-07-13 15:18:51.021879
609	\N	\N	Windows	\N	ftp	\N	\N	./exploits/windows/ftp/17550.py	9e189df1156fc3b18c79ef996bbfa35bcec2b8ae	exploitdb	\N	2012-07-13 15:18:51.021879
610	\N	\N	Windows	\N	ftp	\N	\N	./exploits/windows/ftp/663.py	d7f8f7b5a0829257cc46cb6ad30f4c4b2070a149	exploitdb	\N	2012-07-13 15:18:51.021879
611	\N	\N	Windows	\N	ftp	\N	\N	./exploits/windows/ftp/2530.py	758d21b83b753d5ffcc7c0b64ed8f5460b15469a	exploitdb	\N	2012-07-13 15:18:51.021879
612	\N	\N	Windows	\N	ftp	\N	\N	./exploits/windows/ftp/14400.py	920b15bb344fb84bddb65bc743570185b910033f	exploitdb	\N	2012-07-13 15:18:51.021879
613	\N	\N	Windows	\N	ftp	\N	\N	./exploits/windows/ftp/16101.py	f57cfd649923d515d8167b9341ed39fb119b295b	exploitdb	\N	2012-07-13 15:18:51.021879
614	\N	\N	Windows	\N	ftp	\N	\N	./exploits/windows/ftp/14402.py	a481d45012a4b3ffbd87e530acbcaf3a6c41e1a6	exploitdb	\N	2012-07-13 15:18:51.021879
615	\N	\N	Windows	\N	ftp	\N	\N	./exploits/windows/ftp/11468.py	a8692a83e53fe8ffdc774fbee49a4a86de1a2542	exploitdb	\N	2012-07-13 15:18:51.021879
616	\N	\N	Windows	\N	ftp	\N	\N	./exploits/windows/ftp/5314.py	f9aff42644a6d7746d4c4754ac04ecc2e02cefc5	exploitdb	\N	2012-07-13 15:18:51.021879
617	\N	\N	Windows	\N	ftp	\N	\N	./exploits/windows/ftp/11500.py	b7a734b143c340e43c95fc069b8da4f5a0212c8b	exploitdb	\N	2012-07-13 15:18:51.021879
618	\N	\N	Windows	\N	ftp	\N	\N	./exploits/windows/ftp/3954.py	34ed9aa415afd220273b1957885b1d83917e9477	exploitdb	\N	2012-07-13 15:18:51.021879
619	\N	\N	Windows	\N	ftp	\N	\N	./exploits/windows/ftp/11877.py	507b836610b2dc94d56083eff8c8bb86aa1d744e	exploitdb	\N	2012-07-13 15:18:51.021879
620	\N	\N	Windows	\N	ftp	\N	\N	./exploits/windows/ftp/14399.py	0715cf57f0af7881c99b038d4f6a74ba3d133c4b	exploitdb	\N	2012-07-13 15:18:51.021879
621	\N	\N	Windows	\N	ftp	\N	\N	./exploits/windows/ftp/588.py	e61ee4139f5b532278430c1312637c4e0b79470d	exploitdb	\N	2012-07-13 15:18:51.021879
622	\N	\N	Windows	\N	ftp	\N	\N	./exploits/windows/ftp/9817.py	58e5da4935233e852bc67383c85fce3f455c5248	exploitdb	\N	2012-07-13 15:18:51.021879
623	\N	\N	Windows	\N	ftp	\N	\N	./exploits/windows/ftp/11420.py	5ff40304ac044ca77ccf3fb162d95346d1657a28	exploitdb	\N	2012-07-13 15:18:51.021879
624	\N	\N	Windows	\N	ftp	\N	\N	./exploits/windows/ftp/11293.py	5926e6d7ad8979f9709bc2a9167ed463ac7f5f5c	exploitdb	\N	2012-07-13 15:18:51.021879
625	\N	\N	Windows	\N	ftp	\N	\N	./exploits/windows/ftp/955.py	3b6662a2a2e52d99ebad613dfc5a869a5b7c9ab8	exploitdb	\N	2012-07-13 15:18:51.021879
626	\N	\N	Windows	\N	ftp	\N	\N	./exploits/windows/ftp/18345.py	479986156312bc01ea87391ce654c14f294adef5	exploitdb	\N	2012-07-13 15:18:51.021879
627	\N	\N	Windows	\N	ftp	\N	\N	./exploits/windows/ftp/8621.py	c0d26c7777892ea8c9136888808c852a5e8c5e50	exploitdb	\N	2012-07-13 15:18:51.021879
628	\N	\N	Windows	\N	ftp	\N	\N	./exploits/windows/ftp/11539.py	254e6e112de04f2ace17e2f8d848683dce04432c	exploitdb	\N	2012-07-13 15:18:51.021879
629	\N	\N	Windows	\N	ftp	\N	\N	./exploits/windows/ftp/14604.py	9e0dc37711af0735752266894862a45edc5a50a8	exploitdb	\N	2012-07-13 15:18:51.021879
630	\N	\N	Windows	\N	ftp	\N	\N	./exploits/windows/ftp/13932.py	33b4d143bf81ae95af2ab1717b03d6eb4c7313fe	exploitdb	\N	2012-07-13 15:18:51.021879
631	\N	\N	Windows	\N	ftp	\N	\N	./exploits/windows/ftp/5315.py	b362aca3f15aa7be54627146d08c83cee2e310e9	exploitdb	\N	2012-07-13 15:18:51.021879
632	\N	\N	Windows	\N	ftp	\N	\N	./exploits/windows/ftp/1378.py	5cf416c6b856a85e1eab59d4e41a6e956cc5d8bc	exploitdb	\N	2012-07-13 15:18:51.021879
633	\N	\N	Windows	\N	ftp	\N	\N	./exploits/windows/ftp/11328.py	28e8bdc6136d731fabb54ea9f9e96158595c65dc	exploitdb	\N	2012-07-13 15:18:51.021879
634	\N	\N	Windows	\N	ftp	\N	\N	./exploits/windows/ftp/15689.py	76f9bfeded3dbfb316393f7a43f8d673920b857a	exploitdb	\N	2012-07-13 15:18:51.021879
635	\N	\N	Windows	\N	ftp	\N	\N	./exploits/windows/ftp/3474.py	468088e42ce44b6be92d11d064d74fb837e320e9	exploitdb	\N	2012-07-13 15:18:51.021879
636	\N	\N	Windows	\N	ftp	\N	\N	./exploits/windows/ftp/8732.py	5bcb814125476343d1d83e8894990c80d11db1e6	exploitdb	\N	2012-07-13 15:18:51.021879
637	\N	\N	Windows	\N	ftp	\N	\N	./exploits/windows/ftp/9468.py	5414b87d41eca6067c2d4d10423d1ea63505e99f	exploitdb	\N	2012-07-13 15:18:51.021879
638	\N	\N	Windows	\N	ftp	\N	\N	./exploits/windows/ftp/18534.py	80abf0cd4ae3eab5b1e96fce90f7be2ca676dbc0	exploitdb	\N	2012-07-13 15:18:51.021879
639	\N	\N	Windows	\N	ftp	\N	\N	./exploits/windows/ftp/12834.py	c5249e3f234525df25e76a4ae23084ab5c28bfec	exploitdb	\N	2012-07-13 15:18:51.021879
640	\N	\N	Windows	\N	ftp	\N	\N	./exploits/windows/ftp/17546.py	29bbf63d81ccbfa3056e307c21604dbf1d1c16b6	exploitdb	\N	2012-07-13 15:18:51.021879
641	\N	\N	Windows	\N	ftp	\N	\N	./exploits/windows/ftp/10073.py	f00485bbec7ceb3177475beda3a558773d169a64	exploitdb	\N	2012-07-13 15:18:51.021879
642	\N	\N	Windows	\N	ftp	\N	\N	./exploits/windows/ftp/975.py	0f689a3698a23ac40eb796b3f0ebcca02716276c	exploitdb	\N	2012-07-13 15:18:51.021879
643	\N	\N	Windows	\N	ftp	\N	\N	./exploits/windows/ftp/17519.py	5cd262d66f896303a9c345da80fce48d61ca6ed4	exploitdb	\N	2012-07-13 15:18:51.021879
644	\N	\N	Windows	\N	ftp	\N	\N	./exploits/windows/ftp/17876.py	ef6dda7a786d37f3182fcfaea4b20d5a5fe56259	exploitdb	\N	2012-07-13 15:18:51.021879
645	\N	\N	Windows	\N	ftp	\N	\N	./exploits/windows/ftp/17819.py	d5e815e53464635c9ecbefd5143cbe0cba6d4c00	exploitdb	\N	2012-07-13 15:18:51.021879
646	\N	\N	Windows	\N	ftp	\N	\N	./exploits/windows/ftp/17619.py	61d93811e69dba4f7dc757f9a14305c95fe8540f	exploitdb	\N	2012-07-13 15:18:51.021879
647	\N	\N	Windows	\N	ftp	\N	\N	./exploits/windows/ftp/9815.py	fbf51aa2c8a15998947d7048945f5b15a0108966	exploitdb	\N	2012-07-13 15:18:51.021879
648	\N	\N	Windows	\N	ftp	\N	\N	./exploits/windows/ftp/14623.py	737b324846c9d079b177dd002e1df537e333509e	exploitdb	\N	2012-07-13 15:18:51.021879
649	\N	\N	Windows	\N	ftp	\N	\N	./exploits/windows/ftp/9613.py	89ba491e27cd06fd0b68dfc40207ca048ae8bed2	exploitdb	\N	2012-07-13 15:18:51.021879
650	\N	\N	Windows	\N	ftp	\N	\N	./exploits/windows/ftp/17354.py	9b69381e3591c6c8f58f40e99764651fd064dc73	exploitdb	\N	2012-07-13 15:18:51.021879
651	\N	\N	Windows	\N	ftp	\N	\N	./exploits/windows/ftp/3649.o	0f71c60985d0218419e5c576472cc1584acc0f1c	exploitdb	\N	2012-07-13 15:18:51.021879
652	\N	\N	Windows	\N	ftp	\N	\N	./exploits/windows/ftp/7492.py	b2c75f6f3557b2916542c73a5c1a2acdef62a9ee	exploitdb	\N	2012-07-13 15:18:51.021879
653	\N	\N	Windows	\N	ftp	\N	\N	./exploits/windows/ftp/17166.py	0189bf44634f254727ccb890174ef9d266abcaf3	exploitdb	\N	2012-07-13 15:18:51.021879
654	\N	\N	Windows	\N	ftp	\N	\N	./exploits/windows/ftp/16153.py	4e278a5ce381534f2c4de03251241b7563ed3b3c	exploitdb	\N	2012-07-13 15:18:51.021879
655	\N	\N	Windows	\N	ftp	\N	\N	./exploits/windows/ftp/11314.py	0f6c4c6d254578c06c38d05d84db425a8679fab9	exploitdb	\N	2012-07-13 15:18:51.021879
656	\N	\N	Windows	\N	ftp	\N	\N	./exploits/windows/ftp/14532.py	287d143b84b68b7ca6cce3c052cbd5a2e2a45b26	exploitdb	\N	2012-07-13 15:18:51.021879
657	\N	\N	Windows	\N	ftp	\N	\N	./exploits/windows/ftp/15729.py	0fa73666aae5655c3443801d2c6d3a7fadb4fb47	exploitdb	\N	2012-07-13 15:18:51.021879
658	\N	\N	Windows	\N	ftp	\N	\N	./exploits/windows/ftp/17664.py	113ba1f821953e79df48ac50aa8b9de6e1059d87	exploitdb	\N	2012-07-13 15:18:51.021879
659	\N	\N	linux	\N	smb	\N	\N	./exploits/linux/smb/4478.o	33943f483ad5e154377a8c04d43c0b36a19476a1	exploitdb	\N	2012-07-13 15:18:51.021879
660	\N	\N	linux	\N	smb	\N	\N	./exploits/linux/smb/89.o	bf4970dca8e2e9890b07ae4a388ef2c339ee604b	exploitdb	\N	2012-07-13 15:18:51.021879
661	\N	\N	linux	\N	smb	\N	\N	./exploits/linux/smb/3609.py	598b0370efd0bf5762d9ebf6e22b38f706bad51c	exploitdb	\N	2012-07-13 15:18:51.021879
662	\N	\N	linux	\N	ssh	\N	\N	./exploits/linux/ssh/387.o	ad8761b367922e29de28f83ad7cb5b105061bf77	exploitdb	\N	2012-07-13 15:18:51.021879
663	\N	\N	linux	\N	ssh	\N	\N	./exploits/linux/ssh/812.o	72fb29adcccd2d659d6388985ae8311666f537fa	exploitdb	\N	2012-07-13 15:18:51.021879
664	\N	\N	linux	\N	ssh	\N	\N	./exploits/linux/ssh/25.o	c830704eb04205c5783037c1fd076272ffabf62d	exploitdb	\N	2012-07-13 15:18:51.021879
665	\N	\N	linux	\N	ssh	\N	\N	./exploits/linux/ssh/5720.py	53e77f1d7696124b9ace709f0c5e6b58c9e12410	exploitdb	\N	2012-07-13 15:18:51.021879
666	\N	\N	linux	\N	ssh	\N	\N	./exploits/linux/ssh/3213.o	e64084050e62257748c4413c845cf69740743694	exploitdb	\N	2012-07-13 15:18:51.021879
667	\N	\N	Windows	\N	oracle	\N	\N	./exploits/windows/oracle/16169.py	72cec2fcbc2706226a16cbda6741e253e8cdf579	exploitdb	\N	2012-09-10 15:45:35.983202
668	\N	\N	Windows	\N	rdp	\N	\N	./exploits/windows/rdp/10321.py	5f889f43766b5b5b131b0dde8b1a343fa091c83a	exploitdb	\N	2012-09-10 15:48:51.391512
669	\N	\N	Windows	\N	rdp	\N	\N	./exploits/windows/rdp/10664.py	2eb0210e986088171291991129334a812426099a	exploitdb	\N	2012-09-10 15:48:51.391512
670	\N	\N	Windows	\N	rdp	\N	\N	./exploits/windows/rdp/7329.py	d30bd239e4ecdac46bc84e73c1b51956b6625fe5	exploitdb	\N	2012-09-10 15:48:51.391512
671	\N	\N	Windows	\N	rdp	\N	\N	./exploits/windows/rdp/10322.py	bd9999919020e73d761599e557765b25f777d58a	exploitdb	\N	2012-09-10 15:48:51.391512
672	\N	\N	Windows	\N	rdp	\N	\N	./exploits/windows/rdp/8126.py	eca48ef787586ba6724c6783087d1130773fb12f	exploitdb	\N	2012-09-10 15:48:51.391512
673	\N	\N	Windows	\N	rdp	\N	\N	./exploits/windows/rdp/11958.py	0a97f82214c289ff85904375d5dd701b5d35411d	exploitdb	\N	2012-09-10 15:48:51.391512
674	\N	\N	Windows	\N	rdp	\N	\N	./exploits/windows/rdp/12406.py	610122e02240b9264393916dcc5920180247b1a7	exploitdb	\N	2012-09-10 15:48:51.391512
675	\N	\N	Windows	\N	rdp	\N	\N	./exploits/windows/rdp/10320.py	f5bb68338ed630ffeffdb5db62f8a5979f175cf9	exploitdb	\N	2012-09-10 15:48:51.391512
\.


--
-- TOC entry 1886 (class 0 OID 24882)
-- Dependencies: 148
-- Data for Name: service_script; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY service_script (id, ip, port_id, protocol, service_name, script_id, script_output, date_modified) FROM stdin;
1	127.0.0.1/32	8888	tcp	unknown	ssh-hostkey	1024 ee:94:cc:a3:53:55:95:ce:95:bf:c1:0d:2e:4b:5a:04 (DSA)\n2048 eb:b6:c7:9e:a8:a4:c4:28:97:99:f0:19:6e:7b:95:75 (RSA)	2012-07-03 09:32:07.114303
2	127.0.0.1/32	8888	tcp	unknown	smtp-commands	\nEHLO daniel.elite, PIPELINING, SIZE 10240000, VRFY, ETRN, STARTTLS, ENHANCEDSTATUSCODES, 8BITMIME, DSN	2012-07-03 09:32:07.114303
3	127.0.0.1/32	8888	tcp	unknown	ssh-hostkey	1024 ee:94:cc:a3:53:55:95:ce:95:bf:c1:0d:2e:4b:5a:04 (DSA)\n2048 eb:b6:c7:9e:a8:a4:c4:28:97:99:f0:19:6e:7b:95:75 (RSA)	2012-07-03 11:34:44.540161
4	127.0.0.1/32	8888	tcp	unknown	smtp-commands	\nEHLO daniel.elite, PIPELINING, SIZE 10240000, VRFY, ETRN, STARTTLS, ENHANCEDSTATUSCODES, 8BITMIME, DSN	2012-07-03 11:34:44.540161
5	127.0.0.1/32	11211	tcp	achat	ssh-hostkey	1024 ee:94:cc:a3:53:55:95:ce:95:bf:c1:0d:2e:4b:5a:04 (DSA)\n2048 eb:b6:c7:9e:a8:a4:c4:28:97:99:f0:19:6e:7b:95:75 (RSA)	2012-08-08 11:43:19.357368
6	127.0.0.1/32	11211	tcp	achat	smtp-commands	\nEHLO daniel.elite, PIPELINING, SIZE 10240000, VRFY, ETRN, STARTTLS, ENHANCEDSTATUSCODES, 8BITMIME, DSN	2012-08-08 11:43:19.357368
7	127.0.0.1/32	11211	tcp	achat	ssh-hostkey	1024 ee:94:cc:a3:53:55:95:ce:95:bf:c1:0d:2e:4b:5a:04 (DSA)\n2048 eb:b6:c7:9e:a8:a4:c4:28:97:99:f0:19:6e:7b:95:75 (RSA)	2012-08-08 12:05:11.655104
8	127.0.0.1/32	11211	tcp	achat	smtp-commands	\nEHLO daniel.elite, PIPELINING, SIZE 10240000, VRFY, ETRN, STARTTLS, ENHANCEDSTATUSCODES, 8BITMIME, DSN	2012-08-08 12:05:11.655104
9	127.0.0.1/32	11211	tcp	memcache	ssh-hostkey	1024 ee:94:cc:a3:53:55:95:ce:95:bf:c1:0d:2e:4b:5a:04 (DSA)\n2048 eb:b6:c7:9e:a8:a4:c4:28:97:99:f0:19:6e:7b:95:75 (RSA)	2012-08-08 12:15:21.244322
10	127.0.0.1/32	11211	tcp	memcache	smtp-commands	\nEHLO daniel.elite, PIPELINING, SIZE 10240000, VRFY, ETRN, STARTTLS, ENHANCEDSTATUSCODES, 8BITMIME, DSN	2012-08-08 12:15:21.244322
11	127.0.0.1/32	11211	tcp	achat	ssh-hostkey	1024 ee:94:cc:a3:53:55:95:ce:95:bf:c1:0d:2e:4b:5a:04 (DSA)\n2048 eb:b6:c7:9e:a8:a4:c4:28:97:99:f0:19:6e:7b:95:75 (RSA)	2012-08-08 12:19:56.263842
12	127.0.0.1/32	11211	tcp	achat	smtp-commands	\nEHLO daniel.elite, PIPELINING, SIZE 10240000, VRFY, ETRN, STARTTLS, ENHANCEDSTATUSCODES, 8BITMIME, DSN	2012-08-08 12:19:56.263842
13	127.0.0.1/32	11211	tcp	achat	ssh-hostkey	1024 ee:94:cc:a3:53:55:95:ce:95:bf:c1:0d:2e:4b:5a:04 (DSA)\n2048 eb:b6:c7:9e:a8:a4:c4:28:97:99:f0:19:6e:7b:95:75 (RSA)	2012-08-08 12:27:32.030583
14	127.0.0.1/32	11211	tcp	achat	smtp-commands	\nEHLO daniel.elite, PIPELINING, SIZE 10240000, VRFY, ETRN, STARTTLS, ENHANCEDSTATUSCODES, 8BITMIME, DSN	2012-08-08 12:27:32.030583
15	127.0.0.1/32	11211	tcp	achat	ssh-hostkey	1024 ee:94:cc:a3:53:55:95:ce:95:bf:c1:0d:2e:4b:5a:04 (DSA)\n2048 eb:b6:c7:9e:a8:a4:c4:28:97:99:f0:19:6e:7b:95:75 (RSA)	2012-08-08 12:31:58.612743
16	127.0.0.1/32	11211	tcp	achat	smtp-commands	\nEHLO daniel.elite, PIPELINING, SIZE 10240000, VRFY, ETRN, STARTTLS, ENHANCEDSTATUSCODES, 8BITMIME, DSN	2012-08-08 12:31:58.612743
17	127.0.0.1/32	11211	tcp	achat	ssh-hostkey	1024 ee:94:cc:a3:53:55:95:ce:95:bf:c1:0d:2e:4b:5a:04 (DSA)\n2048 eb:b6:c7:9e:a8:a4:c4:28:97:99:f0:19:6e:7b:95:75 (RSA)	2012-08-08 12:36:35.154142
18	127.0.0.1/32	11211	tcp	achat	smtp-commands	\nEHLO daniel.elite, PIPELINING, SIZE 10240000, VRFY, ETRN, STARTTLS, ENHANCEDSTATUSCODES, 8BITMIME, DSN	2012-08-08 12:36:35.154142
19	127.0.0.1/32	11211	tcp	memcache	ssh-hostkey	1024 ee:94:cc:a3:53:55:95:ce:95:bf:c1:0d:2e:4b:5a:04 (DSA)\n2048 eb:b6:c7:9e:a8:a4:c4:28:97:99:f0:19:6e:7b:95:75 (RSA)	2012-08-08 12:45:37.754921
20	127.0.0.1/32	11211	tcp	memcache	smtp-commands	\nEHLO daniel.elite, PIPELINING, SIZE 10240000, VRFY, ETRN, STARTTLS, ENHANCEDSTATUSCODES, 8BITMIME, DSN	2012-08-08 12:45:37.754921
\.


-- Completed on 2012-09-10 15:56:31 MDT

--
-- PostgreSQL database dump complete
--

