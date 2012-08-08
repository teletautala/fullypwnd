--
-- PostgreSQL database dump
--

-- Started on 2012-08-08 12:48:47 MDT

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = off;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET escape_string_warning = off;

SET search_path = public, pg_catalog;

ALTER TABLE ONLY public.host_service DROP CONSTRAINT fk_host_ip;
ALTER TABLE ONLY public.service_exploit DROP CONSTRAINT fk_exploit_sha1;
ALTER TABLE ONLY public.exploit_parameter DROP CONSTRAINT fk_exploit_sha1;
ALTER TABLE ONLY public.service_exploit DROP CONSTRAINT uniq_working_exploit;
ALTER TABLE ONLY public.service DROP CONSTRAINT uniq_service;
ALTER TABLE ONLY public.host DROP CONSTRAINT uniq_ip;
ALTER TABLE ONLY public.host_service DROP CONSTRAINT uniq_host_service;
ALTER TABLE ONLY public.service_exploit DROP CONSTRAINT pk_working_exploit_id;
ALTER TABLE ONLY public.service_script DROP CONSTRAINT pk_service_script;
ALTER TABLE ONLY public.service DROP CONSTRAINT pk_service_id;
ALTER TABLE ONLY public.os_signature DROP CONSTRAINT pk_os_signature;
ALTER TABLE ONLY public.host_service DROP CONSTRAINT pk_host_service_id;
ALTER TABLE ONLY public.host DROP CONSTRAINT pk_host_id;
ALTER TABLE ONLY public.exploit_parameter DROP CONSTRAINT pk_exploit_parameter;
ALTER TABLE ONLY public.exploit DROP CONSTRAINT pk_exploit;
ALTER TABLE public.service_script ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.service_exploit ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.service ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.os_signature ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.host_service ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.host ALTER COLUMN id DROP DEFAULT;
DROP SEQUENCE public.working_exploit_id_seq;
DROP SEQUENCE public.service_script_id_seq;
DROP TABLE public.service_script;
DROP SEQUENCE public.service_id_seq;
DROP TABLE public.service_exploit;
DROP TABLE public.service;
DROP SEQUENCE public.os_signature_id_seq;
DROP TABLE public.os_signature;
DROP SEQUENCE public.host_service_id_seq;
DROP VIEW public.host_service_extended;
DROP TABLE public.host_service;
DROP SEQUENCE public.host_id_seq;
DROP TABLE public.host;
DROP TABLE public.exploit_parameter;
DROP TABLE public.exploit;
DROP SCHEMA public;
--
-- TOC entry 1856 (class 1262 OID 11564)
-- Dependencies: 1855
-- Name: postgres; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON DATABASE postgres IS 'default administrative connection database';


--
-- TOC entry 5 (class 2615 OID 24839)
-- Name: public; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO postgres;

--
-- TOC entry 1857 (class 0 OID 0)
-- Dependencies: 5
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA public IS 'standard public schema';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 154 (class 1259 OID 25007)
-- Dependencies: 5
-- Name: exploit; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE exploit (
    exploit_sha1 character(41) NOT NULL,
    exploit_githash character(41),
    preliminary_function character varying(25),
    source_file character varying(100)
);


ALTER TABLE public.exploit OWNER TO postgres;

--
-- TOC entry 153 (class 1259 OID 24969)
-- Dependencies: 5
-- Name: exploit_parameter; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE exploit_parameter (
    parameter character varying(15) NOT NULL,
    function character varying(25) NOT NULL,
    exploit_sha1 character(41) NOT NULL
)
WITH (autovacuum_enabled=true);


ALTER TABLE public.exploit_parameter OWNER TO postgres;

--
-- TOC entry 140 (class 1259 OID 24848)
-- Dependencies: 5
-- Name: host; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE host (
    date_modified timestamp with time zone NOT NULL,
    ip cidr NOT NULL,
    id integer NOT NULL,
    state character varying(25),
    reason character varying(25),
    hostname character varying(100),
    os_type character varying(100),
    os_vendor character varying(100),
    os_family character varying(100),
    os_gen character varying(100),
    osclass_accuracy integer,
    uptime integer,
    osmatch_name character varying(50),
    osmatch_accuracy integer,
    elapsed character varying(25),
    lastboot character varying(50),
    finished character varying(50),
    fingerprint character varying(1000)
)
WITH (autovacuum_enabled=true);


ALTER TABLE public.host OWNER TO postgres;

--
-- TOC entry 141 (class 1259 OID 24854)
-- Dependencies: 140 5
-- Name: host_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE host_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.host_id_seq OWNER TO postgres;

--
-- TOC entry 1859 (class 0 OID 0)
-- Dependencies: 141
-- Name: host_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE host_id_seq OWNED BY host.id;


