-- PostgreSQL database dump

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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

DROP DATABASE universe;

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';
ALTER DATABASE universe OWNER TO juan;

SET default_tablespace = '';
SET default_table_access_method = heap;

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    star_id integer NOT NULL,
    name character varying(20) NOT NULL,
    area integer,
    volume integer,
    age numeric,
    material text,
    has_life boolean,
    has_water boolean
);

ALTER TABLE public.galaxy OWNER TO juan;
ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;

CREATE SEQUENCE public.galaxy_galaxy_id_seq AS integer START WITH 1 INCREMENT BY 1 NO MINVALUE NO MAXVALUE CACHE 1;

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    planet_id integer NOT NULL,
    name character varying(20) NOT NULL,
    area integer,
    volume integer,
    age numeric,
    material text,
    has_life boolean,
    has_water boolean
);

ALTER TABLE public.moon OWNER TO juan;
ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;

CREATE SEQUENCE public.moon_moon_id_seq AS integer START WITH 1 INCREMENT BY 1 NO MINVALUE NO MAXVALUE CACHE 1;

CREATE TABLE public.more_info (
    more_info_id integer NOT NULL,
    object_id integer NOT NULL,
    name character varying(20) NOT NULL,
    description text
);

ALTER TABLE public.more_info OWNER TO juan;
ALTER SEQUENCE public.more_info_more_info_id_seq OWNED BY public.more_info.more_info_id;

CREATE SEQUENCE public.more_info_more_info_id_seq AS integer START WITH 1 INCREMENT BY 1 NO MINVALUE NO MAXVALUE CACHE 1;

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    star_id integer NOT NULL,
    moon_id integer NOT NULL,
    name character varying(20) NOT NULL,
    area integer,
    volume integer,
    age numeric,
    material text,
    has_life boolean,
    has_water boolean
);

ALTER TABLE public.planet OWNER TO juan;
ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;

CREATE SEQUENCE public.planet_planet_id_seq AS integer START WITH 1 INCREMENT BY 1 NO MINVALUE NO MAXVALUE CACHE 1;

CREATE TABLE public.star (
    star_id integer NOT NULL,
    galaxy_id integer NOT NULL,
    planet_id integer NOT NULL,
    name character varying(20) NOT NULL,
    area integer,
    volume integer,
    age numeric,
    material text,
    has_life boolean,
    has_water boolean
);

ALTER TABLE public.star OWNER TO juan;
ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;

CREATE SEQUENCE public.star_star_id_seq AS integer START WITH 1 INCREMENT BY 1 NO MINVALUE NO MAXVALUE CACHE 1;

INSERT INTO public.galaxy VALUES (1, 1, 'galaxy1', 500, 750, 1500.75, 'solid', true, true);
-- Insertar más datos según sea necesario

INSERT INTO public.moon VALUES (1, 1, 'moon1', 500, 750, 1500.75, 'true', true, NULL);
-- Insertar más datos según sea necesario

INSERT INTO public.more_info VALUES (1, 1, 'info1', 'lorem impsum');
-- Insertar más datos según sea necesario

INSERT INTO public.planet VALUES (1, 1, 1, 'planet1', 500, 750, 1500.75, 'true', true, NULL);
-- Insertar más datos según sea necesario

INSERT INTO public.star VALUES (1, 1, 1, 'star1', 500, 750, 1500.75, 'true', true, NULL);
-- Insertar más datos según sea necesario

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 1, false);
SELECT pg_catalog.setval('public.moon_moon_id_seq', 1, false);
SELECT pg_catalog.setval('public.more_info_more_info_id_seq', 1, false);
SELECT pg_catalog.setval('public.planet_planet_id_seq', 1, false);
SELECT pg_catalog.setval('public.star_star_id_seq', 1, false);

ALTER TABLE ONLY public.galaxy ADD CONSTRAINT galaxy_name_key UNIQUE (name);
ALTER TABLE ONLY public.galaxy ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);
-- Agregar más restricciones de clave única y primaria según sea necesario

ALTER TABLE ONLY public.galaxy ADD CONSTRAINT galaxy_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);
-- Agregar más restricciones de clave foránea según sea necesario

-- PostgreSQL database dump complete

