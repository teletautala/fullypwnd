--
-- PostgreSQL database dump
--

-- Dumped from database version 9.1.5
-- Dumped by pg_dump version 9.1.5
-- Started on 2012-09-17 21:50:24 MDT

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- TOC entry 2010 (class 1262 OID 11951)
-- Name: postgres; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE postgres WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'en_US.UTF-8' LC_CTYPE = 'en_US.UTF-8';


ALTER DATABASE postgres OWNER TO postgres;

\connect postgres

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- TOC entry 2011 (class 1262 OID 11951)
-- Dependencies: 2010
-- Name: postgres; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON DATABASE postgres IS 'default administrative connection database';


--
-- TOC entry 184 (class 3079 OID 11677)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2014 (class 0 OID 0)
-- Dependencies: 184
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 161 (class 1259 OID 18419)
-- Dependencies: 6
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
-- TOC entry 162 (class 1259 OID 18422)
-- Dependencies: 6
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
-- TOC entry 163 (class 1259 OID 18425)
-- Dependencies: 6
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
    osmatch_name character varying(100),
    osmatch_accuracy integer,
    elapsed character varying(25),
    lastboot character varying(50),
    finished character varying(50),
    fingerprint character varying(1000)
)
WITH (autovacuum_enabled=true);


ALTER TABLE public.host OWNER TO postgres;

--
-- TOC entry 164 (class 1259 OID 18431)
-- Dependencies: 6 163
-- Name: host_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE host_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.host_id_seq OWNER TO postgres;

--
-- TOC entry 2015 (class 0 OID 0)
-- Dependencies: 164
-- Name: host_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE host_id_seq OWNED BY host.id;


--
-- TOC entry 165 (class 1259 OID 18433)
-- Dependencies: 6
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
-- TOC entry 166 (class 1259 OID 18439)
-- Dependencies: 1956 6
-- Name: host_service_extended; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW host_service_extended AS
    SELECT host.ip, host.os_family, host.os_vendor, host.os_gen, host.osmatch_name, host.osmatch_accuracy, host_service.port_id, host_service.service_name, host_service.product, host_service.version, host_service.extrainfo FROM (host JOIN host_service ON (((host.ip)::inet = (host_service.ip)::inet)));


ALTER TABLE public.host_service_extended OWNER TO postgres;

--
-- TOC entry 167 (class 1259 OID 18444)
-- Dependencies: 6 165
-- Name: host_service_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE host_service_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.host_service_id_seq OWNER TO postgres;

--
-- TOC entry 2016 (class 0 OID 0)
-- Dependencies: 167
-- Name: host_service_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE host_service_id_seq OWNED BY host_service.id;


--
-- TOC entry 168 (class 1259 OID 18446)
-- Dependencies: 6
-- Name: nmap_service_alias; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE nmap_service_alias (
    id bigint NOT NULL,
    nmap_service character varying(100) NOT NULL,
    service_alias character varying(100) NOT NULL,
    date_modified timestamp without time zone
);


ALTER TABLE public.nmap_service_alias OWNER TO postgres;

--
-- TOC entry 169 (class 1259 OID 18449)
-- Dependencies: 6 168
-- Name: nmap_service_alias_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE nmap_service_alias_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.nmap_service_alias_id_seq OWNER TO postgres;

--
-- TOC entry 2017 (class 0 OID 0)
-- Dependencies: 169
-- Name: nmap_service_alias_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE nmap_service_alias_id_seq OWNED BY nmap_service_alias.id;


--
-- TOC entry 170 (class 1259 OID 18451)
-- Dependencies: 6
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
-- TOC entry 171 (class 1259 OID 18457)
-- Dependencies: 6 170
-- Name: os_signature_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE os_signature_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.os_signature_id_seq OWNER TO postgres;

--
-- TOC entry 2018 (class 0 OID 0)
-- Dependencies: 171
-- Name: os_signature_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE os_signature_id_seq OWNED BY os_signature.id;


--
-- TOC entry 172 (class 1259 OID 18459)
-- Dependencies: 1961 6
-- Name: product; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE product (
    id integer NOT NULL,
    product_name character varying(100),
    version text,
    date_modified timestamp without time zone DEFAULT now() NOT NULL,
    default_port integer,
    vendor character varying(100),
    default_admin_username character varying(50),
    default_admin_password character varying,
    password_constraints text,
    service_name character varying(100),
    extrainfo character varying(200)
);


ALTER TABLE public.product OWNER TO postgres;

--
-- TOC entry 183 (class 1259 OID 19716)
-- Dependencies: 6
-- Name: product_exploit; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE product_exploit (
    id bigint NOT NULL,
    exploit_sha1 character(41),
    product_id bigint
);


ALTER TABLE public.product_exploit OWNER TO postgres;

--
-- TOC entry 182 (class 1259 OID 19714)
-- Dependencies: 183 6
-- Name: product_exploit_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE product_exploit_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.product_exploit_id_seq OWNER TO postgres;

--
-- TOC entry 2019 (class 0 OID 0)
-- Dependencies: 182
-- Name: product_exploit_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE product_exploit_id_seq OWNED BY product_exploit.id;