--
-- TOC entry 142 (class 1259 OID 24856)
-- Dependencies: 5
-- Name: host_service; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE host_service (
    port_id integer NOT NULL,
    protocol character varying(25),
    service_name character varying(100),
    reason character varying(50),
    date_modified timestamp without time zone,
    ip cidr NOT NULL,
    id integer NOT NULL,
    state character varying(15),
    reason_ttl integer,
    product character varying(50),
    version character varying(50),
    extrainfo character varying(50),
    ostype character varying(50),
    method character varying(50),
    conf integer
)
WITH (autovacuum_enabled=true, toast.autovacuum_enabled=true);


ALTER TABLE public.host_service OWNER TO postgres;

--
-- TOC entry 143 (class 1259 OID 24862)
-- Dependencies: 1627 5
-- Name: host_service_extended; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW host_service_extended AS
    SELECT host.ip, host.os_family, host.os_vendor, host.os_gen, host.osmatch_name, host.osmatch_accuracy, host_service.port_id, host_service.service_name, host_service.product, host_service.version, host_service.extrainfo FROM (host JOIN host_service ON (((host.ip)::inet = (host_service.ip)::inet)));


ALTER TABLE public.host_service_extended OWNER TO postgres;

--
-- TOC entry 144 (class 1259 OID 24867)
-- Dependencies: 5 142
-- Name: host_service_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE host_service_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.host_service_id_seq OWNER TO postgres;

--
-- TOC entry 1860 (class 0 OID 0)
-- Dependencies: 144
-- Name: host_service_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE host_service_id_seq OWNED BY host_service.id;


--
-- TOC entry 145 (class 1259 OID 24869)
-- Dependencies: 5
-- Name: os_signature; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE os_signature (
    id integer NOT NULL,
    os_signature text NOT NULL,
    os_signature_source text NOT NULL,
    os_vendor character varying(50),
    os_name character varying(50),
    os_version character varying(25),
    os_release character varying(25),
    date_modified timestamp with time zone NOT NULL
)
WITH (autovacuum_enabled=true);


ALTER TABLE public.os_signature OWNER TO postgres;

--
-- TOC entry 146 (class 1259 OID 24875)
-- Dependencies: 145 5
-- Name: os_signature_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE os_signature_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.os_signature_id_seq OWNER TO postgres;

--
-- TOC entry 1861 (class 0 OID 0)
-- Dependencies: 146
-- Name: os_signature_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE os_signature_id_seq OWNED BY os_signature.id;


--
-- TOC entry 147 (class 1259 OID 24877)
-- Dependencies: 5
-- Name: service; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE service (
    service character varying(25) NOT NULL,
    default_port integer NOT NULL,
    id integer NOT NULL,
    servicedesc character varying(50),
    date_modified timestamp with time zone NOT NULL,
    protocol character varying(25),
    product character varying(50),
    version character varying(50),
    extrainfo character varying(50)
)
WITH (autovacuum_enabled=true);


ALTER TABLE public.service OWNER TO postgres;

--
-- TOC entry 151 (class 1259 OID 24890)
-- Dependencies: 1825 5
-- Name: service_exploit; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE service_exploit (
    id bigint NOT NULL,
    os_vendor character varying(100),
    os_type character varying(100),
    os_family character varying(100),
    os_gen character varying(100),
    service_name character varying(100),
    product character varying(50),
    version character varying(50),
    exploit_path text NOT NULL,
    exploit_sha1 character varying(41) NOT NULL,
    exploit_source character varying(50),
    preliminary_function character varying(100),
    date_modified timestamp without time zone DEFAULT now() NOT NULL
)
WITH (autovacuum_enabled=true);


ALTER TABLE public.service_exploit OWNER TO postgres;

--
-- TOC entry 148 (class 1259 OID 24880)
-- Dependencies: 5 147
-- Name: service_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE service_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.service_id_seq OWNER TO postgres;

--
-- TOC entry 1862 (class 0 OID 0)
-- Dependencies: 148
-- Name: service_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE service_id_seq OWNED BY service.id;


--
-- TOC entry 149 (class 1259 OID 24882)
-- Dependencies: 5
-- Name: service_script; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE service_script (
    id integer NOT NULL,
    ip cidr NOT NULL,
    port_id integer NOT NULL,
    protocol character varying(15) NOT NULL,
    service_name character varying(25) NOT NULL,
    script_id character varying(50),
    script_output text,
    date_modified timestamp without time zone NOT NULL
)
WITH (autovacuum_enabled=true);


ALTER TABLE public.service_script OWNER TO postgres;

--
-- TOC entry 150 (class 1259 OID 24888)
-- Dependencies: 149 5
-- Name: service_script_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE service_script_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.service_script_id_seq OWNER TO postgres;

--
-- TOC entry 1863 (class 0 OID 0)
-- Dependencies: 150
-- Name: service_script_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE service_script_id_seq OWNED BY service_script.id;


--
-- TOC entry 152 (class 1259 OID 24898)
-- Dependencies: 5 151
-- Name: working_exploit_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE working_exploit_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.working_exploit_id_seq OWNER TO postgres;

--
-- TOC entry 1864 (class 0 OID 0)
-- Dependencies: 152
-- Name: working_exploit_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE working_exploit_id_seq OWNED BY service_exploit.id;


