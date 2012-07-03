--
-- PostgreSQL database dump
--

-- Dumped from database version 9.1.4
-- Dumped by pg_dump version 9.1.4
-- Started on 2012-07-02 23:33:36 MDT

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

SET search_path = public, pg_catalog;

ALTER TABLE ONLY public.host_service DROP CONSTRAINT fk_host_ip;
ALTER TABLE ONLY public.service DROP CONSTRAINT uniq_service;
ALTER TABLE ONLY public.host DROP CONSTRAINT uniq_ip;
ALTER TABLE ONLY public.host_service DROP CONSTRAINT uniq_host_service;
ALTER TABLE ONLY public.exploits DROP CONSTRAINT uniq_exploit;
ALTER TABLE ONLY public.working_exploits DROP CONSTRAINT pk_working_exploit_id;
ALTER TABLE ONLY public.service_script DROP CONSTRAINT pk_service_script;
ALTER TABLE ONLY public.service DROP CONSTRAINT pk_service_id;
ALTER TABLE ONLY public.os_signature DROP CONSTRAINT pk_os_signature;
ALTER TABLE ONLY public.host_service DROP CONSTRAINT pk_host_service_id;
ALTER TABLE ONLY public.host DROP CONSTRAINT pk_host_id;
ALTER TABLE ONLY public.exploits DROP CONSTRAINT pk_exploit_id;
ALTER TABLE public.working_exploits ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.service_script ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.service ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.os_signature ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.host_service ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.host ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.exploits ALTER COLUMN id DROP DEFAULT;
DROP SEQUENCE public.working_exploits_id_seq;
DROP TABLE public.working_exploits;
DROP SEQUENCE public.service_script_id_seq;
DROP TABLE public.service_script;
DROP SEQUENCE public.service_id_seq;
DROP TABLE public.service;
DROP SEQUENCE public.os_signature_id_seq;
DROP TABLE public.os_signature;
DROP SEQUENCE public.host_service_id_seq;
DROP VIEW public.host_service_extended;
DROP TABLE public.host_service;
DROP SEQUENCE public.host_id_seq;
DROP TABLE public.host;
DROP SEQUENCE public.exploits_id_seq;
DROP TABLE public.exploits;
DROP EXTENSION plpgsql;
DROP SCHEMA public;
--
-- TOC entry 1966 (class 1262 OID 11951)
-- Dependencies: 1965
-- Name: postgres; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON DATABASE postgres IS 'default administrative connection database';


--
-- TOC entry 6 (class 2615 OID 2200)
-- Name: public; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO postgres;

--
-- TOC entry 1967 (class 0 OID 0)
-- Dependencies: 6
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA public IS 'standard public schema';


--
-- TOC entry 176 (class 3079 OID 11677)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 1969 (class 0 OID 0)
-- Dependencies: 176
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 161 (class 1259 OID 16832)
-- Dependencies: 6
-- Name: exploits; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE exploits (
    id integer NOT NULL,
    exploit_sha1 character varying(41) NOT NULL,
    exploit_source character varying(100) NOT NULL,
    exploit_path text NOT NULL,
    os_family character varying(25),
    service_name character varying(25),
    exploit_githash character varying(41)
);


ALTER TABLE public.exploits OWNER TO postgres;

--
-- TOC entry 162 (class 1259 OID 16838)
-- Dependencies: 161 6
-- Name: exploits_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE exploits_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.exploits_id_seq OWNER TO postgres;

--
-- TOC entry 1970 (class 0 OID 0)
-- Dependencies: 162
-- Name: exploits_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE exploits_id_seq OWNED BY exploits.id;


--
-- TOC entry 163 (class 1259 OID 16840)
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
    osmatch_name character varying(50),
    osmatch_accuracy integer,
    elapsed character varying(25),
    lastboot character varying(50),
    finished character varying(50),
    fingerprint character varying(1000)
);


ALTER TABLE public.host OWNER TO postgres;

