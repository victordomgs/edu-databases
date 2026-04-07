SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;

CREATE SCHEMA IF NOT EXISTS miniwind;

SET search_path TO miniwind, public;

-- Name: customers; Type: TABLE; Schema: miniwind; Owner: -
--

CREATE TABLE miniwind.customers (
    id bigint NOT NULL,
    company character varying(50) DEFAULT NULL::character varying,
    last_name character varying(50) DEFAULT NULL::character varying,
    first_name character varying(50) DEFAULT NULL::character varying,
    email_address character varying(50) DEFAULT NULL::character varying,
    job_title character varying(50) DEFAULT NULL::character varying,
    mobile_phone character varying(25) DEFAULT NULL::character varying,
    address text,
    city character varying(50) DEFAULT NULL::character varying,
    state_province character varying(50) DEFAULT NULL::character varying,
    zip_postal_code character varying(15) DEFAULT NULL::character varying,
    country_region character varying(50) DEFAULT NULL::character varying
);


--
-- Name: customers_id_seq; Type: SEQUENCE; Schema: miniwind; Owner: -
--

CREATE SEQUENCE miniwind.customers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: customers_id_seq; Type: SEQUENCE OWNED BY; Schema: miniwind; Owner: -
--

ALTER SEQUENCE miniwind.customers_id_seq OWNED BY miniwind.customers.id;


--
-- Name: employees; Type: TABLE; Schema: miniwind; Owner: -
--

CREATE TABLE miniwind.employees (
    id bigint NOT NULL,
    last_name character varying(50) DEFAULT NULL::character varying,
    first_name character varying(50) DEFAULT NULL::character varying,
    email_address character varying(50) DEFAULT NULL::character varying,
    job_title character varying(50) DEFAULT NULL::character varying,
    mobile_phone character varying(25) DEFAULT NULL::character varying,
    fax_number character varying(25) DEFAULT NULL::character varying,
    address text,
    city character varying(50) DEFAULT NULL::character varying,
    state_province character varying(50) DEFAULT NULL::character varying,
    zip_postal_code character varying(15) DEFAULT NULL::character varying,
    country_region character varying(50) DEFAULT NULL::character varying,
    notes text
);


--
-- Name: employees_id_seq; Type: SEQUENCE; Schema: miniwind; Owner: -
--

CREATE SEQUENCE miniwind.employees_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: employees_id_seq; Type: SEQUENCE OWNED BY; Schema: miniwind; Owner: -
--

ALTER SEQUENCE miniwind.employees_id_seq OWNED BY miniwind.employees.id;


--
-- Name: invoices; Type: TABLE; Schema: miniwind; Owner: -
--

CREATE TABLE miniwind.invoices (
    id bigint NOT NULL,
    order_id bigint,
    invoice_date timestamp with time zone,
    due_date timestamp with time zone,
    tax numeric(19,4) DEFAULT 0.0000,
    shipping numeric(19,4) DEFAULT 0.0000,
    amount_due numeric(19,4) DEFAULT 0.0000
);


--
-- Name: invoices_id_seq; Type: SEQUENCE; Schema: miniwind; Owner: -
--

CREATE SEQUENCE miniwind.invoices_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: invoices_id_seq; Type: SEQUENCE OWNED BY; Schema: miniwind; Owner: -
--

ALTER SEQUENCE miniwind.invoices_id_seq OWNED BY miniwind.invoices.id;


--
-- Name: order_details; Type: TABLE; Schema: miniwind; Owner: -
--

CREATE TABLE miniwind.order_details (
    id bigint NOT NULL,
    order_id bigint NOT NULL,
    product_id bigint,
    quantity numeric(18,4) DEFAULT 0.0000 NOT NULL,
    unit_price numeric(19,4) DEFAULT 0.0000,
    discount double precision DEFAULT '0'::double precision NOT NULL,
    status_id bigint,
    inventory_id bigint
);


--
-- Name: order_details_id_seq; Type: SEQUENCE; Schema: miniwind; Owner: -
--

CREATE SEQUENCE miniwind.order_details_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: order_details_id_seq; Type: SEQUENCE OWNED BY; Schema: miniwind; Owner: -
--

ALTER SEQUENCE miniwind.order_details_id_seq OWNED BY miniwind.order_details.id;


--
-- Name: order_details_status; Type: TABLE; Schema: miniwind; Owner: -
--

CREATE TABLE miniwind.order_details_status (
    id bigint NOT NULL,
    status_name character varying(50) NOT NULL
);


--
-- Name: orders; Type: TABLE; Schema: miniwind; Owner: -
--

CREATE TABLE miniwind.orders (
    id bigint NOT NULL,
    employee_id bigint,
    customer_id bigint,
    order_date timestamp with time zone,
    shipped_date timestamp with time zone,
    ship_name character varying(50) DEFAULT NULL::character varying,
    ship_address text,
    ship_city character varying(50) DEFAULT NULL::character varying,
    ship_state_province character varying(50) DEFAULT NULL::character varying,
    ship_zip_postal_code character varying(50) DEFAULT NULL::character varying,
    ship_country_region character varying(50) DEFAULT NULL::character varying,
    shipping_fee numeric(19,4) DEFAULT 0.0000,
    payment_type character varying(50) DEFAULT NULL::character varying,
    paid_date timestamp with time zone,
    status_id smallint DEFAULT '0'::smallint
);


--
-- Name: orders_id_seq; Type: SEQUENCE; Schema: miniwind; Owner: -
--

CREATE SEQUENCE miniwind.orders_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: orders_id_seq; Type: SEQUENCE OWNED BY; Schema: miniwind; Owner: -
--

ALTER SEQUENCE miniwind.orders_id_seq OWNED BY miniwind.orders.id;


--
-- Name: orders_status; Type: TABLE; Schema: miniwind; Owner: -
--

CREATE TABLE miniwind.orders_status (
    id smallint NOT NULL,
    status_name character varying(50) NOT NULL
);


--
-- Name: products; Type: TABLE; Schema: miniwind; Owner: -
--

CREATE TABLE miniwind.products (
    supplier_ids text,
    id bigint NOT NULL,
    product_code character varying(25) DEFAULT NULL::character varying,
    product_name character varying(50) DEFAULT NULL::character varying,
    standard_cost numeric(19,4) DEFAULT 0.0000,
    list_price numeric(19,4) DEFAULT 0.0000 NOT NULL,
    reorder_level bigint,
    target_level bigint,
    quantity_per_unit character varying(50) DEFAULT NULL::character varying,
    minimum_reorder_quantity bigint,
    category character varying(50) DEFAULT NULL::character varying
);


--
-- Name: products_id_seq; Type: SEQUENCE; Schema: miniwind; Owner: -
--

CREATE SEQUENCE miniwind.products_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: products_id_seq; Type: SEQUENCE OWNED BY; Schema: miniwind; Owner: -
--

ALTER SEQUENCE miniwind.products_id_seq OWNED BY miniwind.products.id;


--
-- Name: suppliers; Type: TABLE; Schema: miniwind; Owner: -
--

