--
-- PostgreSQL database dump
--

-- Dumped from database version 11.5 (Ubuntu 11.5-3.pgdg19.04+1)
-- Dumped by pg_dump version 11.5 (Ubuntu 11.5-0ubuntu0.19.04.1)

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
-- Name: auth_group; Type: TABLE; Schema: public; Owner: ricardo
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO ricardo;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: ricardo
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO ricardo;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ricardo
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: ricardo
--

CREATE TABLE public.auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO ricardo;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: ricardo
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO ricardo;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ricardo
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: ricardo
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO ricardo;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: ricardo
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO ricardo;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ricardo
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: ricardo
--

CREATE TABLE public.auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE public.auth_user OWNER TO ricardo;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: ricardo
--

CREATE TABLE public.auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO ricardo;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: ricardo
--

CREATE SEQUENCE public.auth_user_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_groups_id_seq OWNER TO ricardo;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ricardo
--

ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: ricardo
--

CREATE SEQUENCE public.auth_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_id_seq OWNER TO ricardo;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ricardo
--

ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: ricardo
--

CREATE TABLE public.auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO ricardo;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: ricardo
--

CREATE SEQUENCE public.auth_user_user_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_user_permissions_id_seq OWNER TO ricardo;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ricardo
--

ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: ricardo
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO ricardo;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: ricardo
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO ricardo;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ricardo
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: ricardo
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO ricardo;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: ricardo
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO ricardo;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ricardo
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: ricardo
--

CREATE TABLE public.django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO ricardo;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: ricardo
--

CREATE SEQUENCE public.django_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO ricardo;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ricardo
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: ricardo
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO ricardo;

--
-- Name: orders_ordenes; Type: TABLE; Schema: public; Owner: ricardo
--

CREATE TABLE public.orders_ordenes (
    id_orden integer NOT NULL,
    fecha date NOT NULL,
    direccion character varying(150) NOT NULL,
    status character varying(50) NOT NULL,
    id_dueno_id integer NOT NULL
);


ALTER TABLE public.orders_ordenes OWNER TO ricardo;

--
-- Name: orders_ordenes_id_orden_seq; Type: SEQUENCE; Schema: public; Owner: ricardo
--

CREATE SEQUENCE public.orders_ordenes_id_orden_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.orders_ordenes_id_orden_seq OWNER TO ricardo;

--
-- Name: orders_ordenes_id_orden_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ricardo
--

ALTER SEQUENCE public.orders_ordenes_id_orden_seq OWNED BY public.orders_ordenes.id_orden;


--
-- Name: orders_pizza; Type: TABLE; Schema: public; Owner: ricardo
--

CREATE TABLE public.orders_pizza (
    id_pizza integer NOT NULL,
    num_toppings integer NOT NULL,
    id_subtipo_id integer NOT NULL
);


ALTER TABLE public.orders_pizza OWNER TO ricardo;

--
-- Name: orders_pizza_id_pizza_seq; Type: SEQUENCE; Schema: public; Owner: ricardo
--

CREATE SEQUENCE public.orders_pizza_id_pizza_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.orders_pizza_id_pizza_seq OWNER TO ricardo;

--
-- Name: orders_pizza_id_pizza_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ricardo
--

ALTER SEQUENCE public.orders_pizza_id_pizza_seq OWNED BY public.orders_pizza.id_pizza;


--
-- Name: orders_pizza_id_subtipo_id_seq; Type: SEQUENCE; Schema: public; Owner: ricardo
--

CREATE SEQUENCE public.orders_pizza_id_subtipo_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.orders_pizza_id_subtipo_id_seq OWNER TO ricardo;

--
-- Name: orders_pizza_id_subtipo_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ricardo
--

ALTER SEQUENCE public.orders_pizza_id_subtipo_id_seq OWNED BY public.orders_pizza.id_subtipo_id;


--
-- Name: orders_prod_orden; Type: TABLE; Schema: public; Owner: ricardo
--

CREATE TABLE public.orders_prod_orden (
    id_prod_creado integer NOT NULL,
    cantidad integer NOT NULL,
    "id_ordenIn_id" integer NOT NULL,
    "id_ptsWho_id" integer NOT NULL
);


ALTER TABLE public.orders_prod_orden OWNER TO ricardo;

--
-- Name: orders_prod_orden_id_prod_creado_seq; Type: SEQUENCE; Schema: public; Owner: ricardo
--

CREATE SEQUENCE public.orders_prod_orden_id_prod_creado_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.orders_prod_orden_id_prod_creado_seq OWNER TO ricardo;

--
-- Name: orders_prod_orden_id_prod_creado_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ricardo
--

ALTER SEQUENCE public.orders_prod_orden_id_prod_creado_seq OWNED BY public.orders_prod_orden.id_prod_creado;


--
-- Name: orders_prod_orden_topping; Type: TABLE; Schema: public; Owner: ricardo
--

CREATE TABLE public.orders_prod_orden_topping (
    id integer NOT NULL,
    prod_orden_id integer NOT NULL,
    toppings_id integer NOT NULL
);


ALTER TABLE public.orders_prod_orden_topping OWNER TO ricardo;

--
-- Name: orders_prod_orden_topping_id_seq; Type: SEQUENCE; Schema: public; Owner: ricardo
--

CREATE SEQUENCE public.orders_prod_orden_topping_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.orders_prod_orden_topping_id_seq OWNER TO ricardo;

--
-- Name: orders_prod_orden_topping_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ricardo
--

ALTER SEQUENCE public.orders_prod_orden_topping_id_seq OWNED BY public.orders_prod_orden_topping.id;


--
-- Name: orders_prod_tam_sub; Type: TABLE; Schema: public; Owner: ricardo
--

CREATE TABLE public.orders_prod_tam_sub (
    id_pts integer NOT NULL,
    precio numeric(10,2) NOT NULL,
    "id_productoPts_id" integer NOT NULL,
    "id_subtipoPts_id" integer NOT NULL,
    "id_tamanoPts_id" integer
);


ALTER TABLE public.orders_prod_tam_sub OWNER TO ricardo;

--
-- Name: orders_prod_tam_sub_id_pts_seq; Type: SEQUENCE; Schema: public; Owner: ricardo
--

CREATE SEQUENCE public.orders_prod_tam_sub_id_pts_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.orders_prod_tam_sub_id_pts_seq OWNER TO ricardo;

--
-- Name: orders_prod_tam_sub_id_pts_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ricardo
--

ALTER SEQUENCE public.orders_prod_tam_sub_id_pts_seq OWNED BY public.orders_prod_tam_sub.id_pts;


--
-- Name: orders_producto; Type: TABLE; Schema: public; Owner: ricardo
--

CREATE TABLE public.orders_producto (
    id_producto integer NOT NULL,
    tipo character varying(200) NOT NULL
);


ALTER TABLE public.orders_producto OWNER TO ricardo;

--
-- Name: orders_producto_id_producto_seq; Type: SEQUENCE; Schema: public; Owner: ricardo
--

CREATE SEQUENCE public.orders_producto_id_producto_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.orders_producto_id_producto_seq OWNER TO ricardo;

--
-- Name: orders_producto_id_producto_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ricardo
--

ALTER SEQUENCE public.orders_producto_id_producto_seq OWNED BY public.orders_producto.id_producto;


--
-- Name: orders_subtipo; Type: TABLE; Schema: public; Owner: ricardo
--

CREATE TABLE public.orders_subtipo (
    id_subtipo integer NOT NULL,
    nom_subtipo character varying(200) NOT NULL
);


ALTER TABLE public.orders_subtipo OWNER TO ricardo;

--
-- Name: orders_subtipo_id_subtipo_seq; Type: SEQUENCE; Schema: public; Owner: ricardo
--

CREATE SEQUENCE public.orders_subtipo_id_subtipo_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.orders_subtipo_id_subtipo_seq OWNER TO ricardo;

--
-- Name: orders_subtipo_id_subtipo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ricardo
--

ALTER SEQUENCE public.orders_subtipo_id_subtipo_seq OWNED BY public.orders_subtipo.id_subtipo;


