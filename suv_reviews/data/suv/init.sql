--
-- PostgreSQL database dump
--

-- Dumped from database version 13.2
-- Dumped by pg_dump version 13.2

-- Started on 2022-01-31 01:23:19 UTC

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
-- TOC entry 212 (class 1259 OID 65955)
-- Name: Cars_Dotcom_Reviews; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Cars_Dotcom_Reviews" (
    id integer NOT NULL,
    suv_year_id integer NOT NULL,
    num_reviews integer NOT NULL,
    score numeric(3,2) NOT NULL,
    cost_new numeric(6,0)
);


ALTER TABLE public."Cars_Dotcom_Reviews" OWNER TO postgres;

--
-- TOC entry 211 (class 1259 OID 65953)
-- Name: Cars_Dotcom_Reviews_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Cars_Dotcom_Reviews_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Cars_Dotcom_Reviews_id_seq" OWNER TO postgres;

--
-- TOC entry 3090 (class 0 OID 0)
-- Dependencies: 211
-- Name: Cars_Dotcom_Reviews_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Cars_Dotcom_Reviews_id_seq" OWNED BY public."Cars_Dotcom_Reviews".id;


--
-- TOC entry 214 (class 1259 OID 65968)
-- Name: Edmunds_Reviews; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Edmunds_Reviews" (
    id integer NOT NULL,
    suv_year_id integer NOT NULL,
    num_reviews integer NOT NULL,
    score numeric(3,2) NOT NULL
);


ALTER TABLE public."Edmunds_Reviews" OWNER TO postgres;

--
-- TOC entry 213 (class 1259 OID 65966)
-- Name: Edmunds_Reviews_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Edmunds_Reviews_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Edmunds_Reviews_id_seq" OWNER TO postgres;

--
-- TOC entry 3091 (class 0 OID 0)
-- Dependencies: 213
-- Name: Edmunds_Reviews_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Edmunds_Reviews_id_seq" OWNED BY public."Edmunds_Reviews".id;


--
-- TOC entry 216 (class 1259 OID 65981)
-- Name: KBB_Reviews; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."KBB_Reviews" (
    id integer NOT NULL,
    suv_year_id integer NOT NULL,
    num_reviews integer NOT NULL,
    score numeric(3,2) NOT NULL,
    recomended integer NOT NULL
);


ALTER TABLE public."KBB_Reviews" OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 65979)
-- Name: KBB_Reviews_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."KBB_Reviews_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."KBB_Reviews_id_seq" OWNER TO postgres;

--
-- TOC entry 3092 (class 0 OID 0)
-- Dependencies: 215
-- Name: KBB_Reviews_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."KBB_Reviews_id_seq" OWNED BY public."KBB_Reviews".id;


--
-- TOC entry 202 (class 1259 OID 65889)
-- Name: Manufacturers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Manufacturers" (
    manufacturer_id integer NOT NULL,
    name character varying(32) NOT NULL,
    country character varying(32) NOT NULL
);


ALTER TABLE public."Manufacturers" OWNER TO postgres;

--
-- TOC entry 201 (class 1259 OID 65887)
-- Name: Manufacturers_manufacturer_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Manufacturers_manufacturer_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Manufacturers_manufacturer_id_seq" OWNER TO postgres;

--
-- TOC entry 3093 (class 0 OID 0)
-- Dependencies: 201
-- Name: Manufacturers_manufacturer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Manufacturers_manufacturer_id_seq" OWNED BY public."Manufacturers".manufacturer_id;


--
-- TOC entry 204 (class 1259 OID 65899)
-- Name: Markets; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Markets" (
    market_id integer NOT NULL,
    name character varying(32) NOT NULL
);


ALTER TABLE public."Markets" OWNER TO postgres;

--
-- TOC entry 203 (class 1259 OID 65897)
-- Name: Markets_market_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Markets_market_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Markets_market_id_seq" OWNER TO postgres;

--
-- TOC entry 3094 (class 0 OID 0)
-- Dependencies: 203
-- Name: Markets_market_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Markets_market_id_seq" OWNED BY public."Markets".market_id;


