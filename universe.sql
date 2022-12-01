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
-- Name: constelations; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.constelations (
    constelations_id integer NOT NULL,
    name character varying(40) NOT NULL,
    description text,
    planets integer NOT NULL,
    galaxy_id integer NOT NULL
);


ALTER TABLE public.constelations OWNER TO freecodecamp;

--
-- Name: constelations_constelations_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.constelations_constelations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.constelations_constelations_id_seq OWNER TO freecodecamp;

--
-- Name: constelations_constelations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.constelations_constelations_id_seq OWNED BY public.constelations.constelations_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(40) NOT NULL,
    size_in_kpc numeric NOT NULL,
    has_black_holes boolean,
    description text
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
    name character varying(40) NOT NULL,
    has_life boolean NOT NULL,
    distance_from_earth_in_ly numeric NOT NULL,
    description text,
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
    name character varying(40) NOT NULL,
    has_life boolean NOT NULL,
    distance_from_earth_in_ly numeric NOT NULL,
    description text,
    moons integer,
    star_id integer NOT NULL
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
    name character varying(40) NOT NULL,
    distance_from_earth_in_ly numeric NOT NULL,
    description text,
    planets integer,
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
-- Name: constelations constelations_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constelations ALTER COLUMN constelations_id SET DEFAULT nextval('public.constelations_constelations_id_seq'::regclass);


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
-- Data for Name: constelations; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.constelations VALUES (1, 'Andromeda', 'Andromeda, which is shortened from "Andromeda Galaxy", gets its name from the area of the sky in which it appears, the constellation of Andromeda.', 10, 1);
INSERT INTO public.constelations VALUES (2, 'Centaurus', ' It appears to rotate backwards, as the tips of the spiral arms point in the direction of rotation.', 12, 2);
INSERT INTO public.constelations VALUES (3, 'Virgo', 'Looks are similar to a butterfly.', 16, 3);
INSERT INTO public.constelations VALUES (4, 'Sagittarius', 'The appearance from Earth of the galaxy', 9, 4);
INSERT INTO public.constelations VALUES (5, 'Triangulum', 'Named after its location within the Triangulum constellation.', 3, 5);
INSERT INTO public.constelations VALUES (6, 'Hydra', 'Named after its resemblance to the Pinwheel Galaxy and its location in the southern celestial hemisphere.', 21, 6);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Andromeda Galaxy', 46.56, true, 'Andromeda is the closest big galaxy to the Milky Way and is expected to collide with the Milky Way around 4.5 billion years from now. The two will eventually merge into a single new galaxy called Milkdromeda.');
INSERT INTO public.galaxy VALUES (2, 'Backward Galaxy', 34, true, 'The spiral galaxy, NGC 4622 (also called Backward galaxy), lies approximately 111 million light years away from Earth in the constellation Centaurus. NGC 4622 is an example of a galaxy with leading spiral arms.');
INSERT INTO public.galaxy VALUES (3, 'Butterfly Galaxies', 24.59, true, 'Butterfly Galaxies , also known as the Siamese Twins, is a unbarred spiral located in the constellation Virgo .');
INSERT INTO public.galaxy VALUES (4, 'Milky Way', 2.6, true, 'The galaxy containing the Sun and its Solar System, and therefore Earth.');
INSERT INTO public.galaxy VALUES (5, 'Triangulum Galaxy', 18.74, true, 'Spiral galaxy M33 is located in the triangle-shaped constellation Triangulum, earning it the nickname the Triangulum galaxy.');
INSERT INTO public.galaxy VALUES (6, 'Southern Pinwheel Galaxy', 82, true, 'Is a barred spiral galaxy approximately 15 million light-years away in the constellation borders of Hydra and Centaurus.');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', true, 0, 'Our lovely moon.', 1);
INSERT INTO public.moon VALUES (2, 'Phobos', false, 12.3, 'Moon description.', 2);
INSERT INTO public.moon VALUES (3, 'Deimos', false, 67.89, 'Moon description.', 3);
INSERT INTO public.moon VALUES (4, 'Ganymede', false, 23.45, 'Moon description.', 4);
INSERT INTO public.moon VALUES (5, 'Callisto', false, 171.67, 'Moon description.', 5);
INSERT INTO public.moon VALUES (6, 'Io', false, 45.7, 'Moon description.', 6);
INSERT INTO public.moon VALUES (7, 'Europa', false, 130.5, 'Moon description.', 7);
INSERT INTO public.moon VALUES (8, 'Amalthea', false, 123.23, 'Moon description.', 8);
INSERT INTO public.moon VALUES (9, 'Himalia', false, 560.78, 'Moon description.', 9);
INSERT INTO public.moon VALUES (10, 'Thebe', false, 365.36, 'Moon description.', 10);
INSERT INTO public.moon VALUES (11, 'Elara', false, 654.12, 'Moon description.', 11);
INSERT INTO public.moon VALUES (12, 'Pasiphae', true, 777.77, 'Moon description.', 7);
INSERT INTO public.moon VALUES (13, 'Metis', false, 168.89, 'Moon description.', 8);
INSERT INTO public.moon VALUES (14, 'Carme', false, 980.56, 'Moon description.', 4);
INSERT INTO public.moon VALUES (15, 'Sinope', false, 23.5, 'Moon description.', 2);
INSERT INTO public.moon VALUES (16, 'Lysithea', false, 67.8, 'Moon description.', 8);
INSERT INTO public.moon VALUES (17, 'Ananke', false, 567.4, 'Moon description.', 9);
INSERT INTO public.moon VALUES (18, 'Leda', false, 234.34, 'Moon description.', 3);
INSERT INTO public.moon VALUES (19, 'Adrastea', false, 456.7, 'Moon description.', 5);
INSERT INTO public.moon VALUES (20, 'Arche', false, 78.99, 'Moon description.', 5);
INSERT INTO public.moon VALUES (21, 'Pandia', false, 23.2, 'Moon description.', 7);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', true, 0, 'Our lovely home planet.', 1, 1);
INSERT INTO public.planet VALUES (2, 'Orcus', false, 10.12, 'Planet description.', 4, 2);
INSERT INTO public.planet VALUES (3, 'Salacia', false, 5.45, 'Planet description.', 21, 3);
INSERT INTO public.planet VALUES (4, 'Gonggong', false, 6.7, 'Planet description.', 11, 4);
INSERT INTO public.planet VALUES (5, 'Sedna', false, 32.80, 'Planet description.', 9, 5);
INSERT INTO public.planet VALUES (6, 'Ceres', false, 171.54, 'Planet description.', 8, 6);
INSERT INTO public.planet VALUES (7, 'Eris', true, 77.77, 'Planet description.', 7, 7);
INSERT INTO public.planet VALUES (8, 'Pluto', false, 50.12, 'Planet description.', 3, 2);
INSERT INTO public.planet VALUES (9, 'Makemake', false, 12.36, 'Planet description.', 4, 3);
INSERT INTO public.planet VALUES (10, 'Haumea', false, 360.57, 'Planet description.', 5, 4);
INSERT INTO public.planet VALUES (11, 'Quaoar', false, 157.24, 'Planet description.', 4, 5);
INSERT INTO public.planet VALUES (12, 'Nasd', false, 240, 'Planet description.', 3, 6);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 0, 'Our lovely sun.', 12, 4);
INSERT INTO public.star VALUES (2, 'Adhil', 38.09, 'Star from the Andromeda Galaxy.', 22, 1);
INSERT INTO public.star VALUES (3, 'Pincoya', 39.23, 'Star from the Triangulum Galaxy.', 12, 5);
INSERT INTO public.star VALUES (4, 'Pipoltr', 105.56, 'Star from the Butterfly Galaxies.', 31, 3);
INSERT INTO public.star VALUES (5, 'Proxima Centauri', 12.78, 'Star from the Backward Galaxy.', 36, 2);
INSERT INTO public.star VALUES (6, 'Horna', 340.00, 'Star from the Triangulum Galaxys.', 2, 5);
INSERT INTO public.star VALUES (7, 'Lerna', 761.12, 'Southern Pinwheel Galaxy.', 34, 6);


--
-- Name: constelations_constelations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.constelations_constelations_id_seq', 6, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 21, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 7, true);


--
-- Name: constelations constelations_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constelations
    ADD CONSTRAINT constelations_name_key UNIQUE (name);


--
-- Name: constelations constelations_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constelations
    ADD CONSTRAINT constelations_pkey PRIMARY KEY (constelations_id);


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
-- Name: constelations constelations_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constelations
    ADD CONSTRAINT constelations_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


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