--
-- TOC entry 173 (class 1259 OID 18466)
-- Dependencies: 172 6
-- Name: product_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE product_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.product_id_seq OWNER TO postgres;

--
-- TOC entry 2020 (class 0 OID 0)
-- Dependencies: 173
-- Name: product_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE product_id_seq OWNED BY product.id;


--
-- TOC entry 174 (class 1259 OID 18468)
-- Dependencies: 6
-- Name: scan; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE scan (
    id bigint NOT NULL,
    scanner character varying(50),
    args character varying(100),
    start integer,
    startstr character varying(50),
    type character varying(50),
    protocol character varying(5),
    numservices integer,
    state character varying(10),
    state_reason character varying(50)
);


ALTER TABLE public.scan OWNER TO postgres;

--
-- TOC entry 175 (class 1259 OID 18471)
-- Dependencies: 6 174
-- Name: scan_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE scan_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.scan_id_seq OWNER TO postgres;

--
-- TOC entry 2021 (class 0 OID 0)
-- Dependencies: 175
-- Name: scan_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE scan_id_seq OWNED BY scan.id;


--
-- TOC entry 176 (class 1259 OID 18473)
-- Dependencies: 6
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
    extrainfo character varying(50),
    os_family character varying(100)
)
WITH (autovacuum_enabled=true);


ALTER TABLE public.service OWNER TO postgres;

--
-- TOC entry 177 (class 1259 OID 18476)
-- Dependencies: 1965 6
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
-- TOC entry 178 (class 1259 OID 18483)
-- Dependencies: 176 6
-- Name: service_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE service_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.service_id_seq OWNER TO postgres;

--
-- TOC entry 2022 (class 0 OID 0)
-- Dependencies: 178
-- Name: service_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE service_id_seq OWNED BY service.id;


--
-- TOC entry 179 (class 1259 OID 18485)
-- Dependencies: 6
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
-- TOC entry 180 (class 1259 OID 18491)
-- Dependencies: 6 179
-- Name: service_script_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE service_script_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.service_script_id_seq OWNER TO postgres;

--
-- TOC entry 2023 (class 0 OID 0)
-- Dependencies: 180
-- Name: service_script_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE service_script_id_seq OWNED BY service_script.id;


--
-- TOC entry 181 (class 1259 OID 18493)
-- Dependencies: 177 6
-- Name: working_exploit_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE working_exploit_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.working_exploit_id_seq OWNER TO postgres;

--
-- TOC entry 2024 (class 0 OID 0)
-- Dependencies: 181
-- Name: working_exploit_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE working_exploit_id_seq OWNED BY service_exploit.id;


--
-- TOC entry 1957 (class 2604 OID 18495)
-- Dependencies: 164 163
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY host ALTER COLUMN id SET DEFAULT nextval('host_id_seq'::regclass);


--
-- TOC entry 1958 (class 2604 OID 18496)
-- Dependencies: 167 165
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY host_service ALTER COLUMN id SET DEFAULT nextval('host_service_id_seq'::regclass);


--
-- TOC entry 1959 (class 2604 OID 18497)
-- Dependencies: 169 168
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY nmap_service_alias ALTER COLUMN id SET DEFAULT nextval('nmap_service_alias_id_seq'::regclass);


--
-- TOC entry 1960 (class 2604 OID 18498)
-- Dependencies: 171 170
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY os_signature ALTER COLUMN id SET DEFAULT nextval('os_signature_id_seq'::regclass);


--
-- TOC entry 1962 (class 2604 OID 18499)
-- Dependencies: 173 172
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY product ALTER COLUMN id SET DEFAULT nextval('product_id_seq'::regclass);


--
-- TOC entry 1968 (class 2604 OID 19719)
-- Dependencies: 182 183 183
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY product_exploit ALTER COLUMN id SET DEFAULT nextval('product_exploit_id_seq'::regclass);


--
-- TOC entry 1963 (class 2604 OID 18500)
-- Dependencies: 175 174
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY scan ALTER COLUMN id SET DEFAULT nextval('scan_id_seq'::regclass);


--
-- TOC entry 1964 (class 2604 OID 18501)
-- Dependencies: 178 176
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY service ALTER COLUMN id SET DEFAULT nextval('service_id_seq'::regclass);


--
-- TOC entry 1966 (class 2604 OID 18502)
-- Dependencies: 181 177
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY service_exploit ALTER COLUMN id SET DEFAULT nextval('working_exploit_id_seq'::regclass);


--
-- TOC entry 1967 (class 2604 OID 18503)
-- Dependencies: 180 179
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY service_script ALTER COLUMN id SET DEFAULT nextval('service_script_id_seq'::regclass);


--
-- TOC entry 1970 (class 2606 OID 18505)
-- Dependencies: 161 161 2007
-- Name: pk_exploit; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY exploit
    ADD CONSTRAINT pk_exploit PRIMARY KEY (exploit_sha1);


--
-- TOC entry 1972 (class 2606 OID 18507)
-- Dependencies: 162 162 162 162 2007
-- Name: pk_exploit_parameter; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY exploit_parameter
    ADD CONSTRAINT pk_exploit_parameter PRIMARY KEY (exploit_sha1, parameter, function);


