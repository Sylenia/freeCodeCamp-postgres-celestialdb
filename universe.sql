--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: asteroid; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.asteroid (
    asteroid_id integer NOT NULL,
    name character varying(255) NOT NULL,
    is_spherical boolean NOT NULL,
    mass numeric NOT NULL
);


ALTER TABLE public.asteroid OWNER TO freecodecamp;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.asteroid_asteroid_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.asteroid_asteroid_id_seq OWNER TO freecodecamp;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.asteroid_asteroid_id_seq OWNED BY public.asteroid.asteroid_id;


--
-- Name: exo_planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.exo_planet (
    exo_planet_id integer NOT NULL,
    name character varying(255) NOT NULL,
    description text NOT NULL,
    star_id integer,
    distance_from_earth integer NOT NULL,
    has_life boolean NOT NULL
);


ALTER TABLE public.exo_planet OWNER TO freecodecamp;

--
-- Name: exo_planet_exo_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.exo_planet_exo_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.exo_planet_exo_planet_id_seq OWNER TO freecodecamp;

--
-- Name: exo_planet_exo_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.exo_planet_exo_planet_id_seq OWNED BY public.exo_planet.exo_planet_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(255) NOT NULL,
    galaxy_type character varying(100) NOT NULL,
    age_in_millions_of_years integer NOT NULL,
    has_life boolean NOT NULL
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(255) NOT NULL,
    planet_id integer,
    is_spherical boolean NOT NULL,
    radius_km integer NOT NULL
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(255) NOT NULL,
    planet_type character varying(100) NOT NULL,
    star_id integer,
    distance_from_earth integer NOT NULL,
    has_life boolean NOT NULL
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(255) NOT NULL,
    star_type character varying(100) NOT NULL,
    galaxy_id integer,
    mass numeric NOT NULL,
    is_spherical boolean NOT NULL
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: asteroid asteroid_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid ALTER COLUMN asteroid_id SET DEFAULT nextval('public.asteroid_asteroid_id_seq'::regclass);