--
-- Name: orders_tamano; Type: TABLE; Schema: public; Owner: ricardo
--

CREATE TABLE public.orders_tamano (
    id_tamano integer NOT NULL,
    nom_tamano character varying(100) NOT NULL
);


ALTER TABLE public.orders_tamano OWNER TO ricardo;

--
-- Name: orders_tamano_id_tamano_seq; Type: SEQUENCE; Schema: public; Owner: ricardo
--

CREATE SEQUENCE public.orders_tamano_id_tamano_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.orders_tamano_id_tamano_seq OWNER TO ricardo;

--
-- Name: orders_tamano_id_tamano_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ricardo
--

ALTER SEQUENCE public.orders_tamano_id_tamano_seq OWNED BY public.orders_tamano.id_tamano;


--
-- Name: orders_toppings; Type: TABLE; Schema: public; Owner: ricardo
--

CREATE TABLE public.orders_toppings (
    id_topping integer NOT NULL,
    topp_nombre character varying(150) NOT NULL
);


ALTER TABLE public.orders_toppings OWNER TO ricardo;

--
-- Name: orders_toppings_id_topping_seq; Type: SEQUENCE; Schema: public; Owner: ricardo
--

CREATE SEQUENCE public.orders_toppings_id_topping_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.orders_toppings_id_topping_seq OWNER TO ricardo;

--
-- Name: orders_toppings_id_topping_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ricardo
--

ALTER SEQUENCE public.orders_toppings_id_topping_seq OWNED BY public.orders_toppings.id_topping;


--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: ricardo
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: ricardo
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: ricardo
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: auth_user id; Type: DEFAULT; Schema: public; Owner: ricardo
--

ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);


--
-- Name: auth_user_groups id; Type: DEFAULT; Schema: public; Owner: ricardo
--

ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);


--
-- Name: auth_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: ricardo
--

ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: ricardo
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: ricardo
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: ricardo
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Name: orders_ordenes id_orden; Type: DEFAULT; Schema: public; Owner: ricardo
--

ALTER TABLE ONLY public.orders_ordenes ALTER COLUMN id_orden SET DEFAULT nextval('public.orders_ordenes_id_orden_seq'::regclass);


--
-- Name: orders_pizza id_pizza; Type: DEFAULT; Schema: public; Owner: ricardo
--

ALTER TABLE ONLY public.orders_pizza ALTER COLUMN id_pizza SET DEFAULT nextval('public.orders_pizza_id_pizza_seq'::regclass);


--
-- Name: orders_pizza id_subtipo_id; Type: DEFAULT; Schema: public; Owner: ricardo
--

ALTER TABLE ONLY public.orders_pizza ALTER COLUMN id_subtipo_id SET DEFAULT nextval('public.orders_pizza_id_subtipo_id_seq'::regclass);


--
-- Name: orders_prod_orden id_prod_creado; Type: DEFAULT; Schema: public; Owner: ricardo
--

ALTER TABLE ONLY public.orders_prod_orden ALTER COLUMN id_prod_creado SET DEFAULT nextval('public.orders_prod_orden_id_prod_creado_seq'::regclass);


--
-- Name: orders_prod_orden_topping id; Type: DEFAULT; Schema: public; Owner: ricardo
--

ALTER TABLE ONLY public.orders_prod_orden_topping ALTER COLUMN id SET DEFAULT nextval('public.orders_prod_orden_topping_id_seq'::regclass);


--
-- Name: orders_prod_tam_sub id_pts; Type: DEFAULT; Schema: public; Owner: ricardo
--

ALTER TABLE ONLY public.orders_prod_tam_sub ALTER COLUMN id_pts SET DEFAULT nextval('public.orders_prod_tam_sub_id_pts_seq'::regclass);


--
-- Name: orders_producto id_producto; Type: DEFAULT; Schema: public; Owner: ricardo
--

ALTER TABLE ONLY public.orders_producto ALTER COLUMN id_producto SET DEFAULT nextval('public.orders_producto_id_producto_seq'::regclass);


--
-- Name: orders_subtipo id_subtipo; Type: DEFAULT; Schema: public; Owner: ricardo
--

ALTER TABLE ONLY public.orders_subtipo ALTER COLUMN id_subtipo SET DEFAULT nextval('public.orders_subtipo_id_subtipo_seq'::regclass);


--
-- Name: orders_tamano id_tamano; Type: DEFAULT; Schema: public; Owner: ricardo
--

ALTER TABLE ONLY public.orders_tamano ALTER COLUMN id_tamano SET DEFAULT nextval('public.orders_tamano_id_tamano_seq'::regclass);


--
-- Name: orders_toppings id_topping; Type: DEFAULT; Schema: public; Owner: ricardo
--

ALTER TABLE ONLY public.orders_toppings ALTER COLUMN id_topping SET DEFAULT nextval('public.orders_toppings_id_topping_seq'::regclass);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: ricardo
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: ricardo
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: ricardo
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can view log entry	1	view_logentry
5	Can add permission	2	add_permission
6	Can change permission	2	change_permission
7	Can delete permission	2	delete_permission
8	Can view permission	2	view_permission
9	Can add group	3	add_group
10	Can change group	3	change_group
11	Can delete group	3	delete_group
12	Can view group	3	view_group
13	Can add user	4	add_user
14	Can change user	4	change_user
15	Can delete user	4	delete_user
16	Can view user	4	view_user
17	Can add content type	5	add_contenttype
18	Can change content type	5	change_contenttype
19	Can delete content type	5	delete_contenttype
20	Can view content type	5	view_contenttype
21	Can add session	6	add_session
22	Can change session	6	change_session
23	Can delete session	6	delete_session
24	Can view session	6	view_session
25	Can add prod_orden	7	add_prod_orden
26	Can change prod_orden	7	change_prod_orden
27	Can delete prod_orden	7	delete_prod_orden
28	Can view prod_orden	7	view_prod_orden
29	Can add ordenes	8	add_ordenes
30	Can change ordenes	8	change_ordenes
31	Can delete ordenes	8	delete_ordenes
32	Can view ordenes	8	view_ordenes
33	Can add toppings	9	add_toppings
34	Can change toppings	9	change_toppings
35	Can delete toppings	9	delete_toppings
36	Can view toppings	9	view_toppings
37	Can add pizza	10	add_pizza
38	Can change pizza	10	change_pizza
39	Can delete pizza	10	delete_pizza
40	Can view pizza	10	view_pizza
41	Can add prod_tam_sub	11	add_prod_tam_sub
42	Can change prod_tam_sub	11	change_prod_tam_sub
43	Can delete prod_tam_sub	11	delete_prod_tam_sub
44	Can view prod_tam_sub	11	view_prod_tam_sub
45	Can add producto	12	add_producto
46	Can change producto	12	change_producto
47	Can delete producto	12	delete_producto
48	Can view producto	12	view_producto
49	Can add tamano	13	add_tamano
50	Can change tamano	13	change_tamano
51	Can delete tamano	13	delete_tamano
52	Can view tamano	13	view_tamano
53	Can add subtipo	14	add_subtipo
54	Can change subtipo	14	change_subtipo
55	Can delete subtipo	14	delete_subtipo
56	Can view subtipo	14	view_subtipo
\.


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: ricardo
--

COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
1	pbkdf2_sha256$150000$SWxH037IsSb8$h+e9Bo/k7lY+yguroffgABGenZRPDDi6eutR5DZ3as0=	2019-11-17 15:33:16.099175-05	t	ricardo			richago29@gmail.com	t	t	2019-11-17 15:33:06.132318-05
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: ricardo
--

COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: ricardo
--

COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: ricardo
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2019-11-17 15:50:03.767627-05	4	ricardo 2019-11-17 4ricardo	1	[{"added": {}}]	8	1
2	2019-11-17 15:50:52.599579-05	1	1 regular	1	[{"added": {}}]	14	1
3	2019-11-17 15:51:02.51651-05	2	2 siciliana	1	[{"added": {}}]	14	1
4	2019-11-17 15:51:43.323359-05	1	1 regular 1	1	[{"added": {}}]	10	1
5	2019-11-17 16:09:43.585649-05	1	id: 1 nombre: Peperonni	1	[{"added": {}}]	9	1
6	2019-11-17 16:10:02.920603-05	2	id: 2 nombre: Chesse	1	[{"added": {}}]	9	1
7	2019-11-17 16:21:44.504434-05	1	id: 1 nombre: small	1	[{"added": {}}]	13	1
8	2019-11-17 16:21:49.427898-05	2	id: 2 nombre: large	1	[{"added": {}}]	13	1
9	2019-11-17 16:22:07.987866-05	3	id: 3 nombre: Soda can	1	[{"added": {}}]	13	1
10	2019-11-17 16:22:16.872312-05	4	id: 4 nombre: Soda tap	1	[{"added": {}}]	13	1
11	2019-11-17 16:22:25.433188-05	5	id: 5 nombre: Soda bottle	1	[{"added": {}}]	13	1
12	2019-11-17 16:23:38.44092-05	1	id: 1 tipo:Pizza	1	[{"added": {}}]	12	1
13	2019-11-17 16:23:43.882673-05	2	id: 2 tipo:Sub	1	[{"added": {}}]	12	1
14	2019-11-17 16:23:51.507401-05	3	id: 3 tipo:Pasta	1	[{"added": {}}]	12	1
15	2019-11-17 16:23:58.683763-05	4	id: 4 tipo:Salad	1	[{"added": {}}]	12	1
16	2019-11-17 16:24:12.001958-05	5	id: 5 tipo:Dinner Plattes	1	[{"added": {}}]	12	1
17	2019-11-17 16:24:16.428137-05	6	id: 6 tipo:Drinks	1	[{"added": {}}]	12	1
18	2019-11-17 16:25:57.578161-05	2	id: 2 nombre:siciliana	3		14	1
19	2019-11-17 16:25:57.58473-05	1	id: 1 nombre:regular	3		14	1
20	2019-11-17 16:26:28.451057-05	3	id: 3 nombre:regular 0 toppings	1	[{"added": {}}]	14	1
21	2019-11-17 16:26:33.218764-05	4	id: 4 nombre:regular 1 toppings	1	[{"added": {}}]	14	1
22	2019-11-17 16:26:56.175615-05	5	id: 5 nombre:regular 2 toppings	1	[{"added": {}}]	14	1
23	2019-11-17 16:27:02.719256-05	6	id: 6 nombre:regular 3 toppings	1	[{"added": {}}]	14	1
24	2019-11-17 16:27:17.90752-05	7	id: 7 nombre:Pizza special 5 toppings	1	[{"added": {}}]	14	1
25	2019-11-17 16:27:28.514292-05	8	id: 8 nombre:siciliana 0 toppings	1	[{"added": {}}]	14	1
26	2019-11-17 16:27:34.28253-05	9	id: 9 nombre:siciliana 1 toppings	1	[{"added": {}}]	14	1
27	2019-11-17 16:27:39.691472-05	10	id: 10 nombre:siciliana 2 toppings	1	[{"added": {}}]	14	1
28	2019-11-17 16:27:45.8458-05	11	id: 11 nombre:siciliana 3 toppings	1	[{"added": {}}]	14	1
29	2019-11-17 16:28:53.983416-05	12	id: 12 nombre:Sub cheese	1	[{"added": {}}]	14	1
30	2019-11-17 16:29:00.852068-05	13	id: 13 nombre:sub Italian	1	[{"added": {}}]	14	1
31	2019-11-17 16:29:08.137125-05	14	id: 14 nombre:sub Ham+chesse	1	[{"added": {}}]	14	1
32	2019-11-17 16:29:20.248354-05	15	id: 15 nombre:sub meatball	1	[{"added": {}}]	14	1
33	2019-11-17 16:29:26.673819-05	16	id: 16 nombre:sub tuna	1	[{"added": {}}]	14	1
34	2019-11-17 16:29:35.438556-05	17	id: 17 nombre:sub turkey + cheese	1	[{"added": {}}]	14	1
35	2019-11-17 16:29:52.097956-05	18	id: 18 nombre:sub chicken parmigiana	1	[{"added": {}}]	14	1
36	2019-11-17 16:29:57.74824-05	19	id: 19 nombre:sub roastbeef	1	[{"added": {}}]	14	1
37	2019-11-17 16:30:11.465211-05	20	id: 20 nombre:sub eggplant parmigiana	1	[{"added": {}}]	14	1
38	2019-11-17 16:30:22.266507-05	21	id: 21 nombre:sub steak	1	[{"added": {}}]	14	1
39	2019-11-17 16:30:29.8781-05	22	id: 22 nombre:sub steak + chesse	1	[{"added": {}}]	14	1
40	2019-11-17 16:30:40.598097-05	23	id: 23 nombre:sub steak + mushrooms	1	[{"added": {}}]	14	1
41	2019-11-17 16:30:58.849047-05	24	id: 24 nombre:sub steak + green peppers	1	[{"added": {}}]	14	1
42	2019-11-17 16:31:08.858904-05	25	id: 25 nombre:sub steak + onions	1	[{"added": {}}]	14	1
43	2019-11-17 16:31:26.696199-05	26	id: 26 nombre:sub sausage, peppers + onions	1	[{"added": {}}]	14	1
44	2019-11-17 16:31:36.400194-05	27	id: 27 nombre:sub hamburguer	1	[{"added": {}}]	14	1
45	2019-11-17 16:31:48.327589-05	28	id: 28 nombre:sub cheeseburguer	1	[{"added": {}}]	14	1
46	2019-11-17 16:31:55.661839-05	29	id: 29 nombre:sub fried Chicken	1	[{"added": {}}]	14	1
47	2019-11-17 16:32:01.904542-05	30	id: 30 nombre:sub Veggie	1	[{"added": {}}]	14	1
48	2019-11-17 16:32:40.342665-05	31	id: 31 nombre:sub addon of extra cheese	1	[{"added": {}}]	14	1
49	2019-11-17 16:33:40.69519-05	32	id: 32 nombre:pasta baked zitti mozarella	1	[{"added": {}}]	14	1
50	2019-11-17 16:33:49.447582-05	33	id: 33 nombre:pasta baked zitti meatballs	1	[{"added": {}}]	14	1
51	2019-11-17 16:33:57.510827-05	34	id: 34 nombre:pasta baked zitti chicken	1	[{"added": {}}]	14	1
52	2019-11-17 16:34:19.943306-05	35	id: 35 nombre:garden salad	1	[{"added": {}}]	14	1
53	2019-11-17 16:34:24.401026-05	36	id: 36 nombre:greek salad	1	[{"added": {}}]	14	1
54	2019-11-17 16:34:30.26172-05	37	id: 37 nombre:antipasto salad	1	[{"added": {}}]	14	1
55	2019-11-17 16:34:37.951335-05	38	id: 38 nombre:salad Tuna	1	[{"added": {}}]	14	1
56	2019-11-17 16:34:44.169755-05	39	id: 39 nombre:salad chicken	1	[{"added": {}}]	14	1
57	2019-11-17 16:35:05.701544-05	40	id: 40 nombre:dinnerplater garden salad	1	[{"added": {}}]	14	1
58	2019-11-17 16:35:12.86378-05	41	id: 41 nombre:dinnerplater greek salad	1	[{"added": {}}]	14	1
59	2019-11-17 16:35:18.759244-05	42	id: 42 nombre:dinnerplater antipasto	1	[{"added": {}}]	14	1
60	2019-11-17 16:35:31.742161-05	43	id: 43 nombre:dinnerplater baked ziti	1	[{"added": {}}]	14	1
61	2019-11-17 16:35:45.740057-05	44	id: 44 nombre:dinnerplater baked ziti with meatballs	1	[{"added": {}}]	14	1
62	2019-11-17 16:36:00.73519-05	45	id: 45 nombre:dinnerplater baked zitti with chicken	1	[{"added": {}}]	14	1
63	2019-11-17 16:36:36.561826-05	46	id: 46 nombre:chip and cookies	1	[{"added": {}}]	14	1
64	2019-11-17 16:37:46.459209-05	2	id: 2 nombre: Chesse	3		9	1
65	2019-11-17 16:38:39.127249-05	3	id: 3 nombre: green peppers	1	[{"added": {}}]	9	1
66	2019-11-17 16:38:45.262403-05	4	id: 4 nombre: sausage	1	[{"added": {}}]	9	1
67	2019-11-17 16:38:52.432207-05	5	id: 5 nombre: ham	1	[{"added": {}}]	9	1
68	2019-11-17 16:39:32.981309-05	6	id: 6 nombre: zucchini	1	[{"added": {}}]	9	1
69	2019-11-17 16:39:39.677414-05	7	id: 7 nombre: canadian bacon	1	[{"added": {}}]	9	1
70	2019-11-17 17:01:18.160189-05	8	id: 8 nombre: Eggplant	1	[{"added": {}}]	9	1
71	2019-11-17 17:01:27.990472-05	9	id: 9 nombre: Tomato + Basil	1	[{"added": {}}]	9	1
72	2019-11-17 17:01:35.500485-05	10	id: 10 nombre: Mushroom	1	[{"added": {}}]	9	1
73	2019-11-17 17:01:40.380566-05	11	id: 11 nombre: Onions	1	[{"added": {}}]	9	1
74	2019-11-17 17:01:52.842426-05	12	id: 12 nombre: Hamburguer	1	[{"added": {}}]	9	1
75	2019-11-17 17:01:58.791584-05	13	id: 13 nombre: spinach	1	[{"added": {}}]	9	1
76	2019-11-17 17:02:07.06886-05	14	id: 14 nombre: artichoke	1	[{"added": {}}]	9	1
77	2019-11-17 17:02:15.617539-05	15	id: 15 nombre: anchovies	1	[{"added": {}}]	9	1
78	2019-11-17 17:02:22.835562-05	16	id: 16 nombre: black olive	1	[{"added": {}}]	9	1
79	2019-11-17 17:02:33.126906-05	17	id: 17 nombre: fresh garlic	1	[{"added": {}}]	9	1
80	2019-11-17 17:02:39.386886-05	18	id: 18 nombre: meatball	1	[{"added": {}}]	9	1
81	2019-11-17 17:03:31.094267-05	0	id_subtipo: id: 3 nombre:regular 0 toppings num_toppings: 0	1	[{"added": {}}]	10	1
82	2019-11-17 17:03:36.492522-05	1	id_subtipo: id: 4 nombre:regular 1 toppings num_toppings: 1	1	[{"added": {}}]	10	1
83	2019-11-17 17:03:41.33628-05	2	id_subtipo: id: 5 nombre:regular 2 toppings num_toppings: 2	1	[{"added": {}}]	10	1
84	2019-11-17 17:03:46.258174-05	3	id_subtipo: id: 6 nombre:regular 3 toppings num_toppings: 3	1	[{"added": {}}]	10	1
85	2019-11-17 17:03:51.703143-05	5	id_subtipo: id: 7 nombre:Pizza special 5 toppings num_toppings: 5	1	[{"added": {}}]	10	1
86	2019-11-17 17:54:00.527639-05	3	id_subtipo: id: 3 nombre:regular 0 toppings num_toppings: 0	1	[{"added": {}}]	10	1
87	2019-11-17 17:54:07.020707-05	4	id_subtipo: id: 3 nombre:regular 0 toppings num_toppings: 0	1	[{"added": {}}]	10	1
88	2019-11-17 17:56:10.457703-05	4	id_subtipo: id: 3 nombre:regular 0 toppings num_toppings: 0	3		10	1
89	2019-11-17 17:56:10.465194-05	3	id_subtipo: id: 3 nombre:regular 0 toppings num_toppings: 0	3		10	1
90	2019-11-17 17:56:10.468098-05	2	id_subtipo: id: 3 nombre:regular 0 toppings num_toppings: 0	3		10	1
91	2019-11-17 17:56:21.424666-05	5	id_subtipo: id: 3 nombre:regular 0 toppings num_toppings: 0	1	[{"added": {}}]	10	1
92	2019-11-17 17:56:44.764762-05	6	id_subtipo: id: 4 nombre:regular 1 toppings num_toppings: 1	1	[{"added": {}}]	10	1
93	2019-11-17 17:56:50.910843-05	7	id_subtipo: id: 5 nombre:regular 2 toppings num_toppings: 2	1	[{"added": {}}]	10	1
94	2019-11-17 17:56:55.988488-05	8	id_subtipo: id: 6 nombre:regular 3 toppings num_toppings: 3	1	[{"added": {}}]	10	1
95	2019-11-17 17:57:02.801977-05	9	id_subtipo: id: 7 nombre:Pizza special 5 toppings num_toppings: 5	1	[{"added": {}}]	10	1
96	2019-11-17 17:57:09.281498-05	10	id_subtipo: id: 8 nombre:siciliana 0 toppings num_toppings: 0	1	[{"added": {}}]	10	1
97	2019-11-17 17:57:15.012168-05	11	id_subtipo: id: 9 nombre:siciliana 1 toppings num_toppings: 1	1	[{"added": {}}]	10	1
98	2019-11-17 17:57:22.819786-05	12	id_subtipo: id: 10 nombre:siciliana 2 toppings num_toppings: 2	1	[{"added": {}}]	10	1
99	2019-11-17 17:57:30.400542-05	13	id_subtipo: id: 11 nombre:siciliana 3 toppings num_toppings: 3	1	[{"added": {}}]	10	1
100	2019-11-17 19:30:44.766567-05	1	id_pts:1 id_subtipo: id: 3 nombre:regular 0 toppings id_prodPts: id: 1 tipo:Pizza id_tamano: id: 1 nombre: small precio: 8.35	1	[{"added": {}}]	11	1
101	2019-11-17 19:30:59.514528-05	2	id_pts:2 id_subtipo: id: 3 nombre:regular 0 toppings id_prodPts: id: 1 tipo:Pizza id_tamano: id: 2 nombre: large precio: 13.75	1	[{"added": {}}]	11	1
102	2019-11-17 19:51:43.700972-05	3	regular 1 toppings Pizza small 9.50	1	[{"added": {}}]	11	1
103	2019-11-17 19:51:55.083551-05	4	regular 1 toppings Pizza large 15.75	1	[{"added": {}}]	11	1
104	2019-11-17 19:52:10.002632-05	5	regular 2 toppings Pizza small 10.50	1	[{"added": {}}]	11	1
105	2019-11-17 19:52:20.24348-05	6	regular 2 toppings Pizza large 17.75	1	[{"added": {}}]	11	1
106	2019-11-17 19:52:30.21812-05	7	regular 3 toppings Pizza small 11.70	1	[{"added": {}}]	11	1
107	2019-11-17 19:52:40.639216-05	8	regular 3 toppings Pizza large 19.75	1	[{"added": {}}]	11	1
108	2019-11-17 19:52:51.476113-05	9	Pizza special 5 toppings Pizza small 14.75	1	[{"added": {}}]	11	1
109	2019-11-17 19:53:07.844955-05	10	Pizza special 5 toppings Pizza large 20.95	1	[{"added": {}}]	11	1
110	2019-11-17 19:53:49.824391-05	11	siciliana 0 toppings Pizza small 16.75	1	[{"added": {}}]	11	1
111	2019-11-17 19:54:04.213449-05	12	siciliana 0 toppings Pizza large 26.50	1	[{"added": {}}]	11	1
112	2019-11-17 19:57:42.791506-05	13	siciliana 1 toppings Pizza small 18.75	1	[{"added": {}}]	11	1
113	2019-11-17 19:57:55.982125-05	14	siciliana 1 toppings Pizza large 28.50	1	[{"added": {}}]	11	1
114	2019-11-17 19:58:09.806585-05	15	siciliana 2 toppings Pizza small 19.75	1	[{"added": {}}]	11	1
115	2019-11-17 19:58:44.119353-05	16	siciliana 2 toppings Pizza large 30.50	1	[{"added": {}}]	11	1
116	2019-11-17 19:59:03.655867-05	17	siciliana 3 toppings Pizza small 20.75	1	[{"added": {}}]	11	1
117	2019-11-17 19:59:20.571445-05	18	siciliana 3 toppings Pizza large 31.50	1	[{"added": {}}]	11	1
118	2019-11-17 20:00:04.987997-05	47	Pizza special 5 toppings sicilian	1	[{"added": {}}]	14	1
119	2019-11-17 20:00:33.078851-05	19	Pizza special 5 toppings sicilian Pizza small 21.75	1	[{"added": {}}]	11	1
120	2019-11-17 20:00:46.495621-05	20	Pizza special 5 toppings sicilian Pizza large 33.50	1	[{"added": {}}]	11	1
121	2019-11-17 20:01:08.744105-05	21	Sub cheese Sub small 4.50	1	[{"added": {}}]	11	1
122	2019-11-17 20:01:25.217018-05	22	Sub cheese Sub large 5.60	1	[{"added": {}}]	11	1
123	2019-11-17 20:01:43.505931-05	23	sub Italian Sub small 4.95	1	[{"added": {}}]	11	1
124	2019-11-17 20:01:58.989832-05	24	sub Italian Pizza large 6.00	1	[{"added": {}}]	11	1
125	2019-11-17 20:02:16.924206-05	25	sub Ham+chesse Sub small 4.95	1	[{"added": {}}]	11	1
126	2019-11-17 20:02:26.700004-05	26	sub Ham+chesse Sub large 6.00	1	[{"added": {}}]	11	1
127	2019-11-17 20:02:37.61912-05	27	sub meatball Sub small 4.95	1	[{"added": {}}]	11	1
128	2019-11-17 20:02:47.367381-05	28	sub meatball Sub large 6.00	1	[{"added": {}}]	11	1
129	2019-11-17 20:03:04.908338-05	29	sub tuna Sub small 4.95	1	[{"added": {}}]	11	1
130	2019-11-17 20:03:18.26612-05	30	sub tuna Sub large 6.00	1	[{"added": {}}]	11	1
131	2019-11-17 20:05:00.794383-05	31	sub turkey + cheese Sub small 5.75	1	[{"added": {}}]	11	1
132	2019-11-17 20:05:11.909616-05	32	sub turkey + cheese Sub large 6.75	1	[{"added": {}}]	11	1
133	2019-11-17 20:05:29.096041-05	33	sub chicken parmigiana Sub small 5.75	1	[{"added": {}}]	11	1
134	2019-11-17 20:05:37.58012-05	34	sub chicken parmigiana Sub large 6.75	1	[{"added": {}}]	11	1
135	2019-11-17 20:05:59.933329-05	35	sub roastbeef Sub small 5.75	1	[{"added": {}}]	11	1
136	2019-11-17 20:06:09.043065-05	36	sub roastbeef Sub large 6.75	1	[{"added": {}}]	11	1
137	2019-11-17 20:06:27.495354-05	37	sub eggplant parmigiana Sub small 5.25	1	[{"added": {}}]	11	1
138	2019-11-17 20:06:37.337224-05	38	sub eggplant parmigiana Sub large 6.00	1	[{"added": {}}]	11	1
139	2019-11-17 20:06:50.170013-05	39	sub steak Sub small 5.25	1	[{"added": {}}]	11	1
140	2019-11-17 20:07:01.612238-05	40	sub steak Sub large 6.25	1	[{"added": {}}]	11	1
141	2019-11-17 20:07:37.311569-05	41	sub steak + chesse Sub small 5.75	1	[{"added": {}}]	11	1
142	2019-11-17 20:07:48.151736-05	42	sub steak + chesse Sub large 6.75	1	[{"added": {}}]	11	1
143	2019-11-17 20:09:15.264344-05	23	sub steak + chesse + mushrooms	2	[{"changed": {"fields": ["nom_subtipo"]}}]	14	1
144	2019-11-17 20:09:37.210859-05	24	sub steak + cheese + green peppers	2	[{"changed": {"fields": ["nom_subtipo"]}}]	14	1
145	2019-11-17 20:09:58.587683-05	25	sub steak + chesse + onions	2	[{"changed": {"fields": ["nom_subtipo"]}}]	14	1
146	2019-11-17 20:10:37.582341-05	43	sub steak + chesse + mushrooms Sub small 6.25	1	[{"added": {}}]	11	1
147	2019-11-17 20:10:53.374579-05	44	sub steak + chesse + mushrooms Sub large 7.25	1	[{"added": {}}]	11	1
148	2019-11-17 20:16:09.191277-05	45	sub steak + cheese + green peppers Sub small 5.75	1	[{"added": {}}]	11	1
149	2019-11-17 20:16:24.984345-05	46	sub steak + cheese + green peppers Sub large 6.75	1	[{"added": {}}]	11	1
150	2019-11-17 20:18:33.959016-05	47	sub steak + chesse + onions Sub small 5.75	1	[{"added": {}}]	11	1
151	2019-11-17 20:19:48.300119-05	48	sub steak + chesse + onions Sub large 6.25	1	[{"added": {}}]	11	1
152	2019-11-17 20:20:07.893138-05	49	sub sausage, peppers + onions Sub large 6.75	1	[{"added": {}}]	11	1
153	2019-11-17 20:20:23.71655-05	50	sub hamburguer Sub small 3.95	1	[{"added": {}}]	11	1
154	2019-11-17 20:20:44.037323-05	51	sub hamburguer Sub large 5.50	1	[{"added": {}}]	11	1
155	2019-11-17 20:21:04.374857-05	52	sub cheeseburguer Sub small 4.50	1	[{"added": {}}]	11	1
156	2019-11-17 20:21:15.314845-05	53	sub cheeseburguer Sub large 6.00	1	[{"added": {}}]	11	1
157	2019-11-17 20:21:26.206446-05	54	sub fried Chicken Sub small 5.95	1	[{"added": {}}]	11	1
158	2019-11-17 20:21:58.968297-05	55	sub fried Chicken Sub large 6.95	1	[{"added": {}}]	11	1
159	2019-11-17 20:22:14.417001-05	56	sub Veggie Sub small 5.75	1	[{"added": {}}]	11	1
160	2019-11-17 20:22:32.963157-05	57	sub Veggie Sub large 6.75	1	[{"added": {}}]	11	1
161	2019-11-17 20:28:09.790652-05	58	sub addon of extra cheese Sub None 0.50	1	[{"added": {}}]	11	1
162	2019-11-17 20:29:36.801281-05	59	dinnerplater garden salad Dinner Plattes small 35.00	1	[{"added": {}}]	11	1
163	2019-11-17 20:29:52.334441-05	60	dinnerplater garden salad Dinner Plattes large 60.00	1	[{"added": {}}]	11	1
164	2019-11-17 20:30:08.743523-05	61	dinnerplater greek salad Dinner Plattes small 45.00	1	[{"added": {}}]	11	1
165	2019-11-17 20:30:23.902257-05	62	dinnerplater greek salad Dinner Plattes large 70.00	1	[{"added": {}}]	11	1
166	2019-11-17 20:30:44.796455-05	63	dinnerplater antipasto Dinner Plattes small 45.00	1	[{"added": {}}]	11	1
167	2019-11-17 20:31:03.171982-05	64	dinnerplater antipasto Dinner Plattes large 70.00	1	[{"added": {}}]	11	1
168	2019-11-17 20:31:21.272341-05	65	dinnerplater baked ziti Dinner Plattes small 35.00	1	[{"added": {}}]	11	1
169	2019-11-17 20:31:35.843784-05	66	dinnerplater baked ziti Dinner Plattes large 60.00	1	[{"added": {}}]	11	1
170	2019-11-17 20:32:11.554569-05	67	dinnerplater baked ziti with meatballs Dinner Plattes small 45.00	1	[{"added": {}}]	11	1
171	2019-11-17 20:32:29.314808-05	68	dinnerplater baked ziti with meatballs Dinner Plattes large 70.00	1	[{"added": {}}]	11	1
172	2019-11-17 20:32:41.101884-05	69	dinnerplater baked zitti with chicken Dinner Plattes small 45.00	1	[{"added": {}}]	11	1
173	2019-11-17 20:32:52.011668-05	70	dinnerplater baked zitti with chicken Dinner Plattes large 80.00	1	[{"added": {}}]	11	1
174	2019-11-17 20:33:24.365122-05	71	pasta baked zitti mozarella Pasta None 6.50	1	[{"added": {}}]	11	1
175	2019-11-17 20:33:49.350018-05	72	pasta baked zitti meatballs Pasta None 8.75	1	[{"added": {}}]	11	1
176	2019-11-17 20:34:10.180687-05	73	pasta baked zitti chicken Pasta None 9.75	1	[{"added": {}}]	11	1
177	2019-11-17 20:34:40.318826-05	74	salad Tuna Salad None 8.25	1	[{"added": {}}]	11	1
178	2019-11-17 20:35:24.685572-05	75	salad chicken Salad None 6.75	1	[{"added": {}}]	11	1
179	2019-11-17 20:35:56.97576-05	76	garden salad Salad None 4.95	1	[{"added": {}}]	11	1
180	2019-11-17 20:36:12.2755-05	77	greek salad Salad None 6.25	1	[{"added": {}}]	11	1
181	2019-11-17 20:36:27.181548-05	78	antipasto salad Salad None 6.25	1	[{"added": {}}]	11	1
182	2019-11-17 20:37:14.363647-05	7	addons	1	[{"added": {}}]	12	1
183	2019-11-17 20:37:42.422715-05	79	chip and cookies addons None 0.90	1	[{"added": {}}]	11	1
184	2019-11-17 20:38:39.720446-05	48	Drink	1	[{"added": {}}]	14	1
185	2019-11-17 20:39:14.243687-05	80	Drink Drinks Soda can 1.50	1	[{"added": {}}]	11	1
186	2019-11-17 20:39:38.25297-05	81	Drink Drinks Soda tap 1.75	1	[{"added": {}}]	11	1
187	2019-11-17 20:39:52.600235-05	82	Drink Drinks Soda bottle 1.65	1	[{"added": {}}]	11	1
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: ricardo
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	auth	user
5	contenttypes	contenttype
6	sessions	session
7	orders	prod_orden
8	orders	ordenes
9	orders	toppings
10	orders	pizza
11	orders	prod_tam_sub
12	orders	producto
13	orders	tamano
14	orders	subtipo
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: ricardo
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2019-11-16 20:31:45.723846-05
2	auth	0001_initial	2019-11-16 20:31:45.806653-05
3	admin	0001_initial	2019-11-16 20:31:45.907345-05
4	admin	0002_logentry_remove_auto_add	2019-11-16 20:31:45.9587-05
5	admin	0003_logentry_add_action_flag_choices	2019-11-16 20:31:46.006706-05
6	contenttypes	0002_remove_content_type_name	2019-11-16 20:31:46.052944-05
7	auth	0002_alter_permission_name_max_length	2019-11-16 20:31:46.066106-05
8	auth	0003_alter_user_email_max_length	2019-11-16 20:31:46.086888-05
9	auth	0004_alter_user_username_opts	2019-11-16 20:31:46.112553-05
10	auth	0005_alter_user_last_login_null	2019-11-16 20:31:46.129816-05
11	auth	0006_require_contenttypes_0002	2019-11-16 20:31:46.133393-05
12	auth	0007_alter_validators_add_error_messages	2019-11-16 20:31:46.151803-05
13	auth	0008_alter_user_username_max_length	2019-11-16 20:31:46.191239-05
14	auth	0009_alter_user_last_name_max_length	2019-11-16 20:31:46.212631-05
15	auth	0010_alter_group_name_max_length	2019-11-16 20:31:46.235391-05
16	auth	0011_update_proxy_permissions	2019-11-16 20:31:46.25663-05
17	sessions	0001_initial	2019-11-16 20:31:46.271111-05
18	orders	0001_initial	2019-11-17 14:40:51.662883-05
21	orders	0002_auto_20191117_2024	2019-11-17 15:24:32.44005-05
22	orders	0003_auto_20191118_0123	2019-11-17 20:24:06.242808-05
23	orders	0004_auto_20191118_0127	2019-11-17 20:27:42.626256-05
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: ricardo
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
kq2dbw9tb1xrr3usic2mhl308ne24jzr	MGViYWRhZDZkM2FjMGNmYWY3Y2U1MjIyYTdlZDViNzdlMTMzY2NlNzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4YzBkNTIzYzFlZDczMzRjMjA3YjZiYWViZGExMjJiMjliMjE4ZTc4In0=	2019-12-01 15:33:16.108271-05
\.