CREATE TABLE miniwind.suppliers (
    id bigint NOT NULL,
    company character varying(50) DEFAULT NULL::character varying,
    last_name character varying(50) DEFAULT NULL::character varying,
    first_name character varying(50) DEFAULT NULL::character varying,
    email_address character varying(50) DEFAULT NULL::character varying,
    job_title character varying(50) DEFAULT NULL::character varying,
    mobile_phone character varying(25) DEFAULT NULL::character varying,
    address text,
    city character varying(50) DEFAULT NULL::character varying,
    state_province character varying(50) DEFAULT NULL::character varying,
    zip_postal_code character varying(15) DEFAULT NULL::character varying,
    country_region character varying(50) DEFAULT NULL::character varying,
    web_page text,
    notes text
);


--
-- Name: suppliers_id_seq; Type: SEQUENCE; Schema: miniwind; Owner: -
--

CREATE SEQUENCE miniwind.suppliers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: suppliers_id_seq; Type: SEQUENCE OWNED BY; Schema: miniwind; Owner: -
--

ALTER SEQUENCE miniwind.suppliers_id_seq OWNED BY miniwind.suppliers.id;


--
-- Name: customers id; Type: DEFAULT; Schema: miniwind; Owner: -
--

ALTER TABLE ONLY miniwind.customers ALTER COLUMN id SET DEFAULT nextval('miniwind.customers_id_seq'::regclass);


--
-- Name: employees id; Type: DEFAULT; Schema: miniwind; Owner: -
--

ALTER TABLE ONLY miniwind.employees ALTER COLUMN id SET DEFAULT nextval('miniwind.employees_id_seq'::regclass);


--
-- Name: invoices id; Type: DEFAULT; Schema: miniwind; Owner: -
--

ALTER TABLE ONLY miniwind.invoices ALTER COLUMN id SET DEFAULT nextval('miniwind.invoices_id_seq'::regclass);


--
-- Name: order_details id; Type: DEFAULT; Schema: miniwind; Owner: -
--

ALTER TABLE ONLY miniwind.order_details ALTER COLUMN id SET DEFAULT nextval('miniwind.order_details_id_seq'::regclass);


--
-- Name: orders id; Type: DEFAULT; Schema: miniwind; Owner: -
--

ALTER TABLE ONLY miniwind.orders ALTER COLUMN id SET DEFAULT nextval('miniwind.orders_id_seq'::regclass);


--
-- Name: products id; Type: DEFAULT; Schema: miniwind; Owner: -
--

ALTER TABLE ONLY miniwind.products ALTER COLUMN id SET DEFAULT nextval('miniwind.products_id_seq'::regclass);


--
-- Name: suppliers id; Type: DEFAULT; Schema: miniwind; Owner: -
--

ALTER TABLE ONLY miniwind.suppliers ALTER COLUMN id SET DEFAULT nextval('miniwind.suppliers_id_seq'::regclass);


--
-- Data for Name: customers; Type: TABLE DATA; Schema: miniwind; Owner: -
--

COPY miniwind.customers (id, company, last_name, first_name, email_address, job_title, mobile_phone, address, city, state_province, zip_postal_code, country_region) FROM stdin;
1	Lueilwitz, Homenick and Quigley	Gladhill	Marga	mgladhill0@constantcontact.com	Purchasing Representative	(785) 5471951	63202 Aberg Hill	Duluth	MN	55811	USA
2	Toy-Rutherford	Brett	Marco	mbrett1@unicef.org	Purchasing Representative	(817) 7965289	7 Homewood Road	Santa Ana	CA	92705	USA
3	Lueilwitz-Zboncak	Bellelli	Trixie	tbellelli2@biblegateway.com	Accounting Assistant	(571) 4007887	17 Quincy Plaza	New Orleans	LA	70183	USA
4	Renner, Beier and Denesik	Teece	Marnie	mteece3@studiopress.com	Purchasing Representative	(786) 2516698	9152 Lake View Trail	Springfield	MO	65805	USA
5	Ryan, Farrell and Tromp	Sellers	Dredi	dsellers4@blogger.com	Purchasing Representative	(559) 4379480	2024 Pawling Circle	Virginia Beach	VA	23471	USA
6	Ullrich, Schoen and Ankunding	Squirrel	Emma	esquirrel5@youtube.com	Purchasing Representative	(410) 3701720	86 Ridgeway Crossing	Largo	FL	34643	USA
7	Hudson-Lesch	Dyott	Joni	jdyott6@foxnews.com	Owner	(509) 3210210	7258 Heffernan Parkway	Indianapolis	IN	46247	USA
8	Emmerich, Mueller and Volkman	O'Lynn	Lorianne	lolynn7@example.com	Purchasing Representative	(585) 8222889	2 Commercial Road	Oklahoma City	OK	73152	USA
9	Zemlak-Muller	Trew	Mendel	mtrew8@mozilla.com	Owner	(336) 4148918	442 Lukken Circle	Dayton	OH	45403	USA
10	Gerhold-Carter	Talks	Tessie	ttalks9@cdc.gov	Purchasing Representative	(818) 8653483	29 Texas Road	Jacksonville	FL	32230	USA
11	Towne, Mante and Kuphal	Fuzzens	Rhody	rfuzzensa@istockphoto.com	Purchasing Representative	(941) 2995824	7 Steensland Street	Myrtle Beach	SC	29579	USA
12	Larson-Weber	Clohisey	Concordia	cclohiseyb@disqus.com	Purchasing Manager	(937) 8628987	4686 Harbort Court	Fresno	CA	93740	USA
13	Wiza-Wisozk	Bonnaire	Orelia	obonnairec@go.com	Purchasing Manager	(972) 5298537	99589 Lerdahl Trail	Houston	TX	77045	USA
14	Mante-Wintheiser	Malley	Pieter	pmalleyd@fda.gov	Purchasing Representative	(915) 5775902	025 Arapahoe Court	Pittsburgh	PA	15279	USA
15	McDermott-Spinka	Streat	Ammamaria	astreate@seattletimes.com	Accounting Assistant	(314) 2160121	12 Scott Parkway	El Paso	TX	79955	USA
16	McLaughlin, Weber and Green	Ashton	Thorndike	tashtonf@rambler.ru	Owner	(513) 8346641	1 Magdeline Lane	New York City	NY	10155	USA
17	Welch Group	Ludlem	Mace	mludlemg@cloudflare.com	Accounting Assistant	(801) 3456443	979 Pennsylvania Hill	Mobile	AL	36628	USA
18	Treutel LLC	Fugere	Kasey	kfugereh@tinypic.com	Purchasing Manager	(352) 6247543	5 Melvin Way	Corpus Christi	TX	78410	USA
19	Hoeger-Ernser	Kindle	Shandeigh	skindlei@theatlantic.com	Purchasing Representative	(305) 9024633	5668 Anhalt Plaza	San Diego	CA	92121	USA
20	Buckridge LLC	Willis	Gipsy	gwillisj@symantec.com	Purchasing Manager	(419) 7453729	53 Gulseth Street	Lexington	KY	40591	USA
21	Mitchell, Brakus and Bradtke	Gonnel	Filberto	fgonnelk@pinterest.com	Owner	(419) 9832396	9 Hoard Junction	Charlotte	NC	28284	USA
22	Lockman, Pagac and Doyle	Messham	Dolley	dmesshaml@furl.net	Purchasing Manager	(770) 1848252	59 Cardinal Court	Shawnee Mission	KS	66286	USA
23	Franecki and Sons	Sabin	Jude	jsabinm@live.com	Purchasing Manager	(860) 5354017	71 Mayer Place	Fresno	CA	93704	USA
24	Kohler and Sons	Barron	Hannie	hbarronn@clickbank.net	Purchasing Manager	(706) 4281660	07 Hermina Point	Brooklyn	NY	11225	USA
25	Mayert Inc	Murden	Alford	amurdeno@sina.com.cn	Purchasing Representative	(813) 9777076	59546 Wayridge Street	Sioux Falls	SD	57105	USA
26	Mertz, Weimann and Durgan	Basnett	Agata	abasnettp@weather.com	Accounting Assistant	(502) 8439841	1842 Mesta Lane	Louisville	KY	40210	USA
27	Sporer LLC	Balkwill	Judye	jbalkwillq@facebook.com	Purchasing Representative	(918) 6821657	0 Stephen Crossing	Fort Wayne	IN	46852	USA
28	Feil, Mills and Koss	Mussington	Sumner	smussingtonr@umn.edu	Owner	(404) 2902575	336 Arapahoe Way	Sacramento	CA	94250	USA
29	Cruickshank Inc	Coulthard	Belita	bcoulthards@wsj.com	Accounting Assistant	(408) 9337973	49 Mayfield Pass	Indianapolis	IN	46295	USA
\.


