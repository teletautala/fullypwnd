--
-- PostgreSQL database dump
--

-- Started on 2012-06-19 15:50:11 MDT

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = off;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET escape_string_warning = off;

SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 151 (class 1259 OID 24765)
-- Dependencies: 3
-- Name: exploits; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE exploits (
    id integer NOT NULL,
    exploit_id character varying(30) NOT NULL,
    exploit_source character varying(100) NOT NULL
);


ALTER TABLE public.exploits OWNER TO postgres;

--
-- TOC entry 150 (class 1259 OID 24763)
-- Dependencies: 3 151
-- Name: exploits_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE exploits_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.exploits_id_seq OWNER TO postgres;

--
-- TOC entry 1849 (class 0 OID 0)
-- Dependencies: 150
-- Name: exploits_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE exploits_id_seq OWNED BY exploits.id;


--
-- TOC entry 140 (class 1259 OID 16385)
-- Dependencies: 3
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
-- TOC entry 144 (class 1259 OID 16480)
-- Dependencies: 3 140
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
-- TOC entry 1850 (class 0 OID 0)
-- Dependencies: 144
-- Name: host_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE host_id_seq OWNED BY host.id;


--
-- TOC entry 141 (class 1259 OID 16390)
-- Dependencies: 3
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
-- TOC entry 145 (class 1259 OID 24576)
-- Dependencies: 3 141
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
-- TOC entry 1851 (class 0 OID 0)
-- Dependencies: 145
-- Name: host_service_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE host_service_id_seq OWNED BY host_service.id;


--
-- TOC entry 147 (class 1259 OID 24593)
-- Dependencies: 3
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
-- TOC entry 146 (class 1259 OID 24591)
-- Dependencies: 3 147
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
-- TOC entry 1852 (class 0 OID 0)
-- Dependencies: 146
-- Name: os_signature_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE os_signature_id_seq OWNED BY os_signature.id;


--
-- TOC entry 142 (class 1259 OID 16401)
-- Dependencies: 3
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
-- TOC entry 143 (class 1259 OID 16458)
-- Dependencies: 142 3
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
-- TOC entry 1853 (class 0 OID 0)
-- Dependencies: 143
-- Name: service_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE service_id_seq OWNED BY service.id;


--
-- TOC entry 149 (class 1259 OID 24748)
-- Dependencies: 3
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
-- TOC entry 148 (class 1259 OID 24746)
-- Dependencies: 3 149
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
-- TOC entry 1854 (class 0 OID 0)
-- Dependencies: 148
-- Name: service_script_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE service_script_id_seq OWNED BY service_script.id;


--
-- TOC entry 153 (class 1259 OID 24775)
-- Dependencies: 1819 1820 3
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
-- TOC entry 152 (class 1259 OID 24773)
-- Dependencies: 3 153
-- Name: working_exploits_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE working_exploits_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.working_exploits_id_seq OWNER TO postgres;

--
-- TOC entry 1855 (class 0 OID 0)
-- Dependencies: 152
-- Name: working_exploits_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE working_exploits_id_seq OWNED BY working_exploits.id;


--
-- TOC entry 1817 (class 2604 OID 24768)
-- Dependencies: 151 150 151
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY exploits ALTER COLUMN id SET DEFAULT nextval('exploits_id_seq'::regclass);


--
-- TOC entry 1812 (class 2604 OID 16482)
-- Dependencies: 144 140
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY host ALTER COLUMN id SET DEFAULT nextval('host_id_seq'::regclass);


--
-- TOC entry 1813 (class 2604 OID 24578)
-- Dependencies: 145 141
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY host_service ALTER COLUMN id SET DEFAULT nextval('host_service_id_seq'::regclass);


--
-- TOC entry 1815 (class 2604 OID 24596)
-- Dependencies: 146 147 147
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY os_signature ALTER COLUMN id SET DEFAULT nextval('os_signature_id_seq'::regclass);


--
-- TOC entry 1814 (class 2604 OID 16460)
-- Dependencies: 143 142
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY service ALTER COLUMN id SET DEFAULT nextval('service_id_seq'::regclass);


--
-- TOC entry 1816 (class 2604 OID 24751)
-- Dependencies: 149 148 149
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY service_script ALTER COLUMN id SET DEFAULT nextval('service_script_id_seq'::regclass);


--
-- TOC entry 1818 (class 2604 OID 24778)
-- Dependencies: 152 153 153
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY working_exploits ALTER COLUMN id SET DEFAULT nextval('working_exploits_id_seq'::regclass);


--
-- TOC entry 1838 (class 2606 OID 24770)
-- Dependencies: 151 151
-- Name: pk_exploit_id; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY exploits
    ADD CONSTRAINT pk_exploit_id PRIMARY KEY (id);


--
-- TOC entry 1822 (class 2606 OID 16492)
-- Dependencies: 140 140
-- Name: pk_host_id; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY host
    ADD CONSTRAINT pk_host_id PRIMARY KEY (id);


--
-- TOC entry 1826 (class 2606 OID 24586)
-- Dependencies: 141 141
-- Name: pk_host_service_id; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY host_service
    ADD CONSTRAINT pk_host_service_id PRIMARY KEY (id);


--
-- TOC entry 1834 (class 2606 OID 24601)
-- Dependencies: 147 147
-- Name: pk_os_signature; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY os_signature
    ADD CONSTRAINT pk_os_signature PRIMARY KEY (id);


--
-- TOC entry 1830 (class 2606 OID 16465)
-- Dependencies: 142 142
-- Name: pk_service_id; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY service
    ADD CONSTRAINT pk_service_id PRIMARY KEY (id);


--
-- TOC entry 1836 (class 2606 OID 24756)
-- Dependencies: 149 149
-- Name: pk_service_script; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY service_script
    ADD CONSTRAINT pk_service_script PRIMARY KEY (id);


--
-- TOC entry 1842 (class 2606 OID 24780)
-- Dependencies: 153 153
-- Name: pk_working_exploit_id; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY working_exploits
    ADD CONSTRAINT pk_working_exploit_id PRIMARY KEY (id);


--
-- TOC entry 1840 (class 2606 OID 24772)
-- Dependencies: 151 151 151
-- Name: uniq_exploit; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY exploits
    ADD CONSTRAINT uniq_exploit UNIQUE (exploit_id, exploit_source);


--
-- TOC entry 1828 (class 2606 OID 24625)
-- Dependencies: 141 141 141 141
-- Name: uniq_host_service; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY host_service
    ADD CONSTRAINT uniq_host_service UNIQUE (ip, port_id, protocol);


--
-- TOC entry 1824 (class 2606 OID 16434)
-- Dependencies: 140 140
-- Name: uniq_ip; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY host
    ADD CONSTRAINT uniq_ip UNIQUE (ip);


--
-- TOC entry 1832 (class 2606 OID 16474)
-- Dependencies: 142 142
-- Name: uniq_service; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY service
    ADD CONSTRAINT uniq_service UNIQUE (service);


--
-- TOC entry 1843 (class 2606 OID 16468)
-- Dependencies: 1823 141 140
-- Name: fk_host_ip; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY host_service
    ADD CONSTRAINT fk_host_ip FOREIGN KEY (ip) REFERENCES host(ip) MATCH FULL;


--
-- TOC entry 1848 (class 0 OID 0)
-- Dependencies: 3
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2012-06-19 15:50:11 MDT

--
-- PostgreSQL database dump complete
--

