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
    name character varying(60) NOT NULL,
    black_hole character varying(60),
    galactic_super_cluster character varying(60),
    age_in_millions_of_years integer
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
    name character varying(60) NOT NULL,
    planet_id integer NOT NULL,
    fun_fact text,
    diameter_in_miles integer
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
    name character varying(60) NOT NULL,
    star_id integer NOT NULL,
    is_exoplanet boolean NOT NULL,
    number_of_moons integer
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
-- Name: random_celestial_bodies; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.random_celestial_bodies (
    name character varying(30) NOT NULL,
    type character varying(10) NOT NULL,
    random_celestial_bodies_id integer NOT NULL
);


ALTER TABLE public.random_celestial_bodies OWNER TO freecodecamp;

--
-- Name: random_celestial_bodies_random_celestial_bodies_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.random_celestial_bodies_random_celestial_bodies_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.random_celestial_bodies_random_celestial_bodies_id_seq OWNER TO freecodecamp;

--
-- Name: random_celestial_bodies_random_celestial_bodies_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.random_celestial_bodies_random_celestial_bodies_id_seq OWNED BY public.random_celestial_bodies.random_celestial_bodies_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(60) NOT NULL,
    galaxy_id integer NOT NULL,
    is_pulsar boolean NOT NULL,
    relative_distance_in_light_years numeric(12,5)
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
-- Name: random_celestial_bodies random_celestial_bodies_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.random_celestial_bodies ALTER COLUMN random_celestial_bodies_id SET DEFAULT nextval('public.random_celestial_bodies_random_celestial_bodies_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Sagittarius A-star', 'Laniakea Supercluster', 13610);
INSERT INTO public.galaxy VALUES (2, 'Adromeda', 'Andromeda A-star', 'Virgo Cluster', 10010);
INSERT INTO public.galaxy VALUES (3, 'Sombrero', 'Sombrero Black Hole', 'Virgo-Corvus Superclusters', 13250);
INSERT INTO public.galaxy VALUES (4, 'Messier 64', 'Messier 64 Core', 'Virgo Supercluster', 13280);
INSERT INTO public.galaxy VALUES (5, 'Messier 101', 'Messier 101-Center', 'Virgo Supercluster', 0);
INSERT INTO public.galaxy VALUES (6, 'Bodes Galaxy', 'Bodes Hole', 'Virgo Supercluster', 0);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Lunarian I', 1, 'Has a unique, irregular orbit', 1200);
INSERT INTO public.moon VALUES (2, 'Centaurias Moon', 2, 'Contains ancient impact craters', 900);
INSERT INTO public.moon VALUES (3, 'Lunarias Companion', 3, 'Tidally locked with its planet', 1500);
INSERT INTO public.moon VALUES (4, 'AndroMoon I-A', 4, 'Glows faintly in the dark due to reflective ice.', 800);
INSERT INTO public.moon VALUES (5, 'Proximuss Satellite', 5, 'Orbits the planet in a retrograde motion.', 1100);
INSERT INTO public.moon VALUES (6, 'Alphas Little Moon', 6, 'Experiences extreme temperature variations.', 700);
INSERT INTO public.moon VALUES (7, 'AstraLunas Beacon', 7, 'Named after a famous astronomer.', 1300);
INSERT INTO public.moon VALUES (8, 'M31 Satellites Companion', 8, 'Largest moon in the planetary system', 1800);
INSERT INTO public.moon VALUES (9, 'Proximus II-A', 9, 'Possesses a subsurface ocean', 1000);
INSERT INTO public.moon VALUES (10, 'Nebula Novas Moon', 10, 'Visible from the planet as a bright dot', 850);
INSERT INTO public.moon VALUES (11, 'Andromoon II-A', 11, 'Hosts a series of interconnected craters', 1050);
INSERT INTO public.moon VALUES (12, 'Galactic Rings Companion', 12, 'Eclipses the sun during its orbit', 1600);
INSERT INTO public.moon VALUES (13, 'Lunarian II', 1, 'Contains high concentration of rare minerals', 1250);
INSERT INTO public.moon VALUES (14, 'Centaurias Second Moon', 2, 'Exhibits a reddish hue due to surface composition', 950);
INSERT INTO public.moon VALUES (15, 'Lunarias Twin', 3, 'Has a synchronous rotation with its planet', 1550);
INSERT INTO public.moon VALUES (16, 'AndroMoon I-B', 4, 'Surrounded by a faint ring system', 820);
INSERT INTO public.moon VALUES (17, 'Proximuss Companion', 5, 'Has a chaotic orbit influenced by nearby planets', 1180);
INSERT INTO public.moon VALUES (18, 'Alphas Dim Moon', 6, 'Experiences frequent meteor showers', 680);
INSERT INTO public.moon VALUES (19, 'AstraLunas Guide', 7, 'Assisted in the discovery of the planet', 1450);
INSERT INTO public.moon VALUES (20, 'M31 Satellites Sibling', 8, 'Harbors an atmosphere with unique chemical composition', 1700);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Proximus I', 1, true, 2);
INSERT INTO public.planet VALUES (2, 'Centauria', 2, false, 1);
INSERT INTO public.planet VALUES (3, 'Lunaria', 3, false, 3);
INSERT INTO public.planet VALUES (4, 'AndroMoon I', 4, true, 2);
INSERT INTO public.planet VALUES (5, 'Centauri Prime', 1, true, 0);
INSERT INTO public.planet VALUES (6, 'Alpha Moon', 2, false, 4);
INSERT INTO public.planet VALUES (7, 'AstraLuna', 3, false, 1);
INSERT INTO public.planet VALUES (8, 'M31 Satellite', 4, true, 5);
INSERT INTO public.planet VALUES (9, 'Proximus II', 1, true, 1);
INSERT INTO public.planet VALUES (10, 'Nebula Nova', 2, false, 2);
INSERT INTO public.planet VALUES (11, 'AndroMoon II', 3, true, 0);
INSERT INTO public.planet VALUES (12, 'Galactic Ring', 4, true, 3);