--
-- Data for Name: employees; Type: TABLE DATA; Schema: miniwind; Owner: -
--

COPY miniwind.employees (id, last_name, first_name, email_address, job_title, mobile_phone, fax_number, address, city, state_province, zip_postal_code, country_region, notes) FROM stdin;
1	Jurek	Maynord	maynord@northwindtraders.com	Sales Representative	(901) 3049980	\N	026 Ohio Alley	Portland	OR	97296	USA	\N
2	Guyton	Jabez	jabez@northwindtraders.com	Vice President, Sales	(608) 4693824	\N	96050 Helena Terrace	Fresno	CA	93740	USA	Joined the company as a sales representative, was promoted to sales manager and was then named vice president of sales.
3	Pointing	Hall	hall@northwindtraders.com	Sales Representative	(614) 7124463	\N	0651 Melvin Way	El Paso	TX	79911	USA	Was hired as a sales associate and was promoted to sales representative.
4	O Sullivan	Delaney	delaney@northwindtraders.com	Sales Representative	(330) 5001704	\N	5787 Schlimgen Circle	Camden	NJ	08104	USA	\N
5	Coppin	Grover	grover@northwindtraders.com	Sales Manager	(904) 2943765	\N	83 Mariners Cove Way	Atlanta	GA	30301	USA	Joined the company as a sales representative and was promoted to sales manager.  Fluent in French.
6	Seczyk	Cesya	cesya@northwindtraders.com	Sales Representative	(253) 8468633	\N	77 Dakota Plaza	Oklahoma City	OK	73142	USA	Fluent in Japanese and can read and write French, Portuguese, and Spanish.
7	Redit	Titus	titus@northwindtraders.com	Sales Representative	(734) 4105611	\N	94704 Oak Valley Circle	Washington	DC	20425	USA	\N
8	Jirusek	Thelma	thelma@northwindtraders.com	Sales Coordinator	(607) 7982119	\N	1761 Farwell Circle	Lubbock	TX	79491	USA	Reads and writes French.
9	Polet	Selia	selia@northwindtraders.com	Sales Representative	(202) 7115116	\N	0241 Sutteridge Crossing	Washington	DC	20022	USA	Fluent in French and German.
\.


--
-- Data for Name: invoices; Type: TABLE DATA; Schema: miniwind; Owner: -
--

COPY miniwind.invoices (id, order_id, invoice_date, due_date, tax, shipping, amount_due) FROM stdin;
5	31	2006-03-22 16:08:59+00	\N	0.0000	0.0000	0.0000
6	32	2006-03-22 16:10:27+00	\N	0.0000	0.0000	0.0000
7	40	2006-03-24 10:41:41+00	\N	0.0000	0.0000	0.0000
8	39	2006-03-24 10:55:46+00	\N	0.0000	0.0000	0.0000
9	38	2006-03-24 10:56:57+00	\N	0.0000	0.0000	0.0000
10	37	2006-03-24 10:57:38+00	\N	0.0000	0.0000	0.0000
11	36	2006-03-24 10:58:40+00	\N	0.0000	0.0000	0.0000
12	35	2006-03-24 10:59:41+00	\N	0.0000	0.0000	0.0000
13	34	2006-03-24 11:00:55+00	\N	0.0000	0.0000	0.0000
14	33	2006-03-24 11:02:02+00	\N	0.0000	0.0000	0.0000
15	30	2006-03-24 11:03:00+00	\N	0.0000	0.0000	0.0000
16	56	2006-04-03 13:50:15+00	\N	0.0000	0.0000	0.0000
17	55	2006-04-04 11:05:04+00	\N	0.0000	0.0000	0.0000
18	51	2006-04-04 11:06:13+00	\N	0.0000	0.0000	0.0000
19	50	2006-04-04 11:06:56+00	\N	0.0000	0.0000	0.0000
20	48	2006-04-04 11:07:37+00	\N	0.0000	0.0000	0.0000
21	47	2006-04-04 11:08:14+00	\N	0.0000	0.0000	0.0000
22	46	2006-04-04 11:08:49+00	\N	0.0000	0.0000	0.0000
23	45	2006-04-04 11:09:24+00	\N	0.0000	0.0000	0.0000
24	79	2006-04-04 11:35:54+00	\N	0.0000	0.0000	0.0000
25	78	2006-04-04 11:36:21+00	\N	0.0000	0.0000	0.0000
26	77	2006-04-04 11:36:47+00	\N	0.0000	0.0000	0.0000
27	76	2006-04-04 11:37:09+00	\N	0.0000	0.0000	0.0000
28	75	2006-04-04 11:37:49+00	\N	0.0000	0.0000	0.0000
29	74	2006-04-04 11:38:11+00	\N	0.0000	0.0000	0.0000
30	73	2006-04-04 11:38:32+00	\N	0.0000	0.0000	0.0000
31	72	2006-04-04 11:38:53+00	\N	0.0000	0.0000	0.0000
32	71	2006-04-04 11:39:29+00	\N	0.0000	0.0000	0.0000
33	70	2006-04-04 11:39:53+00	\N	0.0000	0.0000	0.0000
34	69	2006-04-04 11:40:16+00	\N	0.0000	0.0000	0.0000
35	67	2006-04-04 11:40:38+00	\N	0.0000	0.0000	0.0000
36	42	2006-04-04 11:41:14+00	\N	0.0000	0.0000	0.0000
37	60	2006-04-04 11:41:45+00	\N	0.0000	0.0000	0.0000
38	63	2006-04-04 11:42:26+00	\N	0.0000	0.0000	0.0000
39	58	2006-04-04 11:43:08+00	\N	0.0000	0.0000	0.0000
\.


--
-- Data for Name: order_details; Type: TABLE DATA; Schema: miniwind; Owner: -
--