--
-- TOC entry 1974 (class 2606 OID 18509)
-- Dependencies: 163 163 2007
-- Name: pk_host_id; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY host
    ADD CONSTRAINT pk_host_id PRIMARY KEY (id);


--
-- TOC entry 1978 (class 2606 OID 18511)
-- Dependencies: 165 165 2007
-- Name: pk_host_service_id; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY host_service
    ADD CONSTRAINT pk_host_service_id PRIMARY KEY (id);


--
-- TOC entry 1982 (class 2606 OID 18513)
-- Dependencies: 168 168 2007
-- Name: pk_nmap_service_alias; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY nmap_service_alias
    ADD CONSTRAINT pk_nmap_service_alias PRIMARY KEY (id);


--
-- TOC entry 1984 (class 2606 OID 18515)
-- Dependencies: 170 170 2007
-- Name: pk_os_signature; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY os_signature
    ADD CONSTRAINT pk_os_signature PRIMARY KEY (id);


--
-- TOC entry 1986 (class 2606 OID 18517)
-- Dependencies: 172 172 2007
-- Name: pk_product; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY product
    ADD CONSTRAINT pk_product PRIMARY KEY (id);


--
-- TOC entry 2000 (class 2606 OID 19721)
-- Dependencies: 183 183 2007
-- Name: pk_product_exploit; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY product_exploit
    ADD CONSTRAINT pk_product_exploit PRIMARY KEY (id);


--
-- TOC entry 1988 (class 2606 OID 18519)
-- Dependencies: 174 174 2007
-- Name: pk_scan; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY scan
    ADD CONSTRAINT pk_scan PRIMARY KEY (id);


--
-- TOC entry 1990 (class 2606 OID 18521)
-- Dependencies: 176 176 2007
-- Name: pk_service_id; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY service
    ADD CONSTRAINT pk_service_id PRIMARY KEY (id);


--
-- TOC entry 1998 (class 2606 OID 18523)
-- Dependencies: 179 179 2007
-- Name: pk_service_script; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY service_script
    ADD CONSTRAINT pk_service_script PRIMARY KEY (id);


--
-- TOC entry 1994 (class 2606 OID 18525)
-- Dependencies: 177 177 2007
-- Name: pk_working_exploit_id; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY service_exploit
    ADD CONSTRAINT pk_working_exploit_id PRIMARY KEY (id);


--
-- TOC entry 1980 (class 2606 OID 18527)
-- Dependencies: 165 165 165 165 2007
-- Name: uniq_host_service; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY host_service
    ADD CONSTRAINT uniq_host_service UNIQUE (ip, port_id, protocol);


--
-- TOC entry 1976 (class 2606 OID 18529)
-- Dependencies: 163 163 2007
-- Name: uniq_ip; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY host
    ADD CONSTRAINT uniq_ip UNIQUE (ip);


--
-- TOC entry 1992 (class 2606 OID 18531)
-- Dependencies: 176 176 2007
-- Name: uniq_service; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY service
    ADD CONSTRAINT uniq_service UNIQUE (service);


--
-- TOC entry 1996 (class 2606 OID 18533)
-- Dependencies: 177 177 177 2007
-- Name: uniq_working_exploit; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY service_exploit
    ADD CONSTRAINT uniq_working_exploit UNIQUE (exploit_sha1, exploit_path);


--
-- TOC entry 2004 (class 2606 OID 19722)
-- Dependencies: 183 161 1969 2007
-- Name: fk_exploit; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY product_exploit
    ADD CONSTRAINT fk_exploit FOREIGN KEY (exploit_sha1) REFERENCES exploit(exploit_sha1);


--
-- TOC entry 2001 (class 2606 OID 18534)
-- Dependencies: 1969 161 162 2007
-- Name: fk_exploit_sha1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY exploit_parameter
    ADD CONSTRAINT fk_exploit_sha1 FOREIGN KEY (exploit_sha1) REFERENCES exploit(exploit_sha1) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2003 (class 2606 OID 18539)
-- Dependencies: 1969 177 161 2007
-- Name: fk_exploit_sha1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY service_exploit
    ADD CONSTRAINT fk_exploit_sha1 FOREIGN KEY (exploit_sha1) REFERENCES exploit(exploit_sha1);


--
-- TOC entry 2002 (class 2606 OID 18544)
-- Dependencies: 163 165 1975 2007
-- Name: fk_host_ip; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY host_service
    ADD CONSTRAINT fk_host_ip FOREIGN KEY (ip) REFERENCES host(ip) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2005 (class 2606 OID 19727)
-- Dependencies: 172 183 1985 2007
-- Name: fk_product; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY product_exploit
    ADD CONSTRAINT fk_product FOREIGN KEY (product_id) REFERENCES product(id);


--
-- TOC entry 2013 (class 0 OID 0)
-- Dependencies: 6
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2012-09-17 21:50:24 MDT

--
-- PostgreSQL database dump complete
--