--
-- Data for Name: orders_ordenes; Type: TABLE DATA; Schema: public; Owner: ricardo
--

COPY public.orders_ordenes (id_orden, fecha, direccion, status, id_dueno_id) FROM stdin;
4	2019-11-17	calle 14	activa	1
\.


--
-- Data for Name: orders_pizza; Type: TABLE DATA; Schema: public; Owner: ricardo
--

COPY public.orders_pizza (id_pizza, num_toppings, id_subtipo_id) FROM stdin;
5	0	3
6	1	4
7	2	5
8	3	6
9	5	7
10	0	8
11	1	9
12	2	10
13	3	11
\.


--
-- Data for Name: orders_prod_orden; Type: TABLE DATA; Schema: public; Owner: ricardo
--

COPY public.orders_prod_orden (id_prod_creado, cantidad, "id_ordenIn_id", "id_ptsWho_id") FROM stdin;
\.


--
-- Data for Name: orders_prod_orden_topping; Type: TABLE DATA; Schema: public; Owner: ricardo
--

COPY public.orders_prod_orden_topping (id, prod_orden_id, toppings_id) FROM stdin;
\.


--
-- Data for Name: orders_prod_tam_sub; Type: TABLE DATA; Schema: public; Owner: ricardo
--

COPY public.orders_prod_tam_sub (id_pts, precio, "id_productoPts_id", "id_subtipoPts_id", "id_tamanoPts_id") FROM stdin;
1	8.35	1	3	1
2	13.75	1	3	2
3	9.50	1	4	1
4	15.75	1	4	2
5	10.50	1	5	1
6	17.75	1	5	2
7	11.70	1	6	1
8	19.75	1	6	2
9	14.75	1	7	1
10	20.95	1	7	2
11	16.75	1	8	1
12	26.50	1	8	2
13	18.75	1	9	1
14	28.50	1	9	2
15	19.75	1	10	1
16	30.50	1	10	2
17	20.75	1	11	1
18	31.50	1	11	2
19	21.75	1	47	1
20	33.50	1	47	2
21	4.50	2	12	1
22	5.60	2	12	2
23	4.95	2	13	1
24	6.00	1	13	2
25	4.95	2	14	1
26	6.00	2	14	2
27	4.95	2	15	1
28	6.00	2	15	2
29	4.95	2	16	1
30	6.00	2	16	2
31	5.75	2	17	1
32	6.75	2	17	2
33	5.75	2	18	1
34	6.75	2	18	2
35	5.75	2	19	1
36	6.75	2	19	2
37	5.25	2	20	1
38	6.00	2	20	2
39	5.25	2	21	1
40	6.25	2	21	2
41	5.75	2	22	1
42	6.75	2	22	2
43	6.25	2	23	1
44	7.25	2	23	2
45	5.75	2	24	1
46	6.75	2	24	2
47	5.75	2	25	1
48	6.25	2	25	2
49	6.75	2	26	2
50	3.95	2	27	1
51	5.50	2	27	2
52	4.50	2	28	1
53	6.00	2	28	2
54	5.95	2	29	1
55	6.95	2	29	2
56	5.75	2	30	1
57	6.75	2	30	2
58	0.50	2	31	\N
59	35.00	5	40	1
60	60.00	5	40	2
61	45.00	5	41	1
62	70.00	5	41	2
63	45.00	5	42	1
64	70.00	5	42	2
65	35.00	5	43	1
66	60.00	5	43	2
67	45.00	5	44	1
68	70.00	5	44	2
69	45.00	5	45	1
70	80.00	5	45	2
71	6.50	3	32	\N
72	8.75	3	33	\N
73	9.75	3	34	\N
74	8.25	4	38	\N
75	6.75	4	39	\N
76	4.95	4	35	\N
77	6.25	4	36	\N
78	6.25	4	37	\N
79	0.90	7	46	\N
80	1.50	6	48	3
81	1.75	6	48	4
82	1.65	6	48	5
\.