COPY miniwind.order_details (id, order_id, product_id, quantity, unit_price, discount, status_id, inventory_id) FROM stdin;
27	30	34	100.0000	14.0000	0	2	83
28	30	80	30.0000	3.5000	0	2	63
29	31	7	10.0000	30.0000	0	2	64
30	31	51	10.0000	53.0000	0	2	65
31	31	80	10.0000	3.5000	0	2	66
32	32	1	15.0000	18.0000	0	2	67
33	32	43	20.0000	46.0000	0	2	68
34	33	19	30.0000	9.2000	0	2	81
35	34	19	20.0000	9.2000	0	2	69
36	35	48	10.0000	12.7500	0	2	70
37	36	41	200.0000	9.6500	0	2	79
38	37	8	17.0000	40.0000	0	2	71
39	38	43	300.0000	46.0000	0	2	77
40	39	48	100.0000	12.7500	0	2	75
41	40	81	200.0000	2.9900	0	2	73
42	41	43	300.0000	46.0000	0	1	104
43	42	6	10.0000	25.0000	0	2	84
44	42	4	10.0000	22.0000	0	2	85
45	42	19	10.0000	9.2000	0	2	110
46	43	80	20.0000	3.5000	0	1	86
47	43	81	50.0000	2.9900	0	1	87
48	44	1	25.0000	18.0000	0	1	88
49	44	43	25.0000	46.0000	0	1	89
50	44	81	25.0000	2.9900	0	1	90
51	45	41	50.0000	9.6500	0	2	116
52	45	40	50.0000	18.4000	0	2	91
53	46	57	100.0000	19.5000	0	2	101
54	46	72	50.0000	34.8000	0	2	114
55	47	34	300.0000	14.0000	0	2	108
56	48	8	25.0000	40.0000	0	2	106
57	48	19	25.0000	9.2000	0	2	112
59	50	21	20.0000	10.0000	0	2	92
60	51	5	25.0000	21.3500	0	2	93
61	51	41	30.0000	9.6500	0	2	94
62	51	40	30.0000	18.4000	0	2	95
66	56	48	10.0000	12.7500	0	2	99
67	55	34	87.0000	14.0000	0	2	117
68	79	7	30.0000	30.0000	0	2	119
69	79	51	30.0000	53.0000	0	2	118
70	78	17	40.0000	39.0000	0	2	120
71	77	6	90.0000	25.0000	0	2	121
72	76	4	30.0000	22.0000	0	2	122
73	75	48	40.0000	12.7500	0	2	123
74	74	48	40.0000	12.7500	0	2	124
75	73	41	10.0000	9.6500	0	2	125
76	72	43	5.0000	46.0000	0	2	126
77	71	40	40.0000	18.4000	0	2	127
78	70	8	20.0000	40.0000	0	2	128
79	69	80	15.0000	3.5000	0	2	129
80	67	74	20.0000	10.0000	0	2	130
81	60	72	40.0000	34.8000	0	2	131
82	63	3	50.0000	10.0000	0	2	132
83	63	8	3.0000	40.0000	0	2	133
84	58	20	40.0000	81.0000	0	2	134
85	58	52	40.0000	7.0000	0	2	135
86	80	56	10.0000	38.0000	0	1	136
90	81	81	0.0000	2.9900	0	5	\N
91	81	56	0.0000	38.0000	0	0	\N
\.


--
-- Data for Name: order_details_status; Type: TABLE DATA; Schema: miniwind; Owner: -
--

COPY miniwind.order_details_status (id, status_name) FROM stdin;
0	None
1	Allocated
2	Invoiced
3	Shipped
4	On Order
5	No Stock
\.


--
-- Data for Name: orders; Type: TABLE DATA; Schema: miniwind; Owner: -
--

