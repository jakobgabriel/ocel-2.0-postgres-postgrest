-- PostgreSQL database dump

-- Dumped from database version 14.4
-- Dumped by pg_dump version 14.4

-- Adjusted for Docker initialization

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

-- Ensure we are not in the 'ocelv2' database
\c postgres

-- Use a DO block to handle the database creation logic
DO $$
BEGIN
    -- Check if the 'ocelv2' database exists
    IF EXISTS (SELECT FROM pg_database WHERE datname = 'ocelv2') THEN
        -- If it exists, and we are not connected to it, drop it
        RAISE NOTICE 'Dropping existing database ocelv2';
        EXECUTE 'DROP DATABASE ocelv2';
    END IF;
    
    -- Create the database after dropping it, or if it didn't exist
    RAISE NOTICE 'Creating database ocelv2';
    EXECUTE 'CREATE DATABASE ocelv2 WITH TEMPLATE = template0 ENCODING = ''UTF8'' LOCALE = ''German_Germany.1252''';
END
$$;

-- CREATE DATABASE ocelv2 

ALTER DATABASE ocelv2 OWNER TO postgres;

\connect ocelv2

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 212 (class 1259 OID 16921)
-- Name: event; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.event (
    event_id integer NOT NULL,
    event_type_id integer NOT NULL,
    "timestamp" timestamp without time zone NOT NULL
);


ALTER TABLE public.event OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 16933)
-- Name: event_attribute; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.event_attribute (
    event_attribute_id integer NOT NULL,
    event_type_id integer NOT NULL,
    name character varying(255) NOT NULL
);


ALTER TABLE public.event_attribute OWNER TO postgres;

--
-- TOC entry 213 (class 1259 OID 16932)
-- Name: event_attribute_event_attribute_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.event_attribute_event_attribute_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.event_attribute_event_attribute_id_seq OWNER TO postgres;

--
-- TOC entry 3408 (class 0 OID 0)
-- Dependencies: 213
-- Name: event_attribute_event_attribute_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.event_attribute_event_attribute_id_seq OWNED BY public.event_attribute.event_attribute_id;


--
-- TOC entry 216 (class 1259 OID 16945)
-- Name: event_attribute_value; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.event_attribute_value (
    event_attribute_value_id integer NOT NULL,
    event_id integer NOT NULL,
    event_attribute_id integer NOT NULL,
    value json NOT NULL
);


ALTER TABLE public.event_attribute_value OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 16944)
-- Name: event_attribute_value_event_attribute_value_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.event_attribute_value_event_attribute_value_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.event_attribute_value_event_attribute_value_id_seq OWNER TO postgres;

--
-- TOC entry 3409 (class 0 OID 0)
-- Dependencies: 215
-- Name: event_attribute_value_event_attribute_value_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.event_attribute_value_event_attribute_value_id_seq OWNED BY public.event_attribute_value.event_attribute_value_id;


--
-- TOC entry 211 (class 1259 OID 16920)
-- Name: event_event_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.event_event_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.event_event_id_seq OWNER TO postgres;

--
-- TOC entry 3410 (class 0 OID 0)
-- Dependencies: 211
-- Name: event_event_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.event_event_id_seq OWNED BY public.event.event_id;


--
-- TOC entry 230 (class 1259 OID 17047)
-- Name: event_object_relationship; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.event_object_relationship (
    event_object_relationship_id integer NOT NULL,
    event_id integer NOT NULL,
    object_id integer NOT NULL,
    qualifier_id integer NOT NULL
);


ALTER TABLE public.event_object_relationship OWNER TO postgres;

--
-- TOC entry 229 (class 1259 OID 17046)
-- Name: event_object_relationship_event_object_relationship_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.event_object_relationship_event_object_relationship_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.event_object_relationship_event_object_relationship_id_seq OWNER TO postgres;

--
-- TOC entry 3411 (class 0 OID 0)
-- Dependencies: 229
-- Name: event_object_relationship_event_object_relationship_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.event_object_relationship_event_object_relationship_id_seq OWNED BY public.event_object_relationship.event_object_relationship_id;