--
-- TOC entry 1819 (class 2604 OID 24901)
-- Dependencies: 141 140
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY host ALTER COLUMN id SET DEFAULT nextval('host_id_seq'::regclass);


--
-- TOC entry 1820 (class 2604 OID 24902)
-- Dependencies: 144 142
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY host_service ALTER COLUMN id SET DEFAULT nextval('host_service_id_seq'::regclass);


--
-- TOC entry 1821 (class 2604 OID 24903)
-- Dependencies: 146 145
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY os_signature ALTER COLUMN id SET DEFAULT nextval('os_signature_id_seq'::regclass);


--
-- TOC entry 1822 (class 2604 OID 24904)
-- Dependencies: 148 147
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY service ALTER COLUMN id SET DEFAULT nextval('service_id_seq'::regclass);


--
-- TOC entry 1824 (class 2604 OID 24906)
-- Dependencies: 152 151
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY service_exploit ALTER COLUMN id SET DEFAULT nextval('working_exploit_id_seq'::regclass);


--
-- TOC entry 1823 (class 2604 OID 24905)
-- Dependencies: 150 149
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY service_script ALTER COLUMN id SET DEFAULT nextval('service_script_id_seq'::regclass);


--
-- TOC entry 1849 (class 2606 OID 25011)
-- Dependencies: 154 154
-- Name: pk_exploit; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY exploit
    ADD CONSTRAINT pk_exploit PRIMARY KEY (exploit_sha1);


--
-- TOC entry 1847 (class 2606 OID 25004)
-- Dependencies: 153 153 153 153
-- Name: pk_exploit_parameter; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY exploit_parameter
    ADD CONSTRAINT pk_exploit_parameter PRIMARY KEY (exploit_sha1, parameter, function);


--
-- TOC entry 1827 (class 2606 OID 24910)
-- Dependencies: 140 140
-- Name: pk_host_id; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY host
    ADD CONSTRAINT pk_host_id PRIMARY KEY (id);


--
-- TOC entry 1831 (class 2606 OID 24912)
-- Dependencies: 142 142
-- Name: pk_host_service_id; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY host_service
    ADD CONSTRAINT pk_host_service_id PRIMARY KEY (id);


--
-- TOC entry 1835 (class 2606 OID 24914)
-- Dependencies: 145 145
-- Name: pk_os_signature; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY os_signature
    ADD CONSTRAINT pk_os_signature PRIMARY KEY (id);


--
-- TOC entry 1837 (class 2606 OID 24916)
-- Dependencies: 147 147
-- Name: pk_service_id; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY service
    ADD CONSTRAINT pk_service_id PRIMARY KEY (id);


--
-- TOC entry 1841 (class 2606 OID 24918)
-- Dependencies: 149 149
-- Name: pk_service_script; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY service_script
    ADD CONSTRAINT pk_service_script PRIMARY KEY (id);


--
-- TOC entry 1843 (class 2606 OID 24920)
-- Dependencies: 151 151
-- Name: pk_working_exploit_id; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY service_exploit
    ADD CONSTRAINT pk_working_exploit_id PRIMARY KEY (id);


--
-- TOC entry 1833 (class 2606 OID 24924)
-- Dependencies: 142 142 142 142
-- Name: uniq_host_service; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY host_service
    ADD CONSTRAINT uniq_host_service UNIQUE (ip, port_id, protocol);


--
-- TOC entry 1829 (class 2606 OID 24926)
-- Dependencies: 140 140
-- Name: uniq_ip; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY host
    ADD CONSTRAINT uniq_ip UNIQUE (ip);


--
-- TOC entry 1839 (class 2606 OID 24928)
-- Dependencies: 147 147
-- Name: uniq_service; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY service
    ADD CONSTRAINT uniq_service UNIQUE (service);


--
-- TOC entry 1845 (class 2606 OID 25061)
-- Dependencies: 151 151 151
-- Name: uniq_working_exploit; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY service_exploit
    ADD CONSTRAINT uniq_working_exploit UNIQUE (exploit_sha1, exploit_path);


--
-- TOC entry 1852 (class 2606 OID 25012)
-- Dependencies: 153 1848 154
-- Name: fk_exploit_sha1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY exploit_parameter
    ADD CONSTRAINT fk_exploit_sha1 FOREIGN KEY (exploit_sha1) REFERENCES exploit(exploit_sha1) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 1851 (class 2606 OID 25069)
-- Dependencies: 151 1848 154
-- Name: fk_exploit_sha1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY service_exploit
    ADD CONSTRAINT fk_exploit_sha1 FOREIGN KEY (exploit_sha1) REFERENCES exploit(exploit_sha1);


--
-- TOC entry 1850 (class 2606 OID 24935)
-- Dependencies: 1828 140 142
-- Name: fk_host_ip; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY host_service
    ADD CONSTRAINT fk_host_ip FOREIGN KEY (ip) REFERENCES host(ip) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 1858 (class 0 OID 0)
-- Dependencies: 5
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2012-08-08 12:48:48 MDT

--
-- PostgreSQL database dump complete
--