COPY miniwind.orders (id, employee_id, customer_id, order_date, shipped_date, ship_name, ship_address, ship_city, ship_state_province, ship_zip_postal_code, ship_country_region, shipping_fee, payment_type, paid_date, status_id) FROM stdin;
30	9	27	2006-01-15 00:00:00+00	2006-01-22 00:00:00+00	Judye Balkwill	0 Stephen Crossing	Fort Wayne	IN	46852	USA	200.0000	Check	2006-01-15 00:00:00+00	3
31	3	4	2006-01-20 00:00:00+00	2006-01-22 00:00:00+00	Marnie Teece	9152 Lake View Trail	Springfield	MO	65805	USA	5.0000	Credit Card	2006-01-20 00:00:00+00	3
32	4	12	2006-01-22 00:00:00+00	2006-01-22 00:00:00+00	Concordia Clohisey	4686 Harbort Court	Fresno	CA	93740	USA	5.0000	Credit Card	2006-01-22 00:00:00+00	3
33	6	8	2006-01-30 00:00:00+00	2006-01-31 00:00:00+00	Lorianne O'Lynn	2 Commercial Road	Oklahoma City	OK	73152	USA	50.0000	Credit Card	2006-01-30 00:00:00+00	3
34	9	4	2006-02-06 00:00:00+00	2006-02-07 00:00:00+00	Marnie Teece	9152 Lake View Trail	Springfield	MO	65805	USA	4.0000	Check	2006-02-06 00:00:00+00	3
35	3	29	2006-02-10 00:00:00+00	2006-02-12 00:00:00+00	Belita Coulthard	49 Mayfield Pass	Indianapolis	IN	46295	USA	7.0000	Check	2006-02-10 00:00:00+00	3
36	4	3	2006-02-23 00:00:00+00	2006-02-25 00:00:00+00	Trixie Bellelli	17 Quincy Plaza	New Orleans	LA	70183	USA	7.0000	Cash	2006-02-23 00:00:00+00	3
37	8	6	2006-03-06 00:00:00+00	2006-03-09 00:00:00+00	Emma Squirrel	86 Ridgeway Crossing	Largo	FL	34643	USA	12.0000	Credit Card	2006-03-06 00:00:00+00	3
38	9	28	2006-03-10 00:00:00+00	2006-03-11 00:00:00+00	Sumner Mussington	336 Arapahoe Way	Sacramento	CA	94250	USA	10.0000	Check	2006-03-10 00:00:00+00	3
39	3	8	2006-03-22 00:00:00+00	2006-03-24 00:00:00+00	Lorianne O'Lynn	2 Commercial Road	Oklahoma City	OK	73152	USA	5.0000	Check	2006-03-22 00:00:00+00	3
40	4	10	2006-03-24 00:00:00+00	2006-03-24 00:00:00+00	Tessie Talks	29 Texas Road	Jacksonville	FL	32230	USA	9.0000	Credit Card	2006-03-24 00:00:00+00	3
41	1	7	2006-03-24 00:00:00+00	\N	Joni Dyott	7258 Heffernan Parkway	Indianapolis	IN	46247	USA	0.0000	\N	\N	0
42	1	10	2006-03-24 00:00:00+00	2006-04-07 00:00:00+00	Tessie Talks	29 Texas Road	Jacksonville	FL	32230	USA	0.0000	\N	\N	2
43	1	11	2006-03-24 00:00:00+00	\N	Rhody Fuzzens	7 Steensland Street	Myrtle Beach	SC	29579	USA	0.0000	\N	\N	0
44	1	1	2006-03-24 00:00:00+00	\N	Marga Gladhill	63202 Aberg Hill	Duluth	MN	55811	USA	0.0000	\N	\N	0
45	1	28	2006-04-07 00:00:00+00	2006-04-07 00:00:00+00	Sumner Mussington	336 Arapahoe Way	Sacramento	CA	94250	USA	40.0000	Credit Card	2006-04-07 00:00:00+00	3
46	7	9	2006-04-05 00:00:00+00	2006-04-05 00:00:00+00	Mendel Trew	442 Lukken Circle	Dayton	OH	45403	USA	100.0000	Check	2006-04-05 00:00:00+00	3
47	6	6	2006-04-08 00:00:00+00	2006-04-08 00:00:00+00	Emma Squirrel	86 Ridgeway Crossing	Largo	FL	34643	USA	300.0000	Credit Card	2006-04-08 00:00:00+00	3
48	4	8	2006-04-05 00:00:00+00	2006-04-05 00:00:00+00	Lorianne O'Lynn	2 Commercial Road	Oklahoma City	OK	73152	USA	50.0000	Check	2006-04-05 00:00:00+00	3
50	9	25	2006-04-05 00:00:00+00	2006-04-05 00:00:00+00	Alford Murden	59546 Wayridge Street	Sioux Falls	SD	57105	USA	5.0000	Cash	2006-04-05 00:00:00+00	3
51	9	26	2006-04-05 00:00:00+00	2006-04-05 00:00:00+00	Agata Basnett	1842 Mesta Lane	Louisville	KY	40210	USA	60.0000	Credit Card	2006-04-05 00:00:00+00	3
55	1	29	2006-04-05 00:00:00+00	2006-04-05 00:00:00+00	Belita Coulthard	49 Mayfield Pass	Indianapolis	IN	46295	USA	200.0000	Check	2006-04-05 00:00:00+00	3
56	2	6	2006-04-03 00:00:00+00	2006-04-03 00:00:00+00	Emma Squirrel	86 Ridgeway Crossing	Largo	FL	34643	USA	0.0000	Check	2006-04-03 00:00:00+00	3
57	9	27	2006-04-22 00:00:00+00	2006-04-22 00:00:00+00	Judye Balkwill	0 Stephen Crossing	Fort Wayne	IN	46852	USA	200.0000	Check	2006-04-22 00:00:00+00	0
58	3	4	2006-04-22 00:00:00+00	2006-04-22 00:00:00+00	Marnie Teece	9152 Lake View Trail	Springfield	MO	65805	USA	5.0000	Credit Card	2006-04-22 00:00:00+00	3
59	4	12	2006-04-22 00:00:00+00	2006-04-22 00:00:00+00	Concordia Clohisey	4686 Harbort Court	Fresno	CA	93740	USA	5.0000	Credit Card	2006-04-22 00:00:00+00	0
60	6	8	2006-04-30 00:00:00+00	2006-04-30 00:00:00+00	Lorianne O'Lynn	2 Commercial Road	Oklahoma City	OK	73152	USA	50.0000	Credit Card	2006-04-30 00:00:00+00	3
61	9	4	2006-04-07 00:00:00+00	2006-04-07 00:00:00+00	Marnie Teece	9152 Lake View Trail	Springfield	MO	65805	USA	4.0000	Check	2006-04-07 00:00:00+00	0
62	3	29	2006-04-12 00:00:00+00	2006-04-12 00:00:00+00	Belita Coulthard	49 Mayfield Pass	Indianapolis	IN	46295	USA	7.0000	Check	2006-04-12 00:00:00+00	0
63	4	3	2006-04-25 00:00:00+00	2006-04-25 00:00:00+00	Trixie Bellelli	17 Quincy Plaza	New Orleans	LA	70183	USA	7.0000	Cash	2006-04-25 00:00:00+00	3
64	8	6	2006-05-09 00:00:00+00	2006-05-09 00:00:00+00	Emma Squirrel	86 Ridgeway Crossing	Largo	FL	34643	USA	12.0000	Credit Card	2006-05-09 00:00:00+00	0
65	9	28	2006-05-11 00:00:00+00	2006-05-11 00:00:00+00	Sumner Mussington	336 Arapahoe Way	Sacramento	CA	94250	USA	10.0000	Check	2006-05-11 00:00:00+00	0
66	3	8	2006-05-24 00:00:00+00	2006-05-24 00:00:00+00	Lorianne O'Lynn	2 Commercial Road	Oklahoma City	OK	73152	USA	5.0000	Check	2006-05-24 00:00:00+00	0
67	4	10	2006-05-24 00:00:00+00	2006-05-24 00:00:00+00	Tessie Talks	29 Texas Road	Jacksonville	FL	32230	USA	9.0000	Credit Card	2006-05-24 00:00:00+00	3
68	1	7	2006-05-24 00:00:00+00	\N	Joni Dyott	7258 Heffernan Parkway	Indianapolis	IN	46247	USA	0.0000	\N	\N	0
69	1	10	2006-05-24 00:00:00+00	\N	Tessie Talks	29 Texas Road	Jacksonville	FL	32230	USA	0.0000	\N	\N	0
70	1	11	2006-05-24 00:00:00+00	\N	Rhody Fuzzens	7 Steensland Street	Myrtle Beach	SC	29579	USA	0.0000	\N	\N	0
71	1	1	2006-05-24 00:00:00+00	\N	Marga Gladhill	63202 Aberg Hill	Duluth	MN	55811	USA	0.0000	\N	\N	0
72	1	28	2006-06-07 00:00:00+00	2006-06-07 00:00:00+00	Sumner Mussington	336 Arapahoe Way	Sacramento	CA	94250	USA	40.0000	Credit Card	2006-06-07 00:00:00+00	3
73	7	9	2006-06-05 00:00:00+00	2006-06-05 00:00:00+00	Mendel Trew	442 Lukken Circle	Dayton	OH	45403	USA	100.0000	Check	2006-06-05 00:00:00+00	3
74	6	6	2006-06-08 00:00:00+00	2006-06-08 00:00:00+00	Emma Squirrel	86 Ridgeway Crossing	Largo	FL	34643	USA	300.0000	Credit Card	2006-06-08 00:00:00+00	3
75	4	8	2006-06-05 00:00:00+00	2006-06-05 00:00:00+00	Lorianne O'Lynn	2 Commercial Road	Oklahoma City	OK	73152	USA	50.0000	Check	2006-06-05 00:00:00+00	3
76	9	25	2006-06-05 00:00:00+00	2006-06-05 00:00:00+00	Alford Murden	59546 Wayridge Street	Sioux Falls	SD	57105	USA	5.0000	Cash	2006-06-05 00:00:00+00	3
77	9	26	2006-06-05 00:00:00+00	2006-06-05 00:00:00+00	Agata Basnett	1842 Mesta Lane	Louisville	KY	40210	USA	60.0000	Credit Card	2006-06-05 00:00:00+00	3
78	1	29	2006-06-05 00:00:00+00	2006-06-05 00:00:00+00	Belita Coulthard	49 Mayfield Pass	Indianapolis	IN	46295	USA	200.0000	Check	2006-06-05 00:00:00+00	3
79	2	6	2006-06-23 00:00:00+00	2006-06-23 00:00:00+00	Emma Squirrel	86 Ridgeway Crossing	Largo	FL	34643	USA	0.0000	Check	2006-06-23 00:00:00+00	3
80	2	4	2006-04-25 17:03:55+00	\N	Marnie Teece	9152 Lake View Trail	Springfield	MO	65805	USA	0.0000	\N	\N	0
81	2	3	2006-04-25 17:26:53+00	\N	Trixie Bellelli	17 Quincy Plaza	New Orleans	LA	70183	USA	0.0000	\N	\N	0
\.