--
-- Data for Name: orders_producto; Type: TABLE DATA; Schema: public; Owner: ricardo
--

COPY public.orders_producto (id_producto, tipo) FROM stdin;
1	Pizza
2	Sub
3	Pasta
4	Salad
5	Dinner Plattes
6	Drinks
7	addons
\.


--
-- Data for Name: orders_subtipo; Type: TABLE DATA; Schema: public; Owner: ricardo
--

COPY public.orders_subtipo (id_subtipo, nom_subtipo) FROM stdin;
3	regular 0 toppings
4	regular 1 toppings
5	regular 2 toppings
6	regular 3 toppings
7	Pizza special 5 toppings
8	siciliana 0 toppings
9	siciliana 1 toppings
10	siciliana 2 toppings
11	siciliana 3 toppings
12	Sub cheese
13	sub Italian
14	sub Ham+chesse
15	sub meatball
16	sub tuna
17	sub turkey + cheese
18	sub chicken parmigiana
19	sub roastbeef
20	sub eggplant parmigiana
21	sub steak
22	sub steak + chesse
26	sub sausage, peppers + onions
27	sub hamburguer
28	sub cheeseburguer
29	sub fried Chicken
30	sub Veggie
31	sub addon of extra cheese
32	pasta baked zitti mozarella
33	pasta baked zitti meatballs
34	pasta baked zitti chicken
35	garden salad
36	greek salad
37	antipasto salad
38	salad Tuna
39	salad chicken
40	dinnerplater garden salad
41	dinnerplater greek salad
42	dinnerplater antipasto
43	dinnerplater baked ziti
44	dinnerplater baked ziti with meatballs
45	dinnerplater baked zitti with chicken
46	chip and cookies
47	Pizza special 5 toppings sicilian
23	sub steak + chesse + mushrooms
24	sub steak + cheese + green peppers
25	sub steak + chesse + onions
48	Drink
\.