--
-- TOC entry 210 (class 1259 OID 16914)
-- Name: event_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.event_type (
    event_type_id integer NOT NULL,
    name character varying(255) NOT NULL
);


ALTER TABLE public.event_type OWNER TO postgres;

--
-- TOC entry 209 (class 1259 OID 16913)
-- Name: event_type_event_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.event_type_event_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.event_type_event_type_id_seq OWNER TO postgres;

--
-- TOC entry 3412 (class 0 OID 0)
-- Dependencies: 209
-- Name: event_type_event_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.event_type_event_type_id_seq OWNED BY public.event_type.event_type_id;


--
-- TOC entry 220 (class 1259 OID 16971)
-- Name: object; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.object (
    object_id integer NOT NULL,
    object_type_id integer NOT NULL
);


ALTER TABLE public.object OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 16983)
-- Name: object_attribute; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.object_attribute (
    object_attribute_id integer NOT NULL,
    object_type_id integer NOT NULL,
    name character varying(255) NOT NULL
);


ALTER TABLE public.object_attribute OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 16982)
-- Name: object_attribute_object_attribute_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.object_attribute_object_attribute_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.object_attribute_object_attribute_id_seq OWNER TO postgres;

--
-- TOC entry 3413 (class 0 OID 0)
-- Dependencies: 221
-- Name: object_attribute_object_attribute_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.object_attribute_object_attribute_id_seq OWNED BY public.object_attribute.object_attribute_id;


--
-- TOC entry 224 (class 1259 OID 16995)
-- Name: object_attribute_value; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.object_attribute_value (
    object_attribute_value_id integer NOT NULL,
    object_id integer NOT NULL,
    object_attribute_id integer NOT NULL,
    "timestamp" timestamp without time zone NOT NULL,
    value json NOT NULL
);


ALTER TABLE public.object_attribute_value OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 16994)
-- Name: object_attribute_value_object_attribute_value_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.object_attribute_value_object_attribute_value_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.object_attribute_value_object_attribute_value_id_seq OWNER TO postgres;

--
-- TOC entry 3414 (class 0 OID 0)
-- Dependencies: 223
-- Name: object_attribute_value_object_attribute_value_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.object_attribute_value_object_attribute_value_id_seq OWNED BY public.object_attribute_value.object_attribute_value_id;


--
-- TOC entry 219 (class 1259 OID 16970)
-- Name: object_object_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.object_object_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.object_object_id_seq OWNER TO postgres;

--
-- TOC entry 3415 (class 0 OID 0)
-- Dependencies: 219
-- Name: object_object_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.object_object_id_seq OWNED BY public.object.object_id;


--
-- TOC entry 228 (class 1259 OID 17023)
-- Name: object_relationship; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.object_relationship (
    object_relationship_id integer NOT NULL,
    object_parent_id integer NOT NULL,
    object_child_id integer NOT NULL,
    qualifier_id integer
);


ALTER TABLE public.object_relationship OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 17022)
-- Name: object_relationship_object_relationship_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.object_relationship_object_relationship_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.object_relationship_object_relationship_id_seq OWNER TO postgres;

--
-- TOC entry 3416 (class 0 OID 0)
-- Dependencies: 227
-- Name: object_relationship_object_relationship_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.object_relationship_object_relationship_id_seq OWNED BY public.object_relationship.object_relationship_id;


--
-- TOC entry 218 (class 1259 OID 16964)
-- Name: object_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.object_type (
    object_type_id integer NOT NULL,
    name character varying(255) NOT NULL
);


ALTER TABLE public.object_type OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 16963)
-- Name: object_type_object_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.object_type_object_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.object_type_object_type_id_seq OWNER TO postgres;

--
-- TOC entry 3417 (class 0 OID 0)
-- Dependencies: 217
-- Name: object_type_object_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.object_type_object_type_id_seq OWNED BY public.object_type.object_type_id;


--
-- TOC entry 226 (class 1259 OID 17014)
-- Name: qualifier; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.qualifier (
    qualifier_id integer NOT NULL,
    value json NOT NULL
);