--
-- TOC entry 164 (class 1259 OID 16846)
-- Dependencies: 163 6
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
-- TOC entry 1971 (class 0 OID 0)
-- Dependencies: 164
-- Name: host_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE host_id_seq OWNED BY host.id;


--
-- TOC entry 165 (class 1259 OID 16848)
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
-- TOC entry 175 (class 1259 OID 17283)
-- Dependencies: 1930 6
-- Name: host_service_extended; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW host_service_extended AS
    SELECT host.ip, host.os_family, host.os_vendor, host.os_gen, host.osmatch_name, host.osmatch_accuracy, host_service.port_id, host_service.service_name, host_service.product, host_service.version, host_service.extrainfo FROM (host JOIN host_service ON (((host.ip)::inet = (host_service.ip)::inet)));


ALTER TABLE public.host_service_extended OWNER TO postgres;

--
-- TOC entry 166 (class 1259 OID 16854)
-- Dependencies: 165 6
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
-- TOC entry 1972 (class 0 OID 0)
-- Dependencies: 166
-- Name: host_service_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE host_service_id_seq OWNED BY host_service.id;


--
-- TOC entry 167 (class 1259 OID 16856)
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
);


ALTER TABLE public.os_signature OWNER TO postgres;

--
-- TOC entry 168 (class 1259 OID 16862)
-- Dependencies: 6 167
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
-- TOC entry 1973 (class 0 OID 0)
-- Dependencies: 168
-- Name: os_signature_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE os_signature_id_seq OWNED BY os_signature.id;


--
-- TOC entry 169 (class 1259 OID 16864)
-- Dependencies: 6
-- Name: service; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE service (
    service character varying(25) NOT NULL,
    default_port integer NOT NULL,
    id integer NOT NULL,
    servicedesc character varying(50),
    date_modified timestamp with time zone NOT NULL
);


ALTER TABLE public.service OWNER TO postgres;

--
-- TOC entry 170 (class 1259 OID 16867)
-- Dependencies: 6 169
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
-- TOC entry 1974 (class 0 OID 0)
-- Dependencies: 170
-- Name: service_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE service_id_seq OWNED BY service.id;


--
-- TOC entry 171 (class 1259 OID 16869)
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
);


ALTER TABLE public.service_script OWNER TO postgres;

--
-- TOC entry 172 (class 1259 OID 16875)
-- Dependencies: 6 171
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
-- TOC entry 1975 (class 0 OID 0)
-- Dependencies: 172
-- Name: service_script_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE service_script_id_seq OWNED BY service_script.id;


--
-- TOC entry 173 (class 1259 OID 16877)
-- Dependencies: 1937 1938 6
-- Name: working_exploits; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE working_exploits (
    id bigint NOT NULL,
    exploit_id integer,
    os_vendor character varying(100),
    os_type character varying(100),
    os_famliy character varying(100),
    os_gen character varying(100),
    service_name character varying(100),
    product character varying(50),
    version character varying(50),
    attempts integer DEFAULT 0,
    successes integer DEFAULT 0
);


ALTER TABLE public.working_exploits OWNER TO postgres;

--
-- TOC entry 174 (class 1259 OID 16885)
-- Dependencies: 6 173
-- Name: working_exploits_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE working_exploits_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.working_exploits_id_seq OWNER TO postgres;

--
-- TOC entry 1976 (class 0 OID 0)
-- Dependencies: 174
-- Name: working_exploits_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE working_exploits_id_seq OWNED BY working_exploits.id;


--
-- TOC entry 1931 (class 2604 OID 16887)
-- Dependencies: 162 161
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY exploits ALTER COLUMN id SET DEFAULT nextval('exploits_id_seq'::regclass);


--
-- TOC entry 1932 (class 2604 OID 16888)
-- Dependencies: 164 163
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY host ALTER COLUMN id SET DEFAULT nextval('host_id_seq'::regclass);