--
-- Data for Name: orders_status; Type: TABLE DATA; Schema: miniwind; Owner: -
--

COPY miniwind.orders_status (id, status_name) FROM stdin;
0	New
1	Invoiced
2	Shipped
3	Closed
\.


--
-- Data for Name: products; Type: TABLE DATA; Schema: miniwind; Owner: -
--

COPY miniwind.products (supplier_ids, id, product_code, product_name, standard_cost, list_price, reorder_level, target_level, quantity_per_unit, minimum_reorder_quantity, category) FROM stdin;
4	1	NWTB-1	Northwind Traders Chai	13.5000	18.0000	10	40	10 boxes x 20 bags	10	Beverages
10	3	NWTCO-3	Northwind Traders Syrup	7.5000	10.0000	25	100	12 - 550 ml bottles	25	Condiments
10	4	NWTCO-4	Northwind Traders Cajun Seasoning	16.5000	22.0000	10	40	48 - 6 oz jars	10	Condiments
10	5	NWTO-5	Northwind Traders Olive Oil	16.0125	21.3500	10	40	36 boxes	10	Oil
2;6	6	NWTJP-6	Northwind Traders Boysenberry Spread	18.7500	25.0000	25	100	12 - 8 oz jars	25	Jams, Preserves
2	7	NWTDFN-7	Northwind Traders Dried Pears	22.5000	30.0000	10	40	12 - 1 lb pkgs.	10	Dried Fruit & Nuts
8	8	NWTS-8	Northwind Traders Curry Sauce	30.0000	40.0000	10	40	12 - 12 oz jars	10	Sauces
2;6	14	NWTDFN-14	Northwind Traders Walnuts	17.4375	23.2500	10	40	40 - 100 g pkgs.	10	Dried Fruit & Nuts
6	17	NWTCFV-17	Northwind Traders Fruit Cocktail	29.2500	39.0000	10	40	15.25 OZ	10	Canned Fruit & Vegetables
1	19	NWTBGM-19	Northwind Traders Chocolate Biscuits Mix	6.9000	9.2000	5	20	10 boxes x 12 pieces	5	Baked Goods & Mixes
2;6	20	NWTJP-6	Northwind Traders Marmalade	60.7500	81.0000	10	40	30 gift boxes	10	Jams, Preserves
1	21	NWTBGM-21	Northwind Traders Scones	7.5000	10.0000	5	20	24 pkgs. x 4 pieces	5	Baked Goods & Mixes
4	34	NWTB-34	Northwind Traders Beer	10.5000	14.0000	15	60	24 - 12 oz bottles	15	Beverages
7	40	NWTCM-40	Northwind Traders Crab Meat	13.8000	18.4000	30	120	24 - 4 oz tins	30	Canned Meat
6	41	NWTSO-41	Northwind Traders Clam Chowder	7.2375	9.6500	10	40	12 - 12 oz cans	10	Soups
3;4	43	NWTB-43	Northwind Traders Coffee	34.5000	46.0000	25	100	16 - 500 g tins	25	Beverages
10	48	NWTCA-48	Northwind Traders Chocolate	9.5625	12.7500	25	100	10 pkgs	25	Candy
2	51	NWTDFN-51	Northwind Traders Dried Apples	39.7500	53.0000	10	40	50 - 300 g pkgs.	10	Dried Fruit & Nuts
1	52	NWTG-52	Northwind Traders Long Grain Rice	5.2500	7.0000	25	100	16 - 2 kg boxes	25	Grains
1	56	NWTP-56	Northwind Traders Gnocchi	28.5000	38.0000	30	120	24 - 250 g pkgs.	30	Pasta
1	57	NWTP-57	Northwind Traders Ravioli	14.6250	19.5000	20	80	24 - 250 g pkgs.	20	Pasta
8	65	NWTS-65	Northwind Traders Hot Pepper Sauce	15.7875	21.0500	10	40	32 - 8 oz bottles	10	Sauces
8	66	NWTS-66	Northwind Traders Tomato Sauce	12.7500	17.0000	20	80	24 - 8 oz jars	20	Sauces
5	72	NWTD-72	Northwind Traders Mozzarella	26.1000	34.8000	10	40	24 - 200 g pkgs.	10	Dairy products
2;6	74	NWTDFN-74	Northwind Traders Almonds	7.5000	10.0000	5	20	5 kg pkg.	5	Dried Fruit & Nuts
10	77	NWTCO-77	Northwind Traders Mustard	9.7500	13.0000	15	60	12 boxes	15	Condiments
2	80	NWTDFN-80	Northwind Traders Dried Plums	3.0000	3.5000	50	75	1 lb bag	25	Dried Fruit & Nuts
3	81	NWTB-81	Northwind Traders Green Tea	2.0000	2.9900	100	125	20 bags per box	25	Beverages
1	82	NWTC-82	Northwind Traders Granola	2.0000	4.0000	20	100	\N	\N	Cereal
9	83	NWTCS-83	Northwind Traders Potato Chips	0.5000	1.8000	30	200	\N	\N	Chips, Snacks
1	85	NWTBGM-85	Northwind Traders Brownie Mix	9.0000	12.4900	10	20	3 boxes	5	Baked Goods & Mixes
1	86	NWTBGM-86	Northwind Traders Cake Mix	10.5000	15.9900	10	20	4 boxes	5	Baked Goods & Mixes
7	87	NWTB-87	Northwind Traders Tea	2.0000	4.0000	20	50	100 count per box	\N	Beverages
6	88	NWTCFV-88	Northwind Traders Pears	1.0000	1.3000	10	40	15.25 OZ	\N	Canned Fruit & Vegetables
6	89	NWTCFV-89	Northwind Traders Peaches	1.0000	1.5000	10	40	15.25 OZ	\N	Canned Fruit & Vegetables
6	90	NWTCFV-90	Northwind Traders Pineapple	1.0000	1.8000	10	40	15.25 OZ	\N	Canned Fruit & Vegetables
6	91	NWTCFV-91	Northwind Traders Cherry Pie Filling	1.0000	2.0000	10	40	15.25 OZ	\N	Canned Fruit & Vegetables
6	92	NWTCFV-92	Northwind Traders Green Beans	1.0000	1.2000	10	40	14.5 OZ	\N	Canned Fruit & Vegetables
6	93	NWTCFV-93	Northwind Traders Corn	1.0000	1.2000	10	40	14.5 OZ	\N	Canned Fruit & Vegetables
6	94	NWTCFV-94	Northwind Traders Peas	1.0000	1.5000	10	40	14.5 OZ	\N	Canned Fruit & Vegetables
7	95	NWTCM-95	Northwind Traders Tuna Fish	0.5000	2.0000	30	50	5 oz	\N	Canned Meat
7	96	NWTCM-96	Northwind Traders Smoked Salmon	2.0000	4.0000	30	50	5 oz	\N	Canned Meat
1	97	NWTC-82	Northwind Traders Hot Cereal	3.0000	5.0000	50	200	\N	\N	Cereal
6	98	NWTSO-98	Northwind Traders Vegetable Soup	1.0000	1.8900	100	200	\N	\N	Soups
6	99	NWTSO-99	Northwind Traders Chicken Soup	1.0000	1.9500	100	200	\N	\N	Soups
\.