--
-- Name: exo_planet exo_planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.exo_planet ALTER COLUMN exo_planet_id SET DEFAULT nextval('public.exo_planet_exo_planet_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: asteroid; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.asteroid VALUES (1, 'Ceres', true, 939300000000000000000);
INSERT INTO public.asteroid VALUES (2, 'Pallas', true, 211000000000000000000);
INSERT INTO public.asteroid VALUES (3, 'Vesta', true, 259000000000000000000);
INSERT INTO public.asteroid VALUES (4, 'Hygiea', true, 86700000000000000000);
INSERT INTO public.asteroid VALUES (5, 'Eros', false, 6690000000000000);
INSERT INTO public.asteroid VALUES (6, 'Itokawa', false, 35100000000);


--
-- Data for Name: exo_planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.exo_planet VALUES (1, 'Kepler-452b', 'Often called Earth 2.0 due to its similarities with our planet.', 2, 1400000, false);
INSERT INTO public.exo_planet VALUES (2, 'Gliese 581g', 'Potentially habitable exoplanet in the Gliese 581 system.', 2, 20000, false);
INSERT INTO public.exo_planet VALUES (3, 'HD 40307 g', 'Super-Earth in the habitable zone with possible water.', 1, 42000, false);
INSERT INTO public.exo_planet VALUES (4, 'Proxima Centauri b', 'The closest known exoplanet to the Solar System.', 6, 42400000, false);
INSERT INTO public.exo_planet VALUES (5, 'TRAPPIST-1d', 'One of the seven terrestrial planets in the TRAPPIST-1 system.', 2, 39100000, false);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Spiral', 13600, true);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Spiral', 9800, false);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Spiral', 10000, false);
INSERT INTO public.galaxy VALUES (4, 'Sombrero', 'Elliptical', 12000, false);
INSERT INTO public.galaxy VALUES (5, 'Whirlpool', 'Spiral', 13000, false);
INSERT INTO public.galaxy VALUES (6, 'Pinwheel', 'Spiral', 11000, false);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 1, true, 1737);
INSERT INTO public.moon VALUES (2, 'Phobos', 2, true, 11);
INSERT INTO public.moon VALUES (3, 'Deimos', 2, true, 6);
INSERT INTO public.moon VALUES (4, 'Io', 3, true, 1821);
INSERT INTO public.moon VALUES (5, 'Europa', 3, true, 1561);
INSERT INTO public.moon VALUES (6, 'Ganymede', 3, true, 2634);
INSERT INTO public.moon VALUES (7, 'Callisto', 3, true, 2410);
INSERT INTO public.moon VALUES (8, 'Titan', 4, true, 2575);
INSERT INTO public.moon VALUES (9, 'Rhea', 4, true, 764);
INSERT INTO public.moon VALUES (10, 'Iapetus', 4, true, 734);
INSERT INTO public.moon VALUES (11, 'Dione', 4, true, 561);
INSERT INTO public.moon VALUES (12, 'Tethys', 4, true, 533);
INSERT INTO public.moon VALUES (13, 'Enceladus', 4, true, 252);
INSERT INTO public.moon VALUES (14, 'Mimas', 4, true, 198);
INSERT INTO public.moon VALUES (15, 'Triton', 5, true, 1353);
INSERT INTO public.moon VALUES (16, 'Charon', 5, true, 606);
INSERT INTO public.moon VALUES (17, 'Nereid', 5, true, 170);
INSERT INTO public.moon VALUES (18, 'Proxima Centauri b Moon 1', 6, true, 50);
INSERT INTO public.moon VALUES (19, 'Alpha Centauri Bb Moon 1', 7, true, 60);
INSERT INTO public.moon VALUES (20, 'Alpha Centauri Bc Moon 1', 8, true, 70);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 'Terrestrial', 1, 0, true);
INSERT INTO public.planet VALUES (2, 'Mars', 'Terrestrial', 1, 225, false);
INSERT INTO public.planet VALUES (3, 'Jupiter', 'Gas Giant', 1, 588, false);
INSERT INTO public.planet VALUES (4, 'Saturn', 'Gas Giant', 1, 1200, false);
INSERT INTO public.planet VALUES (5, 'Venus', 'Terrestrial', 1, 261, false);
INSERT INTO public.planet VALUES (6, 'Proxima b', 'Terrestrial', 2, 42400000, false);
INSERT INTO public.planet VALUES (7, 'Alpha Centauri Bb', 'Terrestrial', 3, 43710000, false);
INSERT INTO public.planet VALUES (8, 'Alpha Centauri Bc', 'Terrestrial', 4, 43800000, false);
INSERT INTO public.planet VALUES (9, 'Kepler-22b', 'Super-Earth', 2, 58700000, false);
INSERT INTO public.planet VALUES (10, 'HD 40307 g', 'Super-Earth', 1, 42400000, false);
INSERT INTO public.planet VALUES (11, 'Kepler-69c', 'Super-Earth', 1, 64000000, false);
INSERT INTO public.planet VALUES (12, 'TRAPPIST-1e', 'Terrestrial', 2, 39100000, false);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 'G-type', 1, 1989000000000000000000000000000, true);
INSERT INTO public.star VALUES (2, 'Proxima Centauri', 'M-type', 2, 244600000000000000000000000000, true);
INSERT INTO public.star VALUES (3, 'Alpha Centauri A', 'G-type', 2, 2187000000000000000000000000000, true);
INSERT INTO public.star VALUES (4, 'Alpha Centauri B', 'K-type', 2, 1804000000000000000000000000000, true);
INSERT INTO public.star VALUES (5, 'Sirius', 'A-type', 1, 3978000000000000000000000000000, true);
INSERT INTO public.star VALUES (6, 'Betelgeuse', 'M-type', 1, 27810000000000000000000000000000, true);


--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.asteroid_asteroid_id_seq', 6, true);


--
-- Name: exo_planet_exo_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.exo_planet_exo_planet_id_seq', 5, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: asteroid asteroid_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_name_key UNIQUE (name);


--
-- Name: asteroid asteroid_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_pkey PRIMARY KEY (asteroid_id);


--
-- Name: exo_planet exo_planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.exo_planet
    ADD CONSTRAINT exo_planet_name_key UNIQUE (name);


--
-- Name: exo_planet exo_planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.exo_planet
    ADD CONSTRAINT exo_planet_pkey PRIMARY KEY (exo_planet_id);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: exo_planet exo_planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.exo_planet
    ADD CONSTRAINT exo_planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