--
-- TOC entry 210 (class 1259 OID 65942)
-- Name: SUV_Years; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."SUV_Years" (
    id integer NOT NULL,
    suv_id integer NOT NULL,
    year integer NOT NULL
);


ALTER TABLE public."SUV_Years" OWNER TO postgres;

--
-- TOC entry 209 (class 1259 OID 65940)
-- Name: SUV_Years_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."SUV_Years_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."SUV_Years_id_seq" OWNER TO postgres;

--
-- TOC entry 3095 (class 0 OID 0)
-- Dependencies: 209
-- Name: SUV_Years_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."SUV_Years_id_seq" OWNED BY public."SUV_Years".id;


--
-- TOC entry 206 (class 1259 OID 65909)
-- Name: SUVs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."SUVs" (
    suv_id integer NOT NULL,
    model character varying(32) NOT NULL,
    wiki_page character varying(128),
    start_year integer NOT NULL,
    end_year integer NOT NULL,
    manufacturer_id integer NOT NULL
);


ALTER TABLE public."SUVs" OWNER TO postgres;

--
-- TOC entry 205 (class 1259 OID 65907)
-- Name: SUVs_suv_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."SUVs_suv_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."SUVs_suv_id_seq" OWNER TO postgres;

--
-- TOC entry 3096 (class 0 OID 0)
-- Dependencies: 205
-- Name: SUVs_suv_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."SUVs_suv_id_seq" OWNED BY public."SUVs".suv_id;


--
-- TOC entry 208 (class 1259 OID 65924)
-- Name: Sales_Regions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Sales_Regions" (
    id integer NOT NULL,
    manufacturer_id integer NOT NULL,
    market_id integer NOT NULL
);


ALTER TABLE public."Sales_Regions" OWNER TO postgres;

--
-- TOC entry 207 (class 1259 OID 65922)
-- Name: Sales_Regions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Sales_Regions_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Sales_Regions_id_seq" OWNER TO postgres;

--
-- TOC entry 3097 (class 0 OID 0)
-- Dependencies: 207
-- Name: Sales_Regions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Sales_Regions_id_seq" OWNED BY public."Sales_Regions".id;


--
-- TOC entry 200 (class 1259 OID 65882)
-- Name: alembic_version; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.alembic_version (
    version_num character varying(32) NOT NULL
);


ALTER TABLE public.alembic_version OWNER TO postgres;

--
-- TOC entry 2901 (class 2604 OID 65958)
-- Name: Cars_Dotcom_Reviews id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Cars_Dotcom_Reviews" ALTER COLUMN id SET DEFAULT nextval('public."Cars_Dotcom_Reviews_id_seq"'::regclass);


--
-- TOC entry 2902 (class 2604 OID 65971)
-- Name: Edmunds_Reviews id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Edmunds_Reviews" ALTER COLUMN id SET DEFAULT nextval('public."Edmunds_Reviews_id_seq"'::regclass);


--
-- TOC entry 2903 (class 2604 OID 65984)
-- Name: KBB_Reviews id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."KBB_Reviews" ALTER COLUMN id SET DEFAULT nextval('public."KBB_Reviews_id_seq"'::regclass);


--
-- TOC entry 2896 (class 2604 OID 65892)
-- Name: Manufacturers manufacturer_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Manufacturers" ALTER COLUMN manufacturer_id SET DEFAULT nextval('public."Manufacturers_manufacturer_id_seq"'::regclass);


--
-- TOC entry 2897 (class 2604 OID 65902)
-- Name: Markets market_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Markets" ALTER COLUMN market_id SET DEFAULT nextval('public."Markets_market_id_seq"'::regclass);


--
-- TOC entry 2900 (class 2604 OID 65945)
-- Name: SUV_Years id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SUV_Years" ALTER COLUMN id SET DEFAULT nextval('public."SUV_Years_id_seq"'::regclass);


