--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: authentications; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE authentications (
    id integer NOT NULL,
    user_id integer NOT NULL,
    provider character varying NOT NULL,
    uid character varying NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: authentications_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE authentications_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: authentications_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE authentications_id_seq OWNED BY authentications.id;


--
-- Name: blocks; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE blocks (
    id integer NOT NULL,
    title character varying NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    user_id integer NOT NULL
);


--
-- Name: blocks_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE blocks_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: blocks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE blocks_id_seq OWNED BY blocks.id;


--
-- Name: cards; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE cards (
    id integer NOT NULL,
    original_text text,
    translated_text text,
    review_date timestamp without time zone NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    user_id integer NOT NULL,
    image character varying,
    block_id integer NOT NULL,
    "interval" integer DEFAULT 1 NOT NULL,
    repeat integer DEFAULT 1 NOT NULL,
    efactor double precision DEFAULT 2.5 NOT NULL,
    attempt integer DEFAULT 1 NOT NULL,
    quality integer DEFAULT 5 NOT NULL
);


--
-- Name: cards_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE cards_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: cards_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE cards_id_seq OWNED BY cards.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE schema_migrations (
    version character varying NOT NULL
);


--
-- Name: users; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE users (
    id integer NOT NULL,
    email character varying,
    crypted_password character varying,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    salt character varying,
    remember_me_token character varying,
    remember_me_token_expires_at timestamp without time zone,
    reset_password_token character varying,
    reset_password_token_expires_at timestamp without time zone,
    reset_password_email_sent_at timestamp without time zone,
    current_block_id integer,
    locale character varying
);


--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY authentications ALTER COLUMN id SET DEFAULT nextval('authentications_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY blocks ALTER COLUMN id SET DEFAULT nextval('blocks_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY cards ALTER COLUMN id SET DEFAULT nextval('cards_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- Name: authentications_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY authentications
    ADD CONSTRAINT authentications_pkey PRIMARY KEY (id);


--
-- Name: blocks_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY blocks
    ADD CONSTRAINT blocks_pkey PRIMARY KEY (id);


--
-- Name: cards_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY cards
    ADD CONSTRAINT cards_pkey PRIMARY KEY (id);


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: index_authentications_on_provider_and_uid; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_authentications_on_provider_and_uid ON authentications USING btree (provider, uid);


--
-- Name: index_users_on_email; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX index_users_on_email ON users USING btree (email);


--
-- Name: index_users_on_remember_me_token; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_users_on_remember_me_token ON users USING btree (remember_me_token);


--
-- Name: index_users_on_reset_password_token; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_users_on_reset_password_token ON users USING btree (reset_password_token);


--
-- Name: unique_schema_migrations; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX unique_schema_migrations ON schema_migrations USING btree (version);


--
-- PostgreSQL database dump complete
--

SET search_path TO "$user",public;

INSERT INTO schema_migrations (version) VALUES ('20150324181429');

INSERT INTO schema_migrations (version) VALUES ('20150325070602');

INSERT INTO schema_migrations (version) VALUES ('20150327203129');

INSERT INTO schema_migrations (version) VALUES ('20150327203526');

INSERT INTO schema_migrations (version) VALUES ('20150327220548');

INSERT INTO schema_migrations (version) VALUES ('20150329103805');

INSERT INTO schema_migrations (version) VALUES ('20150329103806');

INSERT INTO schema_migrations (version) VALUES ('20150329103807');

INSERT INTO schema_migrations (version) VALUES ('20150329171607');

INSERT INTO schema_migrations (version) VALUES ('20150329200538');

INSERT INTO schema_migrations (version) VALUES ('20150330165146');

INSERT INTO schema_migrations (version) VALUES ('20150330194042');

INSERT INTO schema_migrations (version) VALUES ('20150330194306');

INSERT INTO schema_migrations (version) VALUES ('20150330194536');

INSERT INTO schema_migrations (version) VALUES ('20150330200230');

INSERT INTO schema_migrations (version) VALUES ('20150331102819');

INSERT INTO schema_migrations (version) VALUES ('20150401155428');

INSERT INTO schema_migrations (version) VALUES ('20150401155753');

INSERT INTO schema_migrations (version) VALUES ('20150401160441');

INSERT INTO schema_migrations (version) VALUES ('20150402104316');

INSERT INTO schema_migrations (version) VALUES ('20150403222932');

INSERT INTO schema_migrations (version) VALUES ('20150404104501');

INSERT INTO schema_migrations (version) VALUES ('20150405115143');

INSERT INTO schema_migrations (version) VALUES ('20150405165550');

INSERT INTO schema_migrations (version) VALUES ('20150405175629');

INSERT INTO schema_migrations (version) VALUES ('20150405180053');

INSERT INTO schema_migrations (version) VALUES ('20150406123839');

INSERT INTO schema_migrations (version) VALUES ('20150406143521');

INSERT INTO schema_migrations (version) VALUES ('20150406175232');

INSERT INTO schema_migrations (version) VALUES ('20150406175914');