--
-- Data for Name: random_celestial_bodies; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.random_celestial_bodies VALUES ('Osborn', 'Planet', 1);
INSERT INTO public.random_celestial_bodies VALUES ('Victorious', 'Galaxy', 2);
INSERT INTO public.random_celestial_bodies VALUES ('Megaladoniaca', 'Cluster', 3);
INSERT INTO public.random_celestial_bodies VALUES ('The Great Attractor', 'XCluster', 4);
INSERT INTO public.random_celestial_bodies VALUES ('X0193 NC UM XU', 'Multiverse', 5);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Proxima Centauri', 1, false, 4.24000);
INSERT INTO public.star VALUES (2, 'Alpha Centauri A', 1, false, 4.37000);
INSERT INTO public.star VALUES (3, 'Alpheratz', 2, false, 97.20000);
INSERT INTO public.star VALUES (4, 'M31 V1', 2, false, 2.54000);
INSERT INTO public.star VALUES (5, 'Bodes Galaxy Star', 6, false, 12.80000);
INSERT INTO public.star VALUES (6, 'Messier 101 Star', 5, false, 21.00000);


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
-- Name: random_celestial_bodies_random_celestial_bodies_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.random_celestial_bodies_random_celestial_bodies_id_seq', 5, true);


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
-- Name: random_celestial_bodies random_celestial_bodies_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.random_celestial_bodies
    ADD CONSTRAINT random_celestial_bodies_name_key UNIQUE (name);


--
-- Name: random_celestial_bodies random_celestial_bodies_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.random_celestial_bodies
    ADD CONSTRAINT random_celestial_bodies_pkey PRIMARY KEY (random_celestial_bodies_id);


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