--
-- TOC entry 2898 (class 2604 OID 65912)
-- Name: SUVs suv_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SUVs" ALTER COLUMN suv_id SET DEFAULT nextval('public."SUVs_suv_id_seq"'::regclass);


--
-- TOC entry 2899 (class 2604 OID 65927)
-- Name: Sales_Regions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Sales_Regions" ALTER COLUMN id SET DEFAULT nextval('public."Sales_Regions_id_seq"'::regclass);


--
-- TOC entry 3080 (class 0 OID 65955)
-- Dependencies: 212
-- Data for Name: Cars_Dotcom_Reviews; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Cars_Dotcom_Reviews" (id, suv_year_id, num_reviews, score, cost_new) FROM stdin;
1	1	252	4.80	45160
2	4	189	4.80	47400
3	7	84	4.80	49865
4	10	41	4.90	50745
5	2	62	4.80	37945
6	5	49	4.80	38045
7	8	55	4.70	38695
8	11	30	4.90	51695
9	3	23	3.40	65490
10	6	3	3.70	67200
11	9	3	4.90	67200
12	12	2	5.00	68900
\.


--
-- TOC entry 3082 (class 0 OID 65968)
-- Dependencies: 214
-- Data for Name: Edmunds_Reviews; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Edmunds_Reviews" (id, suv_year_id, num_reviews, score) FROM stdin;
1	1	73	4.20
2	4	52	4.30
3	7	40	4.30
4	10	34	3.90
5	13	5	4.80
6	2	61	3.20
7	5	40	3.50
8	8	14	4.20
9	11	35	4.50
10	3	12	3.30
11	6	6	3.00
12	9	2	4.50
13	12	1	3.00
\.


--
-- TOC entry 3084 (class 0 OID 65981)
-- Dependencies: 216
-- Data for Name: KBB_Reviews; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."KBB_Reviews" (id, suv_year_id, num_reviews, score, recomended) FROM stdin;
1	1	303	4.60	90
2	4	303	4.60	90
3	7	303	4.60	90
4	10	303	4.60	90
5	13	303	4.60	90
6	2	871	4.50	88
7	5	55	4.40	85
8	8	55	4.40	85
9	11	55	4.40	85
10	14	55	4.40	85
11	3	10	4.40	83
12	6	10	4.40	83
13	9	10	4.40	83
14	12	10	4.40	83
15	15	10	4.40	83
\.


--
-- TOC entry 3070 (class 0 OID 65889)
-- Dependencies: 202
-- Data for Name: Manufacturers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Manufacturers" (manufacturer_id, name, country) FROM stdin;
1	Toyota	Japan
2	Jeep	United States
3	Land Rover	United Kingdom
\.


--
-- TOC entry 3072 (class 0 OID 65899)
-- Dependencies: 204
-- Data for Name: Markets; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Markets" (market_id, name) FROM stdin;
1	China
2	United States
3	Europe
4	Japan
5	India
6	Brazil
7	Russia
\.


--
-- TOC entry 3078 (class 0 OID 65942)
-- Dependencies: 210
-- Data for Name: SUV_Years; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."SUV_Years" (id, suv_id, year) FROM stdin;
1	1	2018
2	2	2018
3	3	2018
4	1	2019
5	2	2019
6	3	2019
7	1	2020
8	2	2020
9	3	2020
10	1	2021
11	2	2021
12	3	2021
13	1	2022
14	2	2022
15	3	2022
16	4	2018
\.


--
-- TOC entry 3074 (class 0 OID 65909)
-- Dependencies: 206
-- Data for Name: SUVs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."SUVs" (suv_id, model, wiki_page, start_year, end_year, manufacturer_id) FROM stdin;
1	4Runner	https://en.wikipedia.org/wiki/Toyota_4Runner	1984	2022	1
2	Wrangler	https://en.wikipedia.org/wiki/Jeep_Wrangler	1987	2022	2
3	Discovery	https://en.wikipedia.org/wiki/Land_Rover_Discovery	1985	2022	3
4	Land Cruzer	https://www.wikipedia.com/toyota/land_cruzer	1975	2022	1
\.