ALTER TABLE public.qualifier OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 17013)
-- Name: qualifier_qualifier_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.qualifier_qualifier_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.qualifier_qualifier_id_seq OWNER TO postgres;

--
-- TOC entry 3418 (class 0 OID 0)
-- Dependencies: 225
-- Name: qualifier_qualifier_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.qualifier_qualifier_id_seq OWNED BY public.qualifier.qualifier_id;


--
-- TOC entry 3215 (class 2604 OID 16924)
-- Name: event event_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.event ALTER COLUMN event_id SET DEFAULT nextval('public.event_event_id_seq'::regclass);


--
-- TOC entry 3216 (class 2604 OID 16936)
-- Name: event_attribute event_attribute_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.event_attribute ALTER COLUMN event_attribute_id SET DEFAULT nextval('public.event_attribute_event_attribute_id_seq'::regclass);


--
-- TOC entry 3217 (class 2604 OID 16948)
-- Name: event_attribute_value event_attribute_value_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.event_attribute_value ALTER COLUMN event_attribute_value_id SET DEFAULT nextval('public.event_attribute_value_event_attribute_value_id_seq'::regclass);


--
-- TOC entry 3224 (class 2604 OID 17050)
-- Name: event_object_relationship event_object_relationship_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.event_object_relationship ALTER COLUMN event_object_relationship_id SET DEFAULT nextval('public.event_object_relationship_event_object_relationship_id_seq'::regclass);


--
-- TOC entry 3214 (class 2604 OID 16917)
-- Name: event_type event_type_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.event_type ALTER COLUMN event_type_id SET DEFAULT nextval('public.event_type_event_type_id_seq'::regclass);


--
-- TOC entry 3219 (class 2604 OID 16974)
-- Name: object object_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.object ALTER COLUMN object_id SET DEFAULT nextval('public.object_object_id_seq'::regclass);


--
-- TOC entry 3220 (class 2604 OID 16986)
-- Name: object_attribute object_attribute_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.object_attribute ALTER COLUMN object_attribute_id SET DEFAULT nextval('public.object_attribute_object_attribute_id_seq'::regclass);


--
-- TOC entry 3221 (class 2604 OID 16998)
-- Name: object_attribute_value object_attribute_value_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.object_attribute_value ALTER COLUMN object_attribute_value_id SET DEFAULT nextval('public.object_attribute_value_object_attribute_value_id_seq'::regclass);


--
-- TOC entry 3223 (class 2604 OID 17026)
-- Name: object_relationship object_relationship_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.object_relationship ALTER COLUMN object_relationship_id SET DEFAULT nextval('public.object_relationship_object_relationship_id_seq'::regclass);


--
-- TOC entry 3218 (class 2604 OID 16967)
-- Name: object_type object_type_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.object_type ALTER COLUMN object_type_id SET DEFAULT nextval('public.object_type_object_type_id_seq'::regclass);


--
-- TOC entry 3222 (class 2604 OID 17017)
-- Name: qualifier qualifier_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.qualifier ALTER COLUMN qualifier_id SET DEFAULT nextval('public.qualifier_qualifier_id_seq'::regclass);


--
-- TOC entry 3230 (class 2606 OID 16938)
-- Name: event_attribute event_attribute_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.event_attribute
    ADD CONSTRAINT event_attribute_pkey PRIMARY KEY (event_attribute_id);


--
-- TOC entry 3232 (class 2606 OID 16952)
-- Name: event_attribute_value event_attribute_value_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.event_attribute_value
    ADD CONSTRAINT event_attribute_value_pkey PRIMARY KEY (event_attribute_value_id);


--
-- TOC entry 3248 (class 2606 OID 17052)
-- Name: event_object_relationship event_object_relationship_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.event_object_relationship
    ADD CONSTRAINT event_object_relationship_pkey PRIMARY KEY (event_object_relationship_id);


--
-- TOC entry 3228 (class 2606 OID 16926)
-- Name: event event_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.event
    ADD CONSTRAINT event_pkey PRIMARY KEY (event_id);


--
-- TOC entry 3226 (class 2606 OID 16919)
-- Name: event_type event_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.event_type
    ADD CONSTRAINT event_type_pkey PRIMARY KEY (event_type_id);