--
-- Data for Name: suppliers; Type: TABLE DATA; Schema: miniwind; Owner: -
--

COPY miniwind.suppliers (id, company, last_name, first_name, email_address, job_title, mobile_phone, address, city, state_province, zip_postal_code, country_region, web_page, notes) FROM stdin;
1	Supplier A	Andersen	Elizabeth A.	\N	Sales Manager	\N	\N	\N	\N	\N	\N	\N	\N
2	Supplier B	Weiler	Cornelia	\N	Sales Manager	\N	\N	\N	\N	\N	\N	\N	\N
3	Supplier C	Kelley	Madeleine	\N	Sales Representative	\N	\N	\N	\N	\N	\N	\N	\N
4	Supplier D	Sato	Naoki	\N	Marketing Manager	\N	\N	\N	\N	\N	\N	\N	\N
5	Supplier E	Hernandez-Echevarria	Amaya	\N	Sales Manager	\N	\N	\N	\N	\N	\N	\N	\N
6	Supplier F	Hayakawa	Satomi	\N	Marketing Assistant	\N	\N	\N	\N	\N	\N	\N	\N
7	Supplier G	Glasson	Stuart	\N	Marketing Manager	\N	\N	\N	\N	\N	\N	\N	\N
8	Supplier H	Dunton	Bryn Paul	\N	Sales Representative	\N	\N	\N	\N	\N	\N	\N	\N
9	Supplier I	Sandberg	Mikael	\N	Sales Manager	\N	\N	\N	\N	\N	\N	\N	\N
10	Supplier J	Sousa	Luis	\N	Sales Manager	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- Name: customers_id_seq; Type: SEQUENCE SET; Schema: miniwind; Owner: -
--

SELECT pg_catalog.setval('miniwind.customers_id_seq', 29, true);


--
-- Name: employees_id_seq; Type: SEQUENCE SET; Schema: miniwind; Owner: -
--

SELECT pg_catalog.setval('miniwind.employees_id_seq', 9, true);


--
-- Name: invoices_id_seq; Type: SEQUENCE SET; Schema: miniwind; Owner: -
--

SELECT pg_catalog.setval('miniwind.invoices_id_seq', 39, true);


--
-- Name: order_details_id_seq; Type: SEQUENCE SET; Schema: miniwind; Owner: -
--

SELECT pg_catalog.setval('miniwind.order_details_id_seq', 91, true);


--
-- Name: orders_id_seq; Type: SEQUENCE SET; Schema: miniwind; Owner: -
--

SELECT pg_catalog.setval('miniwind.orders_id_seq', 81, true);


--
-- Name: products_id_seq; Type: SEQUENCE SET; Schema: miniwind; Owner: -
--

SELECT pg_catalog.setval('miniwind.products_id_seq', 99, true);


--
-- Name: suppliers_id_seq; Type: SEQUENCE SET; Schema: miniwind; Owner: -
--

SELECT pg_catalog.setval('miniwind.suppliers_id_seq', 10, true);


--
-- Name: customers idx_17311_primary; Type: CONSTRAINT; Schema: miniwind; Owner: -
--

ALTER TABLE ONLY miniwind.customers
    ADD CONSTRAINT idx_17311_primary PRIMARY KEY (id);


--
-- Name: employees idx_17330_primary; Type: CONSTRAINT; Schema: miniwind; Owner: -
--

ALTER TABLE ONLY miniwind.employees
    ADD CONSTRAINT idx_17330_primary PRIMARY KEY (id);


--
-- Name: invoices idx_17349_primary; Type: CONSTRAINT; Schema: miniwind; Owner: -
--

ALTER TABLE ONLY miniwind.invoices
    ADD CONSTRAINT idx_17349_primary PRIMARY KEY (id);


--
-- Name: orders idx_17358_primary; Type: CONSTRAINT; Schema: miniwind; Owner: -
--

ALTER TABLE ONLY miniwind.orders
    ADD CONSTRAINT idx_17358_primary PRIMARY KEY (id);


--
-- Name: orders_status idx_17373_primary; Type: CONSTRAINT; Schema: miniwind; Owner: -
--

ALTER TABLE ONLY miniwind.orders_status
    ADD CONSTRAINT idx_17373_primary PRIMARY KEY (id);


--
-- Name: order_details idx_17378_primary; Type: CONSTRAINT; Schema: miniwind; Owner: -
--

ALTER TABLE ONLY miniwind.order_details
    ADD CONSTRAINT idx_17378_primary PRIMARY KEY (id);


--
-- Name: order_details_status idx_17385_primary; Type: CONSTRAINT; Schema: miniwind; Owner: -
--

ALTER TABLE ONLY miniwind.order_details_status
    ADD CONSTRAINT idx_17385_primary PRIMARY KEY (id);


--
-- Name: products idx_17390_primary; Type: CONSTRAINT; Schema: miniwind; Owner: -
--

ALTER TABLE ONLY miniwind.products
    ADD CONSTRAINT idx_17390_primary PRIMARY KEY (id);


--
-- Name: suppliers idx_17405_primary; Type: CONSTRAINT; Schema: miniwind; Owner: -
--

ALTER TABLE ONLY miniwind.suppliers
    ADD CONSTRAINT idx_17405_primary PRIMARY KEY (id);


--
-- Name: idx_17311_city; Type: INDEX; Schema: miniwind; Owner: -
--

CREATE INDEX idx_17311_city ON miniwind.customers USING btree (city);


--
-- Name: idx_17311_company; Type: INDEX; Schema: miniwind; Owner: -
--

CREATE INDEX idx_17311_company ON miniwind.customers USING btree (company);


--
-- Name: idx_17311_first_name; Type: INDEX; Schema: miniwind; Owner: -
--

CREATE INDEX idx_17311_first_name ON miniwind.customers USING btree (first_name);


--
-- Name: idx_17311_last_name; Type: INDEX; Schema: miniwind; Owner: -
--

CREATE INDEX idx_17311_last_name ON miniwind.customers USING btree (last_name);


--
-- Name: idx_17311_state_province; Type: INDEX; Schema: miniwind; Owner: -
--

CREATE INDEX idx_17311_state_province ON miniwind.customers USING btree (state_province);


--
-- Name: idx_17311_zip_postal_code; Type: INDEX; Schema: miniwind; Owner: -
--

CREATE INDEX idx_17311_zip_postal_code ON miniwind.customers USING btree (zip_postal_code);