--
-- TOC entry 3076 (class 0 OID 65924)
-- Dependencies: 208
-- Data for Name: Sales_Regions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Sales_Regions" (id, manufacturer_id, market_id) FROM stdin;
1	1	1
2	1	2
3	1	3
4	1	4
5	1	5
6	1	6
7	1	7
8	2	1
9	2	2
10	2	3
11	3	2
12	3	3
13	3	4
14	3	5
15	3	7
\.


--
-- TOC entry 3068 (class 0 OID 65882)
-- Dependencies: 200
-- Data for Name: alembic_version; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.alembic_version (version_num) FROM stdin;
19d4f013c4f6
\.


--
-- TOC entry 3098 (class 0 OID 0)
-- Dependencies: 211
-- Name: Cars_Dotcom_Reviews_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Cars_Dotcom_Reviews_id_seq"', 12, true);


--
-- TOC entry 3099 (class 0 OID 0)
-- Dependencies: 213
-- Name: Edmunds_Reviews_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Edmunds_Reviews_id_seq"', 13, true);


--
-- TOC entry 3100 (class 0 OID 0)
-- Dependencies: 215
-- Name: KBB_Reviews_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."KBB_Reviews_id_seq"', 17, true);


--
-- TOC entry 3101 (class 0 OID 0)
-- Dependencies: 201
-- Name: Manufacturers_manufacturer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Manufacturers_manufacturer_id_seq"', 4, true);


--
-- TOC entry 3102 (class 0 OID 0)
-- Dependencies: 203
-- Name: Markets_market_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Markets_market_id_seq"', 7, true);


--
-- TOC entry 3103 (class 0 OID 0)
-- Dependencies: 209
-- Name: SUV_Years_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."SUV_Years_id_seq"', 16, true);


--
-- TOC entry 3104 (class 0 OID 0)
-- Dependencies: 205
-- Name: SUVs_suv_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."SUVs_suv_id_seq"', 4, true);


--
-- TOC entry 3105 (class 0 OID 0)
-- Dependencies: 207
-- Name: Sales_Regions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Sales_Regions_id_seq"', 15, true);


--
-- TOC entry 2923 (class 2606 OID 65960)
-- Name: Cars_Dotcom_Reviews Cars_Dotcom_Reviews_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Cars_Dotcom_Reviews"
    ADD CONSTRAINT "Cars_Dotcom_Reviews_pkey" PRIMARY KEY (id);


--
-- TOC entry 2926 (class 2606 OID 65973)
-- Name: Edmunds_Reviews Edmunds_Reviews_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Edmunds_Reviews"
    ADD CONSTRAINT "Edmunds_Reviews_pkey" PRIMARY KEY (id);


--
-- TOC entry 2929 (class 2606 OID 65986)
-- Name: KBB_Reviews KBB_Reviews_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."KBB_Reviews"
    ADD CONSTRAINT "KBB_Reviews_pkey" PRIMARY KEY (id);


--
-- TOC entry 2907 (class 2606 OID 65896)
-- Name: Manufacturers Manufacturers_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Manufacturers"
    ADD CONSTRAINT "Manufacturers_name_key" UNIQUE (name);


--
-- TOC entry 2909 (class 2606 OID 65894)
-- Name: Manufacturers Manufacturers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Manufacturers"
    ADD CONSTRAINT "Manufacturers_pkey" PRIMARY KEY (manufacturer_id);


--
-- TOC entry 2911 (class 2606 OID 65906)
-- Name: Markets Markets_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Markets"
    ADD CONSTRAINT "Markets_name_key" UNIQUE (name);


--
-- TOC entry 2913 (class 2606 OID 65904)
-- Name: Markets Markets_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Markets"
    ADD CONSTRAINT "Markets_pkey" PRIMARY KEY (market_id);


--
-- TOC entry 2921 (class 2606 OID 65947)
-- Name: SUV_Years SUV_Years_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SUV_Years"
    ADD CONSTRAINT "SUV_Years_pkey" PRIMARY KEY (id);