--
-- TOC entry 3244 (class 2606 OID 17030)
-- Name: object_relationship fk_object_hierarchy; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.object_relationship
    ADD CONSTRAINT fk_object_hierarchy UNIQUE (object_parent_id, object_child_id);


--
-- TOC entry 3238 (class 2606 OID 16988)
-- Name: object_attribute object_attribute_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.object_attribute
    ADD CONSTRAINT object_attribute_pkey PRIMARY KEY (object_attribute_id);


--
-- TOC entry 3240 (class 2606 OID 17002)
-- Name: object_attribute_value object_attribute_value_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.object_attribute_value
    ADD CONSTRAINT object_attribute_value_pkey PRIMARY KEY (object_attribute_value_id);


--
-- TOC entry 3236 (class 2606 OID 16976)
-- Name: object object_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.object
    ADD CONSTRAINT object_pkey PRIMARY KEY (object_id);


--
-- TOC entry 3246 (class 2606 OID 17028)
-- Name: object_relationship object_relationship_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.object_relationship
    ADD CONSTRAINT object_relationship_pkey PRIMARY KEY (object_relationship_id);


--
-- TOC entry 3234 (class 2606 OID 16969)
-- Name: object_type object_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.object_type
    ADD CONSTRAINT object_type_pkey PRIMARY KEY (object_type_id);


--
-- TOC entry 3242 (class 2606 OID 17021)
-- Name: qualifier qualifier_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.qualifier
    ADD CONSTRAINT qualifier_pkey PRIMARY KEY (qualifier_id);


--
-- TOC entry 3250 (class 2606 OID 16939)
-- Name: event_attribute event_attribute_event_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.event_attribute
    ADD CONSTRAINT event_attribute_event_type_id_fkey FOREIGN KEY (event_type_id) REFERENCES public.event_type(event_type_id);


--
-- TOC entry 3252 (class 2606 OID 16958)
-- Name: event_attribute_value event_attribute_value_event_attribute_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.event_attribute_value
    ADD CONSTRAINT event_attribute_value_event_attribute_id_fkey FOREIGN KEY (event_attribute_id) REFERENCES public.event_attribute(event_attribute_id);


--
-- TOC entry 3251 (class 2606 OID 16953)
-- Name: event_attribute_value event_attribute_value_event_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.event_attribute_value
    ADD CONSTRAINT event_attribute_value_event_id_fkey FOREIGN KEY (event_id) REFERENCES public.event(event_id);


--
-- TOC entry 3249 (class 2606 OID 16927)
-- Name: event event_event_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.event
    ADD CONSTRAINT event_event_type_id_fkey FOREIGN KEY (event_type_id) REFERENCES public.event_type(event_type_id);


--
-- TOC entry 3260 (class 2606 OID 17053)
-- Name: event_object_relationship event_object_relationship_event_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.event_object_relationship
    ADD CONSTRAINT event_object_relationship_event_id_fkey FOREIGN KEY (event_id) REFERENCES public.event(event_id);


--
-- TOC entry 3261 (class 2606 OID 17058)
-- Name: event_object_relationship event_object_relationship_object_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.event_object_relationship
    ADD CONSTRAINT event_object_relationship_object_id_fkey FOREIGN KEY (object_id) REFERENCES public.object(object_id);


--
-- TOC entry 3262 (class 2606 OID 17063)
-- Name: event_object_relationship event_object_relationship_qualifier_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.event_object_relationship
    ADD CONSTRAINT event_object_relationship_qualifier_id_fkey FOREIGN KEY (qualifier_id) REFERENCES public.qualifier(qualifier_id);


--
-- TOC entry 3254 (class 2606 OID 16989)
-- Name: object_attribute object_attribute_object_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.object_attribute
    ADD CONSTRAINT object_attribute_object_type_id_fkey FOREIGN KEY (object_type_id) REFERENCES public.object_type(object_type_id);


