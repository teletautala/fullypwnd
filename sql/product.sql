--
-- PostgreSQL database dump
--

-- Dumped from database version 9.1.5
-- Dumped by pg_dump version 9.1.5
-- Started on 2012-09-17 21:52:05 MDT

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

SET search_path = public, pg_catalog;

--
-- TOC entry 1953 (class 0 OID 0)
-- Dependencies: 173
-- Name: product_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('product_id_seq', 12, true);


--
-- TOC entry 1948 (class 0 OID 18459)
-- Dependencies: 172 1949
-- Data for Name: product; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY product (id, product_name, version, date_modified, default_port, vendor, default_admin_username, default_admin_password, password_constraints, service_name, extrainfo) FROM stdin;
1	Ability Server	2.34	2012-09-17 21:13:04.861019	21	Ability	\N	\N	\N	ftp	\N
2	3CDaemon	2.0	2012-09-17 21:20:53.291923	21	3com	\N	\N	\N	ftp	rev10
3	SlimFtpd	3.15	2012-09-17 21:22:01.676114	21	\N	\N	\N	\N	ftp	\N
4	SlimFtpd	3.16	2012-09-17 21:23:29.372872	21	\N	\N	\N	\N	ftp	\N
5	Femitter Server FTP	1.x	2012-09-17 21:28:31.15367	21	Femitter	\N	\N	\N	ftp	Multiple Vulnerabilities
6	Serv-U FTPD	3.x	2012-09-17 21:31:37.701721	21	Serv-U	\N	\N	\N	ftp	Multiple Vulnerabilities
7	Serv-U FTPD	4.x	2012-09-17 21:33:02.918638	21	Serv-U	\N	\N	\N	ftp	Multiple Vulnerabilites
8	Serv-U FTPD	5.x	2012-09-17 21:34:34.930693	21	Serv-U	\N	\N	\N	ftp	Multiple Vulnerabilities
9	Easy Personal FTP Server	5.8	2012-09-17 21:38:35.820141	21	XM	\N	\N	\N	ftp	\N
10	Vermillion FTP Daemon	1.31	2012-09-17 21:40:04.014684	21	Vermillion	\N	\N	\N	ftp	\N
11	UplusFtp Server	1.7.0.12	2012-09-17 21:42:04.725296	21	UplusFtp	\N	\N	\N	ftp	\N
12	Open & Compact FTPd	\N	2012-09-17 21:45:35.396784	21	Open	\N	\N	\N	ftp	\N
\.


-- Completed on 2012-09-17 21:52:05 MDT

--
-- PostgreSQL database dump complete
--