--
-- TOC entry 2915 (class 2606 OID 65916)
-- Name: SUVs SUVs_model_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SUVs"
    ADD CONSTRAINT "SUVs_model_key" UNIQUE (model);


--
-- TOC entry 2917 (class 2606 OID 65914)
-- Name: SUVs SUVs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SUVs"
    ADD CONSTRAINT "SUVs_pkey" PRIMARY KEY (suv_id);


--
-- TOC entry 2919 (class 2606 OID 65929)
-- Name: Sales_Regions Sales_Regions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Sales_Regions"
    ADD CONSTRAINT "Sales_Regions_pkey" PRIMARY KEY (id);


--
-- TOC entry 2905 (class 2606 OID 65886)
-- Name: alembic_version alembic_version_pkc; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.alembic_version
    ADD CONSTRAINT alembic_version_pkc PRIMARY KEY (version_num);


--
-- TOC entry 2924 (class 1259 OID 74077)
-- Name: indx_cars_dotcom_suv_years_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX indx_cars_dotcom_suv_years_id ON public."Cars_Dotcom_Reviews" USING hash (suv_year_id);


--
-- TOC entry 2927 (class 1259 OID 74076)
-- Name: indx_edmunds_suv_years_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX indx_edmunds_suv_years_id ON public."Edmunds_Reviews" USING hash (suv_year_id);


--
-- TOC entry 2930 (class 1259 OID 74075)
-- Name: indx_kbb_suv_years_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX indx_kbb_suv_years_id ON public."KBB_Reviews" USING hash (suv_year_id);


--
-- TOC entry 2935 (class 2606 OID 65961)
-- Name: Cars_Dotcom_Reviews Cars_Dotcom_Reviews_suv_year_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Cars_Dotcom_Reviews"
    ADD CONSTRAINT "Cars_Dotcom_Reviews_suv_year_id_fkey" FOREIGN KEY (suv_year_id) REFERENCES public."SUV_Years"(id);


--
-- TOC entry 2936 (class 2606 OID 65974)
-- Name: Edmunds_Reviews Edmunds_Reviews_suv_year_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Edmunds_Reviews"
    ADD CONSTRAINT "Edmunds_Reviews_suv_year_id_fkey" FOREIGN KEY (suv_year_id) REFERENCES public."SUV_Years"(id);


--
-- TOC entry 2937 (class 2606 OID 65987)
-- Name: KBB_Reviews KBB_Reviews_suv_year_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."KBB_Reviews"
    ADD CONSTRAINT "KBB_Reviews_suv_year_id_fkey" FOREIGN KEY (suv_year_id) REFERENCES public."SUV_Years"(id);


--
-- TOC entry 2934 (class 2606 OID 65948)
-- Name: SUV_Years SUV_Years_suv_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SUV_Years"
    ADD CONSTRAINT "SUV_Years_suv_id_fkey" FOREIGN KEY (suv_id) REFERENCES public."SUVs"(suv_id);


--
-- TOC entry 2931 (class 2606 OID 65917)
-- Name: SUVs SUVs_manufacturer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SUVs"
    ADD CONSTRAINT "SUVs_manufacturer_id_fkey" FOREIGN KEY (manufacturer_id) REFERENCES public."Manufacturers"(manufacturer_id);


--
-- TOC entry 2932 (class 2606 OID 65930)
-- Name: Sales_Regions Sales_Regions_manufacturer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Sales_Regions"
    ADD CONSTRAINT "Sales_Regions_manufacturer_id_fkey" FOREIGN KEY (manufacturer_id) REFERENCES public."Manufacturers"(manufacturer_id);


--
-- TOC entry 2933 (class 2606 OID 65935)
-- Name: Sales_Regions Sales_Regions_market_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Sales_Regions"
    ADD CONSTRAINT "Sales_Regions_market_id_fkey" FOREIGN KEY (market_id) REFERENCES public."Markets"(market_id);


-- Completed on 2022-01-31 01:23:19 UTC

--
-- PostgreSQL database dump complete
--