--
-- TOC entry 3256 (class 2606 OID 17008)
-- Name: object_attribute_value object_attribute_value_object_attribute_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.object_attribute_value
    ADD CONSTRAINT object_attribute_value_object_attribute_id_fkey FOREIGN KEY (object_attribute_id) REFERENCES public.object_attribute(object_attribute_id);


--
-- TOC entry 3255 (class 2606 OID 17003)
-- Name: object_attribute_value object_attribute_value_object_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.object_attribute_value
    ADD CONSTRAINT object_attribute_value_object_id_fkey FOREIGN KEY (object_id) REFERENCES public.object(object_id);


--
-- TOC entry 3253 (class 2606 OID 16977)
-- Name: object object_object_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.object
    ADD CONSTRAINT object_object_type_id_fkey FOREIGN KEY (object_type_id) REFERENCES public.object_type(object_type_id);


--
-- TOC entry 3258 (class 2606 OID 17036)
-- Name: object_relationship object_relationship_object_child_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.object_relationship
    ADD CONSTRAINT object_relationship_object_child_id_fkey FOREIGN KEY (object_child_id) REFERENCES public.object(object_id);


--
-- TOC entry 3257 (class 2606 OID 17031)
-- Name: object_relationship object_relationship_object_parent_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.object_relationship
    ADD CONSTRAINT object_relationship_object_parent_id_fkey FOREIGN KEY (object_parent_id) REFERENCES public.object(object_id);


--
-- TOC entry 3259 (class 2606 OID 17041)
-- Name: object_relationship object_relationship_qualifier_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.object_relationship
    ADD CONSTRAINT object_relationship_qualifier_id_fkey FOREIGN KEY (qualifier_id) REFERENCES public.qualifier(qualifier_id);



--
-- TOC entry 3165 (class 0 OID 0)
-- Dependencies: 5
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

GRANT CREATE ON SCHEMA public TO anon;
GRANT CREATE ON SCHEMA public TO authenticator;


--
-- TOC entry 3173 (class 0 OID 0)
-- Dependencies: 203
-- Name: TABLE event; Type: ACL; Schema: public; Owner: postgres
--


GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.event TO anon;
GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.event TO authenticator;


--
-- TOC entry 3183 (class 0 OID 0)
-- Dependencies: 206
-- Name: TABLE event_attribute; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.event_attribute TO anon;
GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.event_attribute TO authenticator;


--
-- TOC entry 3191 (class 0 OID 0)
-- Dependencies: 208
-- Name: TABLE event_attribute_value; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.event_attribute_value TO anon;
GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.event_attribute_value TO authenticator;


--
-- TOC entry 3199 (class 0 OID 0)
-- Dependencies: 204
-- Name: TABLE event_object_relationship; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.event_object_relationship TO anon;
GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.event_object_relationship TO authenticator;


--
-- TOC entry 3211 (class 0 OID 0)
-- Dependencies: 207
-- Name: TABLE event_type; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.event_type TO anon;
GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.event_type TO authenticator;


--
-- TOC entry 3219 (class 0 OID 0)
-- Dependencies: 209
-- Name: TABLE object; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.object TO anon;
GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.object TO authenticator;


--
-- TOC entry 3228 (class 0 OID 0)
-- Dependencies: 202
-- Name: TABLE object_attribute; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.object_attribute TO anon;
GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.object_attribute TO authenticator;


--
-- TOC entry 3238 (class 0 OID 0)
-- Dependencies: 205
-- Name: TABLE object_attribute_value; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.object_attribute_value TO anon;
GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.object_attribute_value TO authenticator;


--
-- TOC entry 3238 (class 0 OID 0)
-- Dependencies: 205
-- Name: TABLE object_relationship; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.object_relationship TO anon;
GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.object_relationship TO authenticator;

--
-- TOC entry 3238 (class 0 OID 0)
-- Dependencies: 205
-- Name: TABLE object_type; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.object_type TO anon;
GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.object_type TO authenticator;

--
-- TOC entry 3238 (class 0 OID 0)
-- Dependencies: 205
-- Name: TABLE qualifier; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.qualifier TO anon;
GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.qualifier TO authenticator;



-- Completed on 2023-11-06 20:41:36

--
-- PostgreSQL database dump complete
--
