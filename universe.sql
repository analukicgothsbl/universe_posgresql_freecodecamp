--
-- PostgreSQL database dump
--

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    size_ly integer,
    apparent_magnitude numeric(3,2),
    distance_kly integer NOT NULL,
    constellation text,
    number_of_stars character varying(30)
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
    name character varying(30) NOT NULL,
    possible_life boolean,
    discovery_year integer,
    semi_major_axis_km integer,
    planet_id integer NOT NULL
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
    name character varying(30) NOT NULL,
    mass character varying(30),
    rings boolean,
    structure text,
    distance bigint,
    number_of_moons integer,
    star_id integer NOT NULL
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_moons; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet_moons (
    planet_moons_id integer NOT NULL,
    name character varying(30) NOT NULL,
    planet_id integer,
    moon_id integer
);


ALTER TABLE public.planet_moons OWNER TO freecodecamp;

--
-- Name: planet_moons_planet_moons_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_moons_planet_moons_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_moons_planet_moons_id_seq OWNER TO freecodecamp;

--
-- Name: planet_moons_planet_moons_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_moons_planet_moons_id_seq OWNED BY public.planet_moons.planet_moons_id;


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
    name character varying(30) NOT NULL,
    detected_by text,
    distance_ly integer,
    spectral_type character varying(20),
    visual_magnitude numeric(3,1),
    galaxy_id integer NOT NULL
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
-- Name: planet_moons planet_moons_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_moons ALTER COLUMN planet_moons_id SET DEFAULT nextval('public.planet_moons_planet_moons_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 80000, -6.50, 0, 'Sagittarius', '4 billion');
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 152, 3.40, 2500, 'Andromeda', '1 trillion');
INSERT INTO public.galaxy VALUES (3, 'Large Magellanic Cloud', 32200, 0.90, 160, 'Dorado/Mensa', NULL);
INSERT INTO public.galaxy VALUES (4, 'Small Magellanic Cloud', 18900, 2.70, 160, 'Tucana', NULL);
INSERT INTO public.galaxy VALUES (5, 'Needle Galaxy', NULL, NULL, 53000, 'Coma Berenices', NULL);
INSERT INTO public.galaxy VALUES (6, 'Malin 1', 650, 1.80, 1190000, 'Coma Berenices', NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', true, NULL, 384399, 3);
INSERT INTO public.moon VALUES (2, 'Phobos', false, 1877, 9377, 4);
INSERT INTO public.moon VALUES (3, 'Deimos', false, 1877, 23460, 4);
INSERT INTO public.moon VALUES (4, 'Metis', false, 1979, 128000, 5);
INSERT INTO public.moon VALUES (5, 'Andrastea', false, 1979, 129000, 5);
INSERT INTO public.moon VALUES (6, 'Amalthea', false, 1892, 181400, 5);
INSERT INTO public.moon VALUES (7, 'Thebe', false, 1979, 221900, 5);
INSERT INTO public.moon VALUES (8, 'Io', false, 1610, 421800, 5);
INSERT INTO public.moon VALUES (9, 'Elara', false, 1905, 11712300, 5);
INSERT INTO public.moon VALUES (10, 'Mimas', false, 1789, 185539, 6);
INSERT INTO public.moon VALUES (11, 'Enceladus', false, 1789, 237948, 6);
INSERT INTO public.moon VALUES (12, 'Tethys', false, 1684, 294619, 6);
INSERT INTO public.moon VALUES (13, 'Dione', false, 1684, 377396, 6);
INSERT INTO public.moon VALUES (14, 'Rhea', false, 1672, 527108, 6);
INSERT INTO public.moon VALUES (15, 'Titan', false, 1655, 1221870, 6);
INSERT INTO public.moon VALUES (16, 'Iapetus', false, 1671, 3560820, 6);
INSERT INTO public.moon VALUES (17, 'Cordelia', false, 1986, 49770, 7);
INSERT INTO public.moon VALUES (18, 'Orphelia', false, 1986, 53790, 7);
INSERT INTO public.moon VALUES (19, 'Juliet', false, 1986, 64350, 7);
INSERT INTO public.moon VALUES (20, 'Naiad', false, 1989, 48224, 8);
INSERT INTO public.moon VALUES (21, 'Thalassa', false, 1989, 50074, 8);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', '3.3 x 10^23kg', false, 'rock', 57909227, 0, 1);
INSERT INTO public.planet VALUES (2, 'Venus', '4.87 x 10^24kg', false, 'rock', 108209475, 0, 1);
INSERT INTO public.planet VALUES (3, 'Earth', '5.97 x 10^24kg', false, 'rock', 149598262, 1, 1);
INSERT INTO public.planet VALUES (4, 'Mars', '6.41 x 10^23kg', false, 'rock', 227943824, 2, 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', '18.98 x 10^26kg', true, 'gas-ice', 778340821, 80, 1);
INSERT INTO public.planet VALUES (6, 'Saturn', '5.68 x 10^26kg', true, 'gas-ice', 1426666000, 83, 1);
INSERT INTO public.planet VALUES (7, 'Uranus', '8.61 x 10^25kg', true, 'gas-ice', 2870658000, 27, 1);
INSERT INTO public.planet VALUES (8, 'Neptune', '1.02 x 10^26kg', true, 'gas-ice', 4988396000, 14, 1);
INSERT INTO public.planet VALUES (9, 'PA-99-N2', '6.34 Jupiter mases', false, NULL, 2185247, NULL, 3);
INSERT INTO public.planet VALUES (11, 'Makemake', '3.1 x 10^21kg', false, NULL, NULL, NULL, 1);
INSERT INTO public.planet VALUES (10, 'Pluto', '1.3 x 10^22kg', false, NULL, NULL, 5, 1);
INSERT INTO public.planet VALUES (12, '225088 Gonggong', '1.75 x 10^21kg', false, NULL, NULL, NULL, 1);


--
-- Data for Name: planet_moons; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet_moons VALUES (1, 'Moon', 3, 1);
INSERT INTO public.planet_moons VALUES (2, 'Phobos', 4, 2);
INSERT INTO public.planet_moons VALUES (3, 'Deimos', 4, 3);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'The Sun', NULL, 26660, 'G2V', -26.7, 1);
INSERT INTO public.star VALUES (2, 'Sirius', NULL, 8, NULL, 1.4, 1);
INSERT INTO public.star VALUES (3, 'Alpha Andromedae', NULL, 97, 'B9p', 2.1, 2);
INSERT INTO public.star VALUES (4, 'Andromeda galaxy', 'Hanbury Brown', 2540000, NULL, 3.4, 2);
INSERT INTO public.star VALUES (5, 'R71', NULL, 49970, 'RBL', 8.7, 3);
INSERT INTO public.star VALUES (6, 'Antares', NULL, 550, NULL, -5.3, 1);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 7, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 21, true);


--
-- Name: planet_moons_planet_moons_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_moons_planet_moons_id_seq', 3, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


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
-- Name: planet_moons planet_moons_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_moons
    ADD CONSTRAINT planet_moons_name_key UNIQUE (name);


--
-- Name: planet_moons planet_moons_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_moons
    ADD CONSTRAINT planet_moons_pkey PRIMARY KEY (planet_moons_id);


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
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet_moons planet_moons_moon_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_moons
    ADD CONSTRAINT planet_moons_moon_id_fkey FOREIGN KEY (moon_id) REFERENCES public.moon(moon_id);


--
-- Name: planet_moons planet_moons_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_moons
    ADD CONSTRAINT planet_moons_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


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