--
-- Data for Name: orders_tamano; Type: TABLE DATA; Schema: public; Owner: ricardo
--

COPY public.orders_tamano (id_tamano, nom_tamano) FROM stdin;
1	small
2	large
3	Soda can
4	Soda tap
5	Soda bottle
\.


--
-- Data for Name: orders_toppings; Type: TABLE DATA; Schema: public; Owner: ricardo
--

COPY public.orders_toppings (id_topping, topp_nombre) FROM stdin;
1	Peperonni
3	green peppers
4	sausage
5	ham
6	zucchini
7	canadian bacon
8	Eggplant
9	Tomato + Basil
10	Mushroom
11	Onions
12	Hamburguer
13	spinach
14	artichoke
15	anchovies
16	black olive
17	fresh garlic
18	meatball
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ricardo
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ricardo
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ricardo
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 56, true);


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ricardo
--

SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ricardo
--

SELECT pg_catalog.setval('public.auth_user_id_seq', 1, true);


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ricardo
--

SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ricardo
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 187, true);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ricardo
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 14, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ricardo
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 23, true);


--
-- Name: orders_ordenes_id_orden_seq; Type: SEQUENCE SET; Schema: public; Owner: ricardo
--

SELECT pg_catalog.setval('public.orders_ordenes_id_orden_seq', 4, true);