--
-- Name: idx_17330_city; Type: INDEX; Schema: miniwind; Owner: -
--

CREATE INDEX idx_17330_city ON miniwind.employees USING btree (city);


--
-- Name: idx_17330_first_name; Type: INDEX; Schema: miniwind; Owner: -
--

CREATE INDEX idx_17330_first_name ON miniwind.employees USING btree (first_name);


--
-- Name: idx_17330_last_name; Type: INDEX; Schema: miniwind; Owner: -
--

CREATE INDEX idx_17330_last_name ON miniwind.employees USING btree (last_name);


--
-- Name: idx_17330_state_province; Type: INDEX; Schema: miniwind; Owner: -
--

CREATE INDEX idx_17330_state_province ON miniwind.employees USING btree (state_province);


--
-- Name: idx_17330_zip_postal_code; Type: INDEX; Schema: miniwind; Owner: -
--

CREATE INDEX idx_17330_zip_postal_code ON miniwind.employees USING btree (zip_postal_code);


--
-- Name: idx_17349_fk_invoices_orders1_idx; Type: INDEX; Schema: miniwind; Owner: -
--

CREATE INDEX idx_17349_fk_invoices_orders1_idx ON miniwind.invoices USING btree (order_id);


--
-- Name: idx_17349_id; Type: INDEX; Schema: miniwind; Owner: -
--

CREATE INDEX idx_17349_id ON miniwind.invoices USING btree (id);


--
-- Name: idx_17358_customer_id; Type: INDEX; Schema: miniwind; Owner: -
--

CREATE INDEX idx_17358_customer_id ON miniwind.orders USING btree (customer_id);


--
-- Name: idx_17358_employee_id; Type: INDEX; Schema: miniwind; Owner: -
--

CREATE INDEX idx_17358_employee_id ON miniwind.orders USING btree (employee_id);


--
-- Name: idx_17358_fk_orders_orders_status1; Type: INDEX; Schema: miniwind; Owner: -
--

CREATE INDEX idx_17358_fk_orders_orders_status1 ON miniwind.orders USING btree (status_id);


--
-- Name: idx_17358_id; Type: INDEX; Schema: miniwind; Owner: -
--

CREATE INDEX idx_17358_id ON miniwind.orders USING btree (id);


--
-- Name: idx_17358_ship_zip_postal_code; Type: INDEX; Schema: miniwind; Owner: -
--

CREATE INDEX idx_17358_ship_zip_postal_code ON miniwind.orders USING btree (ship_zip_postal_code);


--
-- Name: idx_17378_fk_order_details_order_details_status1_idx; Type: INDEX; Schema: miniwind; Owner: -
--

CREATE INDEX idx_17378_fk_order_details_order_details_status1_idx ON miniwind.order_details USING btree (status_id);


--
-- Name: idx_17378_fk_order_details_orders1_idx; Type: INDEX; Schema: miniwind; Owner: -
--

CREATE INDEX idx_17378_fk_order_details_orders1_idx ON miniwind.order_details USING btree (order_id);


--
-- Name: idx_17378_id; Type: INDEX; Schema: miniwind; Owner: -
--

CREATE INDEX idx_17378_id ON miniwind.order_details USING btree (id);


--
-- Name: idx_17378_inventory_id; Type: INDEX; Schema: miniwind; Owner: -
--

CREATE INDEX idx_17378_inventory_id ON miniwind.order_details USING btree (inventory_id);


--
-- Name: idx_17378_product_id; Type: INDEX; Schema: miniwind; Owner: -
--

CREATE INDEX idx_17378_product_id ON miniwind.order_details USING btree (product_id);


--
-- Name: idx_17390_product_code; Type: INDEX; Schema: miniwind; Owner: -
--

CREATE INDEX idx_17390_product_code ON miniwind.products USING btree (product_code);


--
-- Name: idx_17405_city; Type: INDEX; Schema: miniwind; Owner: -
--

CREATE INDEX idx_17405_city ON miniwind.suppliers USING btree (city);


--
-- Name: idx_17405_company; Type: INDEX; Schema: miniwind; Owner: -
--

CREATE INDEX idx_17405_company ON miniwind.suppliers USING btree (company);


--
-- Name: idx_17405_first_name; Type: INDEX; Schema: miniwind; Owner: -
--

CREATE INDEX idx_17405_first_name ON miniwind.suppliers USING btree (first_name);


--
-- Name: idx_17405_last_name; Type: INDEX; Schema: miniwind; Owner: -
--

CREATE INDEX idx_17405_last_name ON miniwind.suppliers USING btree (last_name);


--
-- Name: idx_17405_state_province; Type: INDEX; Schema: miniwind; Owner: -
--

CREATE INDEX idx_17405_state_province ON miniwind.suppliers USING btree (state_province);


--
-- Name: idx_17405_zip_postal_code; Type: INDEX; Schema: miniwind; Owner: -
--

CREATE INDEX idx_17405_zip_postal_code ON miniwind.suppliers USING btree (zip_postal_code);


--
-- Name: invoices fk_invoices_orders1; Type: FK CONSTRAINT; Schema: miniwind; Owner: -
--

ALTER TABLE ONLY miniwind.invoices
    ADD CONSTRAINT fk_invoices_orders1 FOREIGN KEY (order_id) REFERENCES miniwind.orders(id);


--
-- Name: order_details fk_order_details_order_details_status1; Type: FK CONSTRAINT; Schema: miniwind; Owner: -
--

ALTER TABLE ONLY miniwind.order_details
    ADD CONSTRAINT fk_order_details_order_details_status1 FOREIGN KEY (status_id) REFERENCES miniwind.order_details_status(id);


--
-- Name: order_details fk_order_details_orders1; Type: FK CONSTRAINT; Schema: miniwind; Owner: -
--

ALTER TABLE ONLY miniwind.order_details
    ADD CONSTRAINT fk_order_details_orders1 FOREIGN KEY (order_id) REFERENCES miniwind.orders(id);


--
-- Name: order_details fk_order_details_products1; Type: FK CONSTRAINT; Schema: miniwind; Owner: -
--

ALTER TABLE ONLY miniwind.order_details
    ADD CONSTRAINT fk_order_details_products1 FOREIGN KEY (product_id) REFERENCES miniwind.products(id);


--
-- Name: orders fk_orders_customers; Type: FK CONSTRAINT; Schema: miniwind; Owner: -
--

ALTER TABLE ONLY miniwind.orders
    ADD CONSTRAINT fk_orders_customers FOREIGN KEY (customer_id) REFERENCES miniwind.customers(id);


--
-- Name: orders fk_orders_employees1; Type: FK CONSTRAINT; Schema: miniwind; Owner: -
--

ALTER TABLE ONLY miniwind.orders
    ADD CONSTRAINT fk_orders_employees1 FOREIGN KEY (employee_id) REFERENCES miniwind.employees(id);


--
-- Name: orders fk_orders_orders_status1; Type: FK CONSTRAINT; Schema: miniwind; Owner: -
--

ALTER TABLE ONLY miniwind.orders
    ADD CONSTRAINT fk_orders_orders_status1 FOREIGN KEY (status_id) REFERENCES miniwind.orders_status(id);


--
-- PostgreSQL database dump complete
--