--
-- TOC entry 1933 (class 2604 OID 16889)
-- Dependencies: 166 165
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY host_service ALTER COLUMN id SET DEFAULT nextval('host_service_id_seq'::regclass);


--
-- TOC entry 1934 (class 2604 OID 16890)
-- Dependencies: 168 167
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY os_signature ALTER COLUMN id SET DEFAULT nextval('os_signature_id_seq'::regclass);


--
-- TOC entry 1935 (class 2604 OID 16891)
-- Dependencies: 170 169
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY service ALTER COLUMN id SET DEFAULT nextval('service_id_seq'::regclass);


--
-- TOC entry 1936 (class 2604 OID 16892)
-- Dependencies: 172 171
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY service_script ALTER COLUMN id SET DEFAULT nextval('service_script_id_seq'::regclass);


--
-- TOC entry 1939 (class 2604 OID 16893)
-- Dependencies: 174 173
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY working_exploits ALTER COLUMN id SET DEFAULT nextval('working_exploits_id_seq'::regclass);


--
-- TOC entry 1941 (class 2606 OID 16895)
-- Dependencies: 161 161
-- Name: pk_exploit_id; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY exploits
    ADD CONSTRAINT pk_exploit_id PRIMARY KEY (id);


--
-- TOC entry 1945 (class 2606 OID 16897)
-- Dependencies: 163 163
-- Name: pk_host_id; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY host
    ADD CONSTRAINT pk_host_id PRIMARY KEY (id);


--
-- TOC entry 1949 (class 2606 OID 16899)
-- Dependencies: 165 165
-- Name: pk_host_service_id; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY host_service
    ADD CONSTRAINT pk_host_service_id PRIMARY KEY (id);


--
-- TOC entry 1953 (class 2606 OID 16901)
-- Dependencies: 167 167
-- Name: pk_os_signature; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY os_signature
    ADD CONSTRAINT pk_os_signature PRIMARY KEY (id);


--
-- TOC entry 1955 (class 2606 OID 16903)
-- Dependencies: 169 169
-- Name: pk_service_id; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY service
    ADD CONSTRAINT pk_service_id PRIMARY KEY (id);


--
-- TOC entry 1959 (class 2606 OID 16905)
-- Dependencies: 171 171
-- Name: pk_service_script; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY service_script
    ADD CONSTRAINT pk_service_script PRIMARY KEY (id);


--
-- TOC entry 1961 (class 2606 OID 16907)
-- Dependencies: 173 173
-- Name: pk_working_exploit_id; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY working_exploits
    ADD CONSTRAINT pk_working_exploit_id PRIMARY KEY (id);


--
-- TOC entry 1943 (class 2606 OID 16909)
-- Dependencies: 161 161 161
-- Name: uniq_exploit; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY exploits
    ADD CONSTRAINT uniq_exploit UNIQUE (exploit_sha1, exploit_source);


--
-- TOC entry 1951 (class 2606 OID 16911)
-- Dependencies: 165 165 165 165
-- Name: uniq_host_service; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY host_service
    ADD CONSTRAINT uniq_host_service UNIQUE (ip, port_id, protocol);


--
-- TOC entry 1947 (class 2606 OID 16913)
-- Dependencies: 163 163
-- Name: uniq_ip; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY host
    ADD CONSTRAINT uniq_ip UNIQUE (ip);


--
-- TOC entry 1957 (class 2606 OID 16915)
-- Dependencies: 169 169
-- Name: uniq_service; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY service
    ADD CONSTRAINT uniq_service UNIQUE (service);


--
-- TOC entry 1962 (class 2606 OID 16916)
-- Dependencies: 1946 165 163
-- Name: fk_host_ip; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY host_service
    ADD CONSTRAINT fk_host_ip FOREIGN KEY (ip) REFERENCES host(ip) MATCH FULL;


--
-- TOC entry 1968 (class 0 OID 0)
-- Dependencies: 6
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2012-07-02 23:33:36 MDT

--
-- PostgreSQL database dump complete
--