--
-- Name: orders_pizza_id_pizza_seq; Type: SEQUENCE SET; Schema: public; Owner: ricardo
--

SELECT pg_catalog.setval('public.orders_pizza_id_pizza_seq', 13, true);


--
-- Name: orders_pizza_id_subtipo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ricardo
--

SELECT pg_catalog.setval('public.orders_pizza_id_subtipo_id_seq', 1, false);


--
-- Name: orders_prod_orden_id_prod_creado_seq; Type: SEQUENCE SET; Schema: public; Owner: ricardo
--

SELECT pg_catalog.setval('public.orders_prod_orden_id_prod_creado_seq', 1, false);


--
-- Name: orders_prod_orden_topping_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ricardo
--

SELECT pg_catalog.setval('public.orders_prod_orden_topping_id_seq', 1, false);


--
-- Name: orders_prod_tam_sub_id_pts_seq; Type: SEQUENCE SET; Schema: public; Owner: ricardo
--

SELECT pg_catalog.setval('public.orders_prod_tam_sub_id_pts_seq', 82, true);


--
-- Name: orders_producto_id_producto_seq; Type: SEQUENCE SET; Schema: public; Owner: ricardo
--

SELECT pg_catalog.setval('public.orders_producto_id_producto_seq', 7, true);


--
-- Name: orders_subtipo_id_subtipo_seq; Type: SEQUENCE SET; Schema: public; Owner: ricardo
--

SELECT pg_catalog.setval('public.orders_subtipo_id_subtipo_seq', 48, true);


--
-- Name: orders_tamano_id_tamano_seq; Type: SEQUENCE SET; Schema: public; Owner: ricardo
--

SELECT pg_catalog.setval('public.orders_tamano_id_tamano_seq', 5, true);


--
-- Name: orders_toppings_id_topping_seq; Type: SEQUENCE SET; Schema: public; Owner: ricardo
--

SELECT pg_catalog.setval('public.orders_toppings_id_topping_seq', 18, true);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: ricardo
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: ricardo
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: ricardo
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: ricardo
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: ricardo
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: ricardo
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: ricardo
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: ricardo
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: ricardo
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: ricardo
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: ricardo
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_user auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: ricardo
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: ricardo
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: ricardo
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: ricardo
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: ricardo
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: ricardo
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: orders_ordenes orders_ordenes_pkey; Type: CONSTRAINT; Schema: public; Owner: ricardo
--

ALTER TABLE ONLY public.orders_ordenes
    ADD CONSTRAINT orders_ordenes_pkey PRIMARY KEY (id_orden);


--
-- Name: orders_prod_orden orders_prod_orden_pkey; Type: CONSTRAINT; Schema: public; Owner: ricardo
--

ALTER TABLE ONLY public.orders_prod_orden
    ADD CONSTRAINT orders_prod_orden_pkey PRIMARY KEY (id_prod_creado);


--
-- Name: orders_prod_orden_topping orders_prod_orden_toppin_prod_orden_id_toppings_i_3432395f_uniq; Type: CONSTRAINT; Schema: public; Owner: ricardo
--

ALTER TABLE ONLY public.orders_prod_orden_topping
    ADD CONSTRAINT orders_prod_orden_toppin_prod_orden_id_toppings_i_3432395f_uniq UNIQUE (prod_orden_id, toppings_id);


--
-- Name: orders_prod_orden_topping orders_prod_orden_topping_pkey; Type: CONSTRAINT; Schema: public; Owner: ricardo
--

ALTER TABLE ONLY public.orders_prod_orden_topping
    ADD CONSTRAINT orders_prod_orden_topping_pkey PRIMARY KEY (id);


--
-- Name: orders_prod_tam_sub orders_prod_tam_sub_pkey; Type: CONSTRAINT; Schema: public; Owner: ricardo
--

ALTER TABLE ONLY public.orders_prod_tam_sub
    ADD CONSTRAINT orders_prod_tam_sub_pkey PRIMARY KEY (id_pts);


--
-- Name: orders_producto orders_producto_pkey; Type: CONSTRAINT; Schema: public; Owner: ricardo
--

ALTER TABLE ONLY public.orders_producto
    ADD CONSTRAINT orders_producto_pkey PRIMARY KEY (id_producto);


--
-- Name: orders_subtipo orders_subtipo_pkey; Type: CONSTRAINT; Schema: public; Owner: ricardo
--

