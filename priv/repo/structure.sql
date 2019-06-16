--
-- PostgreSQL database dump
--

-- Dumped from database version 11.3
-- Dumped by pg_dump version 11.3

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

SET default_with_oids = false;

--
-- Name: fragrants; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.fragrants (
    id bigint NOT NULL,
    name character varying(255),
    description character varying(255),
    blending_factor integer,
    note character varying(255),
    family character varying(255),
    inserted_at timestamp(0) without time zone NOT NULL,
    updated_at timestamp(0) without time zone NOT NULL,
    name_eng character varying(255)
);


--
-- Name: fragrants_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.fragrants_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: fragrants_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.fragrants_id_seq OWNED BY public.fragrants.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.schema_migrations (
    version bigint NOT NULL,
    inserted_at timestamp(0) without time zone
);


--
-- Name: fragrants id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.fragrants ALTER COLUMN id SET DEFAULT nextval('public.fragrants_id_seq'::regclass);


--
-- Name: fragrants fragrants_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.fragrants
    ADD CONSTRAINT fragrants_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- PostgreSQL database dump complete
--

INSERT INTO public."schema_migrations" (version) VALUES (20190615223910), (20190615224926);

