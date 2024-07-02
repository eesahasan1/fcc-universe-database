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
-- Name: constellations; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.constellations (
    constellations_id integer NOT NULL,
    name character varying(100) NOT NULL,
    best_viewing_month character varying(20),
    stars_included text,
    description text
);


ALTER TABLE public.constellations OWNER TO freecodecamp;

--
-- Name: constellations_constellation_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.constellations_constellation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.constellations_constellation_id_seq OWNER TO freecodecamp;

--
-- Name: constellations_constellation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.constellations_constellation_id_seq OWNED BY public.constellations.constellations_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    age_in_millions_of_years integer,
    distance_from_earth_in_ly numeric,
    description text,
    has_life boolean DEFAULT false
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
    age_in_millions_of_years integer,
    distance_from_earth_in_au numeric,
    description text,
    is_spherical boolean DEFAULT true,
    planet_id integer
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
    age_in_millions_of_years integer,
    distance_from_earth_in_au numeric,
    description text,
    has_life boolean DEFAULT false,
    star_id integer
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
    name character varying(30) NOT NULL,
    age_in_millions_of_years integer,
    distance_from_earth_in_ly numeric,
    description text,
    is_spherical boolean DEFAULT true,
    galaxy_id integer
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
-- Name: constellations constellations_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellations ALTER COLUMN constellations_id SET DEFAULT nextval('public.constellations_constellation_id_seq'::regclass);


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
-- Data for Name: constellations; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.constellations VALUES (1, 'Orion', 'January', 'Betelgeuse, Rigel, Bellatrix, Alnilam, Mintaka', 'One of the most conspicuous and recognizable constellations in the night sky.');
INSERT INTO public.constellations VALUES (2, 'Ursa Major', 'April', 'Dubhe, Merak, Phecda, Megrez, Alioth, Mizar, Alkaid', 'Known for the Big Dipper asterism, it is visible in the northern hemisphere.');
INSERT INTO public.constellations VALUES (3, 'Cassiopeia', 'November', 'Schedar, Caph, Gamma Cassiopeiae, Ruchbah, Segin', 'Easily recognizable due to its W shape, visible all year from northern latitudes.');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 13700, 0, 'The galaxy containing our Solar System.', true);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 10000, 2.537, 'The nearest spiral galaxy to the Milky Way and on a collision course with it.', false);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 6000, 2.723, 'The third-largest member of the Local Group of galaxies, behind the Milky Way and Andromeda.', false);
INSERT INTO public.galaxy VALUES (4, 'Whirlpool Galaxy', 500, 23, 'A classic spiral galaxy, famous for its well-defined spiral arms, located in the constellation Canes Venatici.', false);
INSERT INTO public.galaxy VALUES (5, 'Sombrero Galaxy', 12000, 29.3, 'This galaxy is known for its bright nucleus, large central bulge, and a prominent dust lane in its inclined disk.', false);
INSERT INTO public.galaxy VALUES (6, 'Pinwheel Galaxy', 21000, 20.9, 'Face-on spiral galaxy distingushed by its symmetrical arms, located in the constellation Ursa Major.', false);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 4500, 0.00257, 'Earth''s only natural satellite.', true, 3);
INSERT INTO public.moon VALUES (2, 'Phobos', 4200, 0.00006, 'One of Mars'' small, irregularly shaped moons.', true, 4);
INSERT INTO public.moon VALUES (3, 'Deimos', 4200, 0.00016, 'The smaller and farther of Mars'' two moons.', true, 4);
INSERT INTO public.moon VALUES (4, 'Io', 4500, 0.00282, 'The most geologically active object in the Solar System.', true, 5);
INSERT INTO public.moon VALUES (5, 'Europa', 4500, 0.00282, 'Believed to have an ocean beneath its icy surface.', true, 5);
INSERT INTO public.moon VALUES (6, 'Ganymede', 4500, 0.00282, 'The largest moon in the Solar System.', true, 5);
INSERT INTO public.moon VALUES (7, 'Callisto', 4500, 0.00282, 'A heavily cratered moon with a very old surface.', true, 5);
INSERT INTO public.moon VALUES (8, 'Titan', 4500, 0.00817, 'Largest moon of Saturn, known for its dense atmosphere.', true, 6);
INSERT INTO public.moon VALUES (9, 'Rhea', 4500, 0.00817, 'The second-largest moon of Saturn.', true, 6);
INSERT INTO public.moon VALUES (10, 'Iapetus', 4500, 0.00817, 'Known for its two-tone coloration.', true, 6);
INSERT INTO public.moon VALUES (11, 'Miranda', 4500, 0.01792, 'One of Uranus'' moons, known for its dramatic cliffs.', true, 7);
INSERT INTO public.moon VALUES (12, 'Ariel', 4500, 0.01792, 'Uranian moon with the brightest and youngest surface.', true, 7);
INSERT INTO public.moon VALUES (13, 'Umbriel', 4500, 0.01792, 'Dark and mysterious moon of Uranus.', true, 7);
INSERT INTO public.moon VALUES (14, 'Triton', 4500, 0.03005, 'Largest moon of Neptune and the only large moon with a retrograde orbit.', true, 8);
INSERT INTO public.moon VALUES (15, 'Nereid', 4500, 0.03005, 'A small and irregularly shaped moon of Neptune.', true, 8);
INSERT INTO public.moon VALUES (16, 'Charon', 4500, 0.03948, 'The largest of Pluto''s moons, almost half the size of Pluto itself.', true, 9);
INSERT INTO public.moon VALUES (17, 'Luna Nova', 3000, 0.01000, 'A fictional moon orbiting a distant exoplanet.', true, 10);
INSERT INTO public.moon VALUES (18, 'Elysium', 3200, 0.01200, 'Fictional moon with signs of past water flow.', true, 11);
INSERT INTO public.moon VALUES (19, 'Haven', 2900, 0.01300, 'Fictional, lush green moon with an oxygen-rich atmosphere.', true, 12);
INSERT INTO public.moon VALUES (20, 'Krypton', 4500, 0.00750, 'A moon thought to be composed of green crystal.', true, 12);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 4500, 0.387, 'The smallest and innermost planet in the Solar System.', false, 1);
INSERT INTO public.planet VALUES (2, 'Venus', 4500, 0.72, 'Second planet from the Sun, with a toxic atmosphere.', false, 1);
INSERT INTO public.planet VALUES (3, 'Earth', 4500, 1.00, 'The only astronomical object known to harbor life.', true, 1);
INSERT INTO public.planet VALUES (4, 'Mars', 4500, 1.52, 'The Red Planet, known for its red dust and potential for past life.', false, 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', 4500, 5.20, 'The largest planet in our Solar System, with a prominent Great Red Spot.', false, 1);
INSERT INTO public.planet VALUES (6, 'Saturn', 4500, 9.58, 'Known for its extensive ring system.', false, 1);
INSERT INTO public.planet VALUES (7, 'Uranus', 4500, 19.22, 'An ice giant with a distinct blue color due to methane.', false, 1);
INSERT INTO public.planet VALUES (8, 'Neptune', 4500, 30.05, 'The farthest known full-sized planet in our Solar System.', false, 1);
INSERT INTO public.planet VALUES (9, 'Pluto', 4500, 39.48, 'Formerly the ninth planet, now classified as a dwarf planet.', false, 1);
INSERT INTO public.planet VALUES (10, 'Xenon', 3200, 12.34, 'A fictional exoplanet known for its extreme weather conditions.', false, 2);
INSERT INTO public.planet VALUES (11, 'Naboo', 4000, 18.46, 'A lush, green planet with extensive plains and swamps.', true, 2);
INSERT INTO public.planet VALUES (12, 'Vulcan', 5200, 16.50, 'A hot, desert-like planet with a history of logical beings.', true, 2);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 4600, 0, 'The star at the center of the Solar System.', true, 1);
INSERT INTO public.star VALUES (2, 'Proxima Centauri', 4500, 4.24, 'The closest known star to the Sun and hosts at least two exoplanets.', true, 1);
INSERT INTO public.star VALUES (3, 'Alpha Centauri A', 5000, 4.37, 'Part of the closest star system to the Solar System.', true, 1);
INSERT INTO public.star VALUES (4, 'Sirius', 242, 8.6, 'The brightest star in the Earth''s night sky.', true, 2);
INSERT INTO public.star VALUES (5, 'Vega', 455, 25, 'The fifth-brightest star in the night sky and the second-brightest star in the northern celestial hemisphere.', true, 2);
INSERT INTO public.star VALUES (6, 'Betelgeuse', 8, 642.5, 'A red supergiant of spectral type M1-2, one of the largest stars visible to the naked eye.', true, 2);


--
-- Name: constellations_constellation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.constellations_constellation_id_seq', 3, true);


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
-- Name: constellations constellations_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellations
    ADD CONSTRAINT constellations_pkey PRIMARY KEY (constellations_id);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: constellations unique_constellation_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellations
    ADD CONSTRAINT unique_constellation_name UNIQUE (name);


--
-- Name: galaxy unique_galaxy_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT unique_galaxy_name UNIQUE (name);


--
-- Name: moon unique_moon_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT unique_moon_name UNIQUE (name);


--
-- Name: planet unique_planet_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT unique_planet_name UNIQUE (name);


--
-- Name: star unique_star_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT unique_star_name UNIQUE (name);


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