ALTER TABLE ONLY public.orders_subtipo
    ADD CONSTRAINT orders_subtipo_pkey PRIMARY KEY (id_subtipo);


--
-- Name: orders_tamano orders_tamano_pkey; Type: CONSTRAINT; Schema: public; Owner: ricardo
--

ALTER TABLE ONLY public.orders_tamano
    ADD CONSTRAINT orders_tamano_pkey PRIMARY KEY (id_tamano);


--
-- Name: orders_toppings orders_toppings_pkey; Type: CONSTRAINT; Schema: public; Owner: ricardo
--

ALTER TABLE ONLY public.orders_toppings
    ADD CONSTRAINT orders_toppings_pkey PRIMARY KEY (id_topping);


--
-- Name: orders_pizza pk_id_pizza; Type: CONSTRAINT; Schema: public; Owner: ricardo
--

ALTER TABLE ONLY public.orders_pizza
    ADD CONSTRAINT pk_id_pizza PRIMARY KEY (id_pizza);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: ricardo
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: ricardo
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: ricardo
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: ricardo
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_group_id_97559544; Type: INDEX; Schema: public; Owner: ricardo
--

CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_user_id_6a12ed8b; Type: INDEX; Schema: public; Owner: ricardo
--

CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_permission_id_1fbb5f2c; Type: INDEX; Schema: public; Owner: ricardo
--

CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_user_id_a95ead1b; Type: INDEX; Schema: public; Owner: ricardo
--

CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: ricardo
--

CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: ricardo
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: ricardo
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: ricardo
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: ricardo
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: orders_ordenes_id_id_3c83cebd; Type: INDEX; Schema: public; Owner: ricardo
--

CREATE INDEX orders_ordenes_id_id_3c83cebd ON public.orders_ordenes USING btree (id_dueno_id);


--
-- Name: orders_prod_orden_id_ordenIn_id_a56c76f2; Type: INDEX; Schema: public; Owner: ricardo
--

CREATE INDEX "orders_prod_orden_id_ordenIn_id_a56c76f2" ON public.orders_prod_orden USING btree ("id_ordenIn_id");


--
-- Name: orders_prod_orden_id_ptsWho_id_29cac614; Type: INDEX; Schema: public; Owner: ricardo
--

CREATE INDEX "orders_prod_orden_id_ptsWho_id_29cac614" ON public.orders_prod_orden USING btree ("id_ptsWho_id");


--
-- Name: orders_prod_orden_topping_prod_orden_id_bb90fcdb; Type: INDEX; Schema: public; Owner: ricardo
--

CREATE INDEX orders_prod_orden_topping_prod_orden_id_bb90fcdb ON public.orders_prod_orden_topping USING btree (prod_orden_id);


--
-- Name: orders_prod_orden_topping_toppings_id_f7c44b63; Type: INDEX; Schema: public; Owner: ricardo
--

CREATE INDEX orders_prod_orden_topping_toppings_id_f7c44b63 ON public.orders_prod_orden_topping USING btree (toppings_id);


--
-- Name: orders_prod_tam_sub_id_productoPts_id_07675b55; Type: INDEX; Schema: public; Owner: ricardo
--

CREATE INDEX "orders_prod_tam_sub_id_productoPts_id_07675b55" ON public.orders_prod_tam_sub USING btree ("id_productoPts_id");


--
-- Name: orders_prod_tam_sub_id_subtipoPts_id_f074e602; Type: INDEX; Schema: public; Owner: ricardo
--

CREATE INDEX "orders_prod_tam_sub_id_subtipoPts_id_f074e602" ON public.orders_prod_tam_sub USING btree ("id_subtipoPts_id");


--
-- Name: orders_prod_tam_sub_id_tamanoPts_id_e645f1b1; Type: INDEX; Schema: public; Owner: ricardo
--

CREATE INDEX "orders_prod_tam_sub_id_tamanoPts_id_e645f1b1" ON public.orders_prod_tam_sub USING btree ("id_tamanoPts_id");


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: ricardo
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: ricardo
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: ricardo
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: ricardo
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: ricardo
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: ricardo
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: ricardo
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: ricardo
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: ricardo
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: orders_pizza fk_subtipo; Type: FK CONSTRAINT; Schema: public; Owner: ricardo
--

ALTER TABLE ONLY public.orders_pizza
    ADD CONSTRAINT fk_subtipo FOREIGN KEY (id_subtipo_id) REFERENCES public.orders_subtipo(id_subtipo);


--
-- Name: orders_ordenes orders_ordenes_id_dueno_id_261521c0_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: ricardo
--

ALTER TABLE ONLY public.orders_ordenes
    ADD CONSTRAINT orders_ordenes_id_dueno_id_261521c0_fk_auth_user_id FOREIGN KEY (id_dueno_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: orders_prod_orden orders_prod_orden_id_ordenIn_id_a56c76f2_fk_orders_or; Type: FK CONSTRAINT; Schema: public; Owner: ricardo
--

ALTER TABLE ONLY public.orders_prod_orden
    ADD CONSTRAINT "orders_prod_orden_id_ordenIn_id_a56c76f2_fk_orders_or" FOREIGN KEY ("id_ordenIn_id") REFERENCES public.orders_ordenes(id_orden) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: orders_prod_orden orders_prod_orden_id_ptsWho_id_29cac614_fk_orders_pr; Type: FK CONSTRAINT; Schema: public; Owner: ricardo
--

ALTER TABLE ONLY public.orders_prod_orden
    ADD CONSTRAINT "orders_prod_orden_id_ptsWho_id_29cac614_fk_orders_pr" FOREIGN KEY ("id_ptsWho_id") REFERENCES public.orders_prod_tam_sub(id_pts) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: orders_prod_orden_topping orders_prod_orden_to_prod_orden_id_bb90fcdb_fk_orders_pr; Type: FK CONSTRAINT; Schema: public; Owner: ricardo
--

ALTER TABLE ONLY public.orders_prod_orden_topping
    ADD CONSTRAINT orders_prod_orden_to_prod_orden_id_bb90fcdb_fk_orders_pr FOREIGN KEY (prod_orden_id) REFERENCES public.orders_prod_orden(id_prod_creado) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: orders_prod_orden_topping orders_prod_orden_to_toppings_id_f7c44b63_fk_orders_to; Type: FK CONSTRAINT; Schema: public; Owner: ricardo
--

ALTER TABLE ONLY public.orders_prod_orden_topping
    ADD CONSTRAINT orders_prod_orden_to_toppings_id_f7c44b63_fk_orders_to FOREIGN KEY (toppings_id) REFERENCES public.orders_toppings(id_topping) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: orders_prod_tam_sub orders_prod_tam_sub_id_productoPts_id_07675b55_fk_orders_pr; Type: FK CONSTRAINT; Schema: public; Owner: ricardo
--

ALTER TABLE ONLY public.orders_prod_tam_sub
    ADD CONSTRAINT "orders_prod_tam_sub_id_productoPts_id_07675b55_fk_orders_pr" FOREIGN KEY ("id_productoPts_id") REFERENCES public.orders_producto(id_producto) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: orders_prod_tam_sub orders_prod_tam_sub_id_subtipoPts_id_f074e602_fk_orders_su; Type: FK CONSTRAINT; Schema: public; Owner: ricardo
--

ALTER TABLE ONLY public.orders_prod_tam_sub
    ADD CONSTRAINT "orders_prod_tam_sub_id_subtipoPts_id_f074e602_fk_orders_su" FOREIGN KEY ("id_subtipoPts_id") REFERENCES public.orders_subtipo(id_subtipo) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: orders_prod_tam_sub orders_prod_tam_sub_id_tamanoPts_id_e645f1b1_fk_orders_ta; Type: FK CONSTRAINT; Schema: public; Owner: ricardo
--

ALTER TABLE ONLY public.orders_prod_tam_sub
    ADD CONSTRAINT "orders_prod_tam_sub_id_tamanoPts_id_e645f1b1_fk_orders_ta" FOREIGN KEY ("id_tamanoPts_id") REFERENCES public.orders_tamano(id_tamano) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

