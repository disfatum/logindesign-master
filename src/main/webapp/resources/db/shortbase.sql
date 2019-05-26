--
-- PostgreSQL database dump
--

-- Dumped from database version 10.6
-- Dumped by pg_dump version 10.6

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: aliases; Type: TABLE; Schema: public; Owner: aisori
--

CREATE TABLE public.aliases (
    aliasid integer NOT NULL,
    aliasname character varying(80),
    descr character varying(80),
    ugmsflag boolean DEFAULT false,
    appflag boolean DEFAULT false
);


ALTER TABLE public.aliases OWNER TO aisori;

--
-- Name: aliases_aliasid_seq; Type: SEQUENCE; Schema: public; Owner: aisori
--

CREATE SEQUENCE public.aliases_aliasid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.aliases_aliasid_seq OWNER TO aisori;

--
-- Name: aliases_aliasid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: aisori
--

ALTER SEQUENCE public.aliases_aliasid_seq OWNED BY public.aliases.aliasid;


--
-- Name: aqlfiles; Type: TABLE; Schema: public; Owner: aisori
--

CREATE TABLE public.aqlfiles (
    aqlname character varying,
    aqltext text,
    aliasid integer,
    aqlid integer NOT NULL,
    aqlmenu character varying,
    aqlheader character varying
);


ALTER TABLE public.aqlfiles OWNER TO aisori;

--
-- Name: aqlfiles_aqlid_seq; Type: SEQUENCE; Schema: public; Owner: aisori
--

CREATE SEQUENCE public.aqlfiles_aqlid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.aqlfiles_aqlid_seq OWNER TO aisori;

--
-- Name: aqlfiles_aqlid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: aisori
--

ALTER SEQUENCE public.aqlfiles_aqlid_seq OWNED BY public.aqlfiles.aqlid;


--
-- Name: countries; Type: TABLE; Schema: public; Owner: aisori
--

CREATE TABLE public.countries (
    countryname character varying(80) NOT NULL
);


ALTER TABLE public.countries OWNER TO aisori;

--
-- Name: faillog; Type: TABLE; Schema: public; Owner: aisori
--

CREATE TABLE public.faillog (
    failid integer NOT NULL,
    tstamp timestamp without time zone,
    ipadr character varying,
    logname character varying(32),
    pwd character varying,
    aliasid integer
);


ALTER TABLE public.faillog OWNER TO aisori;

--
-- Name: faillog_failid_seq; Type: SEQUENCE; Schema: public; Owner: aisori
--

CREATE SEQUENCE public.faillog_failid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.faillog_failid_seq OWNER TO aisori;

--
-- Name: faillog_failid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: aisori
--

ALTER SEQUENCE public.faillog_failid_seq OWNED BY public.faillog.failid;


--
-- Name: newstext; Type: TABLE; Schema: public; Owner: aisori
--

CREATE TABLE public.newstext (
    newsid integer NOT NULL,
    tstamp timestamp with time zone,
    ntext character varying,
    aliasid integer
);


ALTER TABLE public.newstext OWNER TO aisori;

--
-- Name: newstext_newsid_seq; Type: SEQUENCE; Schema: public; Owner: aisori
--

CREATE SEQUENCE public.newstext_newsid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.newstext_newsid_seq OWNER TO aisori;

--
-- Name: newstext_newsid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: aisori
--

ALTER SEQUENCE public.newstext_newsid_seq OWNED BY public.newstext.newsid;


--
-- Name: numusers; Type: TABLE; Schema: public; Owner: aisori
--

CREATE TABLE public.numusers (
    dummyid integer NOT NULL,
    numusers integer
);


ALTER TABLE public.numusers OWNER TO aisori;

--
-- Name: reguser; Type: TABLE; Schema: public; Owner: aisori
--

CREATE TABLE public.reguser (
    logname character varying(64) NOT NULL,
    pwd character varying(32),
    fname character varying(80),
    iname character varying(80),
    email character varying(80),
    countryname character varying(80),
    cityname character varying(80),
    org character varying(128),
    uid integer NOT NULL,
    aliasid integer,
    appr boolean,
    allugms boolean DEFAULT false,
    ugmsid integer[]
);


ALTER TABLE public.reguser OWNER TO aisori;

--
-- Name: reguser_uid_seq; Type: SEQUENCE; Schema: public; Owner: aisori
--

CREATE SEQUENCE public.reguser_uid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reguser_uid_seq OWNER TO aisori;

--
-- Name: reguser_uid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: aisori
--

ALTER SEQUENCE public.reguser_uid_seq OWNED BY public.reguser.uid;


--
-- Name: restmail; Type: TABLE; Schema: public; Owner: aisori
--

CREATE TABLE public.restmail (
    eid integer NOT NULL,
    uid integer,
    tstmp timestamp without time zone,
    restored boolean DEFAULT false
);


ALTER TABLE public.restmail OWNER TO aisori;

--
-- Name: restmail_eid_seq; Type: SEQUENCE; Schema: public; Owner: aisori
--

CREATE SEQUENCE public.restmail_eid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.restmail_eid_seq OWNER TO aisori;

--
-- Name: restmail_eid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: aisori
--

ALTER SEQUENCE public.restmail_eid_seq OWNED BY public.restmail.eid;


--
-- Name: session_id; Type: SEQUENCE; Schema: public; Owner: aisori
--

CREATE SEQUENCE public.session_id
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.session_id OWNER TO aisori;

--
-- Name: srsume; Type: TABLE; Schema: public; Owner: aisori
--

CREATE TABLE public.srsume (
    aliasid integer NOT NULL,
    timeid integer NOT NULL,
    tname character varying
);


ALTER TABLE public.srsume OWNER TO aisori;

--
-- Name: statfiles; Type: TABLE; Schema: public; Owner: aisori
--

CREATE TABLE public.statfiles (
    aliasid integer,
    stfileid integer NOT NULL,
    stfname character varying(128)
);


ALTER TABLE public.statfiles OWNER TO aisori;

--
-- Name: statfiles_stfileid_seq; Type: SEQUENCE; Schema: public; Owner: aisori
--

CREATE SEQUENCE public.statfiles_stfileid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.statfiles_stfileid_seq OWNER TO aisori;

--
-- Name: statfiles_stfileid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: aisori
--

ALTER SEQUENCE public.statfiles_stfileid_seq OWNED BY public.statfiles.stfileid;


--
-- Name: stations; Type: TABLE; Schema: public; Owner: aisori
--

CREATE TABLE public.stations (
    stid integer NOT NULL,
    stfileid integer,
    stline character varying(128),
    wmoindex integer
);


ALTER TABLE public.stations OWNER TO aisori;

--
-- Name: stations_stid_seq; Type: SEQUENCE; Schema: public; Owner: aisori
--

CREATE SEQUENCE public.stations_stid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.stations_stid_seq OWNER TO aisori;

--
-- Name: stations_stid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: aisori
--

ALTER SEQUENCE public.stations_stid_seq OWNED BY public.stations.stid;


--
-- Name: timeaql; Type: TABLE; Schema: public; Owner: aisori
--

CREATE TABLE public.timeaql (
    aliasid integer,
    leafid integer NOT NULL,
    aqlid integer NOT NULL
);


ALTER TABLE public.timeaql OWNER TO aisori;

--
-- Name: timeleafs; Type: TABLE; Schema: public; Owner: aisori
--

CREATE TABLE public.timeleafs (
    aliasid integer,
    leafid integer NOT NULL,
    timeid integer,
    fullname character varying,
    tfamily character varying,
    prefix character varying,
    pathdat character varying,
    keyfrm character varying,
    fnamefrm character varying,
    stfileid integer,
    allzipname character varying,
    zipsize character varying
);


ALTER TABLE public.timeleafs OWNER TO aisori;

--
-- Name: timeleafs_leafid_seq; Type: SEQUENCE; Schema: public; Owner: aisori
--

CREATE SEQUENCE public.timeleafs_leafid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.timeleafs_leafid_seq OWNER TO aisori;

--
-- Name: timeleafs_leafid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: aisori
--

ALTER SEQUENCE public.timeleafs_leafid_seq OWNED BY public.timeleafs.leafid;


--
-- Name: ucomments; Type: TABLE; Schema: public; Owner: aisori
--

CREATE TABLE public.ucomments (
    idcomm integer NOT NULL,
    tstamp timestamp with time zone,
    logname character varying(80),
    textcomm character varying,
    aliasid integer
);


ALTER TABLE public.ucomments OWNER TO aisori;

--
-- Name: ucomments_idcomm_seq; Type: SEQUENCE; Schema: public; Owner: aisori
--

CREATE SEQUENCE public.ucomments_idcomm_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ucomments_idcomm_seq OWNER TO aisori;

--
-- Name: ucomments_idcomm_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: aisori
--

ALTER SEQUENCE public.ucomments_idcomm_seq OWNED BY public.ucomments.idcomm;


--
-- Name: ugms; Type: TABLE; Schema: public; Owner: aisori
--

CREATE TABLE public.ugms (
    ugmsid integer NOT NULL,
    ugmsname character varying
);


ALTER TABLE public.ugms OWNER TO aisori;

--
-- Name: userlog; Type: TABLE; Schema: public; Owner: aisori
--

CREATE TABLE public.userlog (
    seansid integer NOT NULL,
    userid integer,
    ipadr character varying,
    tstamp timestamp without time zone
);


ALTER TABLE public.userlog OWNER TO aisori;

--
-- Name: waiconf; Type: TABLE; Schema: public; Owner: aisori
--

CREATE TABLE public.waiconf (
    chkey character varying(16) NOT NULL,
    chvar character varying(256),
    chcomment character varying(256)
);


ALTER TABLE public.waiconf OWNER TO aisori;

--
-- Name: worklog; Type: TABLE; Schema: public; Owner: aisori
--

CREATE TABLE public.worklog (
    idwork integer NOT NULL,
    seansid integer,
    userid integer,
    aliasid integer,
    timeid integer,
    leafid integer,
    stfileid integer,
    datasize bigint,
    stations integer[],
    tname character varying,
    leafname character varying,
    stfname character varying,
    aqlquery character varying
);


ALTER TABLE public.worklog OWNER TO aisori;

--
-- Name: worklog_idwork_seq; Type: SEQUENCE; Schema: public; Owner: aisori
--

CREATE SEQUENCE public.worklog_idwork_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.worklog_idwork_seq OWNER TO aisori;

--
-- Name: worklog_idwork_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: aisori
--

ALTER SEQUENCE public.worklog_idwork_seq OWNED BY public.worklog.idwork;


--
-- Name: aliases aliasid; Type: DEFAULT; Schema: public; Owner: aisori
--

ALTER TABLE ONLY public.aliases ALTER COLUMN aliasid SET DEFAULT nextval('public.aliases_aliasid_seq'::regclass);


--
-- Name: aqlfiles aqlid; Type: DEFAULT; Schema: public; Owner: aisori
--

ALTER TABLE ONLY public.aqlfiles ALTER COLUMN aqlid SET DEFAULT nextval('public.aqlfiles_aqlid_seq'::regclass);


--
-- Name: faillog failid; Type: DEFAULT; Schema: public; Owner: aisori
--

ALTER TABLE ONLY public.faillog ALTER COLUMN failid SET DEFAULT nextval('public.faillog_failid_seq'::regclass);


--
-- Name: newstext newsid; Type: DEFAULT; Schema: public; Owner: aisori
--

ALTER TABLE ONLY public.newstext ALTER COLUMN newsid SET DEFAULT nextval('public.newstext_newsid_seq'::regclass);


--
-- Name: reguser uid; Type: DEFAULT; Schema: public; Owner: aisori
--

ALTER TABLE ONLY public.reguser ALTER COLUMN uid SET DEFAULT nextval('public.reguser_uid_seq'::regclass);


--
-- Name: restmail eid; Type: DEFAULT; Schema: public; Owner: aisori
--

ALTER TABLE ONLY public.restmail ALTER COLUMN eid SET DEFAULT nextval('public.restmail_eid_seq'::regclass);


--
-- Name: statfiles stfileid; Type: DEFAULT; Schema: public; Owner: aisori
--

ALTER TABLE ONLY public.statfiles ALTER COLUMN stfileid SET DEFAULT nextval('public.statfiles_stfileid_seq'::regclass);


--
-- Name: stations stid; Type: DEFAULT; Schema: public; Owner: aisori
--

ALTER TABLE ONLY public.stations ALTER COLUMN stid SET DEFAULT nextval('public.stations_stid_seq'::regclass);


--
-- Name: timeleafs leafid; Type: DEFAULT; Schema: public; Owner: aisori
--

ALTER TABLE ONLY public.timeleafs ALTER COLUMN leafid SET DEFAULT nextval('public.timeleafs_leafid_seq'::regclass);


--
-- Name: ucomments idcomm; Type: DEFAULT; Schema: public; Owner: aisori
--

ALTER TABLE ONLY public.ucomments ALTER COLUMN idcomm SET DEFAULT nextval('public.ucomments_idcomm_seq'::regclass);


--
-- Name: worklog idwork; Type: DEFAULT; Schema: public; Owner: aisori
--

ALTER TABLE ONLY public.worklog ALTER COLUMN idwork SET DEFAULT nextval('public.worklog_idwork_seq'::regclass);


--
-- Data for Name: aliases; Type: TABLE DATA; Schema: public; Owner: aisori
--

COPY public.aliases (aliasid, aliasname, descr, ugmsflag, appflag) FROM stdin;
2	ClimateR	\N	f	f
3	UData	\N	t	t
0	Blocked data	\N	f	f
\.


--
-- Data for Name: aqlfiles; Type: TABLE DATA; Schema: public; Owner: aisori
--

COPY public.aqlfiles (aqlname, aqltext, aliasid, aqlid, aqlmenu, aqlheader) FROM stdin;
tmsM_ct2.aql	// Признаки _ct2 \nWA1 (32000) CHAR; \n \n IN: STREAM(R) TMSM;\n     PORTION RECORDS;\n \n   RECORDS NAT;\n     IF  (СТАНЦИЯ  * 1);\n     IF  (ГОД      * 2);\n     IF  (МЕСЯЦ    * 3);\n     IF  (ТИПЗАП   * 4);\n     WA1 = СТАНЦИЯ           FC(7),               // Станция\n           ГОД               FC(4),               // Год\n           МЕСЯЦ             FC(2),               // Месяц\n\t   ТИПЗАП            FC(1);               // Тип записи (1-9)\t\n   END RECORDS;\n	3	2515	Признаки (Год, Мес, Станция, Тип записи)	\N
tmsM_Sg2.aql	//  Характеристики снежного покрова            =_Sg2\n WA1 (32000) CHAR; \n \n IN: STREAM(R) TMSM;\n     PORTION RECORDS;\n \n   RECORDS NAT;\n     IF  (СТАНЦИЯ  * 1);\n     IF  (ГОД      * 2);\n     IF  (МЕСЯЦ    * 3);\n     WA1 = СТАНЦИЯ           FC(7),               // Станция\n           ГОД               FC(4),               // Год\n           МЕСЯЦ             FC(2);               // Месяц\n \n     RBODY СНЕГ;\n       WA1 = СНПЧДСМС          FC(2),             // Число дней со снежным покровом   \n             СНПЧДСМС.Q        FC(1),             // Признак качества                 \n             СНДПОЯГД          FC(2),             // Дата выпадения первого снега     \n             СНДПОЯГД.Q        FC(1),             // Признак качества                 \n             СНДСXДГД          FC(2),             // Дата последнего снега             \n             СНДСXДГД.Q        FC(1);             // Признак качества                  \n       GROUP СНПОКРОВ;                            //                                  \n         WA1 = ДАТЫ              FC(1),           // Индекс                           \n               СНДОУПГД          FC(2),           // Дата образования снежного покрова\n               СНДОУПГД.Q        FC(1);           // Признак качества                 \n       END СНПОКРОВ;                                                                  \n       GROUP РАЗРУШСП;                            //                                  \n         WA1 = ДАТЫ              FC(1),           // Индекс                           \n               СНДРУПГД          FC(2),           // Дата разрушения снежного покрова \n               СНДРУПГД.Q        FC(1);           // Признак качества                 \n       END РАЗРУШСП;\n     END СНЕГ;\n   END RECORDS;\n	3	2516	Характеристики снежного покрова	\N
tmsM_cn2.aql	//  Паспортные данные _cn2\n WA1 (32000) CHAR; \n \n IN: STREAM(R) TMSM;\n     PORTION RECORDS;\n \n   RECORDS NAT;\n     IF  (СТАНЦИЯ  * 1);\n     IF  (ГОД      * 2);\n     IF  (МЕСЯЦ    * 3);\n     \n     WA1 = СТАНЦИЯ           FC(7),               // Станция\n           ГОД               FC(4),               // Год\n           МЕСЯЦ             FC(2);               // Месяц\n \n     RBODY CONST;\n       WA1 = НАИМЕНСТ          FC(20),            // Наименование станции                                          \n             КООРДНОМ          FC(7),             // Координатныйномер станции                                     \n             НОМУПРАВ          FC(2),             // Номер угмс                                                    \n             НОМЧАСП           FC(2),             // Номер часового пояса                                          \n             ПРГЕОРАС          FC(1),             // Признак географического расположения                          \n             КОЛСРОК           FC(1),             // Кол-во сроков наблюдений                                      \n             ПРНЕПРДН          FC(1),             // Признак непрерывного рабочего дня                             \n             ПРПРИНСТ          FC(1),             // Признак принадлежности станции                                \n             ПРУАТГМС          FC(1),             // Признак наличия уатгмс                                        \n             ПРЕЖЧАСН          FC(1),             // Наличие ежечасных наблюдений                                  \n             ПРАГРОМН          FC(1),             // Наличие агрометрических  наблюдений                           \n             ПРПРМОРН          FC(1),             // Наличие прибров морских  наблюдений                           \n             ПРГИДРОН          FC(1),             // Наличие гидрологических  наблюдений                           \n             ПРАЭРОН           FC(1),             // Наличие аэрологических   наблюдений                           \n             ПРРАДИОН          FC(1),             // Наличие радиолокационных наблюдений                           \n             ПРАКТИНН          FC(1),             // Наличие актинометрических наблюдений                          \n             ПРТЕПЛОБ          FC(1),             // Наличие теплобалансовых  наблюдений                           \n             ПРОЗОНН           FC(1),             // Наличие озонометрических наблюдений                           \n             ПРАТЭЛЕК          FC(1),             // Наличие наблюдений атмосферного электричества                 \n             ПРЗАГРВЗ          FC(1),             // Наличие наблюд. загрязнения воздуха                           \n             ПРКЛАССТ          FC(1),             // Признак классности  станции                                   \n             ПРООЯ             FC(1),             // Классификатор критериев ООЯ                                   \n             ПРПЕЖМЧ1          FC(1),             // Помещение  данных ежмесячника ч1                              \n             ПРПЕЖМЧ2          FC(1),             // Помещение даных ежмесячника ч2,ежгодника                      \n             ПРПССЕЖ2          FC(1),             // Даные солнечного сияния в ежмесячнике ч2                      \n             ТИПУЧАСТ          FC(1),             // Тип участка станции                                           \n             ВЫССТНУМ          FC(5),             // Высота над уровнем моря                                       \n             ПРНВИДИМ          FC(1),             // Наблюдения дальности видимости                                \n             ПРНОБЛАЧ          FC(1),             // Наблюдения над облачностью                                    \n             ПРНВЫСОБ          FC(1),             // Наблюдения высоты нижней границы облаков                      \n             ПРСОСТПП          FC(1),             // Наблюения состояния повехности почвы                          \n             ПРНПОГОД          FC(1),             // Наблюдения над погодой                                        \n             ПРНВЕТР           FC(1),             // Наличие налюдения над ветром                                  \n             ВЫСФЛЛД           FC(5,1),           // Высота флюгера легкой доской                                  \n             ВЫСФЛТД           FC(5,1),           // Высота флюгера тяжелой доской                                 \n             ВЫСАНЕМО          FC(5,1),           // Высота анеморумбометра                                        \n             ПРНОСАДК          FC(1),             // Наблюдения над осадками                                       \n             ПРНТЕМПП          FC(1),             // Наблюдения температуры поверхности почвы                      \n             ПРНТЕМВ           FC(1),             // Наблюдения температуры воздуха                                \n             ПРНСНЕГ           FC(1),             // Наличие снегос'емок                                           \n             ДЛСНЕГП           FC(3,1),           // Длина полевого маршрута                                       \n             ДЛСНЕГЛ           FC(3,1),           // Длина маршрута по лесу                                        \n             ДЛСНЕГБ           FC(3,1),           // Длина маршрута по балкам                                      \n             ПРНГЕЛИО          FC(1),             // Налиие гелиографа                                             \n             ВЫСГЕЛИО          FC(5,1),           // Высота гелиографа над землей                                  \n             ПРНТЕРМО          FC(1),             // Наличие термографа                                            \n             ПРНГИГРО          FC(1),             // Наличие гигрографа                                            \n             ПРНПЛЮВ           FC(1),             // Наличие плювиографа                                           \n             ПРНОБЛЕД          FC(1),             // Набличие обледенения                                          \n             ПРНБАРОМ          FC(1),             // Наличие барометра                                             \n             ВЫСБАРОМ          FC(6,1),           // Высота барометра над уровнем моря                             \n             ТУТЕМПОГ          FC(1),             // Тип устройства измер.темп.почвы оголенной поверхности         \n             ТУТЕМПЕС          FC(1);             // Тип устройства измер.темп.почвы.естестественного покрытия     \n       GROUP GRS1;\n         WA1 = ГЛУБИНЫ           FC(1),           // Индекс глубины                                  \n               ПРНВЫТТ           FC(1);           // Наличие вытяжного термометра на глуб.0,2-3,2 м  \n       END GRS1;\n       GROUP GRS2;\n         WA1 = ГЛУБИНЫ           FC(2),           // Индекс глубины                               \n               ПРНЭЛЕКТ          FC(1);           // Наличие электротермометра на глуб.0,02-3,2 м \n       END GRS2;\n       WA1 = ДНАЧПНОЧ          FC(2),             // День начала полярной ночи                                  \n             МНАЧПНОЧ          FC(2),             // Месяц начала полярной ночи                                 \n             ДКОНЦАПН          FC(2),             // День окончания полярной ночи                               \n             МКОНЦАПН          FC(2),             // Месяц окончания полярной ночи                              \n             НОМЕРАДР          FC(3),             // Номер административного района в угмс                      \n             ГОДТЕКУЩ          FC(4),             // Текущий год                                                \n             МЕСЯЦТЕК          FC(2),             // Текущий месяц                                              \n             КОЛДНМЕС          FC(2),             // Количество дней в месяце                                   \n             НМСМОСКВ          FC(2),             // Начало метеосуток,московское декретное время               \n             НМСПДЗВ           FC(2),             // Начало метеосуток,поясное декретное(зимнее)время (Пдзв)    \n             ПЧАСНМС           FC(2),             // Первый час  от начала метеосуток                           \n             ПСРОКНМС          FC(2),             // Первый срок от начала метеосуток                           \n             СБЛ8ЧАС8          FC(2),             // Срок,ближайший к 8 час.пдзв                                \n             СБ14ЧАС8          FC(2),             // Срок,ближайший к 14час.пдзв                                \n             СБ14ЧАС4          FC(2),             // Срок,ближайший к 14час.пдв(4с)                             \n             ШИРОТА            FC(4,1),           // Широта расположения станции                                \n             ДОЛГОТА           FC(4,1),           // Долгота распположения станции                              \n             ОПРПОЛУШ          FC(1),             // Определение долготы и полушария                            \n             ГОДОТКСТ          FC(4),             // Год открытия станции                                       \n             NАРФАЙЛА          FC(2),             // Номер архивного файла                                      \n             КЗМОNАТ           FC(1),             // Количество записей  MONAT                                  \n             КЗВЕТЕР           FC(1),             // Количество записей 'ветер'                                 \n             КЗДЕКАДЫ          FC(1),             // Количество записей 'декады'                                \n             КЗСРОКИ           FC(1),             // Количество записей 'сроки'                                 \n             КЗТПОЧВЫ          FC(1),             // Количество записей 'тпочвы'                                \n             КЗRЕGЕN           FC(3),             // Количество записей 'rеgеn'                                 \n             КЗСНЕГ            FC(1),             // Количество записей 'снег'                                  \n             КЗОБЛООЯ          FC(1);             // Количество записей 'облооя'                                \n     END CONST;\n   END RECORDS;\n	3	2517	Паспортные данные	\N
tmmn_ge2.aql	 WA1 (10000) CHAR; \n \n IN: STREAM(R) TMM1_NEW;\n     PORTION RECORDS.GЕLIО.ГЕЛИО;\n \n   RECORDS NAT;\n     IF  (СТАНЦИЯ  * 1);\n     IF  (ГОД      * 2);\n     IF  (МЕСЯЦ    * 3);\n     WA1 = СТАНЦИЯ           FC(7),               // Станция\n           ГОД               FC(4),               // Год                      \n           МЕСЯЦ             FC(2);               // Месяц                    \n \n     RBODY GЕLIО;\n       GROUP ГЕЛИО;\n         WA1 = ДЕНИНД            FC(2);           // День\n         GROUP СОЛСПР;\n           WA1 = СОЛСПРЧ           FC(3,1),       // Прод-сть солнечного сияния за 1 час (24)\n                 СОЛСПРЧ.Q         FC(1);         // Признак качества                        \n         END СОЛСПР;\n         WA1 = ПЧКССОЛ           FC(2),           // 1-й час, после которого светило солнце\n               ПЧКССОЛ.Q         FC(1);           // Признак качества                      \n       END ГЕЛИО;\n     END GЕLIО;\n   END RECORDS;\n	3	2518	Данные гелиографа	\N
tmmn_sl2.aql	 WA1 (10000) CHAR; \n \n IN: STREAM(R) TMM1_NEW;\n     PORTION RECORDS.SNEG.SNОWL;\n \n   RECORDS NAT;\n     IF  (СТАНЦИЯ  * 1);\n     IF  (ГОД      * 2);\n     IF  (МЕСЯЦ    * 3);\n     WA1 = СТАНЦИЯ           FC(7),               // Станция\n           ГОД               FC(4),               // Год                      \n           МЕСЯЦ             FC(2);               // Месяц                    \n \n     RBODY SNEG;\n       GROUP SNОWL;\n         WA1 = NSNL              FC(1),           // Номер снегосъемки           \n               ДПРСНЕГ           FC(2),           // Дата проведения снегосъемки \n               СТПМСН            FC(2),           // Степень покрытия маршрута снегом \n               СТПМСН.Q          FC(1),           // Признак качества                 \n               СТПМЛК            FC(2),           // Степень покрытия маршрута ледяной коркой \n               СТПМЛК.Q          FC(1),           // Признак качества                         \n               СТПОКОКР          FC(2),           // Степень покрытия окрестности станции снегом  \n               СТПОКОКР.Q        FC(1),           // Признак качества                             \n               СОСППСН           FC(2),           // Состояние поверхности почвы под снегом       \n               ТОЛСЛЧВ           FC(3),           // Толщина слоя чистой воды\n               ТОЛСЛЧВ.Q         FC(1),           // Признак качества        \n               СНПСРВМ           FC(4),           // Средняя высота снежного покрова на маршруте    \n               СНПСРВМ.Q         FC(1),           // Признак качества                               \n               СНПМАКВМ          FC(4),           // Наибольшая высота снежного покрова на маршруте \n               СНПМАКВМ.Q        FC(1),           // Признак качества                               \n               СНПМИНВМ          FC(4),           // Наименьшая высота снежного покрова на маршруте \n               СНПМИНВМ.Q        FC(1),           // Признак качества                               \n               ТОЛЛКСН           FC(3),           // Средняя толщина ледяной корки \n               ТОЛЛКСН.Q         FC(1),           // Признак качества              \n               ТСЛСННВ           FC(3),           // Толщина слоя снега, насыщенного водой\n               ТСЛСННВ.Q         FC(1),           // Признак качества                     \n               XАРЗСНП           FC(2),           // Характер залегания снежного покрова \n               XАРЗСНП.Q         FC(1),           // Признак качества                    \n               СРПЛСН            FC(2),           // Средняя плотность снега \n               СРПЛСН.Q          FC(1);           // Признак качества        \n       END SNОWL;\n     END SNEG;\n   END RECORDS;\n	3	2519	Данные снегосъемок по лесу	\N
tmmn_os2.aql	 WA1 (10000) CHAR; \n \n IN: STREAM(R) TMM1_NEW;\n     PORTION RECORDS.OSOJAW.ОSОВО;\n \n   RECORDS NAT;\n     IF  (СТАНЦИЯ  * 1);\n     IF  (ГОД      * 2);\n     IF  (МЕСЯЦ    * 3);\n     WA1 = СТАНЦИЯ           FC(7),               // Станция\n           ГОД               FC(4),               // Год                      \n           МЕСЯЦ             FC(2);               // Месяц                    \n \n     RBODY OSOJAW;\n       GROUP ОSОВО;\n         WA1 = КООЯ              FC(3),           // Индекс\n               ООЯДНАЧ           FC(2),           // День начала ООЯ\n               ООЯДОКОН          FC(2),           // День окончания ООЯ\n               ООЯВРНАЧ          FC(5,2),         // Время начала ООЯ\n               ООЯВРНАЧ.Q        FC(1),           // Признак качества\n               ООЯВРОК           FC(5,2),         // Время окончания ООЯ\n               ООЯВРОК.Q         FC(1),           // Признак качества  \n               ООЯШИФР           FC(2),           // Шифр ООЯ        \n               ООЯШИФР.Q         FC(1),           // Признак качества\n               ООЯПЕРX           FC(5),           // Первая характеристика ООЯ \n               ООЯПЕРX.Q         FC(1),           // Признак качества\n               ООЯПРЗПX          FC(1),           // Признак знака >\n               ООЯВТXАР          FC(5),           // Вторая характеристика ООЯ  \n               ООЯВТXАР.Q        FC(1);           // Признак качества \n       END ОSОВО;\n     END OSOJAW;\n   END RECORDS;\n	3	2520	Особо опасные явления	\N
tmmn_sr2.aql	 WA1 (10000) CHAR; \n \n IN: STREAM(R) TMM1_NEW;\n     PORTION RECORDS.SROKM.НАБЛСРОК;\n \n   RECORDS NAT;\n     IF  (СТАНЦИЯ  * 1);\n     IF  (ГОД      * 2);\n     IF  (МЕСЯЦ    * 3);\n     WA1 = СТАНЦИЯ           FC(7),               // Станция\n           ГОД               FC(4),               // Год                      \n           МЕСЯЦ             FC(2);               // Месяц                    \n \n     RBODY SROKM;\n       IF  (ДЕНЬ     * 4);\n       WA1 = ДЕНЬ              FC(2);             // День\n       GROUP НАБЛСРОК;\n         WA1 = СРОКИНД           FC(1),           // Индекс срок\n               ДЕНЬМДВ           FC(2),           // День (местное декретное время)\n               СРНМДВЗ           FC(2),           // Срок (Московское декретное зимнее время)\n               ВЕЛБАРТ           FC(3,1),         // Величина барической тенденции\n               ВЕЛБАРТ.Q         FC(1),           // Признак качества             \n               ОССУМКОЛ          FC(5,1),         // Сумма осадков за период между сроками \n               ОССУМКОЛ.Q        FC(1),           // Признак качества                      \n               ОБЛФОРВЯ          FC(1),           // Форма облаков верхнего яруса            \n               ОБЛФОРВЯ.Q        FC(1),           // Признак качества                        \n               ОБЛФОРСЯ          FC(1),           // Форма облаков среднего яруса            \n               ОБЛФОРСЯ.Q        FC(1),           // Признак качества                        \n               ОБЛФОРВР          FC(1),           // Форма облаков вертикального развития    \n               ОБЛФОРВР.Q        FC(1),           // Признак качества                        \n               ОСЛСЛКУЧ          FC(1),           // Слоистые и слоисто-кучевые облака       \n               ОСЛСЛКУЧ.Q        FC(1),           // Признак качества                        \n               ОСДРДОЖ           FC(1),           // Слоисто-дожд,разорванно-дождевые облака \n               ОСДРДОЖ.Q         FC(1),           // Признак качества                        \n               АТМДУРСТ          FC(6,1),         // Атмосферное давление в срок на уровне станции\n               АТМДУРСТ.Q        FC(1),           // Признак качества                             \n               УПРВОДП           FC(5,1),         // Парциальное давление водяного пара\n               УПРВОДП.Q         FC(1),           // Признак качества                  \n               ОТНВЛВОЗ          FC(3),           // Относительная влажность воздуха в срок\n               ОТНВЛВОЗ.Q        FC(1),           // Признак качества                      \n               АТМДУРМ           FC(6,1),         // Атмосферное давление в срок на уровне моря \n               АТМДУРМ.Q         FC(1),           // Признак качества                           \n               ПОГСРН            FC(2),           // Погода в срок наблюдения \n               ПОГСРН.Q          FC(1),           // Признак качества         \n               ОБЛВНГР           FC(3),           // Высота нижней границы облачности\n               ОБЛВНГР.Q         FC(1),           // Признак качества                \n               СОПРВОБЛ          FC(1),           // Пр. способа опрю. выс. н. г\n               ВЕТНАПР           FC(3),           // Направление ветра\n               ВЕТНАПР.Q         FC(1),           // Признак качества \n               ПОГМСРН           FC(1),           // Погода между сроками \n               ПОГМСРН.Q         FC(1),           // Признак качества     \n               ОБЛОБКОЛ          FC(2),           // Общее количество облачности         \n               ОБЛОБКОЛ.Q        FC(1),           // Признак качества                    \n               ОБЛКОЛНЯ          FC(2),           // Количество облачности нижнего яруса \n               ОБЛКОЛНЯ.Q        FC(1),           // Признак качества                    \n               XАРБАРТ           FC(2),           // Характеристика барической тенденции \n               XАРБАРТ.Q         FC(1),           // Признак качества                    \n               ГОРДАЛВ           FC(3),           // Горизонтальная дальность видимости\n               ГОРДАЛВ.Q         FC(1),           // Признак качества                  \n               КОДЗНВИД          FC(1),           // КОД ЗНАКА '>='ВИД.\n               ТВСРСУXТ          FC(5,1),         // Температура воздуха в срок по сухому терм-ру \n               ТВСРСУXТ.Q        FC(1),           // Признак качества                             \n               ТЕМВМИН           FC(5,1),         // Мин.температура воздуха \n               ТЕМВМИН.Q         FC(1),           // Признак качества                     \n               ВЕТСРСК           FC(2),           // Средняя скорость ветра \n               ВЕТСРСК.Q         FC(1),           // Признак качества       \n               КОДЗНСКВ          FC(1),           // Признак наличия знака > \n               ТЕМВМАКС          FC(5,1),         // Макс. темперура воздуха \n               ТЕМВМАКС.Q        FC(1),           // Признак качества                     \n               ТЕМТОЧР           FC(5,1),         // Температура точки росы\n               ТЕМТОЧР.Q         FC(1),           // Признак качества      \n               ВЕТМАКСК          FC(2),           // Максимальное скорость ветра \n               ВЕТМАКСК.Q        FC(1),           // Признак качества            \n               КОДЗНМСВ          FC(1),           // Признак наличия знака >\n               ТПЕСПГ2           FC(5,1),         // Температура почвы под ест. покровом,  2 см.\n               ТПЕСПГ2.Q         FC(1),           // Признак качества                            \n               ТПЕСПГ5           FC(5,1),         // Температура почвы под ест. покровом,  5 см.\n               ТПЕСПГ5.Q         FC(1),           // Признак качества                            \n               ТППОЧСРТ          FC(5,1),         // Температура поверхности почвы в срок \n               ТППОЧСРТ.Q        FC(1),           // Признак качества                     \n               ТПЕСПГ10          FC(5,1),         // Температура почвы под ест. покровом,  10 см.\n               ТПЕСПГ10.Q        FC(1),           // Признак качества                            \n               ТПЕСПГ15          FC(5,1),         // Температура почвы под ест. покровом,  25 см.\n               ТПЕСПГ15.Q        FC(1),           // Признак качества                            \n               ДЕФУПРУГ          FC(5,1),         // Дефицит насыщения водяного пара\n               ДЕФУПРУГ.Q        FC(1),           // Признак качества               \n               ТПЕСПГ20          FC(5,1),         // Температура почвы под ест. покровом,  20 см.\n               ТПЕСПГ20.Q        FC(1),           // Признак качества\n               ТПЕСПГ40          FC(5,1),         // Температура почвы под ест. покровом,  40 см.\n               ТПЕСПГ40.Q        FC(1),           // Признак качества                            \n               ТППМИН            FC(5,1),         // Мин. температура пов-сти почвы \n               ТППМИН.Q          FC(1),           // Признак качества               \n               ТПОГП5            FC(5,1),         // Температура почвы под огол. поверх,  5 см. \n               ТПОГП5.Q          FC(1),           // Признак качества                             \n               ТПОГП10           FC(5,1),         // Температура почвы под огол. поверх, 10 см.\n               ТПОГП10.Q         FC(1),           // Признак качества                          \n               ТППМАКС           FC(5,1),         // Макс. температура пов-сти почвы \n               ТППМАКС.Q         FC(1),           // Признак качества                \n               ТПОГП15           FC(5,1),         // Температура почвы под огол. поверх, 15 см. \n               ТПОГП15.Q         FC(1),           // Признак качества                           \n               ТПОГП20           FC(5,1),         // Температура почвы под огол. поверх, 20 см.\n               ТПОГП20.Q         FC(1),           // Признак качества                          \n               СИЗТПЕП           FC(1),           // Способ измерения темп. почвы, 2-40 см.\n               ТМТППВСТ          FC(4),           // Температура пов-сти почвы по макс. терм-ру п/встр.\n               ТМТППВСТ.Q        FC(1),           // Признак качества                                  \n               ТСПТПОВП          FC(4),           // Температура пов. почвы по спирту мин. терм-ра\n               ТСПТПОВП.Q        FC(1),           // Признак качества                             \n               ТВСМОЧТ           FC(5,1),         // Темп.воздуха в срок по смоченному терм-ру\n               ТВСМОЧТ.Q         FC(1),           // Признак качества                         \n               ПРНЛБСМТ          FC(1),           // Признак нал. льда на батисте\n               ПРЗАШКМТ          FC(1),           // Признак зашкаливания макс. термометра\n               ПРНОУСТ           FC(1),           // Признак наличия облаков ниже уровня станции\n               ПРНОУСТ.Q         FC(1),           // Признак качества\n               ПРНИМТПП          FC(1),           // Признак наличия информации мин. температуры пов-сти почвы\n               ТВСПМИНТ          FC(5,1),         // Температура воздуха по спирту мин. терм-ра\n               ТВСПМИНТ.Q        FC(1),           // Признак качества                          \n               ТВМАКТВС          FC(5,1),         // Темпера воздуха по макс. терм-ра после встрях.\n               ТВМАКТВС.Q        FC(1);           // Признак качества                              \n       END НАБЛСРОК;\n     END SROKM;\n   END RECORDS;\n	3	2521	Срочные данные	\N
tmmn_su2.aql	 WA1 (10000) CHAR; \n \n IN: STREAM(R) TMM1_NEW;\n     PORTION RECORDS.SUTKI.СУТКИ;\n \n   RECORDS NAT;\n     IF  (СТАНЦИЯ  * 1);\n     IF  (ГОД      * 2);\n     IF  (МЕСЯЦ    * 3);\n     WA1 = СТАНЦИЯ           FC(7),               // Станция\n           ГОД               FC(4),               // Год                      \n           МЕСЯЦ             FC(2);               // Месяц                    \n \n     RBODY SUTKI;\n       GROUP СУТКИ;\n         WA1 = ДЕНИНД            FC(2),           // Индекс День\n               ПСИЗТП            FC(2),           // Признак измерения температуры почвы, 80-320 см.\n               СППСБ8            FC(2),           // Состояние поверхности почвы в срок, ближ к 8 час. МДВ\n               СППСБ8.Q          FC(1),           // Признак качества \n               СППСБ20           FC(2),           // Состояние поверхности почвы в срок, ближ к 20 час.\n               СППСБ20.Q         FC(1),           // Признак качества                                 \n               СТПОКОКР          FC(2),           // Степень покрытия окрест. станции снегом  \n               СТПОКОКР.Q        FC(1),           // Признак качества                         \n               XАРЗСНП           FC(1),           // Характер залегания снежного покрова      \n               XАРЗСНП.Q         FC(1),           // Признак качества                         \n               СОЛССУМС          FC(3,1),         // Суммарная продолжительность солнечного сияния за сутки\n               СОЛССУМС.Q        FC(1),           // Признак качества   \n               ТПЕСП80           FC(5,1),         // Температура почвы под ест. покровом, 80 см.\n               ТПЕСП80.Q         FC(1),           // Признак качества\n               ТПЕСП120          FC(5,1),         // Температура почвы под ест. покровом, 120 см.\n               ТПЕСП120.Q        FC(1),           // Признак качества                           \n               ТПЕСП160          FC(5,1),         // Температура почвы под ест. покровом, 160 см.\n               ТПЕСП160.Q        FC(1),           // Признак качества                            \n               ТПЕСП240          FC(5,1),         // Температура почвы под ест. покровом, 240 см.\n               ТПЕСП240.Q        FC(1),           // Признак качества                            \n               ТПЕСП320          FC(5,1),         // Температура почвы под ест. покровом, 320 см.\n               ТПЕСП320.Q        FC(1),           // Признак качества                            \n               СНПВЫСПТ          FC(4),           // Высота снежного покрова у почв. термометра \n               СНПВЫСПТ.Q        FC(1),           // Признак качества                     \n               СНМПВПР1          FC(4),           // Высота снежного покрова, рейка 1 \n               СНМПВПР1.Q        FC(1),           // Признак качества        \n               СНМПВПР2          FC(4),           // Высота снежного покрова, рейка 2\n               СНМПВПР2.Q        FC(1),           // Признак качества                \n               СНМПВПР3          FC(4),           // Высота снежного покрова, рейка 3\n               СНМПВПР3.Q        FC(1);           // Признак качества                \n       END СУТКИ;\n     END SUTKI;\n   END RECORDS;\n	3	2522	Суточные данные	\N
tmmn_ct2.aql	 WA1 (10000) CHAR; \n \n IN: STREAM(R) TMM1_NEW;\n     PORTION RECORDS;\n \n   RECORDS NAT;\n     IF  (СТАНЦИЯ  * 1);\n     IF  (ГОД      * 2);\n     IF  (МЕСЯЦ    * 3);\n     IF  (ТИПЗАП   * 4);\n     WA1 = СТАНЦИЯ           FC(7),               // Станция\n           ГОД               FC(4),               // Год                      \n           МЕСЯЦ             FC(2),               // Месяц                    \n           ТИПЗАП            FC(1);               // Тип записи (1-7)         \n   END RECORDS;\n\n	3	2523	Признаки (Год, Мес, Станция, Тип записи)	\N
tmmn_sp2.aql	 WA1 (10000) CHAR; \n \n IN: STREAM(R) TMM1_NEW;\n     PORTION RECORDS.SNEG.SNОWР;\n \n   RECORDS NAT;\n     IF  (СТАНЦИЯ  * 1);\n     IF  (ГОД      * 2);\n     IF  (МЕСЯЦ    * 3);\n     WA1 = СТАНЦИЯ           FC(7),               // Станция\n           ГОД               FC(4),               // Год                      \n           МЕСЯЦ             FC(2);               // Месяц                    \n \n     RBODY SNEG;\n       GROUP SNОWР;\n         WA1 = NSNР              FC(1),           // Номер снегосъемки           \n               ДПРСНЕГ           FC(2),           // Дата проведения снегосъемки \n               СТПМСН            FC(2),           // Степень покрытия маршрута снегом         \n               СТПМСН.Q          FC(1),           // Признак качества                         \n               СТПМЛК            FC(2),           // Степень покрытия маршрута ледяной коркой \n               СТПМЛК.Q          FC(1),           // Признак качества                         \n               СТПОКОКР          FC(2),           // Степень покрытия окрестности станции снегом  \n               СТПОКОКР.Q        FC(1),           // Признак качества                             \n               СОСППСН           FC(2),           // Состояние поверхности почвы под снегом        \n               ТОЛСЛЧВ           FC(3),           // Толщина слоя чистой воды \n               ТОЛСЛЧВ.Q         FC(1),           // Признак качества         \n               СНПСРВМ           FC(4),           // Средняя высота снежного покрова на маршруте   \n               СНПСРВМ.Q         FC(1),           // Признак качества                              \n               СНПМАКВМ          FC(4),           // Наибольшая высота снежного покрова на маршруте\n               СНПМАКВМ.Q        FC(1),           // Признак качества                              \n               СНПМИНВМ          FC(4),           // Наименьшая высота снежного покрова на маршруте\n               СНПМИНВМ.Q        FC(1),           // Признак качества                              \n               ТОЛЛКСН           FC(3),           // Средняя толщина ледяной корки \n               ТОЛЛКСН.Q         FC(1),           // Признак качества              \n               ТСЛСННВ           FC(3),           // Толщина слоя снега, насыщенного водой \n               ТСЛСННВ.Q         FC(1),           // Признак качества                      \n               XАРЗСНП           FC(2),           // Характер залегания снежного покрова \n               XАРЗСНП.Q         FC(1),           // Признак качества                    \n               СРПЛСН            FC(2),           // Средняя плотность снега \n               СРПЛСН.Q          FC(1);           // Признак качества        \n       END SNОWР;\n     END SNEG;\n   END RECORDS;\n	3	2524	Данные снегосъемок по полю	\N
tmmn_at2.aql	 WA1 (10000) CHAR; \n \n IN: STREAM(R) TMM1_NEW;\n     PORTION RECORDS.ATMOS.АЯ;\n \n   RECORDS NAT;\n     IF  (СТАНЦИЯ  * 1);\n     IF  (ГОД      * 2);\n     IF  (МЕСЯЦ    * 3);\n     WA1 = СТАНЦИЯ           FC(7),               // Станция\n           ГОД               FC(4),               // Год                      \n           МЕСЯЦ             FC(2);               // Месяц                    \n \n     RBODY ATMOS;\n       IF  (ДЕНЬ  * 4);\n       WA1 = ДЕНЬ              FC(2);             // День                        \n       GROUP АЯ;\n         WA1 = NАЯ               FC(3),           // Номер атмосферного явления        \n               АТЯВШИФР          FC(2),           // Шифр атмосферного явления         \n               АТЯВШИФР.Q        FC(1),           // Признак качества                  \n               АТЯВИНТ           FC(3),           // Интенсивность атмосферного явления\n               АТЯВИНТ.Q         FC(1),           // Признак качества                  \n               АТЯВЧН            FC(2),           // Час начала АЯ \n               АТЯВЧН.Q          FC(1),           // Признак качества\n               АТЯВМН            FC(2),           // Минуты начала АЯ\n               АТЯВМН.Q          FC(1),           // Признак качества \n               АТЯВЧОК           FC(2),           // Час окончания АЯ    \n               АТЯВЧОК.Q         FC(1),           // Признак качества \n               АТЯВМОК           FC(2),           // Минуты окончания АЯ \n               АТЯВМОК.Q         FC(1),           // Признак качества \n               АТЯВКНП           FC(1);           // Код наличия перерывов в АЯ\n       END АЯ;\n     END ATMOS;\n   END RECORDS;\n	3	2525	Атмосферные явления	\N
tmmn_sb2.aql	 WA1 (10000) CHAR; \n \n IN: STREAM(R) TMM1_NEW;\n     PORTION RECORDS.SNEG.SNОWВ;\n \n   RECORDS NAT;\n     IF  (СТАНЦИЯ  * 1);\n     IF  (ГОД      * 2);\n     IF  (МЕСЯЦ    * 3);\n     WA1 = СТАНЦИЯ           FC(7),               // Станция\n           ГОД               FC(4),               // Год                      \n           МЕСЯЦ             FC(2);               // Месяц                    \n \n     RBODY SNEG;\n       GROUP SNОWВ;\n         WA1 = NSNВ              FC(1),           // Номер снегосъемки           \n               ДПРСНЕГ           FC(2),           // Дата проведения снегосъемки \n               СТПМСН            FC(2),           // Степень покрытия маршрута снегом            \n               СТПМСН.Q          FC(1),           // Признак качества                            \n               СТПМЛК            FC(2),           // Степень покрытия маршрута ледяной коркой    \n               СТПМЛК.Q          FC(1),           // Признак качества                            \n               СТПОКОКР          FC(2),           // Степень покрытия окрестности станции снегом \n               СТПОКОКР.Q        FC(1),           // Признак качества                            \n               СОСППСН           FC(2),           // Состояние поверхности почвы под снегом    \n               ТОЛСЛЧВ           FC(3),           // Толщина слоя чистой воды                  \n               ТОЛСЛЧВ.Q         FC(1),           // Признак качества                          \n               СНПСРВМ           FC(4),           // Средняя высота снежного покрова на маршруте    \n               СНПСРВМ.Q         FC(1),           // Признак качества                               \n               СНПМАКВМ          FC(4),           // Наибольшая высота снежного покрова на маршруте \n               СНПМАКВМ.Q        FC(1),           // Признак качества                               \n               СНПМИНВМ          FC(4),           // Наименьшая высота снежного покрова на маршруте \n               СНПМИНВМ.Q        FC(1),           // Признак качества                               \n               ТСЛСННВ           FC(3),           // Средняя толщина ледяной корки          \n               ТСЛСННВ.Q         FC(1),           // Признак качества                       \n               ТОЛЛКСН           FC(3),           // Толщина слоя снега, насыщенного водой  \n               ТОЛЛКСН.Q         FC(1),           // Признак качества                       \n               XАРЗСНП           FC(2),           // Характер залегания снежного покрова    \n               XАРЗСНП.Q         FC(1),           // Признак качества        \n               СРПЛСН            FC(2),           // Средняя плотность снега \n               СРПЛСН.Q          FC(1);           // Признак качества        \n       END SNОWВ;\n     END SNEG;\n   END RECORDS;\n	3	2526	Данные снегосъемок по балкам	\N
tmmn_cn2.aql	 WA1 (10000) CHAR; \n \n IN: STREAM(R) TMM1_NEW;\n     PORTION RECORDS.CONST;\n \n   RECORDS NAT;\n     IF  (СТАНЦИЯ  * 1);\n     IF  (ГОД      * 2);\n     IF  (МЕСЯЦ    * 3);\n     WA1 = СТАНЦИЯ           FC(7),               // Станция\n           ГОД               FC(4),               // Год                      \n           МЕСЯЦ             FC(2);               // Месяц                    \n \n     RBODY CONST;\n       WA1 = НУПРГМС           FC(2),             // Номер УГКС\n             КОЛСРНАБ          FC(2),             // Количество сроков наблюдения\n             НОМЧАСП           FC(1),             // Номер часового пояса \n             ТИПУЧСТ           FC(1),             // Тип участка станции  \n             ПРПРИНСТ          FC(1),             // ПР.ПРИН.СТ.МЕЖД.ОБМ\n             ПРССЕЖЧ2          FC(1),             // Дан.солн.с.в ежм ч2 \n             ВЫССТУРМ          FC(4),             // Высота над уровнем моря \n             ПРННМДВ           FC(1),             // СПОС.ИЗМ.ДАЛЬН.ВИД.\n             ПРННКФО           FC(1),             // СПОС.ИЗМ.ВЫС.ОБЛАК.\n             ПРННВЕТ           FC(1),             // СПОСОБ. ИЗМЕР.ВЕТРА\n             ВФЛДПЗ            FC(4,1),           // Высота флюгера с легкой доской  \n             ВФТДПЗ            FC(4,1),           // Высота флюгера с тяжелой доской \n             ВАНПЗ             FC(4,1),           // Высота анеморумбометра \n             ПРННОСАД          FC(1),             // СПОС. ИЗМ. ОСАДКОВ\n             ПРННТПП           FC(1),             // СП.ИЗМ.ТЕМП.ПОВ.ПОЧ\n             ПРМИНТПП          FC(1),             // СП.ИЗМ.МИН.Т.П.ПОЧВ\n             ПРМАКТПП          FC(1),             // СП.ИЗ.МАКС.Т.П.ПОЧВ\n             ТУСОГПОВ          FC(1),             // Тип уст.изм.т.п.огп \n             ТУСЕСПОК          FC(1),             // Тип.уст.изм.т.п.есп \n             ПРНЭТ002          FC(1),             // Наличие электротермометра,   2 см.\n             ПРНЭТ005          FC(1),             // Наличие электротермометра,   5 см.\n             ПРНЭТ010          FC(1),             // Наличие электротермометра,  10 см.\n             ПРНЭТ015          FC(1),             // Наличие электротермометра,  15 см.\n             ПРНЭТ020          FC(1),             // Наличие электротермометра,  20 см.\n             ПРНЭТ040          FC(1),             // Наличие электротермометра,  40 см.\n             ПРНЭТ080          FC(1),             // Наличие электротермометра,  80 см.\n             ПРНДТ120          FC(1),             // Наличие электротермометра, 120 см.\n             ПРНДТ160          FC(1),             // Наличие электротермометра, 160 см.\n             ПРНЭТ320          FC(1),             // Наличие электротермометра, 320 см.\n             ПРНВТ02           FC(1),             // Наличие вытяжного термометра  20 см.\n             ПРНВТ04           FC(1),             // Наличие вытяжного термометра  40 см.\n             ПРНВТ08           FC(1),             // Наличие вытяжного термометра  80 см.\n             ПРНВТ12           FC(1),             // Наличие вытяжного термометра 120 см.\n             ПРНВТ16           FC(1),             // Наличие вытяжного термометра 160 см.\n             ПРНВТ24           FC(1),             // Наличие вытяжного термометра 240 см.\n             ПРНВТ32           FC(1),             // Наличие вытяжного термометра 320 см.\n             ПРНСНСТ           FC(1),             // Наличие снегосъемок\n             ДЛПОЛМСН          FC(4,1),           // Длина полевого маршрута      \n             ДЛЛЕСМСН          FC(4,1),           // Длина маршрута по лесу       \n             ДЛМСНБАЛ          FC(4,1),           // Длина маршрута по балкам     \n             ПРНТЕРСТ          FC(1),             // Наличие термографа\n             ПРНГИГСТ          FC(1),             // Наличие гигрографа\n             ПРНПЛСТ           FC(1),             // Наличие плювиографа\n             ПРНАНЕМ           FC(1),             // Наличие анеморумбометра \n             ВАНПЗ             FC(4,1),           // Высота анеморумбометра \n             ПРНСТГЕЛ          FC(1),             // Наличие гелиографа           \n             ВГЕЛПЗ            FC(4,1),           // Высота гелиографа над землей \n             ПРННОБЛ           FC(1),             // ПР.НАБЛ.ОБЛЕДЕНЕН.\n             ВЫСБАРУМ          FC(6,1),           // Высота барометра над уровнем моря\n             НАИМЕНСТ          AA(20),            // Наименование станции \n             ПОВНОБАР          FC(8),             // ПОВЕР.НОМЕР БАРОМ.\n             ИНДБЮПОВ          AA(4),             // ИНДЕКС БЮРО ПОВЕРКИ\n             ЗНОМБАР           FC(8),             // ЗАВОДСК.НОМ.БАР-РА\n             ДНПОПРБ           FC(2),             // ДЕНЬ НОВ.ПОПР.БАР.\n             МНПОПРБ           FC(2),             // МЕС.ПР.НОВ.ПОПР.БАР\n             ГНПОПРБ           FC(4),             // ГОД ПР.НОВ.ПОПР.БАР\n             ППОПРБАР          FC(4,1),           // ПОСТ.ПОПРАВКА БАР.\n             НОМСУГКС          FC(4),             // ПОР.НОМ.СТ.В УГКС\n             СР4БЛ13           FC(2),             // СР.БЛ.13.МЕСТ.4-СР.\n             ГОД               FC(4),             // ГОД НАБЛЮДЕНИЙ\n             МЕСЯЦ             FC(2),             // МЕСЯЦ НАБЛЮДЕНИЙ\n             КОЛДНМЕС          FC(2),             // КОЛ.ДНЕЙ В МЕСЯЦЕ\n             НМСМОСДВ          FC(2),             // НАЧ.СУТ.МОСК.ДЕК.ВР\n             НМСМЕСДВ          FC(2),             // НАЧ.СУТ.МЕСТ.ДЕК.ВР\n             ПСРПНМС           FC(2),             // 1-Й СР.ПОСЛ.НАЧ.СУТ\n             СРБЛИЖ8           FC(2),             // СР.БЛИЖ.8 ЧАС.МЕСТН\n             СРБЛИЖ13          FC(2),             // СР.БЛ.13 МЕСТ.8-СР.\n             ПЧПНМС            FC(2),             // 1-Й ЧАС ПОС.НАЧ.СУТ\n             ШИРОТА            FC(4,1),           // Широта расположения станции \n             ДОЛГОТА           FC(5,1),           // Долгота расположения станц. \n             ОПРДОЛП           FC(1),             // Определитель долготы и полушария\n             СУМПСМ1Д          FC(3,1),           // СУМ.ПОПРАВКА СМАЧИВ\n             СУМПСМ1Д.Q        FC(1),             // ЗА 1-Ю ДЕКАДУ\n             МВПСС1Д           FC(4),             // МАКС.ВОЗМ.ПРОДОЛЖ.\n             МВПСС1Д.Q         FC(1),             // С/С ЗА 1-Ю ДЕКАДУ\n             МВПСС2Д           FC(4),             // МАКС.ВОЗМ.ПРОДОЛЖ.\n             МВПСС2Д.Q         FC(1),             // С/СЗА 2-Ю ДЕКАДУ\n             КОЛООЯМ           FC(3),             // К-ВО ООЯ ЗА МЕСЯЦ\n             СУМПСМ2Д          FC(3,1),           // СУМ.ПОПРАВКА СМАЧИВ\n             СУМПСМ2Д.Q        FC(1),             // ЗА 2-Ю ДЕКАДУ\n             СУМПСМ3Д          FC(3,1),           // СУМ.ПОПРАВКА СМАЧИВ\n             СУМПСМ3Д.Q        FC(1),             // ЗА 3-Ю ДЕКАДУ\n             МВПСС3Д           FC(4),             // МАКС.ВОЗМ.ПРОДОЛЖ.\n             МВПСС3Д.Q         FC(1),             // С/С ЗА 3-Ю ДЕКАДУ\n             КОЛСНПМ           FC(3),             // КОЛ.СНЕГ.ПОЛЮ В МЕС\n             Д1ЗМИНТ           FC(2),             // ДЕНЬ 1-Й ЗАМ.МИН.Т.\n             СР1ЗМИНТ          FC(2),             // СРОК 1 ЗАМ.МИН.ТЕРМ\n             Д2ЗМИНТ           FC(2),             // ДЕНЬ 2 ЗАМ.МИН.ТЕРМ\n             СР23МИНТ          FC(2),             // СРОК 2 ЗАМ.МИН.ТЕРМ\n             Д33МИНТ           FC(2),             // ДЕНЬ 3 ЗАМ.МИН.ТЕРМ\n             СР33МИНТ          FC(2),             // СРОК 3 ЗАМ.МИН.ТЕРМ\n             КОЛСНЛМ           FC(3),             // КОЛ.СНЕГ.ЛЕСУ В МЕС\n             Д4ЗМИНТ           FC(2),             // ДЕНЬ 4 ЗАМ.МИН.ТЕРМ\n             СР4ЗМИНТ          FC(2),             // СРОК 4 ЗАМ.МИН.ТЕРМ\n             Д5ЗМИНТ           FC(2),             // ДЕНЬ 5 ЗАМ.МИН.ТЕРМ\n             СР5ЗМИНТ          FC(2),             // СРОК 5 ЗАМ.МИН.ТЕРМ\n             Д6ЗМИНТ           FC(2),             // ДЕНЬ 6 ЗАМ.МИН.ТЕРМ\n             СР6ЗМИНТ          FC(2),             // СРОК 6 ЗАМ.МИН.ТЕРМ\n             КОЛСНБО           FC(3),             // КОЛ.СНЕГ.БАЛК.В МЕС\n             Д7ЗМИНТ           FC(2),             // ДЕНЬ 7 ЗАМ.МИН.ТЕРМ\n             СР7ЗМИНТ          FC(2),             // СРОК 7 ЗАМ.МИН.ТЕРМ\n             Д8ЗМИНТ           FC(2),             // ДЕНЬ 8 ЗАМ.МИН.ТЕРМ\n             СР8ЗМИНТ          FC(2),             // СРОК 8 ЗАМ.МИН.ТЕРМ\n             Д9ЗМИНТ           FC(2),             // ДЕНЬ 9 ЗАМ.МИН.ТЕРМ\n             СР9ЗМИНТ          FC(2),             // СРОК 9 ЗАМ.МИН.ТЕРМ\n             ДПМИНТ1           FC(4,1),           // 1 ДОП.ПОПР.МИН.ТЕРМ\n             ДПМИНТ2           FC(4,1),           // 2 ДОП.ПОПР.МИН.ТЕРМ\n             ДПМИНТ3           FC(4,1),           // 3 ДОП.ПОПР.МИН.ТЕРМ\n             ДПМИНТ4           FC(4,1),           // 4 ДОП.ПОПР.МИН.ТЕРМ\n             ДПМИНТ5           FC(4,1),           // 5 ДОП.ПОПР.МИН.ТЕРМ\n             ДПМИНТ6           FC(4,1),           // 6 ДОП.ПОПР.МИН.ТЕРМ\n             ДПМИНТ7           FC(4,1),           // 7 ДОП.ПОПР.МИН.ТЕРМ\n             КДПМИНТ           FC(1),             // КОЛ.ДОП.ПОПР.МИНТЕР\n             ДПМИНТ8           FC(4,1),           // 8 ДОП.ПОПР.МИН.ТЕРМ\n             ДПМИНТ9           FC(4,1);           // 9 ДОП.ПОПР.МИН.ТЕРМ\n     END CONST;\n   END RECORDS;\n	3	2527	Паспортные данные	\N
tmsM_Ov2.aql	// Облачность, видимость                      =_Ov2\nWA1 (10000) CHAR;\n\nIN: STREAM(R) TMSM;\n    PORTION RECORDS.MONAT;\n\n  RECORDS NAT;\n    IF  (СТАНЦИЯ   * 1);\n     IF  (ГОД      * 2);\n     IF  (МЕСЯЦ    * 3);\n     WA1 = СТАНЦИЯ           FC(7),             // Станция\n           ГОД               FC(4),             // Год\n           МЕСЯЦ             FC(2);             // Месяц\n          \n    RBODY MONAT;\n      WA1 = ОБЛОСРМС    FC(4,1),                // Среднее количество общей блачности                 \n            ОБЛОСРМС.Q  FC(1,0),                // Признак качества                                   \n            ОБЛНСРМС    FC(4,1),                // Среднее количество нижней облачности               \n            ОБЛНСРМС.Q  FC(1,0),                // Признак качества                                   \n            ОБОЧЯДМС    FC(2,0),                // Число ясных дней по общей облачности               \n            ОБОЧЯДМС.Q  FC(1,0),                // Признак качества                                   \n            ОБНЧЯДМС    FC(2,0),                // Число ясных дней по нижней облачности              \n            ОБНЧЯДМС.Q  FC(1,0),                // Признак качества                                   \n            ОБОЧПДМС    FC(2,0),                // Число пасмурных дней по общей облачности           \n            ОБОЧПДМС.Q  FC(1,0),                // Признак качества                                   \n            ОБНЧПДМС    FC(2,0),                // Число пасмурных дней по нижней облачности          \n            ОБНЧПДМС.Q  FC(1,0);                // Признак качества                                   \n      GROUP ПОВТФОБЛ;\n        WA1 = ФОРМЫОБЛ    FC(2,0),              // Индекс списка форм облаков    \n              ОБПОФОМС    FC(3,0),              // Повторяемость формы облаков   \n              ОБПОФОМС.Q  FC(1,0);              // Признак качества              \n      END ПОВТФОБЛ;\n      GROUP ЧСЛФОБЛ;\n        WA1 = ФОРМЫОБЛ    FC(2,0),\t\t// Индекс списка случаев облаков     \n              ОБЧСФОМС    FC(3,0),              // Число случаев формы облаков       \n              ОБЧСФОМС.Q  FC(1,0);              // Признак качества                  \n      END ЧСЛФОБЛ;\n      GROUP ВИДИМЧСЛ;\n        WA1 = ГРАДАЦИИ    FC(1,0),              // Номер Градации                                 \n              ВИДЧСГМС    FC(3,0),              // Число случаев дальности видимости по градациям \n              ВИДЧСГМС.Q  FC(1,0);              // Признак качества                               \n      END ВИДИМЧСЛ;\n      GROUP ВИДИМПОВ;\n        WA1 = ГРАДАЦИИ    FC(1,0),              // Номер Градации                           \n              ВИДГПГМС    FC(3,0),              // Повтор дальности видимости по градациям  \n              ВИДГПГМС.Q  FC(1,0);              // Признак качества                         \n      END ВИДИМПОВ;\n    END MONAT;\n  END RECORDS;\n	3	2528	Облачность, видимость	\N
tmsM_Ob2.aql	//  Обледенение                     \t   =_Ob2\n WA1 (32000) CHAR; \n \n IN: STREAM(R) TMSM;\n     PORTION RECORDS;\n \n   RECORDS NAT;\n     IF  (СТАНЦИЯ  * 1);\n     IF  (ГОД      * 2);\n     IF  (МЕСЯЦ    * 3);\n     WA1 = СТАНЦИЯ           FC(7),               // Станция\n           ГОД               FC(4),               // Год\n           МЕСЯЦ             FC(2);               // Месяц\n \n      RBODY ОБЛООЯ;\n         WA1 = СЧОБЛ         FC(2),              // Счетчик случаев обледенения  \n               СЧООЯ         FC(2);              // Счетчик случаев ООЯ          \n         GROUP ОВLЕD;\n         WA1 = КОЛИЧ             FC(2),           // Количество                                                        \n               ОБДНМСЛР          FC(3),           // Порядковый номер случаев обледенения                              \n               ОБДНМСЛР.Q        FC(1);           // Признак качества                                                  \n         GROUP ВИДОБЛ;                            //                                                                   \n           WA1 = ШИФР              FC(1),         // Индекс                                                            \n                 ОБДНВИДВ          FC(2),         // Шифр твердых отложений                                            \n                 ОБДНВИДВ.Q        FC(1);         // Признак качества                                                  \n         END ВИДОБЛ;                                                                                                   \n         WA1 = ОБДНЧИСР          FC(2),           // Дата начала обледенения                                           \n               ОБДВРЕНВ          FC(2),           // Время начала случая обледенения                                   \n               ОБДВРЕНВ.Q        FC(1),           // Признак качества                                                  \n               ОБДПРСТН          FC(4),           // Продолжительность стадии нарастания обледенения                   \n               ОБДПРСТН.Q        FC(1),           // Признак качества                                                  \n               ОБДПРОДВ          FC(4),           // Продолжение всего случая обледенения                              \n               ОБДПРОДВ.Q        FC(1);           // Признак качества                                                  \n         GROUP СТАДИИ;                            //                                                                   \n           WA1 = КСТАДИЙ           FC(1),         // Количество стадий                                                 \n                 ОБДНДИАМ          FC(3),         // Диаметр отложения                                                 \n                 ОБДНДИАМ.Q        FC(1),         // Признак качества                                                  \n                 ОБДТОЛЩМ          FC(3),         // Толщина отложения                                                 \n                 ОБДТОЛЩМ.Q        FC(1),         // Признак качества                                                  \n                 ОБДМАССА          FC(5),         // Масса отложения                                                   \n                 ОБДМАССА.Q        FC(1);         // Признак качества                                                  \n         END СТАДИИ;                                                                                                   \n         WA1 = ОБДТЕМНМ          FC(5,1),         // Температура воздуха в начале обледенения                          \n               ОБДТЕМНМ.Q        FC(1),           // Признак качества                                                  \n               ОБВЕТННМ          FC(3),           // Направление ветра в начале обледенения                            \n               ОБВЕТННМ.Q        FC(1),           // Признак качества                                                  \n               ОБВЕТСНМ          FC(3),           // Скорость ветра в начале обледенения                               \n               ОБВЕТСНМ.Q        FC(1),           // Признак качества                                                  \n               ОБВЕТСНМ.ОБДВПРНЮ FC(1),           // Признак наличия знака > у f                                       \n               ОБДТЕМММ          FC(5,1),         // Темпуратура воздуха при достижении отложений максимального размера\n               ОБДТЕМММ.Q        FC(1),           // Признак качества                                                  \n               ОБВЕТНММ          FC(3),           // Направление ветра при достижении отложений максимального размера  \n               ОБВЕТНММ.Q        FC(1),           // Признак качества                                                  \n               ОБВЕТСММ          FC(2),           // Скорость ветра при достижении отложений максимального размера     \n               ОБВЕТСММ.Q        FC(1),           // Признак качества                                                  \n               ОБВЕТСММ.ОБДВМАНЮ FC(1),           // Признак наличия знака > у f                                       \n               ОБДПРПЕР          FC(1),           // Признак перехода обледенения через границу месяца                 \n               ОБДПРПЕР.Q        FC(1),           // Признак качества                                                  \n               ОБДПРД1Ч          FC(4),           // Продолжительность 1 части обледенения                             \n               ОБДПРД1Ч.Q        FC(1);           // Признак качества                                                  \n       END ОВLЕD;\n       END ОБЛООЯ;\n   END RECORDS;\n	3	2529	Обледенение	\N
tmsM_Sr2.aql	//   Обобщения за месяц по восьми срокам        =_Sr2\n WA1 (32000) CHAR; \n \n IN: STREAM(R) TMSM;\n     PORTION RECORDS;\n \n   RECORDS NAT;\n     IF  (СТАНЦИЯ  * 1);\n     IF  (ГОД      * 2);\n     IF  (МЕСЯЦ    * 3);\n     WA1 = СТАНЦИЯ           FC(7),               // Станция\n           ГОД               FC(4),               // Год\n           МЕСЯЦ             FC(2);               // Месяц\n \n     RBODY СРОКИ;\n       GROUP ВЫВОДЫ;\n         WA1 = СРОКИ             FC(1),           // Обобщения по срокам                                     \n               СРОКНАБЛ          FC(2),           // Срок наблюдения                                         \n               ТЕВССРМС          FC(5,1),         // Среднее значение температуры возд                       \n               ТЕВССРМС.Q        FC(1),           // Признак качества                                        \n               ТППССРМС          FC(5,1),         // Среднее значение температуры поверхности почвы          \n               ТППССРМС.Q        FC(1),           // Признак качества                                        \n               ТТРССРМС          FC(5,1),         // Среднее значение температуры точки росы                 \n               ТТРССРМС.Q        FC(1),           // Признак качества                                        \n               УПРССРМС          FC(5,2),         // Среднее значениепарциальн давления водяного пара        \n               УПРССРМС.Q        FC(1),           // Признак качества                                        \n               УПРССРМС.Q1       FC(1),           // Указатель точности элемента                             \n               ВЛОССРМС          FC(3),           // Среднее значение относительной влажности воздуха        \n               ВЛОССРМС.Q        FC(1),           // Признак качества                                        \n               НЕНССРМС          FC(5,2),         // Среднее значение дефицита насыщения водяного пара       \n               НЕНССРМС.Q        FC(1),           // Признак качества                                        \n               НЕНССРМС.Q1       FC(1),           // указатель точности элемента                             \n               ДАВССРМС          FC(6,1),         // Среднее значение атмосферного давления на уровне станции\n               ДАВССРМС.Q        FC(1),           // Признак качества                                        \n               ДУМССРМС          FC(6,1),         // Среднее значение атмосферного давления на уровне моря   \n               ДУМССРМС.Q        FC(1),           // Признак качества                                        \n               ОБОССРМС          FC(4,1),         // Среднее количество баллов общей облачности              \n               ОБОССРМС.Q        FC(1),           // Признак качества                                        \n               ОБНССРМС          FC(4,1),         // Среднее количествово баллов нижней облачности           \n               ОБНССРМС.Q        FC(1),           // Признак качества                                        \n               ОБУССРМС          FC(3),           // Число случаев облачности ниже уровня станции            \n               ОБУССРМС.Q        FC(1),           // Признак качества                                        \n               ВЕСССРМС          FC(4,1),         // Среднее значение скорости ветра                         \n               ВЕСССРМС.Q        FC(1),           // Признак качества                                        \n               ОСУМСРМС          FC(6,1),         // Суммарное количество во осадков за срок                 \n               ОСУМСРМС.Q        FC(1);           // Признак качества                                        \n         GROUP ТЕМПОГ;                            //                                                         \n           WA1 = ГЛУБИНЫ           FC(1),         // Индекс Под оголенной поверхностью                       \n                 ТЕМПОГМС          FC(5,1),       // Среднее значение температурыры почвы на глубине         \n                 ТЕМПОГМС.Q        FC(1);         // Признак качества                                        \n         END ТЕМПОГ;                                                                                         \n         GROUP ТЕМПЕСТ;                           //                                                         \n           WA1 = ГЛУБИНЫ           FC(1),         // Индекс Под естественным покровом                       \n                 ТЕПЕООМС          FC(5,1),       // Среднее значение температуры почвы на глубине           \n                 ТЕПЕООМС.Q        FC(1);         // Признак качества                                        \n         END ТЕМПЕСТ;\n       END ВЫВОДЫ;\n     END СРОКИ;\n   END RECORDS;\n	3	2530	Обобщения за месяц по восьми срокам	\N
tmsM_Oj2.aql	//  Особо опасные явления\t                   =_Oj2\n WA1 (32000) CHAR; \n \n IN: STREAM(R) TMSM;\n     PORTION RECORDS;\n \n   RECORDS NAT;\n     IF  (СТАНЦИЯ  * 1);\n     IF  (ГОД      * 2);\n     IF  (МЕСЯЦ    * 3);\n     WA1 = СТАНЦИЯ           FC(7),               // Станция\n           ГОД               FC(4),               // Год\n           МЕСЯЦ             FC(2);               // Месяц\n       RBODY ОБЛООЯ;\n              GROUP ОSОВО;\n         WA1 = КООЯ              FC(2),           // Количество   ООЯ                            \n               ООЯЧИСЛН          FC(2),           // Дата начала  ООЯ                            \n               ООЯВРЕМН          FC(2),           // Время начала ООЯ (часы)                     \n               ООЯВРЕМН.Q        FC(1),           // Признак качества                            \n               ООЯВРНМ           FC(2),           // Время начала ООЯ (минуты)                   \n               ООЯВРНМ.Q         FC(1),           // Признак качества                            \n               ООЯЧИСЛК          FC(2),           // Дата окончания ООЯ                          \n               ООЯЧИСЛК.Q        FC(1),           // Признак качества                            \n               ООЯВРЕМК          FC(2),           // Время окончания ООЯ (часы)                  \n               ООЯВРЕМК.Q        FC(1),           // Признак качества                            \n               ООЯВРКМ           FC(2),           // Время окончания ООЯ (минуты)                \n               ООЯВРКМ.Q         FC(1),           // Признак качества                            \n               ООЯВИД            FC(2),           // Вид ООЯ                                     \n               ООЯВИД.Q          FC(1),           // Признак качества                            \n               ООЯXАР1           FC(5),           // Первая характеристика ООЯ                   \n               ООЯXАР1.Q         FC(1),           // В ЯОД точность х1 до цел.                   \n               ООЯXАР2           FC(3),           // Вторая характеристика ООЯ                   \n               ООЯXАР2.Q         FC(1),           // Признак качества                            \n               ООЯПРПЕР          FC(1),           // Признак перехода ООЯ через границу месяца   \n               ООЯПРПЕР.Q        FC(1),           // Признак качества                            \n               ООЯПРО1Ч          FC(4),           // Продолжительность 1-й части ООЯ (часы)      \n               ООЯПРО1Ч.Q        FC(1),           // Признак качества                            \n               ООЯПР1ЧМ          FC(2),           // Продолжительность 1-й части ООЯ (минуты)    \n               ООЯПР1ЧМ.Q        FC(1);           // Признак качества                            \n       END ОSОВО;\n     END ОБЛООЯ;\n   END RECORDS;\n	3	2531	Особо опасные явления	\N
Atm8c_all.aql	 WA1 (32000) CHAR; \n \n IN: STREAM(R) ATM8C;\n     PORTION НАБЛСРОК;\n \n   RECORD НАБЛСРОК NAT;\n     IF  (ГОДГР    * 1);\n     IF  (МЕСЯЦГР  * 2);\n     IF  (ДЕНЬГР   * 3);\n     IF  (СРОКГР   * 4);\n     WA1 = СТАНЦИЯ           FC(5),               // Синоптический индекс станции \n           ГОДГР             FC(4),               // Год по Гринвичу \n           МЕСЯЦГР           FC(2),               // Месяц по Гринвичу \n           ДЕНЬГР            FC(2),               // День по Гринвичу \n           СРОКГР            FC(2),               // Срок по Гринвичу \n           ГОД               FC(4),               // Год источника (местный) \n           МЕСЯЦ             FC(2),               // Месяц источника (местный) \n           ДЕНЬ              FC(2),               // День источника (местный) \n           СРОК              FC(2),               // Срок источника \n           nСРОК             FC(1),               // Номер срока в сутках по ПДЗВ \n           ВРЕМЯМЕ           FC(2),               // Время местное \n           НОМЧАСП           FC(2),               // Номер часового пояса \n           НМСПДЗВ           FC(2),               // Начало метеорологических суток по ПДЗВ \n//           ИНДАРХ            FC(1),               // Индекс архива-источника (2, 3, 4) \n           НОМАЯ             FC(2),               // Номер атмосферного явления \n           АЯВЛВИД           FC(2),               // Шифр атмосферного явления \n           АЯВЛВИД.Q         FC(1),               // Признак качества \n           АЯИНТЕНС          FC(1),               // Интенсивность атмосферного явления \n           АЯИНТЕНС.Q        FC(1),               // Признак качества \n           АЯВРЕМЯН          FC(5,2),             // Время начала АЯ (нат.значение часы, мин) \n           АЯВРЕМЯН.Q        FC(1),               // Признак качества \n           АЯВРЕМЯК          FC(5,2),             // Время окончания АЯ (нат.значение часы, мин) \n           АЯВРЕМЯК.Q        FC(1),               // Признак качества \n           АЯВРЕМЯК.D        FC(1);               // Признак прерыв. АЯ \n//           EOS               FC(4);               // Конец строки \n   END НАБЛСРОК;\n	2	2433	Срочные данные	\N
Sro8c_all.aql	 WA1 (32000) CHAR; \n \n IN: STREAM(R) SROK8C;                             \n     PORTION НАБЛСРОК;                             \n                                                   \n   RECORD НАБЛСРОК NAT;                            \n//   IF  (СТАНЦИЯ  * 1);                           \n     IF  (ГОДГР    * 2);                           \n     IF  (МЕСЯЦГР  * 3);\n     IF  (ДЕНЬГР   * 4);\n     IF  (СРОКГР   * 5);\n     WA1 = СТАНЦИЯ           FC(5),               // Синоптический индекс станции \n           ГОДГР             FC(4),               // Год   по Гринвичу \n           МЕСЯЦГР           FC(2),               // Месяц по Гринвичу \n           ДЕНЬГР            FC(2),               // День  по Гринвичу \n           СРОКГР            FC(2),               // Срок  по Гринвичу \n           ГОД               FC(4),               // Год   источника (местный) \n           МЕСЯЦ             FC(2),               // Месяц источника (местный) \n           ДЕНЬ              FC(2),               // День  источника (местный) \n           СРОК              FC(2),               // Срок  источника (местный) \n           nСРОК             FC(2),               // Номер срока в сутках по ПДЗВ \n           ВРЕМЯМЕ           FC(2),               // Время местное \n           НОМЧАСП           FC(2),               // Номер часового пояса \n           НМСПДЗВ           FC(2),               // Начало метеорологических суток по ПДЗВ \n//         ИНДАРХ            FC(1),               // Индекс архива-источника (2, 3, 4) \n           ВИДГОРИЗ          FC(2),               // Горизонтальная дальность видимости \n           ВИДГОРИЗ.Q        FC(1),               // Признак качества \n           ВИДГОРИЗ.D        FC(1),               // Пр.нал.знака > \n           ОБЛОКОЛВ          FC(2),               // Общее количество облачности \n           ОБЛОКОЛВ.Q        FC(1),               // Признак качества \n           ОБЛНКОЛВ          FC(2),               // Количество облачности нижнего яруса \n           ОБЛНКОЛВ.Q        FC(1),               // Признак качества \n           ОБЛФОРВЯ          FC(2),               // Форма облаков верхнего яруса \n           ОБЛФОРВЯ.Q        FC(1),               // Признак качества \n           ОБЛФОРСЯ          FC(2),               // Форма облаков среднего яруса \n           ОБЛФОРСЯ.Q        FC(1),               // Признак качества \n           ОБЛФОРВР          FC(2),               // Форма облаков вертикального развития \n           ОБЛФОРВР.Q        FC(1),               // Признак качества \n           ОБЛСЛСЛК          FC(2),               // Слоистые и слоисто-кучевые облака \n           ОБЛСЛСЛК.Q        FC(1),               // Признак качества \n           ОБЛСЛДРД          FC(2),               // Слоисто-дожд,разорванно-дождевые облака \n           ОБЛСЛДРД.Q        FC(1),               // Признак качества \n           ОБЛВЫНГМ          FC(4),               // Высота нижней границы облачности \n           ОБЛВЫНГМ.Q        FC(1),               // Признак качества \n           ОБЛВЫНГМ.D        FC(1),               // Признак способа определения выс. н. г \n           ОБЛПННУС          FC(2),               // Признак наличия облачности ниже уровня станции \n           ОБЛПННУС.Q        FC(1),               // Признак качества \n//         СОСТППЧВ          FC(1),               // Состояние поверхности почвы \n//         СОСТППЧВ.Q        FC(1),               // Признак качества \n//         СОСТППЧВ.D        FC(1),               // Признак наличия знака ю у е \n           ПОГОМСНВ          FC(2),               // Погода между сроками \n           ПОГОМСНВ.Q        FC(1),               // Признак качества \n           ПОГОДСНВ          FC(2),               // Погода в срок наблюдения \n           ПОГОДСНВ.Q        FC(1),               // Признак качества \n           ВЕТНАПРМ          FC(3),               // Направление ветра \n           ВЕТНАПРМ.Q        FC(1),               // Признак качества \n           ВЕТСКОРМ          FC(2),               // Средняя скорость ветра \n           ВЕТСКОРМ.Q        FC(1),               // Признак качества \n           ВЕТСКОРМ.D        FC(1),               // Признак наличия знака > \n           ВЕТСКМАК          FC(2),               // Максимальная скорость ветра \n           ВЕТСКМАК.Q        FC(1),               // Признак качества \n           ВЕТСКМАК.D        FC(1),               // Признак наличия знака > \n           ОСАСУМСР          FC(6,1),             // Сумма осадков \n           ОСАСУМСР.Q        FC(1),               // Признак качества \n           ТЕМПОВПМ          FC(5,1),             // Температура поверхности почвы \n           ТЕМПОВПМ.Q        FC(1),               // Признак качества \n           ТЕМПСПИР          FC(5,1),             // Температура пов. почвы по мин. терм-ру \n           ТЕМПСПИР.Q        FC(1),               // Признак качества \n           ТЕИПОВПМ          FC(5,1),             // Мин. температура пов-сти почвы между сроками \n           ТЕИПОВПМ.Q        FC(1),               // Признак качества \n           ТЕАПОВПМ          FC(5,1),             // Макс. температура пов-сти почвы между сроками \n           ТЕАПОВПМ.Q        FC(1),               // Признак качества \n           ТЕМПППВС          FC(5,1),             // Температура пов-сти почвы по макс. терм-ру п/встр. \n           ТЕМПППВС.Q        FC(1),               // Признак качества \n           ТЕМВОЗДМ          FC(5,1),             // Температура воздуха по сухому терм-ру \n           ТЕМВОЗДМ.Q        FC(1),               // Признак качества \n           ТЕМВСМСМ          FC(5,1),             // Темп.воздуха по смоченному терм-ру \n           ТЕМВСМСМ.Q        FC(1),               // Признак качества \n           ТЕМВСМСМ.D        FC(1),               // Признак нал. льда на батисте \n           ТЕВСПИРТ          FC(5,1),             // Температура воздуха по мин. терм-ру \n           ТЕВСПИРТ.Q        FC(1),               // Признак качества \n           ТЕИВОЗСМ          FC(5,1),             // Мин.температура воздуха между сроками \n           ТЕИВОЗСМ.Q        FC(1),               // Признак качества \n           ТЕАВОЗСМ          FC(5,1),             // Макс. темперура воздуха между сроками \n           ТЕАВОЗСМ.Q        FC(1),               // Признак качества \n           ТЕМВМПВС          FC(5,1),             // Темпера воздуха по макс. терм-ру после встрях. \n           ТЕМВМПВС.Q        FC(1),               // Признак качества \n           УПРВПАРР          FC(5,2),             // Парциальное давление водяного пара \n           УПРВПАРР.Q        FC(1),               // Признак качества \n           УПРВПАРР.Q1       FC(1),               // Указатель точности элемента \n           ВЛАОТВОМ          FC(3),               // Относительная влажность воздуха \n           ВЛАОТВОМ.Q        FC(1),               // Признак качества \n           НЕДНАСПР          FC(7,2),             // Дефицит насыщения водяного пара \n           НЕДНАСПР.Q        FC(1),               // Признак качества \n           НЕДНАСПР.D        FC(1),               // Указатель точности элемента \n           ТОЧКАРОС          FC(5,1),             // Температура точки росы \n           ТОЧКАРОС.Q        FC(1),               // Признак качества \n           ДАВЛАСТМ          FC(6,1),             // Атмосферное давление на уровне станции \n           ДАВЛАСТМ.Q        FC(1),               // Признак качества \n           ДАВЛАУММ          FC(6,1),             // Атмосферное давление на уровне моря \n           ДАВЛАУММ.Q        FC(1),               // Признак качества \n           ТЕНБВИДГ          FC(2),               // Характеристика барической тенденции \n           ТЕНБВИДГ.Q        FC(1),               // Признак качества \n           ТЕНБВЕЛР          FC(4,1),             // Величина барической тенденции \n           ТЕНБВЕЛР.Q        FC(1);               // Признак качества \n   END НАБЛСРОК;\n	2	2434	Срочные данные	\N
tmsM_Sgm.aql	//  Маршрутные снегосъемки                     =_Sgm\n WA1 (32000) CHAR; \n \n IN: STREAM(R) TMSM;\n     PORTION RECORDS;\n \n   RECORDS NAT;\n     IF  (СТАНЦИЯ  * 1);\n     IF  (ГОД      * 2);\n     IF  (МЕСЯЦ    * 3);\n     WA1 = СТАНЦИЯ           FC(7),               // Станция\n           ГОД               FC(4),               // Год\n           МЕСЯЦ             FC(2);               // Месяц\n  RBODY СНЕГ;\n       GROUP СНСЬЕМКИ;\n         WA1 = КОЛИЧ             FC(2),           // Кол-во снегосъемок \n               МАРШРУТ           AA(5),           // Маршрут снегосъемки \n               ДАТА              FC(2),           // Дата проведения снегос'емки \n               СНЕСТЕПВ          FC(2),           // Степень покрытия окрестностей станции снегом  \n               СНЕСТЕПВ.Q        FC(1),           // Признак качества                              \n               СНЕСТПОК          FC(2),           // Степень покрытия маршрута снегом              \n               СНЕСТПОК.Q        FC(1),           // Признак качества                              \n               СНЕСТПЛК          FC(2),           // Степень покрытия маршрута ледяной коркой      \n               СНЕСТПЛК.Q        FC(1),           // Признак качества                              \n               СНЕГСВЫС          FC(4),           // Средняя высота снежного покрова на маршруте    \n               СНЕГСВЫС.Q        FC(1),           // Признак качества                              \n               СНЕВЫСМА          FC(4),           // Наибольшая высота снежного покрова на маршруте. \n               СНЕВЫСМА.Q        FC(1),           // Признак качества                              \n               СНЕВЫСМИ          FC(4),           // Наименьшая высота снежного покрова на маршруте. \n               СНЕВЫСМИ.Q        FC(1),           // Признак качества                              \n               СНЕГСРПЛ          FC(4,2),         // Средняя плотность снега                       \n               СНЕГСРПЛ.Q        FC(1),           // Признак качества                              \n               СНЕСРТЛК          FC(3),           // Средняя толщина ледяной корки                 \n               СНЕСРТЛК.Q        FC(1),           // Признак качества                              \n               СНЕГТСНВ          FC(3),           // Толщина слоя снега, насыщенногог водой        \n               СНЕГТСНВ.Q        FC(1),           // Признак качества                              \n               СНЕГТСЧВ          FC(2),           // Толщина слоя чистой воды                      \n               СНЕГТСЧВ.Q        FC(1),           // Признак качества                              \n               СПЗВСНЕГ          FC(4),           // Запас воды в снеге                            \n               СПЗВСНЕГ.Q        FC(1),           // Признак качества                              \n               СНПЗВОБЩ          FC(4),           // Запас воды, общий                             \n               СНПЗВОБЩ.Q        FC(1),           // Признак качества                              \n               СНЕГXАРЗ          FC(1),           // Характер залегания снежного покрова           \n               СНЕГXАРЗ.Q        FC(1),           // Признак качества                              \n               СНЕГXАРП          FC(1),           // Характер снежного покрова                     \n               СНЕГXАРП.Q        FC(1);           // Признак качества                              \n       END СНСЬЕМКИ;\n     END СНЕГ;\n    END RECORDS;\n	3	2532	Маршрутные снегосъемки	\N
tmsM_cw2.aql	//  Данные о ветре                             =_cw2 \nWA1 (32000) CHAR; \n \n IN: STREAM(R) TMSM;\n     PORTION RECORDS;\n    RECORDS NAT;\n     IF  (СТАНЦИЯ  * 1);\n     IF  (ГОД      * 2);\n     IF  (МЕСЯЦ    * 3);\n     WA1 = СТАНЦИЯ           FC(7),               // Станция\n           ГОД               FC(4),               // Год\n           МЕСЯЦ             FC(2);               // Месяц\n \n     RBODY ВЕТЕР;\n       WA1 = ВЕСКСРМС          FC(4,1),           // Среднее значение скорости ветра               \n             ВЕСКСРМС.Q        FC(1),             // Признак качества                              \n             ВЕСКМАМС          FC(3),             // Максимальное значение скорости ветра          \n             ВЕСКМАМС.Q        FC(1),             // Признак качества                              \n             ВЕСКЧМА1          FC(2),             // Дата 1-го максимума скорости ветра            \n             ВЕСКЧМА1.Q        FC(1),             // Признак качества                              \n             ВЕСКЧМА2          FC(2),             // Дата посл.максимума значение скорости ветра   \n             ВЕСКЧМА2.Q        FC(1);             // Признак качества                              \n       GROUP ЧСЛСКОРВ;                            //                              \n         WA1 = ГРАДАЦИИ          FC(2),           // Градации                                      \n               ВЕЧСГРСК          FC(3),           // Число случаев ветра по градации скорости ветра\n               ВЕЧСГРСК.Q        FC(1);           // Признак качества                              \n       END ЧСЛСКОРВ;                                                                               \n       WA1 = ВЕЧСШАМС          FC(3),             // Число случаев штиля                           \n             ВЕЧСШАМС.Q        FC(1),             // Признак качества                              \n             ВЕТПШТМС          FC(3),             // Повторяемость штиля                           \n             ВЕТПШТМС.Q        FC(1);             // Признак качества                              \n       GROUP ПОВНАПРВ;                            //                                               \n         WA1 = РУМБЫ16           FC(2),           // Список Румбы16                                \n               ВЕПОООМС          FC(3),           // Повтораемость ветра по направлениям           \n               ВЕПОООМС.Q        FC(1);           // Признак качества                              \n       END ПОВНАПРВ;                                                                               \n       GROUP СКВНАПР;                             //                                               \n         WA1 = РУМБЫ16           FC(2),           // Список Румбы16                                \n               ВЕСОООМС          FC(4,1),         // Сред.скорость ветра по направлениям           \n               ВЕСОООМС.Q        FC(1);           // Признак качества                              \n       END СКВНАПР;                                                                                \n       GROUP ЧСЛУЧНАП;                            //                                               \n         WA1 = РУМБЫ16           FC(2),           // Список Румбы 16                                \n               ВЕЧСНРМС          FC(3),           // Число случаев ветра по направлениям           \n               ВЕЧСНРМС.Q        FC(1);           // Признак качества                              \n       END ЧСЛУЧНАП;                                                                               \n       GROUP ЧСЛНАПРВ;                            //                                               \n         WA1 = РУМБЫ8            FC(1),           // Список Румбы 8                                 \n               ВЕЧС8РМС          FC(3),           // Число случаев ветра по направлениям           \n               ВЕЧС8РМС.Q        FC(1);           // Признак качества                              \n       END ЧСЛНАПРВ;                                                                               \n       GROUP ПОВТНАПР;                            //                                               \n         WA1 = РУМБЫ8            FC(1),           // Список Румбы 8                                 \n               ВЕПО8РМС          FC(3),           // Повторяемость ветра по направлениям           \n               ВЕПО8РМС.Q        FC(1);           // Признак качества                              \n       END ПОВТНАПР;                                                                               \n       GROUP СКВЕТРА;                             //                                               \n         WA1 = РУМБЫ8            FC(1),           // Список Румбы 8                                 \n               ВЕСК8РМС          FC(4,1),         // Сред.скорость ветра по направлениям           \n               ВЕСК8РМС.Q        FC(1);           // Признак качества                              \n       END СКВЕТРА;\n     END ВЕТЕР;\n   END RECORDS;\n	3	2533	Данные о ветре	\N
tmsM_To2.aql	//   Температура почвы на глубинах              =_To2\n WA1 (32000) CHAR; \n \n IN: STREAM(R) TMSM;\n     PORTION RECORDS;\n \n   RECORDS NAT;\n     IF  (СТАНЦИЯ  * 1);\n     IF  (ГОД      * 2);\n     IF  (МЕСЯЦ    * 3);\n     WA1 = СТАНЦИЯ           FC(7),               // Станция\n           ГОД               FC(4),               // Год\n           МЕСЯЦ             FC(2);               // Месяц\n \n     RBODY ТПОЧВЫ;\n       GROUP ТЕМПОГ;                              // Оголенная поверхность                                 \n         WA1 = ГЛУБИНЫ           FC(1);           // Индекс                                                \n         GROUP G1;                                //                                                       \n           WA1 = СРМАКМИН          FC(1),         // Индекс Оголенная поверхность                          \n                 ТЕМПОЧОГ          FC(5,1),       // Средняя макс,мин.температура почвы на глубине 5-20 см. \n                 ТЕМПОЧОГ.Q        FC(1);         // Признак качества                                      \n         END G1;                                                                                           \n       END ТЕМПОГ;                                                                                         \n       GROUP ТПОЧВЕСТ;                            // Естественный покров                                 \n         WA1 = ГЛУБИНЫ           FC(2);           // Индекс                                               \n         GROUP G2;                                //                                                       \n           WA1 = СРМАКМИН          FC(1),         // Индекс естественный покров                            \n                 ТЕМПЕПМС          FC(5,1),       // Сред,макс,мин.темп.почвы на глубине 0,02-3,2м          \n                 ТЕМПЕПМС.Q        FC(1);         // Признак качества                                      \n         END G2;                                                                                           \n       END ТПОЧВЕСТ;                                                                                       \n       GROUP ЧДНСМОР;                             //                                                       \n         WA1 = ГЛУБИНЫ           FC(2),           // Индекс                                                \n               ТПДМООМС          FC(2),           // Число дней с морозом на глубине 0,02-3,2 м.            \n               ТПДМООМС.Q        FC(1);           // Признак качества                                      \n       END ЧДНСМОР;\n     END ТПОЧВЫ;\n   END RECORDS;\n	3	2534	Температура почвы на глубинах	\N
tmsM_cD2.aql	//  Декадные выводы\t\t\t\t   =_cD2\n WA1 (32000) CHAR; \n \n IN: STREAM(R) TMSM;\n     PORTION RECORDS;\n \n   RECORDS NAT;\n     IF  (СТАНЦИЯ  * 1);\n     IF  (ГОД      * 2);\n     IF  (МЕСЯЦ    * 3);\n     WA1 = СТАНЦИЯ           FC(7),               // Станция\n           ГОД               FC(4),               // Год\n           МЕСЯЦ             FC(2);               // Месяц\n \n     RBODY ДЕКАДЫ;\n       GROUP ОБОБЩЕН;\n         WA1 = ДЕКАДЫ            FC(1),           // Индекс                                                         \n               ТЕМВСРДК          FC(5,1),         // Среднее значение темературы воздуха                            \n               ТЕМВСРДК.Q        FC(1),           // Признак качества                                               \n               ТЕВМАКДК          FC(5,1),         // Среднее значение максимальной темературы воздуха               \n               ТЕВМАКДК.Q        FC(1),           // Признак качества                                               \n               ТЕВМИНДК          FC(5,1),         // Среднее значение минимальной темературы воздуха                \n               ТЕВМИНДК.Q        FC(1),           // Признак качества                                               \n               ТЕППСРДК          FC(5,1),         // Среднее значение темературы поверхности почвы                  \n               ТЕППСРДК.Q        FC(1),           // Признак качества                                               \n               ТППСМАДК          FC(5,1),         // Среднее значение максимальной темературы поверхности почвы     \n               ТППСМАДК.Q        FC(1),           // Признак качества                                               \n               ТППСМИДК          FC(5,1),         // Среднее значение минимальной темературы поверхности почвы      \n               ТППСМИДК.Q        FC(1),           // Признак качества                                               \n               ТТРСМИДК          FC(5,1),         // Среднее значение минимальной темературы точки росы             \n               ТТРСМИДК.Q        FC(1),           // Признак качества                                               \n               УПРПСРДК          FC(5,2),         // Сред.знач.парциального давления водяного пара                  \n               УПРПСРДК.Q        FC(1),           // Признак качества                                               \n               УПРПСРДК.Q1       FC(1),           // указатель точности элемента                                    \n               ВЛОТСРДК          FC(3),           // Среднее значение относительной  влажности воздуха              \n               ВЛОТСРДК.Q        FC(1),           // Признак качества                                               \n               ВЛОСМИДК          FC(3),           // Среднее значение минимальной относительной  влажности воздуха  \n               ВЛОСМИДК.Q        FC(1),           // Признак качества                                               \n               НЕНАСРДК          FC(5,2),         // Среднее значение дефицита насыщения водяного пара              \n               НЕНАСРДК.Q        FC(1),           // Признак качества                                               \n               НЕНАСРДК.Q1       FC(1),           // указатель точности элемента                                    \n               НЕНСМАДК          FC(5,2),         // Среднее значение максимального дефицита насыщения водяного пара\n               НЕНСМАДК.Q        FC(1),           // Признак качества                                               \n               НЕНСМАДК.Q1       FC(1),           // указатель точности элемента                                    \n               ДАВВСРДК          FC(6,1),         // Среднее значение атмосферного давления на уровне станции       \n               ДАВВСРДК.Q        FC(1),           // Признак качества                                               \n               ДАУМСРДК          FC(6,1),         // Среднее значение атмосферного давления на уровне моря          \n               ДАУМСРДК.Q        FC(1),           // Признак качества                                               \n               ВЕСКСРДК          FC(4,1),         // Среднее значение скорости ветра                                \n               ВЕСКСРДК.Q        FC(1),           // Признак качества                                               \n               ОСАСРКДК          FC(6,1),         // Суммарное количество осадков за декаду                         \n               ОСАСРКДК.Q        FC(1),           // Признак качества                                               \n               СНВЫСОДК          FC(5,1),         // Средняя высота снежного покрова по 3-м рейкам                  \n               СНВЫСОДК.Q        FC(1);           // Признак качества                                               \n         GROUP ТПОЧВОГ;                           //                                                                \n           WA1 = ГЛУБИНЫ           FC(1),         // Индекс (огол.пов.0,05-0,2м)                                    \n                 ТЕМПОГДК          FC(5,1),       // Среднее значение температуры почвы на глубине                  \n                 ТЕМПОГДК.Q        FC(1);         // Признак качества                                               \n         END ТПОЧВОГ;                                                                                               \n         GROUP ТПОЧВЕСТ;                          //                                                                \n           WA1 = ГЛУБИНЫ           FC(2),         // Индекс (ест.покр.0,02-3,2 м.)                                   \n                 ТЕМПЕПДК          FC(5,1),       // Среднее значение температуры почвы на глубине                  \n                 ТЕМПЕПДК.Q        FC(1);         // Признак качества                                               \n         END ТПОЧВЕСТ;                                                                                              \n         WA1 = СНПСВЫСТ          FC(5,1),         // Средняя высота снежного покрова у почвы термом.                \n               СНПСВЫСТ.Q        FC(1);           // Признак качества                                               \n         GROUP GELIO;                             //                                                                \n           WA1 = ИНТЕРВАЛ          FC(2),         // Интервал                                                       \n                 СССПРЧДК          FC(4,1),       // Суммарная продолжительность солнечного сияния за интервал      \n                 СССПРЧДК.Q        FC(1);         // Признак качества                                               \n         END GELIO;                                                                                                 \n         WA1 = СОЛСПРДК          FC(5,1),         // Суммарная продолжительность солнечного сияния за декаду        \n               СОЛСПРДК.Q        FC(1);           // Признак качества                                               \n       END ОБОБЩЕН;\n     END ДЕКАДЫ;\n   END RECORDS;\n	3	2535	Декадные выводы	\N
tmsM_Aj2.aql	//  Атмосферные явления                        =_Aj2\n\nWA1 (10000) CHAR;\n\nIN: STREAM(R) TMSM;\n    PORTION RECORDS.MONAT;\n\n  RECORDS NAT;\n     IF  (СТАНЦИЯ  * 1);\n     IF  (ГОД      * 2);\n     IF  (МЕСЯЦ    * 3);\n     WA1 = СТАНЦИЯ           FC(7),               // Станция                         \n           ГОД               FC(4),               // Год                      \n           МЕСЯЦ             FC(2);               // Месяц                                   \n    RBODY MONAT;                                                                                              \n      GROUP ЧИСЛДНАЯ;                             //                                                          \n        WA1 = ВИДЫАЯ      FC(2,0),                // Индекс видов АЯ                                                \n              АЯЧДООМС    FC(2,0),                // Число дней с атмосферными явлениями                    \n              АЯЧДООМС.Q  FC(1,0);                // Признак качества                                         \n      END ЧИСЛДНАЯ;                                                                                           \n      GROUP ПРОДОЛАЯ;                             //                                                          \n        WA1 = ВИДЫАЯ      FC(2,0),                // Индекс                                  \n              АЯПРООМС    FC(3,0),                // Продолжительность атмосферного явления  \n              АЯПРООМС.Q  FC(1,0);                // Признак качества                        \n      END ПРОДОЛАЯ;\n    END MONAT;\n  END RECORDS;\n	3	2536	Атмосферные явления	\N
tmsM_Ss2.aql	//  Солнечное сияние                           =_Ss2\n// VVM;\nWA1 (10000) CHAR;\n\nIN: STREAM(R) TMSM;\n    PORTION RECORDS.MONAT;\n\n  RECORDS NAT;\n     IF  (СТАНЦИЯ  * 1);\n     IF  (ГОД      * 2);\n     IF  (МЕСЯЦ    * 3);\n     WA1 = СТАНЦИЯ           FC(7),               // Станция\n           ГОД               FC(4),               // Год\n           МЕСЯЦ             FC(2);               // Месяц\n    RBODY MONAT;\n      GROUP GELIOGR;\n        WA1 = ИНТЕРВАЛ    FC(2,0),              // Интервал                                                     \n              СССПРЧМС    FC(4,1),              // Суммарная продолжительность солнечного сияния за интервал    \n              СССПРЧМС.Q  FC(1,0);              // Признак качества                                             \n      END GELIOGR;\n      WA1 = СОЛСПРМС    FC(5,1),                // Суммарная продолжительность  солнечного сияния за за месяц          \n            СОЛСПРМС.Q  FC(1,0),                // Признак качества                                                    \n            СССПДСМС    FC(4,1),                // Средняя продолжительность солнечного сияния за день с солнцем       \n            СССПДСМС.Q  FC(1,0),                // Признак качества                                                    \n            ССМВПРМС    FC(5,1),                // Максимально возможная продолжительность солнечного сияния           \n            ССМВПРМС.Q  FC(1,0),                // Признак качества                                                    \n            СОЛОТНМС    FC(3,0),                // Относительная продолжительность солнечного сияния                   \n            СОЛОТНМС.Q  FC(1,0),                // Признак качества                                                    \n            ССЧДБСМС    FC(2,0),                // Число дней без солнца                                               \n            ССЧДБСМС.Q  FC(1,0),                // Признак качества                                                    \n            ССЧДБСПН    FC(2,0),                // Число дней без солнца из-за полярной ночи                           \n            ССЧДБСПН.Q  FC(1,0);                // Признак качества                                                    \n        GROUP ПРОДОЛСС;\n        WA1 = ДЕКАДА      FC(1,0),              // Индекс                                                      \n              ССМАКПДК    FC(3,0),              // Максимально возможная продолжит.солнечного сияния за декаду \n              ССМАКПДК.Q  FC(1,0);              // Признак качества                                            \n      END ПРОДОЛСС;\n    END MONAT;\n  END RECORDS;\n	3	2537	Солнечное сияние	\N
tmsM_p22.aql	//  Данные плювиографа    (Интервалы)                     =_P22\n WA1 (32000) CHAR; \n \n IN: STREAM(R) TMSM;\n     PORTION RECORDS;\n \n   RECORDS NAT;\n     IF  (СТАНЦИЯ  * 1);\n     IF  (ГОД      * 2);\n     IF  (МЕСЯЦ    * 3);\n     WA1 = СТАНЦИЯ           FC(7),               // Станция\n           ГОД               FC(4),               // Год\n           МЕСЯЦ             FC(2);               // Месяц\n \n     RBODY REGEN;\n       WA1 = NДОЖДЯ            FC(3);             // Номер дождя                                           \n       GROUP INT;                                 //                                                       \n         WA1 = ИНТЕРВАЛ          FC(3),           // Номер интервала                                       \n               ОСАВКППИ          FC(4),           // Время окончания первого постоянного интервала (часы)  \n               ОСАВКППИ.Q        FC(1),           // Признак качества                                      \n               ОСАВКПИМ          FC(2),           // Время окончания первого постоянного интервала (минуты)\n               ОСАВКПИМ.Q        FC(1),           // Признак качества                                      \n               ОСАККППИ          FC(6,1),         // Количество осадков на конечный период                 \n               ОСАККППИ.Q        FC(1),           // Признак качества                                      \n               ОСАИНТИР          FC(5,2),         // Средняя интенсивность за период                       \n               ОСАИНТИР.Q        FC(1);           // Признак качества                                      \n       END INT;\n     END REGEN;\n   END RECORDS;\n	3	2538	Данные плювиографа (интервалы)	\N
tmsM_Sxm.aql	// Характеристики маршрутных сЪемок     =_Sxm\n//VVM;\nWA1 (10000) CHAR;\n\nIN: STREAM(R) TMSM;\n    PORTION RECORDS.MONAT;\n\n  RECORDS NAT;\n     IF  (СТАНЦИЯ  * 1);\n     IF  (ГОД      * 2);\n     IF  (МЕСЯЦ    * 3);\n     WA1 = СТАНЦИЯ           FC(7),               // Станция\n           ГОД               FC(4),               // Год\n           МЕСЯЦ             FC(2);               // Месяц\n    RBODY MONAT;\n        WA1 = КСНЕГОСП    FC(1,0),              // Кол-во снегосъемок по полевому маршруту\n              КСНЕГОСП.Q  FC(1,0),              // Признак качества                       \n              КСНЕГОСЛ    FC(1,0),              // Кол-во снегосъемок по лесному маршруту \n              КСНЕГОСЛ.Q  FC(1,0),              // Признак качества                       \n              КСНЕГОСБ    FC(1,0),              // Кол-во снегосъемок по балкам(оврагам)  \n              КСНЕГОСБ.Q  FC(1,0);              // Признак качества                       \n     END MONAT;\n  END RECORDS;\n	3	2539	Характеристики маршрутных снегосъемок	\N
tmsM_Ad2.aql	// Атмосферное давление, осадки               =_Ad2\n//VVM;\nWA1 (10000) CHAR;\n\nIN: STREAM(R) TMSM;\n    PORTION RECORDS.MONAT;\n\n  RECORDS NAT;\n     IF  (СТАНЦИЯ  * 1);\n     IF  (ГОД      * 2);\n     IF  (МЕСЯЦ    * 3);\n     WA1 = СТАНЦИЯ           FC(7),               // Станция\n           ГОД               FC(4),               // Год\n           МЕСЯЦ             FC(2);               // Месяц\n    RBODY MONAT;\n      WA1 = ДАВВСРМС    FC(6,1),                // Среднее значение атмосферного  давления на уровне станции           \n            ДАВВСРМС.Q  FC(1,0),                // Признак качества                                                    \n            ДАВМАКМС    FC(6,1),                // Абсолютный максимум атмосферного давления на уровне станции         \n            ДАВМАКМС.Q  FC(1,0),                // Признак качества                                                    \n            ДАВЧАМА1    FC(2,0),                // Дата 1-го абсолютного максимума атм.давления на уровне станции      \n            ДАВЧАМА1.Q  FC(1,0),                // Признак качества                                                    \n            ДАВЧАМА2    FC(2,0),                // Дата последнего абсолютного максимума атм.давления на уровне станции\n            ДАВЧАМА2.Q  FC(1,0),                // Признак качества                                                    \n            ДАВАМИМС    FC(6,1),                // Абсолютный минимум атмосферного давления на уровне станции          \n            ДАВАМИМС.Q  FC(1,0),                // Признак качества                                                    \n            ДАВЧАМИ1    FC(2,0),                // Дата 1-го абсолютного минимума атм.давления на уровне станции       \n            ДАВЧАМИ1.Q  FC(1,0),                // Признак качества                                                    \n            ДАВЧАМИ2    FC(2,0),                // Дата последнего абсолютного минимума атм.давления на уровне станции \n            ДАВЧАМИ2.Q  FC(1,0),                // Признак качества                                                    \n            ДАУМСРМС    FC(6,1),                // Среднее значение атмосферного давления на уровне станции            \n            ДАУМСРМС.Q  FC(1,0),                // Признак качества                                                    \n            ОССУМНМС    FC(7,1),                // Месячное количество осадков за ночь                                 \n            ОССУМНМС.Q  FC(1,0),                // Признак качества                                                    \n            ОССУМДМС    FC(7,1),                // Месячное количество осадков за день                                 \n            ОССУМДМС.Q  FC(1,0),                // Признак качества                                                    \n            ОСАСУММС    FC(7,1),                // Сумма осадков                                                       \n            ОСАСУММС.Q  FC(1,0),                // Признак качества                                                    \n            ОССМАУМС    FC(6,1),                // Максимальное количество осадков за сутки                            \n            ОССМАУМС.Q  FC(1,0),                // Признак качества                                                    \n            ОСЧМАУМ1    FC(2,0),                // Дата 1-го максимума осадков за сутки                                \n            ОСЧМАУМ1.Q  FC(1,0),                // Признак качества                                                    \n            ОСЧМАУМ2    FC(2,0),                // Дата последнего максимума осадков за сутки                          \n            ОСЧМАУМ2.Q  FC(1,0),                // Признак качества                                                    \n            ОССУМПМС    FC(4,1),                // Суммарная поправка на смачивание                                    \n            ОССУМПМС.Q  FC(1,0);                // Признак качества                                                    \n      GROUP ЧИСЛОДН;\n        WA1 = ГРАДАЦИИ    FC(2,0),              // Индекс видов атмосферных явлений\n              ОСДСООМС    FC(2,0),              // Число дней с количеством осадков не менее\n              ОСДСООМС.Q  FC(1,0);              // Признак качества\n      END ЧИСЛОДН;\n    END MONAT;\n  END RECORDS;\n	3	2540	Атмосферное давление, осадки	\N
tmsM_Tv2.aql	// Температура воздуха, почвы, влажность      =_Tv2\n// VVM;\nWA1 (10000) CHAR;\n\nIN: STREAM(R) TMSM;\n    PORTION RECORDS.MONAT;\n\n  RECORDS NAT;\n     IF  (СТАНЦИЯ  * 1);\n     IF  (ГОД      * 2);\n     IF  (МЕСЯЦ    * 3);\n     WA1 = СТАНЦИЯ           FC(7),               // Станция\n           ГОД               FC(4),               // Год\n           МЕСЯЦ             FC(2);               // Месяц\n          \n    RBODY MONAT;\n      WA1 = ТЕМВСРМС    FC(5,1),                // Средняя температура воздуха                                                  \n            ТЕМВСРМС.Q  FC(1,0),                // Признак качества                                                             \n            ТЕВМАКМС    FC(5,1),                // Средняя максимальная температура воздуха                                     \n            ТЕВМАКМС.Q  FC(1,0),                // Признак качества                                                             \n            ТЕВМИНМС    FC(5,1),                // Средняя минимальная температура воздуха                                      \n            ТЕВМИНМС.Q  FC(1,0),                // Признак качества                                                             \n            ТЕВАМАМС    FC(6,1),                // Абсолютный максимум температуры воздуха                                      \n            ТЕВАМАМС.Q  FC(1,0),                // Признак качества                                                             \n            ТВЧАМАМ1    FC(2,0),                // Дата 1-го абсолютного максимума температуры воздуха                          \n            ТВЧАМАМ1.Q  FC(1,0),                // Признак качества                                                             \n            ТВЧАМАМ2    FC(2,0),                // Дата последнего абсолютного максимума температуры воздуха                    \n            ТВЧАМАМ2.Q  FC(1,0),                // Признак качества                                                             \n            ТЕВАМИМС    FC(5,1),                // Абсолютный минимум температуры воздуха                                       \n            ТЕВАМИМС.Q  FC(1,0),                // Признак качества                                                             \n            ТВЧАМИМ1    FC(2,0),                // Дата 1-го абсолютного минимума температуры воздуха                           \n            ТВЧАМИМ1.Q  FC(1,0),                // Признак качества                                                             \n            ТВЧАМИМ2    FC(2,0),                // Дата последнего абсолютного минимума температуры воздуха                     \n            ТВЧАМИМ2.Q  FC(1,0),                // Признак качества                                                             \n            ТВЧДБОМС    FC(2,0),                // Число дней без оттепели                                                      \n            ТВЧДБОМС.Q  FC(1,0),                // Признак качества                                                             \n            ТВЧДСММС    FC(2,0),                // Число дней с морозом                                                         \n            ТВЧДСММС.Q  FC(1,0),                // Признак качества                                                             \n            ТЕППСРМС    FC(5,1),                // Средняя температура поверхности почвы                                        \n            ТЕППСРМС.Q  FC(1,0),                // Признак качества                                                             \n            ТППСМАМС    FC(5,1),                // Средняя максимальная температура поверхности почвы                           \n            ТППСМАМС.Q  FC(1,0),                // Признак качества                                                             \n            ТППСМИМС    FC(5,1),                // Средняя минимальная температура поверхности почвы                            \n            ТППСМИМС.Q  FC(1,0),                // Признак качества                                                             \n            ТППАМАМС    FC(5,1),                // Абсолютный максимум температуры поверхности почвы                            \n            ТППАМАМС.Q  FC(1,0),                // Признак качества                                                             \n            ТППЧАМА1    FC(2,0),                // Дата 1-го абсолютного максимума температуры поверхности почвы                \n            ТППЧАМА1.Q  FC(1,0),                // Признак качества                                                             \n            ТППЧАМА2    FC(2,0),                // Дата последнего абсолютного максимума температуры поверхности почвы          \n            ТППЧАМА2.Q  FC(1,0),                // Признак качества                                                             \n            ТППАМИМС    FC(5,1),                // Абсолютный минимум  температуры поверхности почвы                            \n            ТППАМИМС.Q  FC(1,0),                // Признак качества                                                             \n            ТППЧАМИ1    FC(2,0),                // Дата 1-го абсолютного минимума температуры поверхности почвы                 \n            ТППЧАМИ1.Q  FC(1,0),                // Признак качества                                                             \n            ТППЧАМИ2    FC(2,0),                // Дата последнего абсолютного минимума температуры поверхности почвы           \n            ТППЧАМИ2.Q  FC(1,0),                // Признак качества                                                             \n            ТППЧДММС    FC(2,0),                // Число дней с морозом на поверхности почвы                                    \n            ТППЧДММС.Q  FC(1,0),                // Признак качества                                                             \n            УПРПСРМС    FC(5,2),                // Среднее значение парциального давления водяного пара                         \n            УПРПСРМС.Q  FC(1,0),                // Признак качества                                                             \n            УПРПСРМС.Q1 FC(1,0),                // указатель точности элемента                                                  \n            УПРАМАМС    FC(5,2),                // Абсолютный максимум парциального давления водяного пара                      \n            УПРАМАМС.Q  FC(1,0),                // Признак качества                                                             \n            УПРАМАМС.Q1 FC(1,0),                // указатель точности элемента                                                  \n            УПРЧАМА1    FC(2,0),                // Дата 1-го абсолютного макс. парциального давления водяного пара              \n            УПРЧАМА1.Q  FC(1,0),                // Признак качества                                                             \n            УПРЧАМА2    FC(2,0),                // Дата последнего абсолютн максимума парциального давления водяного пара       \n            УПРЧАМА2.Q  FC(1,0),                // Признак качества                                                             \n            УПРАМИМС    FC(5,2),                // Абсолбтный минимум парциального давления водяного пара                       \n            УПРАМИМС.Q  FC(1,0),                // Признак качества                                                             \n            УПРАМИМС.Q1 FC(1,0),                // указатель точности элемента                                                  \n            УПРЧАМИ1    FC(2,0),                // Дата 1-го абсолютного минимума парциального давления водяного пара           \n            УПРЧАМИ1.Q  FC(1,0),                // Признак качества                                                             \n            УПРЧАМИ2    FC(2,0),                // Дата последнего абсолютного минимума парциального давления водяного пара     \n            УПРЧАМИ2.Q  FC(1,0),                // Признак качества                                                             \n            ВЛОТСРМС    FC(3,0),                // Среднее значение относительной влажности воздуха                             \n            ВЛОТСРМС.Q  FC(1,0),                // Признак качества                                                             \n            ВЛОТМИМС    FC(3,0),                // Среднее минимальное значение относительной влажности воздуха                 \n            ВЛОТМИМС.Q  FC(1,0),                // Признак качества                                                             \n            ВЛОАМИМС    FC(3,0),                // Абсолютный минимум относительной влажности воздуха                           \n            ВЛОАМИМС.Q  FC(1,0),                // Признак качества                                                             \n            ВЛОЧАМИ1    FC(2,0),                // Дата 1-го абсолютного минимума относительной влажности воздуха               \n            ВЛОЧАМИ1.Q  FC(1,0),                // Признак качества                                                             \n            ВЛОЧАМИ2    FC(2,0),                // Дата последнего абсолютного минимума относительной влажности воздуха         \n            ВЛОЧАМИ2.Q  FC(1,0),                // Признак качества                                                             \n            ВЛЧД30МС    FC(2,0),                // Число дней с относительной влажностью не более 30%                           \n            ВЛЧД30МС.Q  FC(1,0),                // Признак качества                                                             \n            ВЛЧД80МС    FC(2,0),                // Число дней с относительной влажностью не менее 80%                           \n            ВЛЧД80МС.Q  FC(1,0),                // Признак качества                                                             \n            НЕДНСРМС    FC(5,2),                // Среднее значение дефицита насыщения водяного пара                            \n            НЕДНСРМС.Q  FC(1,0),                // Признак качества                                                             \n            НЕДНСРМС.Q1 FC(1,0),                // указатель точн.элемента                                                      \n            НЕДНМАМС    FC(5,2),                // Среднее значение максимального дефицита насыщености водяного пара            \n            НЕДНМАМС.Q  FC(1,0),                // Признак качества                                                             \n            НЕДНМАМС.Q1 FC(1,0),                // Указатель точности элемента                                                  \n            НЕНАМАМС    FC(5,2),                // Абсолютный максимум дефицита насыщености водяного пара                       \n            НЕНАМАМС.Q  FC(1,0),                // Признак качества                                                             \n            НЕНАМАМС.Q1 FC(1,0),                // Указатель точности элемента                                                  \n            ННЧАМАМ1    FC(2,0),                // Дата 1-го абсолютного максимума дефицита насыщености водяного пара           \n            ННЧАМАМ1.Q  FC(1,0),                // Признак качества                                                             \n            ННЧАМАМ2    FC(2,0),                // Дата последнего абсолютного максимума дефицита насыщености водяного пара     \n            ННЧАМАМ2.Q  FC(1,0),                // Признак качества                                                             \n            РОСАСРМС    FC(5,1),                // Среднне значение температуры точки росы                                      \n            РОСАСРМС.Q  FC(1,0),                // Признак качества                                                             \n            ТТРСМИМС    FC(5,1),                // Среднее значение  минимальной температуры точки росы                         \n            ТТРСМИМС.Q  FC(1,0),                // Признак качества                                                             \n            ТЕДПРЗГД    FC(2,0),                // Дата 1-го мороза в воздухе          \n            ТЕДПРЗГД.Q  FC(1,0),                // Признак качества                    \n            ТЕДПСЗГД    FC(2,0),                // Дата посл.мороза в воздухе          \n            ТЕДПСЗГД.Q  FC(1,0),                // Признак качества                    \n            ТПДПРЗГД    FC(2,0),                // Дата 1-го мороза на почве           \n            ТПДПРЗГД.Q  FC(1,0),                // Признак качества                    \n            ТПДПСЗГД    FC(2,0),                // Дата последнего мороза на почве     \n            ТПДПСЗГД.Q  FC(1,0);                // Признак качества                    \n      GROUP БЕТА;                               //       \n        WA1 = ДЕКАДА      FC(1,0),              // Индекс\n              ПРСУТКСР    FC(1,0),              // Суточн.колич. сроков набл.т-ры.почвы,естест.покр.на глуб.(2-40 см) \n              ПРСУТКСР.Q  FC(1,0);              // Признак качества\n      END БЕТА;\n    END MONAT;\n  END RECORDS;\n	3	2541	Температура воздуха, почвы, влажность	\N
tmsM_Tr2.aql	//  Замена термометров, счетчики               =_Tr2\n// VVM;\nWA1 (10000) CHAR;\n\nIN: STREAM(R) TMSM;\n    PORTION RECORDS.MONAT;\n\n  RECORDS NAT;\n     IF  (СТАНЦИЯ  * 1);\n     IF  (ГОД      * 2);\n     IF  (МЕСЯЦ    * 3);\n     WA1 = СТАНЦИЯ           FC(7),               // Станция\n           ГОД               FC(4),               // Год\n           МЕСЯЦ             FC(2);               // Месяц\n     RBODY MONAT;\n        WA1 = ДЗАМСТЕР    FC(2,0),              // Дата замены термомометра на глубине под естественным покрытием         \n            ДЗАМСТЕР.Q  FC(1,0),                // Признак качества                                                       \n            СРОКЗСТР    FC(2,0),                // Срок замены термометра на глубине под естественным покрытием           \n            СРОКЗСТР.Q  FC(1,0);                // Признак качества                                                       \n      GROUP ЗАММИНТ;\n        WA1 = ЗАМЕНАМТ    FC(1,0),              // Индекс                                     \n              ДАТАЗАМТ    FC(2,0),              // Дата замены минимального термометра        \n              ДАТАЗАМТ.Q  FC(1,0),              // Признак качества                           \n              СРОКЗАМТ    FC(2,0),              // Срок замены минимального термометра        \n              СРОКЗАМТ.Q  FC(1,0);              // Признак качества                           \n      END ЗАММИНТ;\n      GROUP ДЕЛЬТА;\n        WA1 = ДЕКАДА      FC(1,0),              // Индекс                                           \n              ОССУМПДК    FC(3,1),              // Сумарные поправки на смачивание осадковза декаду \n              ОССУМПДК.Q  FC(1,0);              // Признак качества                                 \n      END ДЕЛЬТА;\n      GROUP ДОППТМИН;\n        WA1 = КДОППОПР    FC(1,0),              // Индекс                                                 \n              ДОППМИНТ    FC(2,0),              // Дополнительные  поправки минимального термометра       \n              ДОППМИНТ.Q  FC(1,0);              // Признак качества                                   \n      END ДОППТМИН;\n      WA1 = КОЛДОППР    FC(1,0),                // Количество дополнит. поправок мин.термом.      \n            ПРВВЕДП     FC(1,0);                // Признак введенной поправки                     \n    END MONAT;\n  END RECORDS;\n	3	2542	Замена термометров, счетчики	\N
tms_ct2.aql	 WA1 (10000) CHAR; \n \n IN: STREAM(R) TMS;\n     PORTION RECORDS;\n \n   RECORDS NAT;\n     IF  (СТАНЦИЯ  * 1);\n     IF  (ГОД      * 2);\n     IF  (МЕСЯЦ    * 3);\n     IF  (ТИПЗАП   * 4);\n     WA1 = СТАНЦИЯ           FC(7),               // Станция\n           ГОД               FC(4),               // Год\n           МЕСЯЦ             FC(2),               // Месяц\n           ТИПЗАП            FC(1);               // Тип записи (1-9)\n   END RECORDS;\n	3	2495	Признаки (Год, Мес, Станция, Тип записи)	\N
tmsM_p21.aql	//  Данные плювиографа  (Общие)                       =_P21\n WA1 (32000) CHAR; \n \n IN: STREAM(R) TMSM;\n     PORTION RECORDS;\n \n   RECORDS NAT;\n     IF  (СТАНЦИЯ  * 1);\n     IF  (ГОД      * 2);\n     IF  (МЕСЯЦ    * 3);\n     WA1 = СТАНЦИЯ           FC(7),               // Станция\n           ГОД               FC(4),               // Год\n           МЕСЯЦ             FC(2);               // Месяц\n \n     RBODY REGEN;\n       WA1 = NДОЖДЯ            FC(3),             // Номер дождя                                           \n //          СЧINТ             FC(3),             // Счетчик переходов с равной интенсивностью             \n             ОСАПРПЕР          FC(1),             // Признак перехода дождя через границу месяца           \n             ОСАПРПЕР.Q        FC(1),             // Признак качества                                      \n             ОСАДЧИСР          FC(2),             // День начала дождя                                     \n             ОСАДЧИСК          FC(2),             // День окончания дождя                                  \n             ОСАДЧИСК.Q        FC(1),             // Признак качества. Относится к обеим датам             \n             ОСАДВРЕМ          FC(4),             // Время начала дождя (часы)                             \n             ОСАДВРЕМ.Q        FC(1),             // Признак качества                                      \n             ОСАДВРМ           FC(2),             // Время начала дождя (минуты)                           \n             ОСАДВРМ.Q         FC(1),             // Признак качества                                      \n             ОСАКОЛ1Ч          FC(6,1),           // Количество осадков за 1 час дождя                     \n             ОСАКОЛ1Ч.Q        FC(1),             // Признак качества                                      \n             ОСАДПРОД          FC(4),             // Продолжительность дождя (часы)                        \n             ОСАДПРОД.Q        FC(1),             // Признак качества                                      \n             ОСАДПРМ           FC(2),             // Продолжительность дождя (минуты)                      \n             ОСАДПРМ.Q         FC(1),             // Признак качества                                      \n             ОСАКОЛДЖ          FC(6,1),           // Количество осадков за 2 часа дождя                    \n             ОСАКОЛДЖ.Q        FC(1),             // Признак качества                                      \n             ОСАСРИНТ          FC(5,2),           // Средняя интенсивность дождя                           \n             ОСАСРИНТ.Q        FC(1),             // Признак качества                                      \n             ОСАСУМПР          FC(4),             // Суммарная продолжиельность дождя (часы)               \n             ОСАСУМПР.Q        FC(1),             // Признак качества                                      \n             ОСАСУММ           FC(2),             // Суммарная продолжительность дождя (минуты)            \n             ОСАСУММ.Q         FC(1),             // Признак качества                                      \n             ОСАСКОЛД          FC(6,1),           // Суммарное колчество осадков за дождь                  \n             ОСАСКОЛД.Q        FC(1),             // Признак качества                                      \n             ОСАСИНТД          FC(5,2),           // Средняя интенсивность всего дождя                     \n             ОСАСИНТД.Q        FC(1);             // Признак качества                                      \n     END REGEN;\n   END RECORDS;\n	3	2543	Данные плювиографа (общие)	\N
Tpgks_all.aql	 WA1 (10000) CHAR; \n \n IN: STREAM(R) TPGKS;\n     PORTION НАБЛДЕНЬ;\n \n   RECORD НАБЛДЕНЬ NAT;\n     IF  (ГОД      * 1);\n     IF  (МЕСЯЦ    * 2);\n     IF  (ДЕНЬ     * 3);\n     WA1 = СТАНЦИЯ           FC(5),     // Координатный номер станции \n           ГОД               FC(4),     // Год \n           МЕСЯЦ             FC(2),     // Месяц \n           ДЕНЬ              FC(2),     // День \n           ТЕМП05            FC(4),     // Температура на глубине  5 см, увеличенная в 10 раз \n           ТЕМП05.Q          FC(2),     // Признак качества \n           ТЕМП10            FC(4),     // Температура на глубине 10 см, увеличенная в 10 раз \n           ТЕМП10.Q          FC(2),     // Признак качества \n           ТЕМП15            FC(4),     // Температура на глубине 15 см, увеличенная в 10 раз \n           ТЕМП15.Q          FC(2),     // Признак качества \n           ТЕМП20            FC(4),     // Температура на глубине 20 см, увеличенная в 10 раз \n           ТЕМП20.Q          FC(2);     // Признак качества \n  \t\t\n END НАБЛДЕНЬ;\n	2	2435	Суточные данные	\N
Tpg_all.aql	 WA1 (32000) CHAR; \n \n IN: STREAM(R) TPG;\n     PORTION НАБЛДЕНЬ;\n \n   RECORD НАБЛДЕНЬ NAT;\n     IF  (ГОД      * 1);\n     IF  (МЕСЯЦ    * 2);\n     IF  (ДЕНЬ     * 3);\n     WA1 = СТАНЦИЯ           FC(5),               // Индекс ВМО \n           ГОД               FC(4),               // Год \n           МЕСЯЦ             FC(2),               // Месяц \n           ДЕНЬ              FC(2),               // День \n           T02               FC(5,1),             // Температура на глубине 2 см \n           T02.Q             FC(1),               // Признак качества \n           T05               FC(5,1),             // Температура на глубине 5 см \n           T05.Q             FC(1),               // Признак качества \n           T10               FC(5,1),             // Температура на глубине 10 см \n           T10.Q             FC(1),               // Признак качества \n           T15               FC(5,1),             // Температура на глубине 15 см \n           T15.Q             FC(1),               // Признак качества \n           T20               FC(5,1),             // Температура на глубине 20 см \n           T20.Q             FC(1),               // Признак качества \n           T40               FC(5,1),             // Температура на глубине 40 см \n           T40.Q             FC(1),               // Признак качества \n           T60               FC(5,1),             // Температура на глубине 60 см \n           T60.Q             FC(1),               // Признак качества \n           T80               FC(5,1),             // Температура на глубине 80 см \n           T80.Q             FC(1),               // Признак качества \n           T120              FC(5,1),             // Температура на глубине 120 см \n           T120.Q            FC(1),               // Признак качества \n           T160              FC(5,1),             // Температура на глубине 160 см \n           T160.Q            FC(1),               // Признак качества \n           T240              FC(5,1),             // Температура на глубине 240 см \n           T240.Q            FC(1),               // Признак качества \n           T320              FC(5,1),             // Температура на глубине 320 см \n           T320.Q            FC(1);               // Признак качества \n   END НАБЛДЕНЬ;\n	2	2436	Суточные данные	\N
Tttr_all.aql	 WA1 (10000) CHAR; \n \n IN: STREAM(R) TTTR;\n     PORTION НАБЛДЕНЬ;\n \n   RECORD НАБЛДЕНЬ NAT;\n     IF  (ГОД      * 1);\n     IF  (МЕСЯЦ    * 2);\n     IF  (ДЕНЬ     * 3);\n     WA1 = СТАНЦИЯ      FC(5),     // Индекс ВМО             \n           ГОД          FC(4),     // Год                    \n           МЕСЯЦ        FC(2),     // Месяц                \n           ДЕНЬ         FC(2),     // День    \n           QTTT         FC(1),     // Общий признак качества температур                \n           ТЕВМИНСТ     FC(5,1),   // Минимальная температура воздуха  \n           ТЕВМИНСТ.Q   FC(1),     // Признак качества                 \n           ТЕМВСРСТ     FC(5,1),   // Средняя температура воздуха      \n           ТЕМВСРСТ.Q   FC(1),     // Признак качества                 \n           ТЕВМАКСТ     FC(5,1),   // Максимальная температура воздуха \n           ТЕВМАКСТ.Q   FC(1),     // Признак качества                 \n           ОСАДКОЛМ     FC(5,1),   // Количество осадков              \n           ОСАДКОЛМ.QО  FC(1),     // Дополнительная характеристика   \n           ОСАДКОЛМ.Q   FC(1);     // Признак качества\n   END НАБЛДЕНЬ;                                                                       \n	2	2437	Суточные данные	\N
snma_all.aql	 WA1 (32000) CHAR; \n \n IN: STREAM(R) SNMAR;\n     PORTION НАБЛМАРШ;\n \n   RECORD НАБЛМАРШ NAT;\n     IF  (ГОД      * 1);\n     IF  (МЕСЯЦ    * 2);\n     IF  (ТИПМАРШ  * 3);\n     IF  (ДЕНЬ     * 4);\n     WA1 = СТАНЦИЯ  FC(5),        // Индекс ВМО \n           ГОД      FC(4),        // Год \n           МЕСЯЦ    FC(2),        // Месяц \n           ТИПМАРШ  FC(2),        // Тип маршрута                                        \n           ДЕНЬ     FC(2),        // День                                                \n           СНЕСТЕПВ FC(2),        // Степень покрытия окрестности станции снегом         \n           СНЕСТПОК FC(2),        // Степень покрытия маршрута снегом                    \n           СНЕСТПЛК FC(2),        // Степень покрытия маршрута ледяной коркой            \n           СНЕГСВЫС FC(4),        // Средняя высота снежного покрова на маршруте (см)    \n           СНЕВЫСМА FC(4),        // Наибольшая высота снежного покрова на маршруте (см) \n           СНЕВЫСМИ FC(4),        // Наименьшая высота снежного покрова на маршруте (см) \n           СНЕГСРПЛ FC(4,2),      // Средняя плотность снега                             \n           СНЕСРТЛК FC(3),        // Средняя толщина ледяной корки                       \n           СНЕГТСНВ FC(3),        // Толщина слоя снега, насыщенного водой (мм)          \n           СНЕГТСЧВ FC(2),        // Толщина слоя чистой воды (мм)                       \n           СПЗВСНЕГ FC(4),        // Запас воды в снеге (мм)                             \n           СНПЗВОБЩ FC(4),        // Запас воды, общий (мм)                              \n           СНЕГXАРЗ FC(1),        // Характер залегания снежного покрова                 \n           СНЕГXАРП FC(1);        // Характер снежного покрова                           \n   END НАБЛМАРШ;\n	2	2438	Данные снегосъемок	\N
snow_all.aql	 WA1 (32000) CHAR; \n \n IN: STREAM(R) SNOW;\n     PORTION НАБЛДЕНЬ;\n \n   RECORD НАБЛДЕНЬ NAT;\n     IF  (ГОД      * 1);\n     IF  (МЕСЯЦ    * 2);\n     IF  (ДЕНЬ     * 3);\n     WA1 = СТАНЦИЯ           FC(5),               // Индекс ВМО \n           ГОД               FC(4),               // Год \n           МЕСЯЦ             FC(2),               // Месяц \n           ДЕНЬ              FC(2),               // День \n           СНЕПВЫСМ          FC(4),               // Высота снежного покрова \n           СНЕСТЕПВ          FC(2),               // Степень покрова окрестности станции снегом \n           Q1                FC(1),               // Дополнительная информация о высоте снежного покрова \n           Q2                FC(1),               // Признак качества по высоте снежного покрова \n           Q3                FC(1);               // Дополнительная информация с учетом температуры воздуха \n   END НАБЛДЕНЬ;\n	2	2439	Суточные данные	\N
BOUND_all.aql	 WA1 (32000) CHAR; \n \n IN: STREAM(R) BOUND;\n     PORTION НАБЛСРОК;\n \n   RECORD НАБЛСРОК NAT;\n     IF  (GGGG     * 1);\n     IF  (MM       * 2);\n     IF  (HH       * 3);\n     WA1 = INDEX             FC(5),               // Индекс ВМО \n           GGGG              FC(4),               // Год \n           MM                FC(2),               // Месяц \n           HH                FC(2),               // Срок \n           Z                 FC(5),               // Стандартное значение высоты                        (м)   \n           MP                FC(6,1),             // Среднемесячное значение давления                   (гПа) \n           SP                FC(6,1),             // Среднеквадратические отклонения давления           (гПа) \n           NP                FC(2),               // Число наблюдений для давления                            \n           MT                FC(6,1),             // Среднемесячные значения температуры                (°C)  \n           ST                FC(6,1),             // Среднеквадратические отклонения температуры        (°C)  \n           NT                FC(2),               // Число наблюдений для температуры                         \n           MD                FC(6,1),             // Среднемесячный дефицит точки росы                  (°C)  \n           SD                FC(6,1),             // Среднеквадрат. отклонения дефицита точки росы      (°C)  \n           ND                FC(2),               // Число наблюдений для дефицита точки росы                 \n           MS                FC(6,1),             // Скалярная скорость ветра                           (м/с) \n           SS                FC(6,1),             // Среднеквадрат. отклонения скалярной скорости ветра (м/с) \n           NS                FC(2),               // Число наблюдений для скалярной скорости ветра            \n           MU                FC(6,1),             // Зональная составляющая скорости ветра              (м/с) \n           SU                FC(6,1),             // Среднеквадрат. отклонения зональной скорости ветра (м/с) \n           NU                FC(2),               // Число наблюдений для зональной  скорости ветра           \n           MV                FC(6,1),             // Меридиональная составляющая скорости ветра         (м/с) \n           SV                FC(6,1),             // Среднеквадр. отклон. меридиональной скорости ветра (м/с)  \n           NV                FC(2);               // Число наблюдений для меридиональной скорости ветра \n   END НАБЛСРОК;\n	2	2446	Среднемесячные значения в пограничном слое	\N
Sym_all.aql	 WA1 (32000) CHAR; \n \n IN: STREAM(R) SY_M5_1;\n     PORTION REC;\n \n   RECORD REC NAT;\n     IF  (СТАНЦИЯ  * 1);\n     IF  (ГОД      * 2);\n     WA1 = СТАНЦИЯ           FC(5),               // Индекс ВМО \n           ГОД               FC(4),               // Год \n           VALUE01           FC(5,1),             // Январь \n           VALUE02           FC(5,1),             // Февраль \n           VALUE03           FC(5,1),             // Март \n           VALUE04           FC(5,1),             // Апрель \n           VALUE05           FC(5,1),             // Май \n           VALUE06           FC(5,1),             // Июнь \n           VALUE07           FC(5,1),             // Июль \n           VALUE08           FC(5,1),             // Август \n           VALUE09           FC(5,1),             // Сентябрь \n           VALUE10           FC(5,1),             // Октябрь \n           VALUE11           FC(5,1),             // Ноябрь \n           VALUE12           FC(5,1);             // Декабрь \n   END REC;\n	2	2440	Среднемесячные значения	\N
Sym5_2_all.aql	 WA1 (32000) CHAR; \n \n IN: STREAM(R) SY_M5;\n     PORTION REC;\n \n   RECORD REC NAT;\n     IF  (СТАНЦИЯ  * 1);\n     IF  (ГОД      * 2);\n     WA1 = СТАНЦИЯ           FC(5),             // Индекс ВМО \n           ГОД               FC(5),             // Год \n           VALUE01           FC(5),             // Январь \n           VALUE02           FC(5),             // Февраль \n           VALUE03           FC(5),             // Март \n           VALUE04           FC(5),             // Апрель \n           VALUE05           FC(5),             // Май \n           VALUE06           FC(5),             // Июнь \n           VALUE07           FC(5),             // Июль \n           VALUE08           FC(5),             // Август \n           VALUE09           FC(5),             // Сентябрь \n           VALUE10           FC(5),             // Октябрь \n           VALUE11           FC(5),             // Ноябрь \n           VALUE12           FC(5);             // Декабрь \n   END REC;\n	2	2441	Среднемесячные значения	\N
Sym6_all.aql	 WA1 (32000) CHAR; \n \n IN: STREAM(R) SY_M6_1;\n     PORTION REC;\n \n   RECORD REC NAT;\n     IF  (СТАНЦИЯ  * 1);\n     IF  (ГОД      * 2);\n     WA1 = СТАНЦИЯ           FC(5),               // Индекс ВМО \n           ГОД               FC(4),               // Год \n           VALUE01           FC(6,1),             // Январь \n           VALUE02           FC(6,1),             // Февраль \n           VALUE03           FC(6,1),             // Март \n           VALUE04           FC(6,1),             // Апрель \n           VALUE05           FC(6,1),             // Май \n           VALUE06           FC(6,1),             // Июнь \n           VALUE07           FC(6,1),             // Июль \n           VALUE08           FC(6,1),             // Август \n           VALUE09           FC(6,1),             // Сентябрь \n           VALUE10           FC(6,1),             // Октябрь \n           VALUE11           FC(6,1),             // Ноябрь \n           VALUE12           FC(6,1);             // Декабрь \n   END REC;\n	2	2442	Среднемесячные значения	\N
Sym_all.aql	 WA1 (32000) CHAR; \n \n IN: STREAM(R) SY_M5_1;\n     PORTION REC;\n \n   RECORD REC NAT;\n     IF  (СТАНЦИЯ  * 1);\n     IF  (ГОД      * 2);\n     WA1 = СТАНЦИЯ           FC(5),               // Индекс ВМО \n           ГОД               FC(4),               // Год \n           VALUE01           FC(5,1),             // Январь \n           VALUE02           FC(5,1),             // Февраль \n           VALUE03           FC(5,1),             // Март \n           VALUE04           FC(5,1),             // Апрель \n           VALUE05           FC(5,1),             // Май \n           VALUE06           FC(5,1),             // Июнь \n           VALUE07           FC(5,1),             // Июль \n           VALUE08           FC(5,1),             // Август \n           VALUE09           FC(5,1),             // Сентябрь \n           VALUE10           FC(5,1),             // Октябрь \n           VALUE11           FC(5,1),             // Ноябрь \n           VALUE12           FC(5,1);             // Декабрь \n   END REC;\n	2	2443	Среднемесячные значения	\N
Summ_all.aql	 WA1 (32000) CHAR; \n \n IN: STREAM(R) SUMMESC;\n     PORTION SUMM;\n \n   RECORD SUMM NAT;\n     IF  (СТАНЦИЯ  * 1);\n     IF  (ГОД      * 2);\n     IF  (МЕСЯЦ    * 3);\n     WA1 = СТАНЦИЯ           FC(5),               // Синоптический индекс станции \n           ГОД               FC(4),               // Год \n           МЕСЯЦ             FC(2),               // Месяц \n           PrFul             FC(1),               // Признак полноты \n           СУМПОДАН          FC(6,1),             // Месячная сумма осадков по данным \n           СУМСКОРР          FC(6,1),             // Месячная сумма скоррекированных осадков \n           СУМСКОРЖ          FC(6,1),             // Месячная сумма скоррекированных жидких осадков \n           СУМСКОРС          FC(6,1),             // Месячная сумма скоррекированных смешанных осадков \n           СУМСКОРТ          FC(6,1);             // Месячная сумма скоррекированных твёрдых осадков \n   END SUMM;\n	2	2444	Месячные значения	\N
Sym6_1_all.aql	 WA1 (32000) CHAR; \n \n IN: STREAM(R) SY_M6_1;\n     PORTION REC;\n \n   RECORD REC NAT;\n     IF  (СТАНЦИЯ  * 1);\n     IF  (ГОД      * 2);\n     WA1 = СТАНЦИЯ           FC(5),               // Индекс ВМО \n           ГОД               FC(4),               // Год \n           VALUE01           FC(6,1),             // Январь \n           VALUE02           FC(6,1),             // Февраль \n           VALUE03           FC(6,1),             // Март \n           VALUE04           FC(6,1),             // Апрель \n           VALUE05           FC(6,1),             // Май \n           VALUE06           FC(6,1),             // Июнь \n           VALUE07           FC(6,1),             // Июль \n           VALUE08           FC(6,1),             // Август \n           VALUE09           FC(6,1),             // Сентябрь \n           VALUE10           FC(6,1),             // Октябрь \n           VALUE11           FC(6,1),             // Ноябрь \n           VALUE12           FC(6,1);             // Декабрь \n   END REC;\n	2	2445	Среднемесячные значения	\N
Sym5_all.aql	 WA1 (32000) CHAR; \n \n IN: STREAM(R) SY_M5;\n     PORTION REC;\n \n   RECORD REC NAT;\n     IF  (СТАНЦИЯ  * 1);\n     IF  (ГОД      * 2);\n     WA1 = СТАНЦИЯ           FC(5),             // Индекс ВМО \n           ГОД               FC(5),             // Год \n           VALUE01           FC(5),             // Январь \n           VALUE02           FC(5),             // Февраль \n           VALUE03           FC(5),             // Март \n           VALUE04           FC(5),             // Апрель \n           VALUE05           FC(5),             // Май \n           VALUE06           FC(5),             // Июнь \n           VALUE07           FC(5),             // Июль \n           VALUE08           FC(5),             // Август \n           VALUE09           FC(5),             // Сентябрь \n           VALUE10           FC(5),             // Октябрь \n           VALUE11           FC(5),             // Ноябрь \n           VALUE12           FC(5);             // Декабрь \n   END REC;\n	2	2447	Среднемесячные значения	\N
Ammv_all.aql	 WA1 (32000) CHAR; \n \n IN: STREAM(R) AMMV;\n     PORTION НАБЛСРОК;\n \n   RECORD НАБЛСРОК NAT;\n     IF  (GGGG     * 1);\n     IF  (MM       * 2);\n     IF  (HH       *  3);\n     IF  (Pres     * 4);\n     WA1 = INDEX             FC(5),               // Индекс ВМО \n           GGGG              FC(4),               // Год \n           MM                FC(2),               // Месяц \n           HH                FC(2),               // Срок  (GMT)\n           Pres              FC(5),               // Уровень       (Стандартные изобарические поверхности) (гПа)  \n           MH                FC(5),               // Среднемесячное значение геоптенциальной высоты        (гпм) \n           SH                FC(5),               // Среднеквадратические отклонения геоптенц. высоты      (гпм) \n           NH                FC(2),               // Число наблюдений для высоты                                 \n           MT                FC(6,1),             // Среднемесячные значения температуры                   (°C)  \n           ST                FC(6,1),             // Среднеквадратические отклонения температуры           (°C)  \n           NT                FC(2),               // Число наблюдений для температуры                            \n           MD                FC(6,1),             // Среднемесячный дефицит точки росы                     (°C)  \n           SD                FC(6,1),             // Среднеквадратические отклонения дефицита точки росы   (°C)  \n           ND                FC(2),               // Число наблюдений для дефицита точки росы                    \n           MS                FC(6,1),             // Скалярная скорость ветра                              (м/с) \n           SS                FC(6,1),             // Среднеквадратич.отклонения скалярной скорости ветра   (м/с) \n           NS                FC(2),               // Число наблюдений для скалярной скорости ветра               \n           MU                FC(6,1),             // Зональная составляющая скорости ветра                 (м/с) \n           SU                FC(6,1),             // Среднеквадратич.отклонения зональной скорости ветра   (м/с) \n           NU                FC(2),               // Число наблюдений для зональной скорости ветра               \n           MV                FC(6,1),             // Меридиональная составляющая скорости ветра            (м/с) \n           SV                FC(6,1),             // Среднеквадр. отклон. меридиональной скорости ветра    (м/с) \n           NV                FC(2);               // Число наблюдений для меридиональной скорости ветра \n   END НАБЛСРОК;\n	2	2448	Среднемесячные значения	\N
Sym_all.aql	 WA1 (32000) CHAR; \n \n IN: STREAM(R) SY_M5_1;\n     PORTION REC;\n \n   RECORD REC NAT;\n     IF  (СТАНЦИЯ  * 1);\n     IF  (ГОД      * 2);\n     WA1 = СТАНЦИЯ           FC(5),               // Индекс ВМО \n           ГОД               FC(4),               // Год \n           VALUE01           FC(5,1),             // Январь \n           VALUE02           FC(5,1),             // Февраль \n           VALUE03           FC(5,1),             // Март \n           VALUE04           FC(5,1),             // Апрель \n           VALUE05           FC(5,1),             // Май \n           VALUE06           FC(5,1),             // Июнь \n           VALUE07           FC(5,1),             // Июль \n           VALUE08           FC(5,1),             // Август \n           VALUE09           FC(5,1),             // Сентябрь \n           VALUE10           FC(5,1),             // Октябрь \n           VALUE11           FC(5,1),             // Ноябрь \n           VALUE12           FC(5,1);             // Декабрь \n   END REC;\n	2	2449	Среднемесячные значения	\N
tmsM_Ibj.aql	// Количество информации об обледенении и ОЯ        =_Ibj\n//VVM;\nWA1 (10000) CHAR;\n\nIN: STREAM(R) TMSM;\n    PORTION RECORDS.MONAT;\n\n  RECORDS NAT;\n     IF  (СТАНЦИЯ  * 1);\n     IF  (ГОД      * 2);\n     IF  (МЕСЯЦ    * 3);\n     WA1 = СТАНЦИЯ           FC(7),               // Станция\n           ГОД               FC(4),               // Год\n           МЕСЯЦ             FC(2);               // Месяц\n    RBODY MONAT;\n      WA1 =   КБЛОКОБЛ    FC(3,0),              // Кол-во блоков информ. обледенения за месяц\n              КБЛОКОБЛ.Q  FC(1,0),              // Признак качества                          \n              ООЯЧСЛМС    FC(2,0),              // Кол-во ООЯ за месяц                       \n              ООЯЧСЛМС.Q  FC(1,0);              // Признак качества                          \n     END MONAT;\n   END RECORDS;\n	3	2544	Количество информации об обледенении и ОЯ	\N
tmsM_ct2.aql	// Признаки _ct2 \nWA1 (32000) CHAR; \n \n IN: STREAM(R) TMSM;\n     PORTION RECORDS;\n \n   RECORDS NAT;\n     IF  (СТАНЦИЯ  * 1);\n     IF  (ГОД      * 2);\n     IF  (МЕСЯЦ    * 3);\n     IF  (ТИПЗАП   * 4);\n     WA1 = СТАНЦИЯ           FC(7),               // Станция\n           ГОД               FC(4),               // Год\n           МЕСЯЦ             FC(2),               // Месяц\n\t   ТИПЗАП            FC(1);               // Тип записи (1-9)\t\n   END RECORDS;\n	3	2545	Признаки (Год, Мес, Станция, Тип записи)	\N
tmsM_Sg2.aql	//  Характеристики снежного покрова            =_Sg2\n WA1 (32000) CHAR; \n \n IN: STREAM(R) TMSM;\n     PORTION RECORDS;\n \n   RECORDS NAT;\n     IF  (СТАНЦИЯ  * 1);\n     IF  (ГОД      * 2);\n     IF  (МЕСЯЦ    * 3);\n     WA1 = СТАНЦИЯ           FC(7),               // Станция\n           ГОД               FC(4),               // Год\n           МЕСЯЦ             FC(2);               // Месяц\n \n     RBODY СНЕГ;\n       WA1 = СНПЧДСМС          FC(2),             // Число дней со снежным покровом   \n             СНПЧДСМС.Q        FC(1),             // Признак качества                 \n             СНДПОЯГД          FC(2),             // Дата выпадения первого снега     \n             СНДПОЯГД.Q        FC(1),             // Признак качества                 \n             СНДСXДГД          FC(2),             // Дата последнего снега             \n             СНДСXДГД.Q        FC(1);             // Признак качества                  \n       GROUP СНПОКРОВ;                            //                                  \n         WA1 = ДАТЫ              FC(1),           // Индекс                           \n               СНДОУПГД          FC(2),           // Дата образования снежного покрова\n               СНДОУПГД.Q        FC(1);           // Признак качества                 \n       END СНПОКРОВ;                                                                  \n       GROUP РАЗРУШСП;                            //                                  \n         WA1 = ДАТЫ              FC(1),           // Индекс                           \n               СНДРУПГД          FC(2),           // Дата разрушения снежного покрова \n               СНДРУПГД.Q        FC(1);           // Признак качества                 \n       END РАЗРУШСП;\n     END СНЕГ;\n   END RECORDS;\n	3	2546	Характеристики снежного покрова	\N
tmsM_cn2.aql	//  Паспортные данные _cn2\n WA1 (32000) CHAR; \n \n IN: STREAM(R) TMSM;\n     PORTION RECORDS;\n \n   RECORDS NAT;\n     IF  (СТАНЦИЯ  * 1);\n     IF  (ГОД      * 2);\n     IF  (МЕСЯЦ    * 3);\n     \n     WA1 = СТАНЦИЯ           FC(7),               // Станция\n           ГОД               FC(4),               // Год\n           МЕСЯЦ             FC(2);               // Месяц\n \n     RBODY CONST;\n       WA1 = НАИМЕНСТ          FC(20),            // Наименование станции                                          \n             КООРДНОМ          FC(7),             // Координатныйномер станции                                     \n             НОМУПРАВ          FC(2),             // Номер угмс                                                    \n             НОМЧАСП           FC(2),             // Номер часового пояса                                          \n             ПРГЕОРАС          FC(1),             // Признак географического расположения                          \n             КОЛСРОК           FC(1),             // Кол-во сроков наблюдений                                      \n             ПРНЕПРДН          FC(1),             // Признак непрерывного рабочего дня                             \n             ПРПРИНСТ          FC(1),             // Признак принадлежности станции                                \n             ПРУАТГМС          FC(1),             // Признак наличия уатгмс                                        \n             ПРЕЖЧАСН          FC(1),             // Наличие ежечасных наблюдений                                  \n             ПРАГРОМН          FC(1),             // Наличие агрометрических  наблюдений                           \n             ПРПРМОРН          FC(1),             // Наличие прибров морских  наблюдений                           \n             ПРГИДРОН          FC(1),             // Наличие гидрологических  наблюдений                           \n             ПРАЭРОН           FC(1),             // Наличие аэрологических   наблюдений                           \n             ПРРАДИОН          FC(1),             // Наличие радиолокационных наблюдений                           \n             ПРАКТИНН          FC(1),             // Наличие актинометрических наблюдений                          \n             ПРТЕПЛОБ          FC(1),             // Наличие теплобалансовых  наблюдений                           \n             ПРОЗОНН           FC(1),             // Наличие озонометрических наблюдений                           \n             ПРАТЭЛЕК          FC(1),             // Наличие наблюдений атмосферного электричества                 \n             ПРЗАГРВЗ          FC(1),             // Наличие наблюд. загрязнения воздуха                           \n             ПРКЛАССТ          FC(1),             // Признак классности  станции                                   \n             ПРООЯ             FC(1),             // Классификатор критериев ООЯ                                   \n             ПРПЕЖМЧ1          FC(1),             // Помещение  данных ежмесячника ч1                              \n             ПРПЕЖМЧ2          FC(1),             // Помещение даных ежмесячника ч2,ежгодника                      \n             ПРПССЕЖ2          FC(1),             // Даные солнечного сияния в ежмесячнике ч2                      \n             ТИПУЧАСТ          FC(1),             // Тип участка станции                                           \n             ВЫССТНУМ          FC(5),             // Высота над уровнем моря                                       \n             ПРНВИДИМ          FC(1),             // Наблюдения дальности видимости                                \n             ПРНОБЛАЧ          FC(1),             // Наблюдения над облачностью                                    \n             ПРНВЫСОБ          FC(1),             // Наблюдения высоты нижней границы облаков                      \n             ПРСОСТПП          FC(1),             // Наблюения состояния повехности почвы                          \n             ПРНПОГОД          FC(1),             // Наблюдения над погодой                                        \n             ПРНВЕТР           FC(1),             // Наличие налюдения над ветром                                  \n             ВЫСФЛЛД           FC(5,1),           // Высота флюгера легкой доской                                  \n             ВЫСФЛТД           FC(5,1),           // Высота флюгера тяжелой доской                                 \n             ВЫСАНЕМО          FC(5,1),           // Высота анеморумбометра                                        \n             ПРНОСАДК          FC(1),             // Наблюдения над осадками                                       \n             ПРНТЕМПП          FC(1),             // Наблюдения температуры поверхности почвы                      \n             ПРНТЕМВ           FC(1),             // Наблюдения температуры воздуха                                \n             ПРНСНЕГ           FC(1),             // Наличие снегос'емок                                           \n             ДЛСНЕГП           FC(3,1),           // Длина полевого маршрута                                       \n             ДЛСНЕГЛ           FC(3,1),           // Длина маршрута по лесу                                        \n             ДЛСНЕГБ           FC(3,1),           // Длина маршрута по балкам                                      \n             ПРНГЕЛИО          FC(1),             // Налиие гелиографа                                             \n             ВЫСГЕЛИО          FC(5,1),           // Высота гелиографа над землей                                  \n             ПРНТЕРМО          FC(1),             // Наличие термографа                                            \n             ПРНГИГРО          FC(1),             // Наличие гигрографа                                            \n             ПРНПЛЮВ           FC(1),             // Наличие плювиографа                                           \n             ПРНОБЛЕД          FC(1),             // Набличие обледенения                                          \n             ПРНБАРОМ          FC(1),             // Наличие барометра                                             \n             ВЫСБАРОМ          FC(6,1),           // Высота барометра над уровнем моря                             \n             ТУТЕМПОГ          FC(1),             // Тип устройства измер.темп.почвы оголенной поверхности         \n             ТУТЕМПЕС          FC(1);             // Тип устройства измер.темп.почвы.естестественного покрытия     \n       GROUP GRS1;\n         WA1 = ГЛУБИНЫ           FC(1),           // Индекс глубины                                  \n               ПРНВЫТТ           FC(1);           // Наличие вытяжного термометра на глуб.0,2-3,2 м  \n       END GRS1;\n       GROUP GRS2;\n         WA1 = ГЛУБИНЫ           FC(2),           // Индекс глубины                               \n               ПРНЭЛЕКТ          FC(1);           // Наличие электротермометра на глуб.0,02-3,2 м \n       END GRS2;\n       WA1 = ДНАЧПНОЧ          FC(2),             // День начала полярной ночи                                  \n             МНАЧПНОЧ          FC(2),             // Месяц начала полярной ночи                                 \n             ДКОНЦАПН          FC(2),             // День окончания полярной ночи                               \n             МКОНЦАПН          FC(2),             // Месяц окончания полярной ночи                              \n             НОМЕРАДР          FC(3),             // Номер административного района в угмс                      \n             ГОДТЕКУЩ          FC(4),             // Текущий год                                                \n             МЕСЯЦТЕК          FC(2),             // Текущий месяц                                              \n             КОЛДНМЕС          FC(2),             // Количество дней в месяце                                   \n             НМСМОСКВ          FC(2),             // Начало метеосуток,московское декретное время               \n             НМСПДЗВ           FC(2),             // Начало метеосуток,поясное декретное(зимнее)время (Пдзв)    \n             ПЧАСНМС           FC(2),             // Первый час  от начала метеосуток                           \n             ПСРОКНМС          FC(2),             // Первый срок от начала метеосуток                           \n             СБЛ8ЧАС8          FC(2),             // Срок,ближайший к 8 час.пдзв                                \n             СБ14ЧАС8          FC(2),             // Срок,ближайший к 14час.пдзв                                \n             СБ14ЧАС4          FC(2),             // Срок,ближайший к 14час.пдв(4с)                             \n             ШИРОТА            FC(4,1),           // Широта расположения станции                                \n             ДОЛГОТА           FC(4,1),           // Долгота распположения станции                              \n             ОПРПОЛУШ          FC(1),             // Определение долготы и полушария                            \n             ГОДОТКСТ          FC(4),             // Год открытия станции                                       \n             NАРФАЙЛА          FC(2),             // Номер архивного файла                                      \n             КЗМОNАТ           FC(1),             // Количество записей  MONAT                                  \n             КЗВЕТЕР           FC(1),             // Количество записей 'ветер'                                 \n             КЗДЕКАДЫ          FC(1),             // Количество записей 'декады'                                \n             КЗСРОКИ           FC(1),             // Количество записей 'сроки'                                 \n             КЗТПОЧВЫ          FC(1),             // Количество записей 'тпочвы'                                \n             КЗRЕGЕN           FC(3),             // Количество записей 'rеgеn'                                 \n             КЗСНЕГ            FC(1),             // Количество записей 'снег'                                  \n             КЗОБЛООЯ          FC(1);             // Количество записей 'облооя'                                \n     END CONST;\n   END RECORDS;\n	3	2547	Паспортные данные	\N
vosh_all.aql	 WA1 (10000) CHAR; \n \n IN: STREAM(R) VOSHOD;\n     PORTION НАБЛСРОК;\n \n   RECORD НАБЛСРОК NAT;\n     IF  (ГОД      * 1);\n     IF  (МЕСЯЦ    * 2);\n     IF  (СРОК     * 3);\n     IF  (ДЕНЬ     * 4);\n      WA1 = СТАНЦИЯ          FC(7),               // Станция \n           ГОД               FC(4),               // Год\n           МЕСЯЦ             FC(2),               // Месяц\n           СРОК              FC(2),               // Срок\n           ДЕНЬ              FC(2),               // День\n           ВЛАОТВОМ          FC(3),               // Относительная влажность\n           ВЛАОТВОМ.Q        FC(1),               // Признак качества  \n           ВЛОАМИМС          FC(4,1),             // Абсолютная влажность\n           ВЛОАМИМС.Q        FC(1),               // Признак качества   \n           ДАУМСРГД          FC(6,1),             // Давление воздуxа на уровне моря\n           ДАУМСРГД.Q        FC(1),               // Признак качества   \n           ННЧАМАМС          FC(4,1),             // Недостаток насыщения\n           ННЧАМАМС.Q        FC(1),               // Признак качества   \n           ТЕМБВИДГ          FC(1),               // Тенденция барометрическая - вид кривой\n           ТЕМБВИДГ.Q        FC(1),               // Признак качества  \n           ТЕМБВЕЛП          FC(4,1),             // Величина барометрической тенденции\n           ТЕМБВЕЛП.Q        FC(1),               // Признак качества  \n           ВИДГОРИЗ          FC(2),               // Горизонтальная видимость\n           ВИДГОРИЗ.QV       FC(1),               // Дополнитнльный признак \n           ВИДГОРИЗ.Q        FC(1),               // Признак качества  \n           ОБЛВЫНГМ          FC(2),               // Высота нижней границы облачности\n           ОБЛВЫНГМ.QV       FC(1),               // Дополнитнльный признак  \n           ОБЛВЫНГМ.Q        FC(1),               // Признак качества  \n           ТОЧКАРОР          FC(3),               // Температура точки росы\n           ТОЧКАРОР.Q        FC(1),               // Признак качества  \n           СОСТППЧВ          FC(1),               // Состояние поверxности почвы\n           СОСТППЧВ.Q        FC(1),               // Признак качества  \n           ОБЛОКОЛВ          FC(2),               // Количество общей облачности\n           ОБЛОКОЛВ.QV       FC(1),               // Дополнитнльный признак \n           ОБЛОКОЛВ.Q        FC(1),               // Признак качества  \n           ОБЛНКОМВ          FC(2),               // Количество нижней облачности \n           ОБЛНКОМВ.QV       FC(1),               // Дополнитнльный признак \n           ОБЛНКОМВ.Q        FC(1),               // Признак качества   \n           ВЕТНАПРД          FC(2),               // Направление ветра\n           ВЕТНАПРД.Q        FC(1),               // Признак качества  \n           ВЕТСКОРД          FC(2),               // Скорость ветра\n           ВЕТСКОРД.Q        FC(1),               // Признак качества    \n           ОСАКОНДГ          FC(4),               // Количество осадков\n           QV                FC(1),               // Дополнитнльный признак     \n           Q                 FC(1),               // Признак качества  \n           ДАВЛАСТМ          FC(6,1),             // Давление воздуxа на уровне станции\n           ДАВЛАСТМ.Q        FC(1),               // Признак качества  \n           ТЕМПОВПМ          FC(3),               // Температура поверxности почвы\n           ТЕМПОВПМ.Q        FC(1),               // Признак качества  \n           ПОГОМСНВ          FC(1),               // Погода между сроками наблюдений\n           ПОГОМСНВ.QV       FC(1),               // Дополнитнльный признак \n           ПОГОМСНВ.Q        FC(1),               // Признак качества  \n           ПОГОДСНВ          FC(2),               // Погода в срок наблюдений \n           ПОГОДСНВ.Q        FC(1),               // Признак качества   \n           ТЕМВСРСТ          FC(5,1),             // Температура воздуxа\n           ТЕМВСРСТ.Q        FC(1),               // Признак качества   \n           АЯПРО1СТ          FC(1),               // Гололед, изморось, роса, иней\n           АЯПРО1СТ.QI       FC(1),               // Дополнитнльный признак \n           АЯПРО1СТ.Q        FC(1),               // Признак качества  \n           АЯПРО2СТ          FC(1),               // Туманы, дымка, мгла\n           АЯПРО2СТ.QI       FC(1),               // Дополнитнльный признак \n           АЯПРО2СТ.Q        FC(1),               // Признак качества  \n           АЯПРО3СТ          FC(1),               // Метели, поземок, пыльная буря\n           АЯПРО3СТ.QI       FC(1),               // Дополнитнльный признак \n           АЯПРО3СТ.Q        FC(1),               // Признак качества  \n           АЯПРО4СТ          FC(1),               // Снежная, ледяная, крупа, снежные зерна \n           АЯПРО4СТ.QI       FC(1),               // Дополнитнльный признак \n           АЯПРО4СТ.Q        FC(1),               // Признак качества  \n           АЯПРО5СТ          FC(1),               // Морось, обложной, ливневый, ледяной дождь\n           АЯПРО5СТ.Q        FC(1),               // Дополнитнльный признак \n           АЯПРО5СТ.Q        FC(1),               // Признак качества  \n           АЯПРО6СТ          FC(1),               // Мираж, ледяные иглы, снег, мокрый снег\n           АЯПРО6СТ.QI       FC(1),               // Дополнитнльный признак \n           АЯПРО6СТ.Q        FC(1),               // Признак качества  \n           АЯПРО7СТ          FC(1),               // Парение моря,пол.сияние,зарница,гроза,град\n           АЯПРО7СТ.QI       FC(1),               // Дополнитнльный признак \n           АЯПРО7СТ.Q        FC(1),               // Признак качества  \n           ОБЛФОР1В          FC(1),               // Форма облаков верxнего яруса \n           ОБЛФОР1В.QV       FC(1),               // Дополнитнльный признак \n           ОБЛФОР1В.Q        FC(1),               // Признак качества  \n           ОБЛФОР2В          FC(1),               // Форма облаков среднего яруса\n           ОБЛФОР2В.Q        FC(1),               // Признак качества  \n           ОБЛФОР3В          FC(1),               // Форма кучевой облачности\n           ОБЛФОР3В.Q        FC(1),               // Признак качества  \n           ОБЛФОР4В          FC(1),               // Слоистая слоисто-кучевая облачность \n           ОБЛФОР4В.Q        FC(1),               // Признак качества  \n           ОБЛФОР5В          FC(1),               // Дождевая, разорванная облачность\n           ОБЛФОР5В.Q        FC(1);               // Признак качества  \n   END НАБЛСРОК;\n	3	2450	Срочные данные	\N
sut77_all.aql	 WA1 (10000) CHAR; \n \n IN: STREAM(R) SUT77;\n     PORTION НАБЛМЕС.НАБЛДЕНЬ;\n \n   RECORD НАБЛМЕС NAT;\n//   IF  (СТАНЦИЯ  * 1);\n     IF  (ГОД      * 2);\n     IF  (МЕСЯЦ    * 3);\n     WA1 = СТАНЦИЯ           FC(7),               // Станция            \n           ГОД               FC(4),               // Год                \n           МЕСЯЦ             FC(2);               // Месяц              \n     GROUP НАБЛДЕНЬ;\n       IF  (ДЕНЬ     * 4);\n       WA1 = ДЕНЬИНД           FC(2),             // Индекс День \n             ДЕНЬ              FC(2),             // День        \n             ТЕМВСРСТ          FC(5,1),           // Средняя температура воздуха      \n             ТЕМВСРСТ.Q        FC(1),             // Признак качества                 \n             ТЕВМАКСТ          FC(5,1),           // Максимальная температура воздуха \n             ТЕВМАКСТ.Q        FC(1),             // Признак качества                 \n             ТЕВМИНСТ          FC(5,1),           // Минимальная температура воздуха  \n             ТЕВМИНСТ.Q        FC(1),             // Признак качества                 \n             ВЛОМИНСТ          FC(2),             // Минимальная относительная влажность  \n             ВЛОМИНСТ.QL       FC(1),             // Дополнительная характеристика        \n             ВЛОМИНСТ.Q        FC(1),             // Признак качества                     \n             ОСАДКОЛМ          FC(5,1),           // Количество осадков              \n             ОСАДКОЛМ.QО       FC(1),             // Дополнительная характеристика   \n             ОСАДКОЛМ.Q        FC(1),             // Признак качества                \n             СНЕСТЕПВ          FC(1),             // Снежный покров - степень покрытия   \n             СНЕСТЕПВ.QS       FC(1),             // Дополнительная характеристика       \n             СНЕСТЕПВ.Q        FC(1),             // Признак качества                    \n             СНЕПОУЧВ          FC(1),             // Характеристика участка              \n             СНЕПОУЧВ.Q        FC(1),             // Признак качества                    \n             СНЕПВЫСМ          FC(3),             // Высота снежного покрова             \n             СНЕПВЫСМ.QР       FC(1),             // Дополнительная характеристика       \n             СНЕПВЫСМ.Q        FC(1),             // Признак качества                    \n             ТЕИПОПСТ          FC(5,1),           // Мин. температура поверхности почвы \n             ТЕИПОПСТ.Q        FC(1),             // Признак качества                   \n             АЯПР01СТ          FC(2),             // АЯ1  - продолжительность \n             АЯПР01СТ.Q        FC(1),             // Признак качества \n             АЯПР02СТ          FC(2),             // АЯ2  - продолжительность              \n             АЯПР02СТ.Q        FC(1),             // Признак качества\n             АЯПР03СТ          FC(2),             // АЯ3  - продолжительность              \n             АЯПР03СТ.Q        FC(1),             // Признак качества\n             АЯПР04СТ          FC(2),             // АЯ4  - продолжительность              \n             АЯПР04СТ.Q        FC(1),             // Признак качества\n             АЯПР05СТ          FC(2),             // АЯ5  - продолжительность              \n             АЯПР05СТ.Q        FC(1),             // Признак качества\n             АЯПР06СТ          FC(2),             // АЯ6  - продолжительность              \n             АЯПР06СТ.Q        FC(1),             // Признак качества\n             АЯПР07СТ          FC(2),             // АЯ7  - продолжительность              \n             АЯПР07СТ.Q        FC(1),             // Признак качества\n             АЯПР08СТ          FC(2),             // АЯ8  - продолжительность              \n             АЯПР08СТ.Q        FC(1),             // Признак качества\n             АЯПР09СТ          FC(2),             // АЯ9  - продолжительность              \n             АЯПР09СТ.Q        FC(1),             // Признак качества\n             АЯПР10СТ          FC(2),             // АЯ10 - продолжительность              \n             АЯПР10СТ.Q        FC(1),             // Признак качества\n             АЯПР11СТ          FC(2),             // АЯ11 - продолжительность              \n             АЯПР11СТ.Q        FC(1),             // Признак качества\n             АТМЯВЛ1В          FC(1),             // АЯ1 - наличие              \n             АТМЯВЛ1В.Q        FC(1),             // Признак качества\n             АТМЯВЛ2В          FC(1),             // АЯ2 - наличие              \n             АТМЯВЛ2В.Q        FC(1),             // Признак качества\n             АТМЯВЛ3В          FC(1),             // АЯ3 - наличие              \n             АТМЯВЛ3В.Q        FC(1),             // Признак качества\n             АТМЯВЛ4В          FC(1),             // АЯ4 - наличие              \n             АТМЯВЛ4В.Q        FC(1),             // Признак качества\n             АТМЯВЛ5В          FC(1),             // АЯ5 - наличие             \n             АТМЯВЛ5В.Q        FC(1),             // Признак качества\n             АТМЯВЛ6В          FC(1),             // АЯ6 - наличие             \n             АТМЯВЛ6В.Q        FC(1),             // Признак качества\n             АТМЯВЛ7В          FC(1),             // АЯ7 - наличие             \n             АТМЯВЛ7В.Q        FC(1),             // Признак качества\n             ДОПОЛНИТ          FC(1),             // АЯ доп             \n             ДОПОЛНИТ.QD       FC(1),             // Дополнительный признак\n             ДОПОЛНИТ.Q        FC(1),             // Признак качества            \n             ОБОXАРСТ          FC(1),             // Признак качестваКоличество общей облачности    \n             ОБОXАРСТ.Q        FC(1),             // Признак качества               \n             ОБНXАРСТ          FC(1),             // Количество нижней облачности   \n             ОБНXАРСТ.Q        FC(1),             // Признак качества               \n             ВЕТСМАСТ          FC(2),             // Максимальная скорость ветра         \n             ВЕТСМАСТ.QX       FC(1),             // Дополнительная характеристика       \n             ВЕТСМАСТ.Q        FC(1),             // Признак качества                    \n             СОЛСПРСТ          FC(2),             // Продолжительность солнечного сияния \n             СОЛСПРСТ.QY       FC(1),             // Дополнительная характеристика       \n             СОЛСПРСТ.Q        FC(1);             // Признак качества                    \n     END НАБЛДЕНЬ;\n   END НАБЛМЕС;\n	3	2451	Суточные данные  1977-83 гг.	\N
tmss_cn2.aql	 WA1 (10000) CHAR; \n \n IN: STREAM(R) TMSS;\n     PORTION RECORDS.CONST;\n \n   RECORDS NAT;\n     IF  (СТАНЦИЯ  * 1);\n     IF  (ГОД      * 2);\n     IF  (МЕСЯЦ    * 3);\n     WA1 = СТАНЦИЯ           FC(7),               // Станция\n           ГОД               FC(4),               // Год\n           МЕСЯЦ             FC(2);               // Месяц\n \n     RBODY CONST;\n       WA1 = НАИМЕНСТ          FC(20),            // Наименование станции\n             КООРДНОМ          FC(7),             // Координатный номер станции\n             НОМУПРАВ          FC(2),             // Номер УГМС\n             НОМЧАСП           FC(2),             // Номер часового пояса\n             ПРГЕОРАС          FC(1),             // Признак географического расположения\n             КОЛСРОК           FC(1),             // Количество сроков наблюдения\n             ПРНЕПРДН          FC(1),             // Признак непрерывного раб. дня             \n             ПРПРИНСТ          FC(1),             // Признак принадлежности станции            \n             ПРУАТГМС          FC(1),             // Признак наличия УАТГМС                    \n             ПРЕЖЧАСН          FC(1),             // Наличие ежечасных наблюдений              \n             ПРАГРОМН          FC(1),             // Наличие агрометеорологических наблюдений  \n             ПРПРМОРН          FC(1),             // Наличие прибрежных морских наблюдений     \n             ПРГИДРОН          FC(1),             // Наличие гидрологических наблюдений        \n             ПРАЭРОН           FC(1),             // Наличие аэрологических наблюдений         \n             ПРРАДИОН          FC(1),             // Наличие радиолокационных наблюдений       \n             ПРАКТИНН          FC(1),             // Наличие актинометрических наблюдений      \n             ПРТЕПЛОБ          FC(1),             // Наличие теплобалансовых наблюдений        \n             ПРОЗОНН           FC(1),             // Наличие озонометрических наблюдений       \n             ПРАТЭЛЕК          FC(1),             // Наличие набл.атмосферного электричества   \n             ПРЗАГРВЗ          FC(1),             // Наличие наблюдений загрязнения воздуха    \n             ПРКЛАССТ          FC(1),             // Признак классности станции                \n             ПРООЯ             FC(1),             // Классиф.критер.ооя                                         \n             ПРПЕЖМЧ1          FC(1),             // Помещ.данных ежм ч1                                        \n             ПРПЕЖМЧ2          FC(1),             // Пом.дан.ежм ч2,ежг.                    \n             ПРПССЕЖ2          FC(1),             // Дан.солн.с.в ежм ч2                    \n             ТИПУЧАСТ          FC(1),             // Тип участка станции                    \n             ВЫССТНУМ          FC(5),             // Высота над уровнем моря                \n             ПРНВИДИМ          FC(1),             // Наблюдения дальности видимости         \n             ПРНОБЛАЧ          FC(1),             // Наблюдения над облачностью             \n             ПРНВЫСОБ          FC(1),             // Набл. высоты нижней границы облачности \n             ПРСОСТПП          FC(1),             // Наблюдения состояния поверхности почвы \n             ПРНПОГОД          FC(1),             // Наблюдения над погодой                 \n             ПРНВЕТР           FC(1),             // Наблюдения над ветром                  \n             ВЫСФЛЛД           FC(5,1),           // Высота флюгера с легкой доской         \n             ВЫСФЛТД           FC(5,1),           // Высота флюгера с тяжелой доской           \n             ВЫСАНЕМО          FC(5,1),           // Высота анеморумбометра                    \n             ПРНОСАДК          FC(1),             // Наблюдения над осадками                   \n             ПРНТЕМПП          FC(1),             // Наблюдения температуры поверхности почвы  \n             ПРНТЕМВ           FC(1),             // Наблюдения температуры воздуха            \n             ПРНСНЕГ           FC(1),             // Наличие снегосъемок                       \n             ДЛСНЕГП           FC(3,1),           // Длина полевого маршрута                   \n             ДЛСНЕГЛ           FC(3,1),           // Длина маршрута по лесу                    \n             ДЛСНЕГБ           FC(3,1),           // Длина маршрута по балкам                  \n             ПРНГЕЛИО          FC(1),             // Наличие гелиографа                        \n             ВЫСГЕЛИО          FC(5,1),           // Высота гелиографа над землей              \n             ПРНТЕРМО          FC(1),             // Наличие термографа                        \n             ПРНГИГРО          FC(1),             // Наличие гигрографа                        \n             ПРНПЛЮВ           FC(1),             // Наличие плювиографа                       \n             ПРНОБЛЕД          FC(1),             // Наблюдения обледенения                    \n             ПРНБАРОМ          FC(1),             // Наличие барометра                         \n             ВЫСБАРОМ          FC(7,1);           // Высота барометра над уровнем моря         \n       WA1 = ДНАЧПНОЧ          FC(2),             // День начала полярной ночи                \n             МНАЧПНОЧ          FC(2),             // Месяц начала полярной ночи               \n             ДКОНЦАПН          FC(2),             // День окончания полярной ночи             \n             МКОНЦАПН          FC(2),             // Месяц окончания полярной ночи            \n             НОМЕРАДР          FC(3),             // Номер административного района в УГМС    \n             ГОДТЕКУЩ          FC(4),             // Текущий год                              \n             МЕСЯЦТЕК          FC(2),             // Текущий месяц                            \n             КОЛДНМЕС          FC(2),             // Количество дней в месяце                 \n             НМСМОСКВ          FC(2),             // Начало местных суток, МДВ                \n             НМСПДЗВ           FC(2),             // Начало местных суток, ПДЗВ               \n             ПЧАСНМС           FC(2),             // Первый час от начала местных суток       \n             ПСРОКНМС          FC(2),             // Первый срок от начала местных суток      \n             СБЛ8ЧАС8          FC(2),             // Срок, ближайший к 8 часам ПДЗВ           \n             СБ14ЧАС8          FC(2),             // Срок, ближайший к 14 часам ПДЗВ          \n             СБ14ЧАС4          FC(2),             // Срок, ближайший к 14 часам ПДВ (4 срока) \n             ШИРОТА            FC(4,1),           // Широта расположения станции  \n             ДОЛГОТА           FC(4,1),           // Долгота расположения станц.  \n             ОПРПОЛУШ          FC(1),             // Определитель долготы и полушария \n             ГОДОТКСТ          FC(4),             // Год открытия станции    \n             NАРФАЙЛА          FC(2),             // Номер архивного файла   \n             KЗSUTKI           FC(2),             // Количество записей СУТКИ\n             KЗTPOCHV          FC(2);             // Количество записей ТЕМПЕРАТУРА ПОЧВЫ  \n     END CONST;\n   END RECORDS;\n	3	2452	Паспортные данные             *	\N
tmss_ct2.aql	 WA1 (10000) CHAR; \n \n IN: STREAM(R) TMSS;\n     PORTION RECORDS;\n \n   RECORDS NAT;\n     IF  (СТАНЦИЯ  * 1);\n     IF  (ГОД      * 2);\n     IF  (МЕСЯЦ    * 3);\n     IF  (ТИПЗАП   * 4);\n     WA1 = СТАНЦИЯ           FC(7),               // Станция\n           ГОД               FC(4),               // Год\n           МЕСЯЦ             FC(2),               // Месяц\n           ТИПЗАП            FC(1);               // Тип записи (1-3)\n   END RECORDS;\n	3	2453	Признаки (Год, Мес, Станция, Тип записи)	\N
tmss_su2.aql	 WA1 (10000) CHAR; \n \n IN: STREAM(R) TMSS;\n     PORTION RECORDS.SUTKI;\n \n   RECORDS NAT;\n     IF  (СТАНЦИЯ  * 1);\n     IF  (ГОД      * 2);\n     IF  (МЕСЯЦ    * 3);\n     WA1 = СТАНЦИЯ           FC(7),               // Станция\n           ГОД               FC(4),               // Год\n           МЕСЯЦ             FC(2);               // Месяц\n \n     RBODY SUTKI;\n       IF  (ДЕНЬ     * 4);\n       WA1 = ДЕНЬ              FC(2),             // День\n             ДАТА              FC(2),             // Дата\n             ТЕМВСРСТ          FC(5,1),           // Средняя температура воздуха\n             ТЕМВСРСТ.Q        FC(1),             // Признак качества\n             ТЕВМАКСТ          FC(5,1),           // Максимальная температура воздуха\n             ТЕВМАКСТ.Q        FC(1),             // Признак качества\n             ТЕВМИНСТ          FC(5,1),           // Минимальная температура воздуха\n             ТЕВМИНСТ.Q        FC(1),             // Признак качества\n             ТЕМПСРСТ          FC(5,1),           // Средняя температура поверхности почвы\n             ТЕМПСРСТ.Q        FC(1),             // Признак качества\n             ТЕПМАКСТ          FC(5,1),           // Макс. температура поверхности почвы\n             ТЕПМАКСТ.Q        FC(1),             // Признак качества\n             ТЕПМИНСТ          FC(5,1),           // Мин. температура поверхности почвы\n             ТЕПМИНСТ.Q        FC(1),             // Признак качества\n             ТТРМИНСТ          FC(5,1),           // Мин. значение температура точки росы\n             ТТРМИНСТ.Q        FC(1),             // Признак качества\n             УПРПСРСТ          FC(6,2),           // Среднее парциальн. давл. водяного пара\n             УПРПСРСТ.Q        FC(1),             // Признак качества \n             УПРПСРСТ.Q1       FC(1),             // Указатель точности элемента\n             ВЛОТСРСТ          FC(3),             // Средняя относительная влажность воздуха\n             ВЛОТСРСТ.Q        FC(1),             // Признак качества\n             ВЛОМИНСТ          FC(3),             // Мин. относительная влажность воздуха\n             ВЛОМИНСТ.Q        FC(1),             // Признак качества\n             НЕДНСРСТ          FC(5,2),           // Среднее дефицита насыщения водяного пара\n             ДАУМСРСТ.Q        FC(1),             // Признак качества  \n             ОБОXАРСТ          FC(1),             // Xарактеристика общей облачности\n             ОБОXАРСТ.Q        FC(1),             // Признак качества\n             ОБНXАРСТ          FC(1),             // Xарактеристика нижней облачности\n             Q                 FC(1),             // Признак качества\n             ВЕСРСКСТ          FC(4,1),           // Среднее значение скорости ветра\n             ВЕСРСКСТ.Q        FC(1),             // Признак качества\n             ВЕТСМАСТ          FC(3),             // Максимальная скорость ветра по 8 срокам\n             ВЕТСМАСТ.Q        FC(1),             // Признак качества  \n             ВЕТСАМСТ          FC(3),             // Абсол. максимальная скорость ветра\n             ВЕТСАМСТ.Q        FC(1),             // Признак качества\n             ОСАСУМСТ          FC(6,1),           // Суточная сумма осадков\n             ОСАСУМСТ.Q        FC(1),             // Признак качества\n             СОСТППЧВ          FC(1),             // Состояние поверxности почвы\n             СОСТППЧВ.Q        FC(1),             // Признак качества\n             СОСТППЧВ.СОСТПППЮ FC(1),             // Признак наличия знака ю у е\n             СНЕПВЫСМ          FC(4),             // Высота сн.покрова на метеоплощ.(3рейки)\n             СНЕПВЫСМ.Q        FC(1),             // Признак качества  \n             СНЕСТЕПВ          FC(2),             // Степень покр.окрестности станции снегом\n             СНЕСТЕПВ.Q        FC(1),             // Признак качества  \n             СНЕПXАРЗ          FC(1),             // Xарактер залегания снежного покрова\n             СНЕПXАРЗ.Q        FC(1),             // Признак качества  \n             СОЛСПРСТ          FC(4,1),           // Продолжительность солнечного сияния\n             СОЛСПРСТ.Q        FC(1);             // Признак качества  \n     END SUTKI;\n   END RECORDS;\n	3	2454	Основные суточные данные (кроме АЯ)	\N
tmss_at2.aql	 WA1 (10000) CHAR; \n \n IN: STREAM(R) TMSS;\n     PORTION RECORDS.SUTKI;\n \n   RECORDS NAT;\n     IF  (СТАНЦИЯ  * 1);\n     IF  (ГОД      * 2);\n     IF  (МЕСЯЦ    * 3);\n     WA1 = СТАНЦИЯ           FC(7),               // Станция\n           ГОД               FC(4),               // Год\n           МЕСЯЦ             FC(2);               // Месяц\n \n     RBODY SUTKI;\n       IF  (ДЕНЬ     * 4);\n       WA1 = ДЕНЬ              FC(2);             // День\n       GROUP ПРАТМЯВЛ;\n         WA1 = ВИДЫАЯ            FC(2),           // Вид атмосферного явления\n               АЯПРОДСТ          FC(2),           // Продолжительность атмосферного явления\n               АЯПРОДСТ.Q        FC(1);           // Признак качества\n       END ПРАТМЯВЛ;\n       GROUP НАЛИЧАЯ;\n         WA1 = ВИДЫАЯ            FC(1),           // Вид атмосферного явления\n               НАЛАЯВСТ          FC(1),           // Наличие атмосферного явления\n               НАЛАЯВСТ.Q        FC(1);           // Признак качества\n       END НАЛИЧАЯ;\n     END SUTKI;\n   END RECORDS;\n	3	2455	Атмосферные явления	\N
sr65_all.aql	 WA1 (10000) CHAR; \n \n IN: STREAM(R) TM1_SR65;\n     PORTION НАБЛСРОК.НАБЛДЕНЬ;\n \n   RECORD НАБЛСРОК NAT;\n     IF  (ГОД      * 1);\n     IF  (МЕСЯЦ    * 2);\n     IF  (СРОК     * 3);\n     WA1 = СТАНЦИЯ           FC(7),               // Станция              \n           ГОД               FC(4),               // Год                    \n           МЕСЯЦ             FC(2),               // Месяц                \n           СРОК              FC(2);               // Срок             \n     GROUP НАБЛДЕНЬ;\n       IF  (ДЕНЬ     * 4);\n       WA1 = ДЕНЬИНД           FC(2),             // Индекс День                   \n             ДЕНЬ              FC(2),             // День                             \n             ВЛАОТВОМ          FC(3),             // Относительная влажность\n             ВЛАОТВОМ.Q        FC(1),             // Признак качества                     \n             ВЛОАМИМС          FC(4,1),           // Абсолютная влажность         \n             ВЛОАМИМС.Q        FC(1),             // Признак качества                     \n             ДАВЛАУММ          FC(6,1),           // Давление воздуxа на уровне моря\n             ДАВЛАУММ.Q        FC(1),             // Признак качества                     \n             НЕДНАСПР          FC(4,1),           // Недостаток насыщения    \n             НЕДНАСПР.Q        FC(1),             // Признак качества                     \n             ВЕТХАР0В          FC(1),             // Характеристика ветра         \n             ВЕТХАР0В.Q        FC(1),             // Признак качества                     \n             ТЕНБВИДГ          FC(1),             // Тенденция барометрическая - вид кривой           \n             ТЕНБВИДГ.Q        FC(1),             // Признак качества                     \n             ТЕНБВЕЛР          FC(3,1),           // Величина барометрической тенденции\n             ТЕНБВЕЛР.QX       FC(1),             // Дополнитнльный признак                      \n             ТЕНБВЕЛР.Q        FC(1),             // Признак качества                            \n             ВИДГОРИВ          FC(2),             // Горизонтальная видимость           \n             ВИДГОРИВ.QX       FC(1),             // Дополнитнльный признак                      \n             ВИДГОРИВ.Q        FC(1),             // Признак качества                            \n             ОБЛВЫНГМ          FC(2),             // Высота нижней границы облачности  \n             ОБЛВЫНГМ.QX       FC(1),             // Дополнитнльный признак                      \n             ОБЛВЫНГМ.Q        FC(1),             // Признак качества                            \n             ТОЧКАРОР          FC(3),             // Точка росы           \n             ТОЧКАРОР.Q        FC(1),             // Признак качества                     \n             СОСТППЧВ          FC(1),             // Состояние поверxности почвы   \n             СОСТППЧВ.Q        FC(1),             // Признак качества                     \n             ОБЛОКОЛВ          FC(2),             // Количество общей облачности  \n             ОБЛОКОЛВ.QX       FC(1),             // Дополнитнльный признак                     \n             ОБЛОКОЛВ.Q        FC(1),             // Признак качества                           \n             ОБЛНКОЛВ          FC(2),             // Количество нижней облачности     \n             ОБЛНКОЛВ.QХ       FC(1),             // Дополнитнльный признак           \n             ОБЛНКОЛВ.Q        FC(1),             // Признак качества                 \n             ВЕТНАПРД          FC(2),             // Направление ветра    \n             ВЕТНАПРД.Q        FC(1),             // Признак качества     \n             ВЕТСКОРД          FC(2),             // Скорость ветра         \n             ВЕТСКОРД.Q        FC(1),             // Признак качества       \n             ОСАХАР            FC(1),             // Характеристика осадков \n             ОСАКОНДГ          FC(5,1),           // Сумма осадков   \n             ОСАКОНДГ.Q        FC(1),             // Признак качества                     \n             ДАВЛАСТМ          FC(6,1),           // Давление воздуxа на уровне станции  \n             ДАВЛАСТМ.Q        FC(1),             // Признак качества                    \n             ТЕМПОВПМ          FC(3),             // Температура поверxности почвы       \n             ТЕМПОВПМ.Q        FC(1),             // Признак качества                    \n             ПОГОДСНВ          FC(2),             // Погода в срок наблюдений       \n             ПОГОДСНВ.Q        FC(1),             // Признак качества               \n             ПОГОМСНВ          FC(1),             // Погода между сроками наблюдений   \n             ПОГОМСНВ.QX       FC(1),             // Дополнитнльный признак            \n             ПОГОМСНВ.Q        FC(1),             // Признак качества                  \n             ТЕМВОЗДМ          FC(5,1),           // Температура воздуха      \n             ТЕМВОЗДМ.Q        FC(1),             // Признак качества                     \n             АТМЯВЛ1В          FC(1),             // Гололед, изморось, роса, иней                      \n             АТМЯВЛ1В.QY       FC(1),             // Дополнитнльный признак                             \n             АТМЯВЛ1В.Q        FC(1),             // Признак качества                                                 \n             АТМЯВЛ2В          FC(1),             // Туманы, дымка, мгла                                              \n             АТМЯВЛ2В.QY       FC(1),             // Дополнитнльный признак                                           \n             АТМЯВЛ2В.Q        FC(1),             // Признак качества                                                 \n             АТМЯВЛ3В          FC(1),             // Метели, поземок, пыльная буря                                    \n             АТМЯВЛ3В.QY       FC(1),             // Дополнитнльный признак                                           \n             АТМЯВЛ3В.Q        FC(1),             // Признак качества                                                 \n             АТМЯВЛ4В          FC(1),             // Снежная, ледяная, крупа, снежные зерна                           \n             АТМЯВЛ4В.QY       FC(1),             // Дополнитнльный признак                                           \n             АТМЯВЛ4В.Q        FC(1),             // Признак качества                                                 \n             АТМЯВЛ5В          FC(1),             // Морось, обложной, ливневый, ледяной дождь                        \n             АТМЯВЛ5В.QY       FC(1),             // Дополнитнльный признак                                           \n             АТМЯВЛ5В.Q        FC(1),             // Признак качества                                                 \n             АТМЯВЛ6В          FC(1),             // Мираж, ледяные иглы, снег, мокрый снег                           \n             АТМЯВЛ6В.QY       FC(1),             // Дополнитнльный признак                                           \n             АТМЯВЛ6В.Q        FC(1),             // Признак качества                                                 \n             АТМЯВЛ7В          FC(1),             // Парение моря,пол.сияние,зарница,гроза,град                       \n             АТМЯВЛ7В.QY       FC(1),             // Дополнитнльный признак                                           \n             АТМЯВЛ7В.Q        FC(1),             // Признак качества                                                 \n             ОБЛФОР1В          FC(1),             // Форма облаков верxнего яруса        \n             ОБЛФОР1В.QX       FC(1),             // Дополнитнльный признак                                   \n             ОБЛФОР1В.Q        FC(1),             // Признак качества                                         \n             ОБЛФОР2В          FC(1),             // Форма облаков среднего яруса                             \n             ОБЛФОР2В.Q        FC(1),             // Признак качества                                         \n             ОБЛФОР3В          FC(1),             // Форма кучевой облачности                                 \n             ОБЛФОР3В.Q        FC(1),             // Признак качества                                         \n             ОБЛФОР4В          FC(1),             // Слоистая слоисто-кучевая облачность                      \n             ОБЛФОР4В.Q        FC(1),             // Признак качества                                         \n             ОБЛФОР5В          FC(1),             // Дождевая, разорванная облачность                         \n             ОБЛФОР5В.Q        FC(1);             // Признак качества                                         \n     END НАБЛДЕНЬ;\n   END НАБЛСРОК;\n	3	2456	4-Срочные данные    до 1965г.	\N
tmss_cn2.aql	 WA1 (10000) CHAR; \n \n IN: STREAM(R) TMSS;\n     PORTION RECORDS.CONST;\n \n   RECORDS NAT;\n     IF  (СТАНЦИЯ  * 1);\n     IF  (ГОД      * 2);\n     IF  (МЕСЯЦ    * 3);\n     WA1 = СТАНЦИЯ           FC(7),               // Станция\n           ГОД               FC(4),               // Год\n           МЕСЯЦ             FC(2);               // Месяц\n \n     RBODY CONST;\n       WA1 = НАИМЕНСТ          FC(20),            // Наименование станции\n             КООРДНОМ          FC(7),             // Координатный номер станции\n             НОМУПРАВ          FC(2),             // Номер УГМС\n             НОМЧАСП           FC(2),             // Номер часового пояса\n             ПРГЕОРАС          FC(1),             // Признак географического расположения\n             КОЛСРОК           FC(1),             // Количество сроков наблюдения\n             ПРНЕПРДН          FC(1),             // Признак непрерывного раб. дня             \n             ПРПРИНСТ          FC(1),             // Признак принадлежности станции            \n             ПРУАТГМС          FC(1),             // Признак наличия УАТГМС                    \n             ПРЕЖЧАСН          FC(1),             // Наличие ежечасных наблюдений              \n             ПРАГРОМН          FC(1),             // Наличие агрометеорологических наблюдений  \n             ПРПРМОРН          FC(1),             // Наличие прибрежных морских наблюдений     \n             ПРГИДРОН          FC(1),             // Наличие гидрологических наблюдений        \n             ПРАЭРОН           FC(1),             // Наличие аэрологических наблюдений         \n             ПРРАДИОН          FC(1),             // Наличие радиолокационных наблюдений       \n             ПРАКТИНН          FC(1),             // Наличие актинометрических наблюдений      \n             ПРТЕПЛОБ          FC(1),             // Наличие теплобалансовых наблюдений        \n             ПРОЗОНН           FC(1),             // Наличие озонометрических наблюдений       \n             ПРАТЭЛЕК          FC(1),             // Наличие набл.атмосферного электричества   \n             ПРЗАГРВЗ          FC(1),             // Наличие наблюдений загрязнения воздуха    \n             ПРКЛАССТ          FC(1),             // Признак классности станции                \n             ПРООЯ             FC(1),             // Классиф.критер.ооя                                         \n             ПРПЕЖМЧ1          FC(1),             // Помещ.данных ежм ч1                                        \n             ПРПЕЖМЧ2          FC(1),             // Пом.дан.ежм ч2,ежг.                    \n             ПРПССЕЖ2          FC(1),             // Дан.солн.с.в ежм ч2                    \n             ТИПУЧАСТ          FC(1),             // Тип участка станции                    \n             ВЫССТНУМ          FC(5),             // Высота над уровнем моря                \n             ПРНВИДИМ          FC(1),             // Наблюдения дальности видимости         \n             ПРНОБЛАЧ          FC(1),             // Наблюдения над облачностью             \n             ПРНВЫСОБ          FC(1),             // Набл. высоты нижней границы облачности \n             ПРСОСТПП          FC(1),             // Наблюдения состояния поверхности почвы \n             ПРНПОГОД          FC(1),             // Наблюдения над погодой                 \n             ПРНВЕТР           FC(1),             // Наблюдения над ветром                  \n             ВЫСФЛЛД           FC(5,1),           // Высота флюгера с легкой доской         \n             ВЫСФЛТД           FC(5,1),           // Высота флюгера с тяжелой доской           \n             ВЫСАНЕМО          FC(5,1),           // Высота анеморумбометра                    \n             ПРНОСАДК          FC(1),             // Наблюдения над осадками                   \n             ПРНТЕМПП          FC(1),             // Наблюдения температуры поверхности почвы  \n             ПРНТЕМВ           FC(1),             // Наблюдения температуры воздуха            \n             ПРНСНЕГ           FC(1),             // Наличие снегосъемок                       \n             ДЛСНЕГП           FC(3,1),           // Длина полевого маршрута                   \n             ДЛСНЕГЛ           FC(3,1),           // Длина маршрута по лесу                    \n             ДЛСНЕГБ           FC(3,1),           // Длина маршрута по балкам                  \n             ПРНГЕЛИО          FC(1),             // Наличие гелиографа                        \n             ВЫСГЕЛИО          FC(5,1),           // Высота гелиографа над землей              \n             ПРНТЕРМО          FC(1),             // Наличие термографа                        \n             ПРНГИГРО          FC(1),             // Наличие гигрографа                        \n             ПРНПЛЮВ           FC(1),             // Наличие плювиографа                       \n             ПРНОБЛЕД          FC(1),             // Наблюдения обледенения                    \n             ПРНБАРОМ          FC(1),             // Наличие барометра                         \n             ВЫСБАРОМ          FC(7,1);           // Высота барометра над уровнем моря         \n       WA1 = ДНАЧПНОЧ          FC(2),             // День начала полярной ночи                \n             МНАЧПНОЧ          FC(2),             // Месяц начала полярной ночи               \n             ДКОНЦАПН          FC(2),             // День окончания полярной ночи             \n             МКОНЦАПН          FC(2),             // Месяц окончания полярной ночи            \n             НОМЕРАДР          FC(3),             // Номер административного района в УГМС    \n             ГОДТЕКУЩ          FC(4),             // Текущий год                              \n             МЕСЯЦТЕК          FC(2),             // Текущий месяц                            \n             КОЛДНМЕС          FC(2),             // Количество дней в месяце                 \n             НМСМОСКВ          FC(2),             // Начало местных суток, МДВ                \n             НМСПДЗВ           FC(2),             // Начало местных суток, ПДЗВ               \n             ПЧАСНМС           FC(2),             // Первый час от начала местных суток       \n             ПСРОКНМС          FC(2),             // Первый срок от начала местных суток      \n             СБЛ8ЧАС8          FC(2),             // Срок, ближайший к 8 часам ПДЗВ           \n             СБ14ЧАС8          FC(2),             // Срок, ближайший к 14 часам ПДЗВ          \n             СБ14ЧАС4          FC(2),             // Срок, ближайший к 14 часам ПДВ (4 срока) \n             ШИРОТА            FC(4,1),           // Широта расположения станции  \n             ДОЛГОТА           FC(4,1),           // Долгота расположения станц.  \n             ОПРПОЛУШ          FC(1),             // Определитель долготы и полушария \n             ГОДОТКСТ          FC(4),             // Год открытия станции    \n             NАРФАЙЛА          FC(2),             // Номер архивного файла   \n             KЗSUTKI           FC(2),             // Количество записей СУТКИ\n             KЗTPOCHV          FC(2);             // Количество записей ТЕМПЕРАТУРА ПОЧВЫ  \n     END CONST;\n   END RECORDS;\n	3	2457	Паспортные данные             *	\N
tmss_ct2.aql	 WA1 (10000) CHAR; \n \n IN: STREAM(R) TMSS;\n     PORTION RECORDS;\n \n   RECORDS NAT;\n     IF  (СТАНЦИЯ  * 1);\n     IF  (ГОД      * 2);\n     IF  (МЕСЯЦ    * 3);\n     IF  (ТИПЗАП   * 4);\n     WA1 = СТАНЦИЯ           FC(7),               // Станция\n           ГОД               FC(4),               // Год\n           МЕСЯЦ             FC(2),               // Месяц\n           ТИПЗАП            FC(1);               // Тип записи (1-3)\n   END RECORDS;\n	3	2458	Признаки (Год, Мес, Станция, Тип записи)	\N
tmss_su2.aql	 WA1 (10000) CHAR; \n \n IN: STREAM(R) TMSS;\n     PORTION RECORDS.SUTKI;\n \n   RECORDS NAT;\n     IF  (СТАНЦИЯ  * 1);\n     IF  (ГОД      * 2);\n     IF  (МЕСЯЦ    * 3);\n     WA1 = СТАНЦИЯ           FC(7),               // Станция\n           ГОД               FC(4),               // Год\n           МЕСЯЦ             FC(2);               // Месяц\n \n     RBODY SUTKI;\n       IF  (ДЕНЬ     * 4);\n       WA1 = ДЕНЬ              FC(2),             // День\n             ДАТА              FC(2),             // Дата\n             ТЕМВСРСТ          FC(5,1),           // Средняя температура воздуха\n             ТЕМВСРСТ.Q        FC(1),             // Признак качества\n             ТЕВМАКСТ          FC(5,1),           // Максимальная температура воздуха\n             ТЕВМАКСТ.Q        FC(1),             // Признак качества\n             ТЕВМИНСТ          FC(5,1),           // Минимальная температура воздуха\n             ТЕВМИНСТ.Q        FC(1),             // Признак качества\n             ТЕМПСРСТ          FC(5,1),           // Средняя температура поверхности почвы\n             ТЕМПСРСТ.Q        FC(1),             // Признак качества\n             ТЕПМАКСТ          FC(5,1),           // Макс. температура поверхности почвы\n             ТЕПМАКСТ.Q        FC(1),             // Признак качества\n             ТЕПМИНСТ          FC(5,1),           // Мин. температура поверхности почвы\n             ТЕПМИНСТ.Q        FC(1),             // Признак качества\n             ТТРМИНСТ          FC(5,1),           // Мин. значение температура точки росы\n             ТТРМИНСТ.Q        FC(1),             // Признак качества\n             УПРПСРСТ          FC(6,2),           // Среднее парциальн. давл. водяного пара\n             УПРПСРСТ.Q        FC(1),             // Признак качества \n             УПРПСРСТ.Q1       FC(1),             // Указатель точности элемента\n             ВЛОТСРСТ          FC(3),             // Средняя относительная влажность воздуха\n             ВЛОТСРСТ.Q        FC(1),             // Признак качества\n             ВЛОМИНСТ          FC(3),             // Мин. относительная влажность воздуха\n             ВЛОМИНСТ.Q        FC(1),             // Признак качества\n             НЕДНСРСТ          FC(5,2),           // Среднее дефицита насыщения водяного пара\n             ДАУМСРСТ.Q        FC(1),             // Признак качества  \n             ОБОXАРСТ          FC(1),             // Xарактеристика общей облачности\n             ОБОXАРСТ.Q        FC(1),             // Признак качества\n             ОБНXАРСТ          FC(1),             // Xарактеристика нижней облачности\n             Q                 FC(1),             // Признак качества\n             ВЕСРСКСТ          FC(4,1),           // Среднее значение скорости ветра\n             ВЕСРСКСТ.Q        FC(1),             // Признак качества\n             ВЕТСМАСТ          FC(3),             // Максимальная скорость ветра по 8 срокам\n             ВЕТСМАСТ.Q        FC(1),             // Признак качества  \n             ВЕТСАМСТ          FC(3),             // Абсол. максимальная скорость ветра\n             ВЕТСАМСТ.Q        FC(1),             // Признак качества\n             ОСАСУМСТ          FC(6,1),           // Суточная сумма осадков\n             ОСАСУМСТ.Q        FC(1),             // Признак качества\n             СОСТППЧВ          FC(1),             // Состояние поверxности почвы\n             СОСТППЧВ.Q        FC(1),             // Признак качества\n             СОСТППЧВ.СОСТПППЮ FC(1),             // Признак наличия знака ю у е\n             СНЕПВЫСМ          FC(4),             // Высота сн.покрова на метеоплощ.(3рейки)\n             СНЕПВЫСМ.Q        FC(1),             // Признак качества  \n             СНЕСТЕПВ          FC(2),             // Степень покр.окрестности станции снегом\n             СНЕСТЕПВ.Q        FC(1),             // Признак качества  \n             СНЕПXАРЗ          FC(1),             // Xарактер залегания снежного покрова\n             СНЕПXАРЗ.Q        FC(1),             // Признак качества  \n             СОЛСПРСТ          FC(4,1),           // Продолжительность солнечного сияния\n             СОЛСПРСТ.Q        FC(1);             // Признак качества  \n     END SUTKI;\n   END RECORDS;\n	3	2459	Основные суточные данные (кроме АЯ)	\N
tmss_at2.aql	 WA1 (10000) CHAR; \n \n IN: STREAM(R) TMSS;\n     PORTION RECORDS.SUTKI;\n \n   RECORDS NAT;\n     IF  (СТАНЦИЯ  * 1);\n     IF  (ГОД      * 2);\n     IF  (МЕСЯЦ    * 3);\n     WA1 = СТАНЦИЯ           FC(7),               // Станция\n           ГОД               FC(4),               // Год\n           МЕСЯЦ             FC(2);               // Месяц\n \n     RBODY SUTKI;\n       IF  (ДЕНЬ     * 4);\n       WA1 = ДЕНЬ              FC(2);             // День\n       GROUP ПРАТМЯВЛ;\n         WA1 = ВИДЫАЯ            FC(2),           // Вид атмосферного явления\n               АЯПРОДСТ          FC(2),           // Продолжительность атмосферного явления\n               АЯПРОДСТ.Q        FC(1);           // Признак качества\n       END ПРАТМЯВЛ;\n       GROUP НАЛИЧАЯ;\n         WA1 = ВИДЫАЯ            FC(1),           // Вид атмосферного явления\n               НАЛАЯВСТ          FC(1),           // Наличие атмосферного явления\n               НАЛАЯВСТ.Q        FC(1);           // Признак качества\n       END НАЛИЧАЯ;\n     END SUTKI;\n   END RECORDS;\n	3	2460	Атмосферные явления	\N
su65_all.aql	 WA1 (10000) CHAR; \n \n IN: STREAM(R) TM1_SU;\n     PORTION НАБЛМЕС.НАБЛДЕНЬ;\n \n   RECORD НАБЛМЕС NAT;\n//   IF  (СТАНЦИЯ  * 1);\n     IF  (ГОД      * 2);\n     IF  (МЕСЯЦ    * 3);\n     WA1 = СТАНЦИЯ           FC(7),               // Станция\n           ГОД               FC(4),               // Год\n           МЕСЯЦ             FC(2);               // Месяц\n     GROUP НАБЛДЕНЬ;\n       IF  (ДЕНЬ  * 4);\n       WA1 = ДЕНЬИНД           FC(2),             // Индекс День \n             ДЕНЬ              FC(2),             // День\n             TEMBCPCT          FC(5,1),           // Средняя температура воздуха\n             TEMBCPCT.Q        FC(1),             // Признак качества\n             ТЕВМАКСТ          FC(5,1),           // Максимальная температура воздуха \n             ТЕВМАКСТ.Q        FC(1),             // Признак качества\n             ТЕВМИНСТ          FC(5,1),           // Минимальная температура воздуха\n             ТЕВМИНСТ.Q        FC(1),             // Признак качества\n             ВЛОМИНСТ          FC(2),             // Минимальная относительная влажность\n             ВЛОМИНСТ.QL       FC(1),             // Дополнительная характеристика\n             ВЛОМИНСТ.Q        FC(1),             // Признак качества\n             ОСАДКОЛМ          FC(5,1),           // Количество осадков\n             ОСАДКОЛМ.QO       FC(1),             // Дополнительная характеристика\n             ОСАДКОЛМ.Q        FC(1),             // Признак качества\n             СНЕСТЕПВ          FC(1),             // Снежный покров - степень покрытия\n             СНЕСТЕПВ.QC       FC(1),             // Дополнительная характеристика\n             СНЕСТЕПВ.Q        FC(1),             // Признак качества\n             СНЕПОУЧВ          FC(1),             // Характеристика участка\n             СНЕПОУЧВ.Q        FC(1),             // Признак качества\n             СНЕПВЫСМ          FC(3),             // Высота снежного покрова\n             СНЕПВЫСМ.QP       FC(1),             // Дополнительная характеристика\n             СНЕПВЫСМ.Q        FC(1),             // Признак качества\n             ТЕИПОПСТ          FC(5,1),           // Мин. температура поверхности почвы\n             ТЕИПОПСТ.Q        FC(1),             // Признак качества\n             АЯПР01СТ          FC(1),             // АЯ - Дымка\n             АЯПР01СТ.Q        FC(1),             // Признак качества\n             АЯПР02СТ          FC(1),             // АЯ - Поземный туман\n             АЯПР02СТ.Q        FC(1),             // Признак качества\n             АЯПР03СТ          FC(1),             // АЯ - Туман просвеч. ледяной\n             АЯПР03СТ.Q        FC(1),             // Признак качества\n             АЯПР04СТ          FC(1),             // АЯ - Мгла\n             АЯПР04СТ.Q        FC(1),             // Признак качества\n             АЯПР05СТ          FC(1),             // АЯ - Чистый воздух\n             АЯПР05СТ.Q        FC(1),             // Признак качества\n             АЯПР06СТ          FC(1),             // АЯ - Гроза, отдаленная гроза\n             АЯПР06СТ.Q        FC(1),             // Признак качества\n             АЯПР07СТ          FC(1),             // АЯ - Дождь\n             АЯПР07СТ.Q        FC(1),             // Признак качества\n             АЯПР08СТ          FC(1),             // АЯ - Морось\n             АЯПР08СТ.Q        FC(1),             // Признак качества\n             АЯПР09СТ          FC(1),             // АЯ - Ливневый дождь\n             АЯПР09СТ.Q        FC(1),             // Признак качества\n             АЯПР10СТ          FC(1),             // АЯ - Град \n             АЯПР10СТ.Q        FC(1),             // Признак качества\n             АЯПР11СТ          FC(1),             // АЯ - Полярное сияние\n             АЯПР11СТ.Q        FC(1),             // Признак качества\n             АЯПР12СТ          FC(1),             // АЯ - Ледяной дождь\n             АЯПР12СТ.Q        FC(1),             // Признак качества\n             АЯПР13СТ          FC(1),             // АЯ - Мокрый снег\n             АЯПР13СТ.Q        FC(1),             // Признак качества\n             АЯПР14СТ          FC(1),             // АЯ - Ливневой мокрый снег\n             АЯПР14СТ.Q        FC(1),             // Признак качества\n             АЯПР15СТ          FC(1),             // АЯ - Снег, снежные зерна\n             АЯПР15СТ.Q        FC(1),             // Признак качества\n             АЯПР16СТ          FC(1),             // АЯ - Ледяная, снежная крупа; Ливневый снег\n             АЯПР16СТ.Q        FC(1),             // Признак качества\n             АЯПР17СТ          FC(1),             // АЯ - Метель: Низовая; С выпадением снега\n             АЯПР17СТ.Q        FC(1),             // Признак качества\n             АЯПР18СТ          FC(1),             // АЯ - Мираж\n             АЯПР18СТ.Q        FC(1),             // Признак качества\n             АЯПР19СТ          FC(1),             // АЯ - Поземок\n             АЯПР19СТ.Q        FC(1),             // Признак качества\n             АЯПР20СТ          FC(1),             // АЯ - Бурный ветер\n             АЯПР20СТ.Q        FC(1),             // Признак качества\n             АЯПР21СТ          FC(1),             // АЯ - Шквал\n             АЯПР21СТ.Q        FC(1),             // Признак качества\n             АЯПР22СТ          FC(1),             // АЯ - Пыльная буря\n             АЯПР22СТ.Q        FC(1),             // Признак качества\n             АЯПР23СТ          FC(1),             // АЯ - Парение моря, озера, реки\n             АЯПР23СТ.Q        FC(1),             // Признак качества\n             АЯПР24СТ          FC(1),             // АЯ - Роса\n             АЯПР24СТ.Q        FC(1),             // Признак качества\n             АЯПР25СТ          FC(1),             // АЯ - Иней\n             АЯПР25СТ.Q        FC(1),             // Признак качества\n             АЯПР26СТ          FC(1),             // АЯ - Гололед\n             АЯПР26СТ.Q        FC(1),             // Признак качества\n             АЯПР27СТ          FC(1),             // АЯ - Вихрь\n             АЯПР27СТ.Q        FC(1),             // Признак качества\n             АЯПР28СТ          FC(1),             // АЯ - Кристаллическая изморось\n             АЯПР28СТ.Q        FC(1),             // Признак качества\n             АЯПР29СТ          FC(1),             // АЯ - Ледяные иглы\n             АЯПР29СТ.Q        FC(1),             // Признак качества\n             АЯПР30СТ          FC(1),             // АЯ - Смерч\n             АЯПР30СТ.Q        FC(1),             // Признак качества\n             АЯПР31СТ          FC(1),             // АЯ - Твердый, жидкий налет \n             АЯПР31СТ.Q        FC(1),             // Признак качества\n             ДОПОЛНИТ          FC(1),             // Доп. информация об атмосферных явлениях\n             ОБОХАРСТ          FC(1),             // Количество общей облачности\n             ОБОХАРСТ.Q        FC(1),             // Признак качества\n             ОБНХАРСТ          FC(1),             // Количество нижней облачности\n             ОБНХАРСТ.Q        FC(1),             // Признак качества\n             ВЕТНАПРД          FC(1),             // Преобладающее направление ветра\n             ВЕТНАПРД.QX       FC(1),             // Дополнительная характеристика\n             ВЕТНАПРД.Q        FC(1),             // Признак качества\n             ВЕТСМАСТ          FC(2),             // Скорость ветра\n             ВЕТСМАСТ.QX       FC(1),             // Дополнительная характеристика\n             ВЕТСМАСТ.Q        FC(1),             // Признак качества\n             СОЛСПРСТ          FC(2),             // Продолжительность солнечного сияния\n             СОЛСПРСТ.QY       FC(1),             // Дополнительная характеристика\n             СОЛСПРСТ.Q        FC(1);             // Признак качества\n     END НАБЛДЕНЬ;\n   END НАБЛМЕС;\n	3	2461	Суточные данные	\N
srTm0_all.aql	 WA1 (10000) CHAR; \n \n IN: STREAM(R) TM1_SR;\n     PORTION НАБЛСРОК.НАБЛДЕНЬ;\n \n   RECORD НАБЛСРОК NAT;\n     IF  (ГОД      * 1);\n     IF  (МЕСЯЦ    * 2);\n     IF  (СРОК     * 3);\n     WA1 = СТАНЦИЯ           FC(7),               // Станция              \n           ГОД               FC(4),               // Год                    \n           МЕСЯЦ             FC(2),               // Месяц                \n           СРОК              FC(2);               // Срок             \n     GROUP НАБЛДЕНЬ;\n       IF  (ДЕНЬ     * 4);\n       WA1 = ДЕНЬИНД           FC(2),             // Индекс День                   \n             ДЕНЬ              FC(2),             // День                             \n             ВЛАОТВОМ          FC(3),             // Относительная влажность\n             ВЛАОТВОМ.Q        FC(1),             // Признак качества                     \n             ВЛОАМИМС          FC(4,1),           // Абсолютная влажность         \n             ВЛОАМИМС.Q        FC(1),             // Признак качества                     \n             ДАВЛАУММ          FC(6,1),           // Давление воздуxа на уровне моря\n             ДАВЛАУММ.Q        FC(1),             // Признак качества                     \n             НЕДНАСПР          FC(4,1),           // Недостаток насыщения    \n             НЕДНАСПР.Q        FC(1),             // Признак качества                     \n             ВЕТХАР0В          FC(1),             // Характеристика ветра         \n             ВЕТХАР0В.Q        FC(1),             // Признак качества                     \n             ТЕНБВИДГ          FC(1),             // Тенденция барометрическая - вид кривой           \n             ТЕНБВИДГ.Q        FC(1),             // Признак качества                     \n             ТЕНБВЕЛР          FC(3,1),           // Величина барометрической тенденции\n             ТЕНБВЕЛР.QX       FC(1),             // Дополнитнльный признак                      \n             ТЕНБВЕЛР.Q        FC(1),             // Признак качества                            \n             ВИДГОРИВ          FC(2),             // Горизонтальная видимость           \n             ВИДГОРИВ.QX       FC(1),             // Дополнитнльный признак                      \n             ВИДГОРИВ.Q        FC(1),             // Признак качества                            \n             ОБЛВЫНГМ          FC(2),             // Высота нижней границы облачности  \n             ОБЛВЫНГМ.QX       FC(1),             // Дополнитнльный признак                      \n             ОБЛВЫНГМ.Q        FC(1),             // Признак качества                            \n             ТОЧКАРОР          FC(3),             // Точка росы           \n             ТОЧКАРОР.Q        FC(1),             // Признак качества                     \n             СОСТППЧВ          FC(1),             // Состояние поверxности почвы   \n             СОСТППЧВ.Q        FC(1),             // Признак качества                     \n             ОБЛОКОЛВ          FC(2),             // Количество общей облачности  \n             ОБЛОКОЛВ.QX       FC(1),             // Дополнитнльный признак                     \n             ОБЛОКОЛВ.Q        FC(1),             // Признак качества                           \n             ОБЛНКОЛВ          FC(2),             // Количество нижней облачности     \n             ОБЛНКОЛВ.QХ       FC(1),             // Дополнитнльный признак           \n             ОБЛНКОЛВ.Q        FC(1),             // Признак качества                 \n             ВЕТНАПРД          FC(2),             // Направление ветра    \n             ВЕТНАПРД.Q        FC(1),             // Признак качества     \n             ВЕТСКОРД          FC(2),             // Скорость ветра         \n             ВЕТСКОРД.Q        FC(1),             // Признак качества       \n             ОСАХАР            FC(1),             // Характеристика осадков \n             ОСАКОНДГ          FC(5,1),           // Сумма осадков   \n             ОСАКОНДГ.Q        FC(1),             // Признак качества                     \n             ДАВЛАСТМ          FC(6,1),           // Давление воздуxа на уровне станции  \n             ДАВЛАСТМ.Q        FC(1),             // Признак качества                    \n             ТЕМПОВПМ          FC(3),             // Температура поверxности почвы       \n             ТЕМПОВПМ.Q        FC(1),             // Признак качества                    \n             ПОГОДСНВ          FC(2),             // Погода в срок наблюдений       \n             ПОГОДСНВ.Q        FC(1),             // Признак качества               \n             ПОГОМСНВ          FC(1),             // Погода между сроками наблюдений   \n             ПОГОМСНВ.QX       FC(1),             // Дополнитнльный признак            \n             ПОГОМСНВ.Q        FC(1),             // Признак качества                  \n             ТЕМВОЗДМ          FC(5,1),           // Температура воздуха      \n             ТЕМВОЗДМ.Q        FC(1),             // Признак качества                     \n             АТМЯВЛ1В          FC(1),             // Гололед, изморось, роса, иней                      \n             АТМЯВЛ1В.QY       FC(1),             // Дополнитнльный признак                             \n             АТМЯВЛ1В.Q        FC(1),             // Признак качества                                                 \n             АТМЯВЛ2В          FC(1),             // Туманы, дымка, мгла                                              \n             АТМЯВЛ2В.QY       FC(1),             // Дополнитнльный признак                                           \n             АТМЯВЛ2В.Q        FC(1),             // Признак качества                                                 \n             АТМЯВЛ3В          FC(1),             // Метели, поземок, пыльная буря                                    \n             АТМЯВЛ3В.QY       FC(1),             // Дополнитнльный признак                                           \n             АТМЯВЛ3В.Q        FC(1),             // Признак качества                                                 \n             АТМЯВЛ4В          FC(1),             // Снежная, ледяная, крупа, снежные зерна                           \n             АТМЯВЛ4В.QY       FC(1),             // Дополнитнльный признак                                           \n             АТМЯВЛ4В.Q        FC(1),             // Признак качества                                                 \n             АТМЯВЛ5В          FC(1),             // Морось, обложной, ливневый, ледяной дождь                        \n             АТМЯВЛ5В.QY       FC(1),             // Дополнитнльный признак                                           \n             АТМЯВЛ5В.Q        FC(1),             // Признак качества                                                 \n             АТМЯВЛ6В          FC(1),             // Мираж, ледяные иглы, снег, мокрый снег                           \n             АТМЯВЛ6В.QY       FC(1),             // Дополнитнльный признак                                           \n             АТМЯВЛ6В.Q        FC(1),             // Признак качества                                                 \n             АТМЯВЛ7В          FC(1),             // Парение моря,пол.сияние,зарница,гроза,град                       \n             АТМЯВЛ7В.QY       FC(1),             // Дополнитнльный признак                                           \n             АТМЯВЛ7В.Q        FC(1),             // Признак качества                                                 \n             ОБЛФОР1В          FC(1),             // Форма облаков верxнего яруса        \n             ОБЛФОР1В.QX       FC(1),             // Дополнитнльный признак                                   \n             ОБЛФОР1В.Q        FC(1),             // Признак качества                                         \n             ОБЛФОР2В          FC(1),             // Форма облаков среднего яруса                             \n             ОБЛФОР2В.Q        FC(1),             // Признак качества                                         \n             ОБЛФОР3В          FC(1),             // Форма кучевой облачности                                 \n             ОБЛФОР3В.Q        FC(1),             // Признак качества                                         \n             ОБЛФОР4В          FC(1),             // Слоистая слоисто-кучевая облачность                      \n             ОБЛФОР4В.Q        FC(1),             // Признак качества                                         \n             ОБЛФОР5В          FC(1),             // Дождевая, разорванная облачность                         \n             ОБЛФОР5В.Q        FC(1);             // Признак качества                                         \n     END НАБЛДЕНЬ;\n   END НАБЛСРОК;\n	3	2462	3-Срочные данные до 1935г.	\N
sut66_all.aql	 WA1 (10000) CHAR; \n \n IN: STREAM(R) SUT66;\n     PORTION НАБЛМЕС.НАБЛДЕНЬ;\n \n   RECORD НАБЛМЕС NAT;\n//   IF  (СТАНЦИЯ  * 1);\n     IF  (ГОД      * 2);\n     IF  (МЕСЯЦ    * 3);\n     WA1 = СТАНЦИЯ           FC(7),               // Станция            \n           ГОД               FC(4),               // Год                \n           МЕСЯЦ             FC(2);               // Месяц              \n     GROUP НАБЛДЕНЬ;\n       IF  (ДЕНЬ     * 4);\n       WA1 = ДЕНЬИНД           FC(2),             // Индекс День \n             ДЕНЬ              FC(2),             // День        \n             ТЕМВСРСТ          FC(5,1),           // Средняя температура воздуха      \n             ТЕМВСРСТ.Q        FC(1),             // Признак качества                 \n             ТЕВМАКСТ          FC(5,1),           // Максимальная температура воздуха \n             ТЕВМАКСТ.Q        FC(1),             // Признак качества                 \n             ТЕВМИНСТ          FC(5,1),           // Минимальная температура воздуха  \n             ТЕВМИНСТ.Q        FC(1),             // Признак качества                 \n             ВЛОМИНСТ          FC(2),             // Минимальная относительная влажность  \n             ВЛОМИНСТ.QL       FC(1),             // Дополнительная характеристика        \n             ВЛОМИНСТ.Q        FC(1),             // Признак качества                     \n             ОСАДКОЛМ          FC(5,1),           // Количество осадков              \n             ОСАДКОЛМ.QО       FC(1),             // Дополнительная характеристика   \n             ОСАДКОЛМ.Q        FC(1),             // Признак качества                \n             СНЕСТЕПВ          FC(1),             // Снежный покров - степень покрытия   \n             СНЕСТЕПВ.QS       FC(1),             // Дополнительная характеристика       \n             СНЕСТЕПВ.Q        FC(1),             // Признак качества                    \n             СНЕПОУЧВ          FC(1),             // Характеристика участка              \n             СНЕПОУЧВ.Q        FC(1),             // Признак качества                    \n             СНЕПВЫСМ          FC(3),             // Высота снежного покрова             \n             СНЕПВЫСМ.QР       FC(1),             // Дополнительная характеристика       \n             СНЕПВЫСМ.Q        FC(1),             // Признак качества                    \n             ТЕИПОПСТ          FC(5,1),           // Мин. температура поверхности почвы \n             ТЕИПОПСТ.Q        FC(1),             // Признак качества                   \n             АЯПР01СТ          FC(2),             // АЯ1  - продолжительность \n             АЯПР01СТ.Q        FC(1),             // Признак качества \n             АЯПР02СТ          FC(2),             // АЯ2  - продолжительность              \n             АЯПР02СТ.Q        FC(1),             // Признак качества\n             АЯПР03СТ          FC(2),             // АЯ3  - продолжительность              \n             АЯПР03СТ.Q        FC(1),             // Признак качества\n             АЯПР04СТ          FC(2),             // АЯ4  - продолжительность              \n             АЯПР04СТ.Q        FC(1),             // Признак качества\n             АЯПР05СТ          FC(2),             // АЯ5  - продолжительность              \n             АЯПР05СТ.Q        FC(1),             // Признак качества\n             АЯПР06СТ          FC(2),             // АЯ6  - продолжительность              \n             АЯПР06СТ.Q        FC(1),             // Признак качества\n             АЯПР07СТ          FC(2),             // АЯ7  - продолжительность              \n             АЯПР07СТ.Q        FC(1),             // Признак качества\n             АЯПР08СТ          FC(2),             // АЯ8  - продолжительность              \n             АЯПР08СТ.Q        FC(1),             // Признак качества\n             АЯПР09СТ          FC(2),             // АЯ9  - продолжительность              \n             АЯПР09СТ.Q        FC(1),             // Признак качества\n             АЯПР10СТ          FC(2),             // АЯ10 - продолжительность              \n             АЯПР10СТ.Q        FC(1),             // Признак качества\n             АЯПР11СТ          FC(2),             // АЯ11 - продолжительность              \n             АЯПР11СТ.Q        FC(1),             // Признак качества\n             АТМЯВЛ1В          FC(1),             // АЯ1 - наличие              \n             АТМЯВЛ1В.Q        FC(1),             // Признак качества\n             АТМЯВЛ2В          FC(1),             // АЯ2 - наличие              \n             АТМЯВЛ2В.Q        FC(1),             // Признак качества\n             АТМЯВЛ3В          FC(1),             // АЯ3 - наличие              \n             АТМЯВЛ3В.Q        FC(1),             // Признак качества\n             АТМЯВЛ4В          FC(1),             // АЯ4 - наличие              \n             АТМЯВЛ4В.Q        FC(1),             // Признак качества\n             АТМЯВЛ5В          FC(1),             // АЯ5 - наличие             \n             АТМЯВЛ5В.Q        FC(1),             // Признак качества\n             АТМЯВЛ6В          FC(1),             // АЯ6 - наличие             \n             АТМЯВЛ6В.Q        FC(1),             // Признак качества\n             АТМЯВЛ7В          FC(1),             // АЯ7 - наличие             \n             АТМЯВЛ7В.Q        FC(1),             // Признак качества\n             ДОПОЛНИТ          FC(1),             // АЯ доп             \n             ДОПОЛНИТ.QD       FC(1),             // Дополнительный признак\n             ДОПОЛНИТ.Q        FC(1),             // Признак качества            \n             ОБОXАРСТ          FC(1),             // Признак качестваКоличество общей облачности    \n             ОБОXАРСТ.Q        FC(1),             // Признак качества               \n             ОБНXАРСТ          FC(1),             // Количество нижней облачности   \n             ОБНXАРСТ.Q        FC(1),             // Признак качества               \n             ВЕТСМАСТ          FC(2),             // Максимальная скорость ветра         \n             ВЕТСМАСТ.QX       FC(1),             // Дополнительная характеристика       \n             ВЕТСМАСТ.Q        FC(1),             // Признак качества                    \n             СОЛСПРСТ          FC(2),             // Продолжительность солнечного сияния \n             СОЛСПРСТ.QY       FC(1),             // Дополнительная характеристика       \n             СОЛСПРСТ.Q        FC(1);             // Признак качества                    \n     END НАБЛДЕНЬ;\n   END НАБЛМЕС;\n	3	2463	Суточные данные  1966-76гг.	\N
tms_ob2.aql	 WA1 (10000) CHAR; \n \n IN: STREAM(R) TMS;\n     PORTION RECORDS.OBLJAW.OBLED;\n \n   RECORDS NAT;\n     IF  (СТАНЦИЯ  * 1);\n     IF  (ГОД      * 2);\n     IF  (МЕСЯЦ    * 3);\n     WA1 = СТАНЦИЯ           FC(7),               // Станция\n           ГОД               FC(4),               // Год\n           МЕСЯЦ             FC(2);               // Месяц\n \n     RBODY OBLJAW;\n       GROUP OBLED;\n         WA1 = КOBL              FC(2),           // Индекс\n               ОБДНЧИСР          FC(2),           // Дата начала обледенения\n               ОБДНМСЛР          FC(3),           // Порядковый номер случая обледенения\n               ОБДНМСЛР.Q        FC(1);           // Признак качества\n         GROUP ВИДОБЛ;\n           WA1 = ШИФР              FC(1),         // Шифр \n                 ОБДНВИДВ          FC(2),         // Шифр твердых отложений\n                 ОБДНВИДВ.Q        FC(1);         // Признак качества\n         END ВИДОБЛ;\n         WA1 = ОБДВРЕНВ          FC(2),           // Время начала случая облединения\n               ОБДВРЕНВ.Q        FC(1),           // Признак качества\n               ОБДПРСТН          FC(4),           // Продолжительность стадии нарастания \n               ОБДПРСТН.Q        FC(1),           // Признак качества\n               ОБДПРОДВ          FC(4),           // Продолжительность всего случая обледенения \n               ОБДПРОДВ.Q        FC(1),           // Признак качества\n               ОБДТЕМНМ          FC(5,1),         // Температура воздуха в начале облединения\n               ОБДТЕМНМ.Q        FC(1),           // Признак качества\n               ОБВЕТННМ          FC(3),           // Направление ветра в начал еобледенения\n               ОБВЕТННМ.Q        FC(1),           // Признак качества\n               ОБВЕТСНМ          FC(3),           // Скорость ветра в начале обледенения \n               ОБВЕТСНМ.Q        FC(1),           // Признак качества\n               ОБВЕТСНМ.ОБДВПРНЮ FC(1),           // Признак наличия знака > у F\n               ОБДТЕМММ          FC(5,1),         // Темп-ра воздуха при достиж. отлож. макс. размера\n               ОБДТЕМММ.Q        FC(1),           // Признак качества\n               ОБВЕТНММ          FC(3),           // Напр. ветра при достиж. отлож. макс. размера\n               ОБВЕТНММ.Q        FC(1),           // Признак качества\n               ОБВЕТСММ          FC(2),           // Скорость ветра при достиж. отлож. макс. размера\n               ОБВЕТСММ.Q        FC(1),           // Признак качества\n               ОБВЕТСММ.ОБДВМАНЮ FC(1),           // Признак наличия знака > у F\n               ОБДПРПЕР          FC(1),           // Признак перехода облед. через границу месяца\n               ОБДПРПЕР.Q        FC(1),           // Признак качества\n               ОБДПРД1Ч          FC(4),           // Продолжительность 1-й части облединения\n               ОБДПРД1Ч.Q        FC(1);           // Признак качества\n         GROUP СТАДИЯ;\n           WA1 = КСТАДИЙ           FC(1),         // Индекс\n                 ОБДНДИАМ          FC(3),         // Диаметр отложения\n                 ОБДНДИАМ.Q        FC(1),         // Признак качества \n                 ОБДТОЛЩМ          FC(3),         // Толщина отложения\n                 ОБДТОЛЩМ.Q        FC(1),         // Признак качества  \n                 ОБДНМАСТ          FC(5),         // Масса отложения\n                 ОБДНМАСТ.Q        FC(1);         // Признак качества\n         END СТАДИЯ;\n       END OBLED;\n     END OBLJAW;\n   END RECORDS;\n	3	2464	Данные об обледенении	\N
tms_te2_sr.aql	 WA1 (32000) CHAR; \n \n IN: STREAM(R) TMS;\n     PORTION RECORDS.TPOCHV.ТПЕСТ.SROKE;\n \n   RECORDS NAT;\n     IF  (СТАНЦИЯ  * 1);\n     IF  (ГОД      * 2);\n     IF  (МЕСЯЦ    * 3);\n     WA1 = СТАНЦИЯ           FC(7),               // Станция\n           ГОД               FC(4),               // Год\n           МЕСЯЦ             FC(2);               // Месяц\n           \n \n     RBODY TPOCHV;\n       IF  (ДЕНЬ     * 4);\n       WA1 = ДЕНЬ              FC(2);             // День    \n       GROUP ТПЕСТ;\n         GROUP SROKE;\n           WA1 = СРОКНАБЛ          FC(2);         // Срок наблюдения\n           GROUP ТЕМПОЧВ;\n             WA1 = ГЛУБИНЫ           FC(1),       // Глубины (2-40см)\n                   ТЕППЕСТП          FC(6,1),     // Температура почвы в срок\n                   ТЕППЕСТП.Q        FC(1);       // Признак качества\n           END ТЕМПОЧВ;\n         END SROKE;\n       END ТПЕСТ;\n     END TPOCHV;\n   END RECORDS;\n	3	2465	Температура почвы (естественный покров, срочные)	\N
tms_to2.aql	 WA1 (10000) CHAR; \n \n IN: STREAM(R) TMS;\n     PORTION RECORDS.TPOCHV.ТПОГ.SROKG;\n \n   RECORDS NAT;\n     IF  (СТАНЦИЯ  * 1);\n     IF  (ГОД      * 2);\n     IF  (МЕСЯЦ    * 3);\n     WA1 = СТАНЦИЯ           FC(7),               // Станция\n           ГОД               FC(4),               // Год\n           МЕСЯЦ             FC(2);               // Месяц\n \n     RBODY TPOCHV;\n       IF  (ДЕНЬ     * 4);\n       WA1 = ДЕНЬ              FC(2);             // День    \n       GROUP ТПОГ;\n         GROUP SROKG;\n           WA1 = СРОКНАБЛ          FC(2);         // Срок наблюдения\n           GROUP ТПОЧВОГ;\n             WA1 = ГЛУБИНЫ           FC(1),       // Глубина (5-20см)\n                   ТЕОПОООМ          FC(6,1),     // Температура почвы в срок\n                   ТЕОПОООМ.Q        FC(1);       // Признак качества\n           END ТПОЧВОГ;\n         END SROKG;\n       END ТПОГ;\n     END TPOCHV;\n   END RECORDS;\n	3	2466	Температура почвы (оголенная поверхность, срочные)	\N
tms_sp2.aql	 WA1 (10000) CHAR; \n \n IN: STREAM(R) TMS;\n     PORTION RECORDS.SNEG.SNOWP;\n \n   RECORDS NAT;\n     IF  (СТАНЦИЯ  * 1);\n     IF  (ГОД      * 2);\n     IF  (МЕСЯЦ    * 3);\n     WA1 = СТАНЦИЯ           FC(7),               // Станция\n           ГОД               FC(4),               // Год\n           МЕСЯЦ             FC(2);               // Месяц\n \n     RBODY SNEG;\n       GROUP SNOWP;\n         WA1 = NSNP              FC(1),           // Номер снегосъемки   \n               СНЕГПДПР          FC(2),           // Дата проведения снегосъемки\n               СНЕГСВЫС          FC(4),           // Средняя высота снежного покрова на маршруте\n               СНЕГСВЫС.Q        FC(1),           // Признак качества \n               СНЕВЫСМА          FC(4),           // Наибольшая высота снежного покрова на маршруте\n               СНЕВЫСМА.Q        FC(1),           // Признак качества  \n               СНЕВЫСМИ          FC(4),           // Наименьшая высота снежного покрова на маршруте\n               СНЕВЫСМИ.Q        FC(1),           // Признак качества  \n               СНЕСТПОК          FC(2),           // Степень покрытия маршрута снегом \n               СНЕСТПОК.Q        FC(1),           // Признак качества \n               СНЕСТПЛК          FC(2),           // Степень покрытия маршрута ледяной коркой\n               СНЕСТПЛК.Q        FC(1),           // Признак качества \n               СНЕСРТЛК          FC(3),           // Средняя толщина ледяной корки\n               СНЕСРТЛК.Q        FC(1),           // Признак качества \n               СНЕГТСНВ          FC(3),           // Толщина слоя снега, насыщенного водой\n               СНЕГТСНВ.Q        FC(1),           // Признак качества \n               СНЕГТСЧВ          FC(3),           // Толщина слоя чистой воды\n               СНЕГТСЧВ.Q        FC(1),           // Признак качества    \n               СНЕГХАРЗ          FC(1),           // Характер залегания снежного покрова\n               СНЕГХАРЗ.Q        FC(1),           // Признак качества \n               СНЕГХАРП          FC(1),           // Характер снежного покрова\n               СНЕГХАРП.Q        FC(1),           // Признак качества    \n               СНЕГСРПЛ          FC(4,2),         // Средняя плотность снега\n               СНЕГСРПЛ.Q        FC(1),           // Признак качества   \n               СНЕСТЕПВ          FC(2),           // Степень покрытия окрестности станции снегом\n               СНЕСТЕПВ.Q        FC(1);           // Признак качества \n       END SNOWP;\n     END SNEG;\n   END RECORDS;\n	3	2467	Данные снегосъемок по полю	\N
tms_at2.aql	 WA1 (10000) CHAR; \n \n IN: STREAM(R) TMS;\n     PORTION RECORDS.ATMOS.СРОК.АЯ;\n \n   RECORDS NAT;\n     IF  (СТАНЦИЯ  * 1);\n     IF  (ГОД      * 2);\n     IF  (МЕСЯЦ    * 3);\n     WA1 = СТАНЦИЯ           FC(7),               // Станция\n           ГОД               FC(4),               // Год\n           МЕСЯЦ             FC(2);               // Месяц\n \n     RBODY ATMOS;\n       IF  (ДЕНЬ     * 4);\n       WA1 = ДЕНЬ              FC(2);             // День\n       GROUP СРОК;\n         IF  (СРОКНАБЛ * 5);\n         WA1 = СРОКНАБЛ          FC(2);           // Срок \n         GROUP АЯ;\n           WA1 = NАЯ               FC(2),         // Номер атмосферного явления\n                 АЯВЛВИД           FC(2),         // Шифр атмосферного явления\n                 АЯВЛВИД.Q         FC(1),         // Признак качества\n                 АЯИНТЕНС          FC(1),         // Интенсивность атмосферного явления \n                 АЯИНТЕНС.Q        FC(1),         // Признак качества \n                 АЯВРЕМЯН          FC(5,2),       // Время начала АЯ (нат.значение часы, мин) \n                 АЯВРЕМЯН.Q        FC(1),         // Признак качества\n                 АЯВРЕМЯК          FC(5,2),       // Время окончания АЯ (нат.значение часы, мин)\n                 АЯВРЕМЯК.Q        FC(1),         // Признак качества\n                 АЯВРЕМЯК.АЯПРИЗПР FC(1);         // Признак прерыв. АЯ\n         END АЯ;\n       END СРОК;\n     END ATMOS;\n   END RECORDS;\n	3	2468	Атмосферные явления	\N
tms_sb2.aql	 WA1 (10000) CHAR; \n \n IN: STREAM(R) TMS;\n     PORTION RECORDS.SNEG.SNOWB;\n \n   RECORDS NAT;\n     IF  (СТАНЦИЯ  * 1);\n     IF  (ГОД      * 2);\n     IF  (МЕСЯЦ    * 3);\n     WA1 = СТАНЦИЯ           FC(7),               // Станция\n           ГОД               FC(4),               // Год\n           МЕСЯЦ             FC(2);               // Месяц\n \n     RBODY SNEG;\n       GROUP SNOWB;\n         WA1 = NSNB              FC(1),           // Номер снегосъемки                                \n               СНЕГБДПР          FC(2),           // Дата проведения снегосъемки                      \n               СНЕГСВЫС          FC(4),           // Средняя высота снежного покрова на маршруте      \n               СНЕГСВЫС.Q        FC(1),           // Признак качества                                 \n               СНЕВЫСМА          FC(4),           // Наибольшая высота снежного покрова на маршруте   \n               СНЕВЫСМА.Q        FC(1),           // Признак качества                                 \n               СНЕВЫСМИ          FC(4),           // Наименьшая высота снежного покрова на маршруте   \n               СНЕВЫСМИ.Q        FC(1);           // Признак качества                                 \n       END SNOWB;\n     END SNEG;\n   END RECORDS;\n	3	2469	Данные снегосъемок по балкам	\N
tms_os2.aql	 WA1 (10000) CHAR; \n \n IN: STREAM(R) TMS;\n     PORTION RECORDS.OBLJAW.OSOBO;\n \n   RECORDS NAT;\n     IF  (СТАНЦИЯ  * 1);\n     IF  (ГОД      * 2);\n     IF  (МЕСЯЦ    * 3);\n     WA1 = СТАНЦИЯ           FC(7),               // Станция\n           ГОД               FC(4),               // Год\n           МЕСЯЦ             FC(2);               // Месяц\n \n     RBODY OBLJAW;\n       GROUP OSOBO;\n         WA1 = КООЯ              FC(2),           // Индекс \n               ООЯЧИСЛН          FC(2),           // День начала ООЯ\n               ООЯВРЕМН          FC(5,2),         // Время начала ООЯ (нат. знач. часы, мин.)\n               ООЯВРЕМН.Q        FC(1),           // Признак качества\n               ООЯЧИСЛК          FC(2),           // День окончания ООЯ\n               ООЯЧИСЛК.Q        FC(1),           // Признак качества\n               ООЯВРЕМК          FC(5,2),         // Время окончания ООЯ (нат. знач. часы, мин.)\n               ООЯВРЕМК.Q        FC(1),           // Признак качества\n               ООЯВИД            FC(2),           // Шифр ООЯ\n               ООЯВИД.Q          FC(1),           // Признак качества\n               ООЯXАР1           FC(5),           // Первая характеристика ООЯ\n               ООЯXАР1.Q         FC(1),           // В ЯОД точн.х1 до целого\n               ООЯXАР2           FC(3),           // Вторая характеристика ООЯ\n               ООЯXАР2.Q         FC(1),           // Признак качества\n               ООЯПРПЕР          FC(1),           // Признак перехода ООЯ через границу месяца  \n               ООЯПРПЕР.Q        FC(1),           // Признак качества\n               ООЯПРО1Ч          FC(7,2),         // Продолжительность 1-й части ООЯ (нат. знач. часы, мин.) \n               ООЯПРО1Ч.Q        FC(1);           // Признак качества\n       END OSOBO;\n     END OBLJAW;\n   END RECORDS;\n	3	2470	Данные об особо опасных явлениях	\N
tms_p22.aql	 WA1 (10000) CHAR; \n \n IN: STREAM(R) TMS;\n     PORTION RECORDS.REGEN.INT;\n \n   RECORDS NAT;\n     IF  (СТАНЦИЯ  * 1);\n     IF  (ГОД      * 2);\n     IF  (МЕСЯЦ    * 3);\n     WA1 = СТАНЦИЯ           FC(7),               // Станция\n           ГОД               FC(4),               // Год\n           МЕСЯЦ             FC(2);               // Месяц\n \n     RBODY REGEN;\n       WA1 = NДЖ               FC(3);             // Номер дождя\n       GROUP INT;\n         WA1 = КINT              FC(3),           // Номер интервала\n               ОСАВКППИ          FC(5,2),         // Время оконч. периода пост. интенсивности\n               ОСАВКППИ.Q        FC(1),           // Признак качества\n               ОСАККППИ          FC(6,1),         // Количество осадков на конец периода\n               ОСАККППИ.Q        FC(1),           // Признак качества   \n               ОСАИНТИР          FC(5,2),         // Средняя интинтенсивность за период\n               ОСАИНТИР.Q        FC(1);           // Признак качества\n       END INT;\n     END REGEN;\n   END RECORDS;\n	3	2471	Данные плювиографа (интервалы)	\N
tms_gg2.aql	 WA1 (10000) CHAR; \n \n IN: STREAM(R) TMS;\n     PORTION RECORDS.TGGRAF.GIGRO;\n \n   RECORDS NAT;\n     IF  (СТАНЦИЯ  * 1);\n     IF  (ГОД      * 2);\n     IF  (МЕСЯЦ    * 3);\n     WA1 = СТАНЦИЯ           FC(7),               // Станция\n           ГОД               FC(4),               // Год\n           МЕСЯЦ             FC(2);               // Месяц\n \n     RBODY TGGRAF;\n       GROUP GIGRO;\n         IF  (ДЕНЬ     * 4);\n         WA1 = ДЕНЬ              FC(2),           // День\n               ВЛОМАКГГ          FC(3),           // Макс. относительная влажность за сутки\n               ВЛОМАКГГ.Q        FC(1),           // Признак качества\n               ВЛОМИНГГ          FC(3),           // Мин. относительная влажность за сутки\n               ВЛОМИНГГ.Q        FC(1);           // Признак качества\n         GROUP UЕЖ;\n           WA1 = ВЛОТВЗГГ          FC(3),         // Ежечасные значения относительной влажности (24)\n                 ВЛОТВЗГГ.Q        FC(1);         // Признак качества\n         END UЕЖ;\n       END GIGRO;\n     END TGGRAF;\n   END RECORDS;\n	3	2472	Данные гигрографа	\N
tms_ge2.aql	 WA1 (10000) CHAR; \n \n IN: STREAM(R) TMS;\n     PORTION RECORDS.GELIO.ГЕЛИО;\n \n   RECORDS NAT;\n     IF  (СТАНЦИЯ  * 1);\n     IF  (ГОД      * 2);\n     IF  (МЕСЯЦ    * 3);\n     WA1 = СТАНЦИЯ           FC(7),               // Станция\n           ГОД               FC(4),               // Год\n           МЕСЯЦ             FC(2);               // Месяц\n \n     RBODY GELIO;\n       GROUP ГЕЛИО;\n         IF  (ДЕНЬ     * 4);\n         WA1 = ДЕНЬ              FC(2),           // День \n               СОЛСПРСТ          FC(4,1),         // Суммарная прод-сть солнечного сияния за сутки\n               СОЛСПРСТ.Q        FC(1),           // Признак качества\n               СОЛСПЧАС          FC(2),           // 1-й час, после которого светило солнце\n               СОЛСПЧАС.Q        FC(1);           // Признак качества\n         GROUP ЕЖЧПРСС;\n           WA1 = СОЛСПРУГ          FC(3,1),       // Прод-сть солнечного сияния за 1 час (24)\n                 СОЛСПРУГ.Q        FC(1);         // Признак качества\n         END ЕЖЧПРСС;\n       END ГЕЛИО;\n     END GELIO;\n   END RECORDS;\n	3	2473	Данные гелиографа	\N
tms_sl2.aql	 WA1 (10000) CHAR; \n \n IN: STREAM(R) TMS;\n     PORTION RECORDS.SNEG.SNOWL;\n \n   RECORDS NAT;\n     IF  (СТАНЦИЯ  * 1);\n     IF  (ГОД      * 2);\n     IF  (МЕСЯЦ    * 3);\n     WA1 = СТАНЦИЯ           FC(7),               // Станция\n           ГОД               FC(4),               // Год\n           МЕСЯЦ             FC(2);               // Месяц\n \n     RBODY SNEG;\n       GROUP SNOWL;\n         WA1 = NSNL              FC(1),           // Номер снегосъемки                             \n               СНЕГЛДПР          FC(2),           // Дата проведения снегосъемки                     \n               СНЕГСВЫС          FC(4),           // Средняя высота снежного покрова на маршруте     \n               СНЕГСВЫС.Q        FC(1),           // Признак качества                                \n               СНЕВЫСМА          FC(4),           // Наибольшая высота снежного покрова на маршруте  \n               СНЕВЫСМА.Q        FC(1),           // Признак качества                                \n               СНЕВЫСМИ          FC(4),           // Наименьшая высота снежного покрова на маршруте  \n               СНЕВЫСМИ.Q        FC(1),           // Признак качества                                \n               СНЕСТПОК          FC(2),           // Степень покрытия маршрута снегом                \n               СНЕСТПОК.Q        FC(1),           // Признак качества                                \n               СНЕСТПЛК          FC(2),           // Степень покрытия маршрута ледяной коркой        \n               СНЕСТПЛК.Q        FC(1),           // Признак качества                                \n               СНЕСРТЛК          FC(3),           // Средняя толщина ледяной корки                   \n               СНЕСРТЛК.Q        FC(1),           // Признак качества                                \n               СНЕГТСНВ          FC(3),           // Толщина слоя снега, насыщенного водой           \n               СНЕГТСНВ.Q        FC(1),           // Признак качества                                \n               СНЕГТСЧВ          FC(3),           // Толщина слоя чистой воды                        \n               СНЕГТСЧВ.Q        FC(1),           // Признак качества                                \n               СНЕГХАРЗ          FC(1),           // Характер залегания снежного покрова             \n               СНЕГХАРЗ.Q        FC(1),           // Признак качества                                \n               СНЕГХАРП          FC(1),           // Характер снежного покрова                       \n               СНЕГХАРП.Q        FC(1),           // Признак качества                                \n               СНЕГСРПЛ          FC(4,2),         // Средняя плотность снега                         \n               СНЕГСРПЛ.Q        FC(1);           // Признак качества                                \n       END SNOWL;\n     END SNEG;\n   END RECORDS;\n	3	2474	Данные снегосъемок по лесу	\N
tms_sr2.aql	 WA1 (10000) CHAR; \n \n IN: STREAM(R) TMS;\n     PORTION RECORDS.SUTKI.SROKM;\n \n   RECORDS NAT;\n     IF  (СТАНЦИЯ  * 1);\n     IF  (ГОД      * 2);\n     IF  (МЕСЯЦ    * 3);\n     WA1 = СТАНЦИЯ           FC(7),               // Станция\n           ГОД               FC(4),               // Год\n           МЕСЯЦ             FC(2);               // Месяц\n           \n \n     RBODY SUTKI;\n       IF  (ДЕНЬ     * 4);\n       WA1 = ДЕНЬ              FC(2);             // День\n       GROUP SROKM;\n         WA1 = СРОКНАБЛ          FC(2),           // Срок наблюдения\n               ВИДГОРИЗ          FC(2),           // Горизонтальная дальность видимости\n               ВИДГОРИЗ.Q        FC(1),           // Признак качества \n               ВИДГОРИЗ.ВИДГПРНЮ FC(1),           // Пр.нал.знака > \n               ОБЛОКОЛВ          FC(2),           // Общее количество облачности\n               ОБЛОКОЛВ.Q        FC(1),           // Признак качества\n               ОБЛНКОЛВ          FC(2),           // Количество облачности нижнего яруса\n               ОБЛНКОЛВ.Q        FC(1),           // Признак качества\n               ОБЛФОРВЯ          FC(1),           // Форма облаков верхнего яруса\n               ОБЛФОРВЯ.Q        FC(1),           // Признак качества\n               ОБЛФОРСЯ          FC(1),           // Форма облаков среднего яруса\n               ОБЛФОРСЯ.Q        FC(1),           // Признак качества\n               ОБЛФОРВР          FC(1),           // Форма облаков вертикального развития\n               ОБЛФОРВР.Q        FC(1),           // Признак качества\n               ОБЛСЛСЛК          FC(1),           // Слоистые и слоисто-кучевые облака\n               ОБЛСЛСЛК.Q        FC(1),           // Признак качества\n               ОБЛСЛДРД          FC(1),           // Слоисто-дожд,разорванно-дождевые облака\n               ОБЛСЛДРД.Q        FC(1),           // Признак качества\n               ОБЛВЫНГМ          FC(4),           // Высота нижней границы облачности\n               ОБЛВЫНГМ.Q        FC(1),           // Признак качества\n               ОБЛВЫНГМ.ОБЛВПРНЮ FC(1),           // Пр. способа опрю. выс. н. г\n               ОБЛПННУС          FC(1),           // Признак наличия облачности ниже уровня станции\n               ОБЛПННУС.Q        FC(1),           // Признак качества\n               СОСТППЧВ          FC(1),           // Состояние поверхности почвы\n               СОСТППЧВ.Q        FC(1),           // Признак качества\n               СОСТППЧВ.СОСТПППЮ FC(1),           // Признак наличия знака ю у е\n               ПОГОМСНВ          FC(1),           // Погода между сроками\n               ПОГОМСНВ.Q        FC(1),           // Признак качества\n               ПОГОДСНВ          FC(2),           // Погода в срок наблюдения\n               ПОГОДСНВ.Q        FC(1),           // Признак качества\n               ВЕТНАПРМ          FC(3),           // Направление ветра\n               ВЕТНАПРМ.Q        FC(1),           // Признак качества\n               ВЕТСКОРМ          FC(2),           // Средняя скорость ветра\n               ВЕТСКОРМ.Q        FC(1),           // Признак качества\n               ВЕТСКОРМ.ВЕТСПРНЮ FC(1),           // Признак наличия знака > \n               ВЕТСКМАК          FC(2),           // Максимальное скорость ветра\n               ВЕТСКМАК.Q        FC(1),           // Признак качества\n               ВЕТСКМАК.ВЕТСМАПЮ FC(1),           // Признак наличия знака > \n               ОСАСУМСР          FC(6,1),         // Сумма осадков за период между сроками\n               ОСАСУМСР.Q        FC(1),           // Признак качества \n               ТЕМПОВПМ          FC(5,1),         // Температура поверхности почвы в срок \n               ТЕМПОВПМ.Q        FC(1),           // Признак качества                    \n               ТЕМПСПИР          FC(5,1),         // Температура пов. почвы по спирту мин. терм-ра\n               ТЕМПСПИР.Q        FC(1),           // Признак качества \n               ТЕИПОВПМ          FC(5,1),         // Мин. температура пов-сти почвы между сроками\n               ТЕИПОВПМ.Q        FC(1),           // Признак качества\n               ТЕАПОВПМ          FC(5,1),         // Макс. температура пов-сти почвы между сроками\n               ТЕАПОВПМ.Q        FC(1),           // Признак качества\n               ТЕМПППВС          FC(5,1),         // Температура пов-сти почвы по макс. терм-ру п/встр.\n               ТЕМПППВС.Q        FC(1),           // Признак качества \n               ТЕМВОЗДМ          FC(5,1),         // Температура воздуха в срок по сухому терм-ру\n               ТЕМВОЗДМ.Q        FC(1),           // Признак качества \n               ТЕМВСМСМ          FC(5,1),         // Темп.воздуха в срок по смоченному терм-ру\n               ТЕМВСМСМ.Q        FC(1),           // Признак качества \n               ТЕМВСМСМ.ТЕМВПРНЮ FC(1),           // Признак нал. льда на батисте\n               ТЕВСПИРТ          FC(5,1),         // Температура воздуха по спирту мин. терм-ра\n               ТЕВСПИРТ.Q        FC(1),           // Признак качества \n               ТЕИВОЗСМ          FC(5,1),         // Мин.температура воздуха между сроками\n               ТЕИВОЗСМ.Q        FC(1),           // Признак качества \n               ТЕАВОЗСМ          FC(5,1),         // Макс. темперура воздуха между сроками\n               ТЕАВОЗСМ.Q        FC(1),           // Признак качества \n               ТЕМВМПВС          FC(5,1),         // Темпера воздуха по макс. терм-ра после встрях.\n               ТЕМВМПВС.Q        FC(1),           // Признак качества \n               УПРВПАРР          FC(5,2),         // Парциальное давление водяного пара\n               УПРВПАРР.Q        FC(1),           // Признак качества\n               УПРВПАРР.Q1       FC(1),           // Указатель точности элемента\n               ВЛАОТВОМ          FC(3),           // Относительная влажность воздуха в срок\n               ВЛАОТВОМ.Q        FC(1),           // Признак качества \n               НЕДНАСПР          FC(5,2),         // Дефицит насыщения водяного пара\n               НЕДНАСПР.Q        FC(1),           // Признак качества\n               НЕДНАСПР.Q1       FC(1),           // Указатель точности элемента\n               ТОЧКАРОС          FC(5,1),         // Температура точки росы\n               ТОЧКАРОС.Q        FC(1),           // в срок наблюдения\n               ДАВЛАСТМ          FC(6,1),         // Атмосферное давление в срок на уровне станции \n               ДАВЛАСТМ.Q        FC(1),           // Признак качества \n               ДАВЛАУММ          FC(6,1),         // Атмосферное давление в срок на уровне моря\n               ДАВЛАУММ.Q        FC(1),           // Признак качества \n               ТЕНБВИДГ          FC(1),           // Характеристика барической тенденции\n               ТЕНБВИДГ.Q        FC(1),           // Признак качества\n               ТЕНБВЕЛР          FC(4,1),         // Величина барической тенденции\n               ТЕНБВЕЛР.Q        FC(1);           // Признак качества \n       END SROKM;\n     END SUTKI;\n   END RECORDS;\n	3	2475	Срочные данные	\N
tms_te2.aql	 WA1 (10000) CHAR; \n \n IN: STREAM(R) TMS;\n     PORTION RECORDS.TPOCHV.ТПЕСТ;\n \n   RECORDS NAT;\n     IF  (СТАНЦИЯ  * 1);\n     IF  (ГОД      * 2);\n     IF  (МЕСЯЦ    * 3);\n     WA1 = СТАНЦИЯ           FC(7),               // Станция\n           ГОД               FC(4),               // Год\n           МЕСЯЦ             FC(2);               // Месяц\n \n     RBODY TPOCHV;\n       IF  (ДЕНЬ     * 4);\n       WA1 = ДЕНЬ              FC(2);             // День\n       GROUP ТПЕСТ;\n         GROUP SUTKE;\n           WA1 = ГЛУБИНЫ           FC(1),         // Глубина (80-320 см) \n                 ТЕЕПОООМ          FC(5,1),       // Темп.почвы в срок\n                 ТЕЕПОООМ.Q        FC(1);         // Признак качества\n         END SUTKE;\n         WA1 = СНЕПВЫСТ          FC(4),           // Высота снежного покрова у термометра\n               СНЕПВЫСТ.Q        FC(1);           // Признак качества\n       END ТПЕСТ;\n     END TPOCHV;\n   END RECORDS;\n	3	2476	Температура почвы (естественный покров, суточные)	\N
tms_p21.aql	 WA1 (10000) CHAR; \n \n IN: STREAM(R) TMS;\n     PORTION RECORDS.REGEN;\n \n   RECORDS NAT;\n     IF  (СТАНЦИЯ  * 1);\n     IF  (ГОД      * 2);\n     IF  (МЕСЯЦ    * 3);\n     WA1 = СТАНЦИЯ           FC(7),               // Станция\n           ГОД               FC(4),               // Год\n           МЕСЯЦ             FC(2);               // Месяц\n \n     RBODY REGEN;\n       WA1 = NДЖ               FC(3),             // Номер дождя\n             СЧINT             FC(3),             // Счетчик периодов с равной интенсивностью\n             ОСАПРПЕР          FC(1),             // Признак перехода дождя через гран. месяца\n             ОСАПРПЕР.Q        FC(1),             // Признак качества\n             ОСАДЧИСР          FC(2),             // День начала дождя\n             ОСАДЧИСК          FC(2),             // День окончания дожд\n             ОСАДЧИСК.Q        FC(1),             // Признак качества к обеим датам\n             ОСАДВРЕМ          FC(5,2),           // Время начала дождя, часы, мин. (NAT)\n             ОСАДВРЕМ.Q        FC(1),             // Признак качества \n             ОСАКОЛ1Ч          FC(6,1),           // Количество осадков за 1 час дождя\n             ОСАКОЛ1Ч.Q        FC(1),             // Признак качества   \n             ОСАДПРОД          FC(7,2),           // Продолжительность дождя, часы, мин. (NAT) \n             ОСАДПРОД.Q        FC(1),             // Признак качества \n             ОСАКОЛДЖ          FC(6,1),           // Количество осадков за 2 час дождя\n             ОСАКОЛДЖ.Q        FC(1),             // Признак качества   \n             ОСАСРИНТ          FC(5,2),           // Средняя интенсивность дождя\n             ОСАСРИНТ.Q        FC(1),             // Признак качества    \n             ОСАСУМПР          FC(7,2),           // Сумм. продолж-сть дождя, часы, мин. (NAT) \n             ОСАСУМПР.Q        FC(1),             // Признак качества  \n             ОСАСКОЛД          FC(6,1),           // Сумарное количество осадков за дождь\n             ОСАСКОЛД.Q        FC(1),             // Признак качества    \n             ОСАСИНТД          FC(5,2),           // Средняя интенсивность всего дождя\n             ОСАСИНТД.Q        FC(1);             // \n     END REGEN;\n   END RECORDS;\n	3	2477	Данные плювиографа (общие)	\N
tms_ct2.aql	 WA1 (10000) CHAR; \n \n IN: STREAM(R) TMS;\n     PORTION RECORDS;\n \n   RECORDS NAT;\n     IF  (СТАНЦИЯ  * 1);\n     IF  (ГОД      * 2);\n     IF  (МЕСЯЦ    * 3);\n     IF  (ТИПЗАП   * 4);\n     WA1 = СТАНЦИЯ           FC(7),               // Станция\n           ГОД               FC(4),               // Год\n           МЕСЯЦ             FC(2),               // Месяц\n           ТИПЗАП            FC(1);               // Тип записи (1-9)\n   END RECORDS;\n	3	2478	Признаки (Год, Мес, Станция, Тип записи)	\N
tms_tg2.aql	 WA1 (10000) CHAR; \n \n IN: STREAM(R) TMS;\n     PORTION RECORDS.TGGRAF.TERMO;\n \n   RECORDS NAT;\n     IF  (СТАНЦИЯ  * 1);\n     IF  (ГОД      * 2);\n     IF  (МЕСЯЦ    * 3);\n     WA1 = СТАНЦИЯ           FC(7),               // Станция\n           ГОД               FC(4),               // Год\n           МЕСЯЦ             FC(2);               // Месяц\n \n     RBODY TGGRAF;\n       GROUP TERMO;\n         IF  (ДЕНЬ     * 4);\n         WA1 = ДЕНЬ              FC(2),           // День\n               ТЕВМАКТГ          FC(5,1),         // Макс. тeмпература воздуха за сутки\n               ТЕВМАКТГ.Q        FC(1),           // Признак качества\n               ТЕВМИНТГ          FC(5,1),         // Мин. тeмпература воздуха за сутки\n               ТЕВМИНТГ.Q        FC(1);           // Признак качества\n         GROUP TЕЖ;\n           WA1 = ТЕМВОЗТГ          FC(5,1),       // Ежечасное значение температуры воздуха\n                 ТЕМВОЗТГ.Q        FC(1);         // Признак качества\n         END TЕЖ;\n       END TERMO;\n     END TGGRAF;\n   END RECORDS;\n	3	2479	Данные термографа	\N
tms_cn2.aql	 WA1 (10000) CHAR; \n \n IN: STREAM(R) TMS;\n     PORTION RECORDS;\n \n   RECORDS NAT;\n     IF  (СТАНЦИЯ  * 1);\n     IF  (ГОД      * 2);\n     IF  (МЕСЯЦ    * 3);\n     WA1 = СТАНЦИЯ           FC(7),               // Станция\n           ГОД               FC(4),               // Год\n           МЕСЯЦ             FC(2);               // Месяц\n \n     RBODY CONST;\n       WA1 = НАИМЕНСТ          FC(20),            // Наименование станции\n             КООРДНОМ          FC(7),             // Координатный номер станции\n             НОМУПРАВ          FC(2),             // Номер УГМС\n             НОМЧАСП           FC(2),             // Номер часового пояса\n             ТИПУЧАСТ          FC(1),             // Тип участка станции\n             ВЫССТНУМ          FC(5),             // Высота над уровнем моря\n             ПРГЕОРАС          FC(1),             // Признак географического расположения\n             КОЛСРОК           FC(1),             // Количество сроков наблюдения\n             ПРНЕПРДН          FC(1),             // Признак непрерывного раб. дня\n             ПРПРИНСТ          FC(1),             // Признак принадлежности станции\n             ПРУАТГМС          FC(1),             // Признак наличия УАТГМС\n             ПРЕЖЧАСН          FC(1),             // Наличие ежечасных наблюдений\n             ПРАГРОМН          FC(1),             // Наличие агрометеорологических наблюдений\n             ПРПРМОРН          FC(1),             // Наличие прибрежных морских наблюдений\n             ПРГИДРОН          FC(1),             // Наличие гидрологических наблюдений\n             ПРАЭРОН           FC(1),             // Наличие аэрологических наблюдений\n             ПРРАДИОН          FC(1),             // Наличие радиолокационных наблюдений\n             ПРАКТИНН          FC(1),             // Наличие актинометрических наблюдений\n             ПРТЕПЛОБ          FC(1),             // Наличие теплобалансовых наблюдений\n             ПРОЗОНН           FC(1),             // Наличие озонометрических наблюдений\n             ПРАТЭЛЕК          FC(1),             // Наличие набл. атмосферного электричества\n             ПРЗАГРВЗ          FC(1),             // Наличие наблюдений загрязнения воздуха\n             ПРКЛАССТ          FC(1),             // Признак классности станции\n             ПРООЯ             FC(1),             // Классиф.критер.ооя\n             ПРНВИДИМ          FC(1),             // Наблюдения дальности видимости\n             ПРНОБЛАЧ          FC(1),             // Наблюдения над облачностью\n             ПРНВЫСОБ          FC(1),             // Набл. высоты нижней границы облачности\n             ПРСОСТПП          FC(1),             // Наблюдения состояния поверхности почвы\n             ПРНПОГОД          FC(1),             // Наблюдения над погодой\n             ПРНВЕТР           FC(1),             // Наблюдения над ветром\n             ВЫСФЛЛД           FC(5,1),           // Высота флюгера с легкой доской\n             ВЫСФЛТД           FC(5,1),           // Высота флюгера с тяжелой доской\n             ВЫСАНЕМО          FC(5,1),           // Высота анеморумбометра\n             ПРНОСАДК          FC(1),             // Наблюдения над осадками\n             ПРНТЕМПП          FC(1),             // Наблюдения температуры поверхности почвы\n             ПРНТЕМВ           FC(1),             // Наблюдения температуры воздуха\n             ПРНСНЕГ           FC(1),             // Наличие снегосъемок\n             ДЛСНЕГП           FC(3,1),           // Длина полевого маршрута\n             ДЛСНЕГЛ           FC(3,1),           // Длина маршрута по лесу\n             ДЛСНЕГБ           FC(3,1),           // Длина маршрута по балкам\n             ПРНГЕЛИО          FC(1),             // Наличие гелиографа\n             ВЫСГЕЛИО          FC(5,1),           // Высота гелиографа над землей\n             ПРНТЕРМО          FC(1),             // Наличие термографа\n             ПРНГИГРО          FC(1),             // Наличие гигрографа\n             ПРНПЛЮВ           FC(1),             // Наличие плювиографа\n             ПРНОБЛЕД          FC(1),             // Наблюдения обледенения\n             ПРНБАРОМ          FC(1),             // Наличие барометра\n             ВЫСБАРОМ          FC(6,1);           // Высота барометра над уровнем моря\n\n      WA1 =  ДНАЧПНОЧ          FC(2),             // День начала полярной ночи\n             МНАЧПНОЧ          FC(2),             // Месяц начала полярной ночи\n             ДКОНЦАПН          FC(2),             // День окончания полярной ночи\n             МКОНЦАПН          FC(2),             // Месяц окончания полярной ночи\n             НОМЕРАДР          FC(3),             // Номер административного района в УГМС\n             ГОДТЕКУЩ          FC(4),             // Текущий год\n             МЕСЯЦТЕК          FC(2),             // Текущий месяц\n             КОЛДНМЕС          FC(2),             // Количество дней в месяце\n             НМСМОСКВ          FC(2),             // Начало местных суток, МДВ\n             НМСПДЗВ           FC(2),             // Начало местных суток, ПДЗВ\n             ПЧАСНМС           FC(2),             // Первый час от начала местных суток\n             ПСРОКНМС          FC(2),             // Первый срок от начала местных суток\n             СБЛ8ЧАС8          FC(2),             // Срок, ближайший к 8 часам ПДЗВ\n             СБ14ЧАС8          FC(2),             // Срок, ближайший к 14 часам ПДЗВ\n             СБ14ЧАС4          FC(2),             // Срок, ближайший к 14 часам ПДВ (4 срока)\n             ШИРОТА            FC(4,1),           // Широта расположения станции\n             ДОЛГОТА           FC(4,1),           // Долгота расположения станц.\n             ОПРПОЛУШ          FC(1),             // Определитель долготы и полушария\n             ГОДОТКСТ          FC(4),             // Год открытия станции\n             КЗSUTKI           FC(2),             // Количество записей СУТКИ-СРОКИ\n             КЗTPOCHV          FC(2),             // Количество записей ТЕМПЕРАТУРА ПОЧВЫ\n             КЗGELIO           FC(1),             // Количество записей ГЕЛИОГРАФ\n             КЗTGGRAF          FC(1),             // Количество записей ТЕРМОГРАФ\n             КЗSNEG            FC(1),             // Количество записей СНЕГОСЪЕМКИ\n             КЗREGEN           FC(3),             // Количество записей ДОЖДЬ\n             КЗOBLJAW          FC(1),             // Количество записей ОБЛЕДИНЕНИЕ-ООЯ\n             КЗATMOS           FC(2);             // Количество записей АТМОСФЕРНЫЕ ЯВЛЕНИЯ\n     END CONST;\n   END RECORDS;\n	3	2480	Паспортные данные	\N
tms_p21.aql	 WA1 (10000) CHAR; \n \n IN: STREAM(R) TMS;\n     PORTION RECORDS.REGEN;\n \n   RECORDS NAT;\n     IF  (СТАНЦИЯ  * 1);\n     IF  (ГОД      * 2);\n     IF  (МЕСЯЦ    * 3);\n     WA1 = СТАНЦИЯ           FC(7),               // Станция\n           ГОД               FC(4),               // Год\n           МЕСЯЦ             FC(2);               // Месяц\n \n     RBODY REGEN;\n       WA1 = NДЖ               FC(3),             // Номер дождя\n             СЧINT             FC(3),             // Счетчик периодов с равной интенсивностью\n             ОСАПРПЕР          FC(1),             // Признак перехода дождя через гран. месяца\n             ОСАПРПЕР.Q        FC(1),             // Признак качества\n             ОСАДЧИСР          FC(2),             // День начала дождя\n             ОСАДЧИСК          FC(2),             // День окончания дожд\n             ОСАДЧИСК.Q        FC(1),             // Признак качества к обеим датам\n             ОСАДВРЕМ          FC(5,2),           // Время начала дождя, часы, мин. (NAT)\n             ОСАДВРЕМ.Q        FC(1),             // Признак качества \n             ОСАКОЛ1Ч          FC(6,1),           // Количество осадков за 1 час дождя\n             ОСАКОЛ1Ч.Q        FC(1),             // Признак качества   \n             ОСАДПРОД          FC(7,2),           // Продолжительность дождя, часы, мин. (NAT) \n             ОСАДПРОД.Q        FC(1),             // Признак качества \n             ОСАКОЛДЖ          FC(6,1),           // Количество осадков за 2 час дождя\n             ОСАКОЛДЖ.Q        FC(1),             // Признак качества   \n             ОСАСРИНТ          FC(5,2),           // Средняя интенсивность дождя\n             ОСАСРИНТ.Q        FC(1),             // Признак качества    \n             ОСАСУМПР          FC(7,2),           // Сумм. продолж-сть дождя, часы, мин. (NAT) \n             ОСАСУМПР.Q        FC(1),             // Признак качества  \n             ОСАСКОЛД          FC(6,1),           // Сумарное количество осадков за дождь\n             ОСАСКОЛД.Q        FC(1),             // Признак качества    \n             ОСАСИНТД          FC(5,2),           // Средняя интенсивность всего дождя\n             ОСАСИНТД.Q        FC(1);             // \n     END REGEN;\n   END RECORDS;\n	3	2494	Данные плювиографа (общие)	\N
tms_ob2.aql	 WA1 (10000) CHAR; \n \n IN: STREAM(R) TMS;\n     PORTION RECORDS.OBLJAW.OBLED;\n \n   RECORDS NAT;\n     IF  (СТАНЦИЯ  * 1);\n     IF  (ГОД      * 2);\n     IF  (МЕСЯЦ    * 3);\n     WA1 = СТАНЦИЯ           FC(7),               // Станция\n           ГОД               FC(4),               // Год\n           МЕСЯЦ             FC(2);               // Месяц\n \n     RBODY OBLJAW;\n       GROUP OBLED;\n         WA1 = КOBL              FC(2),           // Индекс\n               ОБДНЧИСР          FC(2),           // Дата начала обледенения\n               ОБДНМСЛР          FC(3),           // Порядковый номер случая обледенения\n               ОБДНМСЛР.Q        FC(1);           // Признак качества\n         GROUP ВИДОБЛ;\n           WA1 = ШИФР              FC(1),         // Шифр \n                 ОБДНВИДВ          FC(2),         // Шифр твердых отложений\n                 ОБДНВИДВ.Q        FC(1);         // Признак качества\n         END ВИДОБЛ;\n         WA1 = ОБДВРЕНВ          FC(2),           // Время начала случая облединения\n               ОБДВРЕНВ.Q        FC(1),           // Признак качества\n               ОБДПРСТН          FC(4),           // Продолжительность стадии нарастания \n               ОБДПРСТН.Q        FC(1),           // Признак качества\n               ОБДПРОДВ          FC(4),           // Продолжительность всего случая обледенения \n               ОБДПРОДВ.Q        FC(1),           // Признак качества\n               ОБДТЕМНМ          FC(5,1),         // Температура воздуха в начале облединения\n               ОБДТЕМНМ.Q        FC(1),           // Признак качества\n               ОБВЕТННМ          FC(3),           // Направление ветра в начал еобледенения\n               ОБВЕТННМ.Q        FC(1),           // Признак качества\n               ОБВЕТСНМ          FC(3),           // Скорость ветра в начале обледенения \n               ОБВЕТСНМ.Q        FC(1),           // Признак качества\n               ОБВЕТСНМ.ОБДВПРНЮ FC(1),           // Признак наличия знака > у F\n               ОБДТЕМММ          FC(5,1),         // Темп-ра воздуха при достиж. отлож. макс. размера\n               ОБДТЕМММ.Q        FC(1),           // Признак качества\n               ОБВЕТНММ          FC(3),           // Напр. ветра при достиж. отлож. макс. размера\n               ОБВЕТНММ.Q        FC(1),           // Признак качества\n               ОБВЕТСММ          FC(2),           // Скорость ветра при достиж. отлож. макс. размера\n               ОБВЕТСММ.Q        FC(1),           // Признак качества\n               ОБВЕТСММ.ОБДВМАНЮ FC(1),           // Признак наличия знака > у F\n               ОБДПРПЕР          FC(1),           // Признак перехода облед. через границу месяца\n               ОБДПРПЕР.Q        FC(1),           // Признак качества\n               ОБДПРД1Ч          FC(4),           // Продолжительность 1-й части облединения\n               ОБДПРД1Ч.Q        FC(1);           // Признак качества\n         GROUP СТАДИЯ;\n           WA1 = КСТАДИЙ           FC(1),         // Индекс\n                 ОБДНДИАМ          FC(3),         // Диаметр отложения\n                 ОБДНДИАМ.Q        FC(1),         // Признак качества \n                 ОБДТОЛЩМ          FC(3),         // Толщина отложения\n                 ОБДТОЛЩМ.Q        FC(1),         // Признак качества  \n                 ОБДНМАСТ          FC(5),         // Масса отложения\n                 ОБДНМАСТ.Q        FC(1);         // Признак качества\n         END СТАДИЯ;\n       END OBLED;\n     END OBLJAW;\n   END RECORDS;\n	3	2481	Данные об обледенении	\N
tms_te2_sr.aql	 WA1 (32000) CHAR; \n \n IN: STREAM(R) TMS;\n     PORTION RECORDS.TPOCHV.ТПЕСТ.SROKE;\n \n   RECORDS NAT;\n     IF  (СТАНЦИЯ  * 1);\n     IF  (ГОД      * 2);\n     IF  (МЕСЯЦ    * 3);\n     WA1 = СТАНЦИЯ           FC(7),               // Станция\n           ГОД               FC(4),               // Год\n           МЕСЯЦ             FC(2);               // Месяц\n           \n \n     RBODY TPOCHV;\n       IF  (ДЕНЬ     * 4);\n       WA1 = ДЕНЬ              FC(2);             // День    \n       GROUP ТПЕСТ;\n         GROUP SROKE;\n           WA1 = СРОКНАБЛ          FC(2);         // Срок наблюдения\n           GROUP ТЕМПОЧВ;\n             WA1 = ГЛУБИНЫ           FC(1),       // Глубины (2-40см)\n                   ТЕППЕСТП          FC(6,1),     // Температура почвы в срок\n                   ТЕППЕСТП.Q        FC(1);       // Признак качества\n           END ТЕМПОЧВ;\n         END SROKE;\n       END ТПЕСТ;\n     END TPOCHV;\n   END RECORDS;\n	3	2482	Температура почвы (естественный покров, срочные)	\N
tms_to2.aql	 WA1 (10000) CHAR; \n \n IN: STREAM(R) TMS;\n     PORTION RECORDS.TPOCHV.ТПОГ.SROKG;\n \n   RECORDS NAT;\n     IF  (СТАНЦИЯ  * 1);\n     IF  (ГОД      * 2);\n     IF  (МЕСЯЦ    * 3);\n     WA1 = СТАНЦИЯ           FC(7),               // Станция\n           ГОД               FC(4),               // Год\n           МЕСЯЦ             FC(2);               // Месяц\n \n     RBODY TPOCHV;\n       IF  (ДЕНЬ     * 4);\n       WA1 = ДЕНЬ              FC(2);             // День    \n       GROUP ТПОГ;\n         GROUP SROKG;\n           WA1 = СРОКНАБЛ          FC(2);         // Срок наблюдения\n           GROUP ТПОЧВОГ;\n             WA1 = ГЛУБИНЫ           FC(1),       // Глубина (5-20см)\n                   ТЕОПОООМ          FC(6,1),     // Температура почвы в срок\n                   ТЕОПОООМ.Q        FC(1);       // Признак качества\n           END ТПОЧВОГ;\n         END SROKG;\n       END ТПОГ;\n     END TPOCHV;\n   END RECORDS;\n	3	2483	Температура почвы (оголенная поверхность, срочные)	\N
tms_sp2.aql	 WA1 (10000) CHAR; \n \n IN: STREAM(R) TMS;\n     PORTION RECORDS.SNEG.SNOWP;\n \n   RECORDS NAT;\n     IF  (СТАНЦИЯ  * 1);\n     IF  (ГОД      * 2);\n     IF  (МЕСЯЦ    * 3);\n     WA1 = СТАНЦИЯ           FC(7),               // Станция\n           ГОД               FC(4),               // Год\n           МЕСЯЦ             FC(2);               // Месяц\n \n     RBODY SNEG;\n       GROUP SNOWP;\n         WA1 = NSNP              FC(1),           // Номер снегосъемки   \n               СНЕГПДПР          FC(2),           // Дата проведения снегосъемки\n               СНЕГСВЫС          FC(4),           // Средняя высота снежного покрова на маршруте\n               СНЕГСВЫС.Q        FC(1),           // Признак качества \n               СНЕВЫСМА          FC(4),           // Наибольшая высота снежного покрова на маршруте\n               СНЕВЫСМА.Q        FC(1),           // Признак качества  \n               СНЕВЫСМИ          FC(4),           // Наименьшая высота снежного покрова на маршруте\n               СНЕВЫСМИ.Q        FC(1),           // Признак качества  \n               СНЕСТПОК          FC(2),           // Степень покрытия маршрута снегом \n               СНЕСТПОК.Q        FC(1),           // Признак качества \n               СНЕСТПЛК          FC(2),           // Степень покрытия маршрута ледяной коркой\n               СНЕСТПЛК.Q        FC(1),           // Признак качества \n               СНЕСРТЛК          FC(3),           // Средняя толщина ледяной корки\n               СНЕСРТЛК.Q        FC(1),           // Признак качества \n               СНЕГТСНВ          FC(3),           // Толщина слоя снега, насыщенного водой\n               СНЕГТСНВ.Q        FC(1),           // Признак качества \n               СНЕГТСЧВ          FC(3),           // Толщина слоя чистой воды\n               СНЕГТСЧВ.Q        FC(1),           // Признак качества    \n               СНЕГХАРЗ          FC(1),           // Характер залегания снежного покрова\n               СНЕГХАРЗ.Q        FC(1),           // Признак качества \n               СНЕГХАРП          FC(1),           // Характер снежного покрова\n               СНЕГХАРП.Q        FC(1),           // Признак качества    \n               СНЕГСРПЛ          FC(4,2),         // Средняя плотность снега\n               СНЕГСРПЛ.Q        FC(1),           // Признак качества   \n               СНЕСТЕПВ          FC(2),           // Степень покрытия окрестности станции снегом\n               СНЕСТЕПВ.Q        FC(1);           // Признак качества \n       END SNOWP;\n     END SNEG;\n   END RECORDS;\n	3	2484	Данные снегосъемок по полю	\N
tms_at2.aql	 WA1 (10000) CHAR; \n \n IN: STREAM(R) TMS;\n     PORTION RECORDS.ATMOS.СРОК.АЯ;\n \n   RECORDS NAT;\n     IF  (СТАНЦИЯ  * 1);\n     IF  (ГОД      * 2);\n     IF  (МЕСЯЦ    * 3);\n     WA1 = СТАНЦИЯ           FC(7),               // Станция\n           ГОД               FC(4),               // Год\n           МЕСЯЦ             FC(2);               // Месяц\n \n     RBODY ATMOS;\n       IF  (ДЕНЬ     * 4);\n       WA1 = ДЕНЬ              FC(2);             // День\n       GROUP СРОК;\n         IF  (СРОКНАБЛ * 5);\n         WA1 = СРОКНАБЛ          FC(2);           // Срок \n         GROUP АЯ;\n           WA1 = NАЯ               FC(2),         // Номер атмосферного явления\n                 АЯВЛВИД           FC(2),         // Шифр атмосферного явления\n                 АЯВЛВИД.Q         FC(1),         // Признак качества\n                 АЯИНТЕНС          FC(1),         // Интенсивность атмосферного явления \n                 АЯИНТЕНС.Q        FC(1),         // Признак качества \n                 АЯВРЕМЯН          FC(5,2),       // Время начала АЯ (нат.значение часы, мин) \n                 АЯВРЕМЯН.Q        FC(1),         // Признак качества\n                 АЯВРЕМЯК          FC(5,2),       // Время окончания АЯ (нат.значение часы, мин)\n                 АЯВРЕМЯК.Q        FC(1),         // Признак качества\n                 АЯВРЕМЯК.АЯПРИЗПР FC(1);         // Признак прерыв. АЯ\n         END АЯ;\n       END СРОК;\n     END ATMOS;\n   END RECORDS;\n	3	2485	Атмосферные явления	\N
tms_te2.aql	 WA1 (10000) CHAR; \n \n IN: STREAM(R) TMS;\n     PORTION RECORDS.TPOCHV.ТПЕСТ;\n \n   RECORDS NAT;\n     IF  (СТАНЦИЯ  * 1);\n     IF  (ГОД      * 2);\n     IF  (МЕСЯЦ    * 3);\n     WA1 = СТАНЦИЯ           FC(7),               // Станция\n           ГОД               FC(4),               // Год\n           МЕСЯЦ             FC(2);               // Месяц\n \n     RBODY TPOCHV;\n       IF  (ДЕНЬ     * 4);\n       WA1 = ДЕНЬ              FC(2);             // День\n       GROUP ТПЕСТ;\n         GROUP SUTKE;\n           WA1 = ГЛУБИНЫ           FC(1),         // Глубина (80-320 см) \n                 ТЕЕПОООМ          FC(5,1),       // Темп.почвы в срок\n                 ТЕЕПОООМ.Q        FC(1);         // Признак качества\n         END SUTKE;\n         WA1 = СНЕПВЫСТ          FC(4),           // Высота снежного покрова у термометра\n               СНЕПВЫСТ.Q        FC(1);           // Признак качества\n       END ТПЕСТ;\n     END TPOCHV;\n   END RECORDS;\n	3	2493	Температура почвы (естественный покров, суточные)	\N
tms_sb2.aql	 WA1 (10000) CHAR; \n \n IN: STREAM(R) TMS;\n     PORTION RECORDS.SNEG.SNOWB;\n \n   RECORDS NAT;\n     IF  (СТАНЦИЯ  * 1);\n     IF  (ГОД      * 2);\n     IF  (МЕСЯЦ    * 3);\n     WA1 = СТАНЦИЯ           FC(7),               // Станция\n           ГОД               FC(4),               // Год\n           МЕСЯЦ             FC(2);               // Месяц\n \n     RBODY SNEG;\n       GROUP SNOWB;\n         WA1 = NSNB              FC(1),           // Номер снегосъемки                                \n               СНЕГБДПР          FC(2),           // Дата проведения снегосъемки                      \n               СНЕГСВЫС          FC(4),           // Средняя высота снежного покрова на маршруте      \n               СНЕГСВЫС.Q        FC(1),           // Признак качества                                 \n               СНЕВЫСМА          FC(4),           // Наибольшая высота снежного покрова на маршруте   \n               СНЕВЫСМА.Q        FC(1),           // Признак качества                                 \n               СНЕВЫСМИ          FC(4),           // Наименьшая высота снежного покрова на маршруте   \n               СНЕВЫСМИ.Q        FC(1);           // Признак качества                                 \n       END SNOWB;\n     END SNEG;\n   END RECORDS;\n	3	2486	Данные снегосъемок по балкам	\N
tms_os2.aql	 WA1 (10000) CHAR; \n \n IN: STREAM(R) TMS;\n     PORTION RECORDS.OBLJAW.OSOBO;\n \n   RECORDS NAT;\n     IF  (СТАНЦИЯ  * 1);\n     IF  (ГОД      * 2);\n     IF  (МЕСЯЦ    * 3);\n     WA1 = СТАНЦИЯ           FC(7),               // Станция\n           ГОД               FC(4),               // Год\n           МЕСЯЦ             FC(2);               // Месяц\n \n     RBODY OBLJAW;\n       GROUP OSOBO;\n         WA1 = КООЯ              FC(2),           // Индекс \n               ООЯЧИСЛН          FC(2),           // День начала ООЯ\n               ООЯВРЕМН          FC(5,2),         // Время начала ООЯ (нат. знач. часы, мин.)\n               ООЯВРЕМН.Q        FC(1),           // Признак качества\n               ООЯЧИСЛК          FC(2),           // День окончания ООЯ\n               ООЯЧИСЛК.Q        FC(1),           // Признак качества\n               ООЯВРЕМК          FC(5,2),         // Время окончания ООЯ (нат. знач. часы, мин.)\n               ООЯВРЕМК.Q        FC(1),           // Признак качества\n               ООЯВИД            FC(2),           // Шифр ООЯ\n               ООЯВИД.Q          FC(1),           // Признак качества\n               ООЯXАР1           FC(5),           // Первая характеристика ООЯ\n               ООЯXАР1.Q         FC(1),           // В ЯОД точн.х1 до целого\n               ООЯXАР2           FC(3),           // Вторая характеристика ООЯ\n               ООЯXАР2.Q         FC(1),           // Признак качества\n               ООЯПРПЕР          FC(1),           // Признак перехода ООЯ через границу месяца  \n               ООЯПРПЕР.Q        FC(1),           // Признак качества\n               ООЯПРО1Ч          FC(7,2),         // Продолжительность 1-й части ООЯ (нат. знач. часы, мин.) \n               ООЯПРО1Ч.Q        FC(1);           // Признак качества\n       END OSOBO;\n     END OBLJAW;\n   END RECORDS;\n	3	2487	Данные об особо опасных явлениях	\N
tms_p22.aql	 WA1 (10000) CHAR; \n \n IN: STREAM(R) TMS;\n     PORTION RECORDS.REGEN.INT;\n \n   RECORDS NAT;\n     IF  (СТАНЦИЯ  * 1);\n     IF  (ГОД      * 2);\n     IF  (МЕСЯЦ    * 3);\n     WA1 = СТАНЦИЯ           FC(7),               // Станция\n           ГОД               FC(4),               // Год\n           МЕСЯЦ             FC(2);               // Месяц\n \n     RBODY REGEN;\n       WA1 = NДЖ               FC(3);             // Номер дождя\n       GROUP INT;\n         WA1 = КINT              FC(3),           // Номер интервала\n               ОСАВКППИ          FC(5,2),         // Время оконч. периода пост. интенсивности\n               ОСАВКППИ.Q        FC(1),           // Признак качества\n               ОСАККППИ          FC(6,1),         // Количество осадков на конец периода\n               ОСАККППИ.Q        FC(1),           // Признак качества   \n               ОСАИНТИР          FC(5,2),         // Средняя интинтенсивность за период\n               ОСАИНТИР.Q        FC(1);           // Признак качества\n       END INT;\n     END REGEN;\n   END RECORDS;\n	3	2488	Данные плювиографа (интервалы)	\N
tms_gg2.aql	 WA1 (10000) CHAR; \n \n IN: STREAM(R) TMS;\n     PORTION RECORDS.TGGRAF.GIGRO;\n \n   RECORDS NAT;\n     IF  (СТАНЦИЯ  * 1);\n     IF  (ГОД      * 2);\n     IF  (МЕСЯЦ    * 3);\n     WA1 = СТАНЦИЯ           FC(7),               // Станция\n           ГОД               FC(4),               // Год\n           МЕСЯЦ             FC(2);               // Месяц\n \n     RBODY TGGRAF;\n       GROUP GIGRO;\n         IF  (ДЕНЬ     * 4);\n         WA1 = ДЕНЬ              FC(2),           // День\n               ВЛОМАКГГ          FC(3),           // Макс. относительная влажность за сутки\n               ВЛОМАКГГ.Q        FC(1),           // Признак качества\n               ВЛОМИНГГ          FC(3),           // Мин. относительная влажность за сутки\n               ВЛОМИНГГ.Q        FC(1);           // Признак качества\n         GROUP UЕЖ;\n           WA1 = ВЛОТВЗГГ          FC(3),         // Ежечасные значения относительной влажности (24)\n                 ВЛОТВЗГГ.Q        FC(1);         // Признак качества\n         END UЕЖ;\n       END GIGRO;\n     END TGGRAF;\n   END RECORDS;\n	3	2489	Данные гигрографа	\N
tms_ge2.aql	 WA1 (10000) CHAR; \n \n IN: STREAM(R) TMS;\n     PORTION RECORDS.GELIO.ГЕЛИО;\n \n   RECORDS NAT;\n     IF  (СТАНЦИЯ  * 1);\n     IF  (ГОД      * 2);\n     IF  (МЕСЯЦ    * 3);\n     WA1 = СТАНЦИЯ           FC(7),               // Станция\n           ГОД               FC(4),               // Год\n           МЕСЯЦ             FC(2);               // Месяц\n \n     RBODY GELIO;\n       GROUP ГЕЛИО;\n         IF  (ДЕНЬ     * 4);\n         WA1 = ДЕНЬ              FC(2),           // День \n               СОЛСПРСТ          FC(4,1),         // Суммарная прод-сть солнечного сияния за сутки\n               СОЛСПРСТ.Q        FC(1),           // Признак качества\n               СОЛСПЧАС          FC(2),           // 1-й час, после которого светило солнце\n               СОЛСПЧАС.Q        FC(1);           // Признак качества\n         GROUP ЕЖЧПРСС;\n           WA1 = СОЛСПРУГ          FC(3,1),       // Прод-сть солнечного сияния за 1 час (24)\n                 СОЛСПРУГ.Q        FC(1);         // Признак качества\n         END ЕЖЧПРСС;\n       END ГЕЛИО;\n     END GELIO;\n   END RECORDS;\n	3	2490	Данные гелиографа	\N
tms_sl2.aql	 WA1 (10000) CHAR; \n \n IN: STREAM(R) TMS;\n     PORTION RECORDS.SNEG.SNOWL;\n \n   RECORDS NAT;\n     IF  (СТАНЦИЯ  * 1);\n     IF  (ГОД      * 2);\n     IF  (МЕСЯЦ    * 3);\n     WA1 = СТАНЦИЯ           FC(7),               // Станция\n           ГОД               FC(4),               // Год\n           МЕСЯЦ             FC(2);               // Месяц\n \n     RBODY SNEG;\n       GROUP SNOWL;\n         WA1 = NSNL              FC(1),           // Номер снегосъемки                             \n               СНЕГЛДПР          FC(2),           // Дата проведения снегосъемки                     \n               СНЕГСВЫС          FC(4),           // Средняя высота снежного покрова на маршруте     \n               СНЕГСВЫС.Q        FC(1),           // Признак качества                                \n               СНЕВЫСМА          FC(4),           // Наибольшая высота снежного покрова на маршруте  \n               СНЕВЫСМА.Q        FC(1),           // Признак качества                                \n               СНЕВЫСМИ          FC(4),           // Наименьшая высота снежного покрова на маршруте  \n               СНЕВЫСМИ.Q        FC(1),           // Признак качества                                \n               СНЕСТПОК          FC(2),           // Степень покрытия маршрута снегом                \n               СНЕСТПОК.Q        FC(1),           // Признак качества                                \n               СНЕСТПЛК          FC(2),           // Степень покрытия маршрута ледяной коркой        \n               СНЕСТПЛК.Q        FC(1),           // Признак качества                                \n               СНЕСРТЛК          FC(3),           // Средняя толщина ледяной корки                   \n               СНЕСРТЛК.Q        FC(1),           // Признак качества                                \n               СНЕГТСНВ          FC(3),           // Толщина слоя снега, насыщенного водой           \n               СНЕГТСНВ.Q        FC(1),           // Признак качества                                \n               СНЕГТСЧВ          FC(3),           // Толщина слоя чистой воды                        \n               СНЕГТСЧВ.Q        FC(1),           // Признак качества                                \n               СНЕГХАРЗ          FC(1),           // Характер залегания снежного покрова             \n               СНЕГХАРЗ.Q        FC(1),           // Признак качества                                \n               СНЕГХАРП          FC(1),           // Характер снежного покрова                       \n               СНЕГХАРП.Q        FC(1),           // Признак качества                                \n               СНЕГСРПЛ          FC(4,2),         // Средняя плотность снега                         \n               СНЕГСРПЛ.Q        FC(1);           // Признак качества                                \n       END SNOWL;\n     END SNEG;\n   END RECORDS;\n	3	2491	Данные снегосъемок по лесу	\N
tms_sr2.aql	 WA1 (10000) CHAR; \n \n IN: STREAM(R) TMS;\n     PORTION RECORDS.SUTKI.SROKM;\n \n   RECORDS NAT;\n     IF  (СТАНЦИЯ  * 1);\n     IF  (ГОД      * 2);\n     IF  (МЕСЯЦ    * 3);\n     WA1 = СТАНЦИЯ           FC(7),               // Станция\n           ГОД               FC(4),               // Год\n           МЕСЯЦ             FC(2);               // Месяц\n           \n \n     RBODY SUTKI;\n       IF  (ДЕНЬ     * 4);\n       WA1 = ДЕНЬ              FC(2);             // День\n       GROUP SROKM;\n         WA1 = СРОКНАБЛ          FC(2),           // Срок наблюдения\n               ВИДГОРИЗ          FC(2),           // Горизонтальная дальность видимости\n               ВИДГОРИЗ.Q        FC(1),           // Признак качества \n               ВИДГОРИЗ.ВИДГПРНЮ FC(1),           // Пр.нал.знака > \n               ОБЛОКОЛВ          FC(2),           // Общее количество облачности\n               ОБЛОКОЛВ.Q        FC(1),           // Признак качества\n               ОБЛНКОЛВ          FC(2),           // Количество облачности нижнего яруса\n               ОБЛНКОЛВ.Q        FC(1),           // Признак качества\n               ОБЛФОРВЯ          FC(1),           // Форма облаков верхнего яруса\n               ОБЛФОРВЯ.Q        FC(1),           // Признак качества\n               ОБЛФОРСЯ          FC(1),           // Форма облаков среднего яруса\n               ОБЛФОРСЯ.Q        FC(1),           // Признак качества\n               ОБЛФОРВР          FC(1),           // Форма облаков вертикального развития\n               ОБЛФОРВР.Q        FC(1),           // Признак качества\n               ОБЛСЛСЛК          FC(1),           // Слоистые и слоисто-кучевые облака\n               ОБЛСЛСЛК.Q        FC(1),           // Признак качества\n               ОБЛСЛДРД          FC(1),           // Слоисто-дожд,разорванно-дождевые облака\n               ОБЛСЛДРД.Q        FC(1),           // Признак качества\n               ОБЛВЫНГМ          FC(4),           // Высота нижней границы облачности\n               ОБЛВЫНГМ.Q        FC(1),           // Признак качества\n               ОБЛВЫНГМ.ОБЛВПРНЮ FC(1),           // Пр. способа опрю. выс. н. г\n               ОБЛПННУС          FC(1),           // Признак наличия облачности ниже уровня станции\n               ОБЛПННУС.Q        FC(1),           // Признак качества\n               СОСТППЧВ          FC(1),           // Состояние поверхности почвы\n               СОСТППЧВ.Q        FC(1),           // Признак качества\n               СОСТППЧВ.СОСТПППЮ FC(1),           // Признак наличия знака ю у е\n               ПОГОМСНВ          FC(1),           // Погода между сроками\n               ПОГОМСНВ.Q        FC(1),           // Признак качества\n               ПОГОДСНВ          FC(2),           // Погода в срок наблюдения\n               ПОГОДСНВ.Q        FC(1),           // Признак качества\n               ВЕТНАПРМ          FC(3),           // Направление ветра\n               ВЕТНАПРМ.Q        FC(1),           // Признак качества\n               ВЕТСКОРМ          FC(2),           // Средняя скорость ветра\n               ВЕТСКОРМ.Q        FC(1),           // Признак качества\n               ВЕТСКОРМ.ВЕТСПРНЮ FC(1),           // Признак наличия знака > \n               ВЕТСКМАК          FC(2),           // Максимальное скорость ветра\n               ВЕТСКМАК.Q        FC(1),           // Признак качества\n               ВЕТСКМАК.ВЕТСМАПЮ FC(1),           // Признак наличия знака > \n               ОСАСУМСР          FC(6,1),         // Сумма осадков за период между сроками\n               ОСАСУМСР.Q        FC(1),           // Признак качества \n               ТЕМПОВПМ          FC(5,1),         // Температура поверхности почвы в срок \n               ТЕМПОВПМ.Q        FC(1),           // Признак качества                    \n               ТЕМПСПИР          FC(5,1),         // Температура пов. почвы по спирту мин. терм-ра\n               ТЕМПСПИР.Q        FC(1),           // Признак качества \n               ТЕИПОВПМ          FC(5,1),         // Мин. температура пов-сти почвы между сроками\n               ТЕИПОВПМ.Q        FC(1),           // Признак качества\n               ТЕАПОВПМ          FC(5,1),         // Макс. температура пов-сти почвы между сроками\n               ТЕАПОВПМ.Q        FC(1),           // Признак качества\n               ТЕМПППВС          FC(5,1),         // Температура пов-сти почвы по макс. терм-ру п/встр.\n               ТЕМПППВС.Q        FC(1),           // Признак качества \n               ТЕМВОЗДМ          FC(5,1),         // Температура воздуха в срок по сухому терм-ру\n               ТЕМВОЗДМ.Q        FC(1),           // Признак качества \n               ТЕМВСМСМ          FC(5,1),         // Темп.воздуха в срок по смоченному терм-ру\n               ТЕМВСМСМ.Q        FC(1),           // Признак качества \n               ТЕМВСМСМ.ТЕМВПРНЮ FC(1),           // Признак нал. льда на батисте\n               ТЕВСПИРТ          FC(5,1),         // Температура воздуха по спирту мин. терм-ра\n               ТЕВСПИРТ.Q        FC(1),           // Признак качества \n               ТЕИВОЗСМ          FC(5,1),         // Мин.температура воздуха между сроками\n               ТЕИВОЗСМ.Q        FC(1),           // Признак качества \n               ТЕАВОЗСМ          FC(5,1),         // Макс. темперура воздуха между сроками\n               ТЕАВОЗСМ.Q        FC(1),           // Признак качества \n               ТЕМВМПВС          FC(5,1),         // Темпера воздуха по макс. терм-ра после встрях.\n               ТЕМВМПВС.Q        FC(1),           // Признак качества \n               УПРВПАРР          FC(5,2),         // Парциальное давление водяного пара\n               УПРВПАРР.Q        FC(1),           // Признак качества\n               УПРВПАРР.Q1       FC(1),           // Указатель точности элемента\n               ВЛАОТВОМ          FC(3),           // Относительная влажность воздуха в срок\n               ВЛАОТВОМ.Q        FC(1),           // Признак качества \n               НЕДНАСПР          FC(5,2),         // Дефицит насыщения водяного пара\n               НЕДНАСПР.Q        FC(1),           // Признак качества\n               НЕДНАСПР.Q1       FC(1),           // Указатель точности элемента\n               ТОЧКАРОС          FC(5,1),         // Температура точки росы\n               ТОЧКАРОС.Q        FC(1),           // в срок наблюдения\n               ДАВЛАСТМ          FC(6,1),         // Атмосферное давление в срок на уровне станции \n               ДАВЛАСТМ.Q        FC(1),           // Признак качества \n               ДАВЛАУММ          FC(6,1),         // Атмосферное давление в срок на уровне моря\n               ДАВЛАУММ.Q        FC(1),           // Признак качества \n               ТЕНБВИДГ          FC(1),           // Характеристика барической тенденции\n               ТЕНБВИДГ.Q        FC(1),           // Признак качества\n               ТЕНБВЕЛР          FC(4,1),         // Величина барической тенденции\n               ТЕНБВЕЛР.Q        FC(1);           // Признак качества \n       END SROKM;\n     END SUTKI;\n   END RECORDS;\n	3	2492	Срочные данные	\N
tms_tg2.aql	 WA1 (10000) CHAR; \n \n IN: STREAM(R) TMS;\n     PORTION RECORDS.TGGRAF.TERMO;\n \n   RECORDS NAT;\n     IF  (СТАНЦИЯ  * 1);\n     IF  (ГОД      * 2);\n     IF  (МЕСЯЦ    * 3);\n     WA1 = СТАНЦИЯ           FC(7),               // Станция\n           ГОД               FC(4),               // Год\n           МЕСЯЦ             FC(2);               // Месяц\n \n     RBODY TGGRAF;\n       GROUP TERMO;\n         IF  (ДЕНЬ     * 4);\n         WA1 = ДЕНЬ              FC(2),           // День\n               ТЕВМАКТГ          FC(5,1),         // Макс. тeмпература воздуха за сутки\n               ТЕВМАКТГ.Q        FC(1),           // Признак качества\n               ТЕВМИНТГ          FC(5,1),         // Мин. тeмпература воздуха за сутки\n               ТЕВМИНТГ.Q        FC(1);           // Признак качества\n         GROUP TЕЖ;\n           WA1 = ТЕМВОЗТГ          FC(5,1),       // Ежечасное значение температуры воздуха\n                 ТЕМВОЗТГ.Q        FC(1);         // Признак качества\n         END TЕЖ;\n       END TERMO;\n     END TGGRAF;\n   END RECORDS;\n	3	2496	Данные термографа	\N
tms_cn2.aql	 WA1 (10000) CHAR; \n \n IN: STREAM(R) TMS;\n     PORTION RECORDS;\n \n   RECORDS NAT;\n     IF  (СТАНЦИЯ  * 1);\n     IF  (ГОД      * 2);\n     IF  (МЕСЯЦ    * 3);\n     WA1 = СТАНЦИЯ           FC(7),               // Станция\n           ГОД               FC(4),               // Год\n           МЕСЯЦ             FC(2);               // Месяц\n \n     RBODY CONST;\n       WA1 = НАИМЕНСТ          FC(20),            // Наименование станции\n             КООРДНОМ          FC(7),             // Координатный номер станции\n             НОМУПРАВ          FC(2),             // Номер УГМС\n             НОМЧАСП           FC(2),             // Номер часового пояса\n             ТИПУЧАСТ          FC(1),             // Тип участка станции\n             ВЫССТНУМ          FC(5),             // Высота над уровнем моря\n             ПРГЕОРАС          FC(1),             // Признак географического расположения\n             КОЛСРОК           FC(1),             // Количество сроков наблюдения\n             ПРНЕПРДН          FC(1),             // Признак непрерывного раб. дня\n             ПРПРИНСТ          FC(1),             // Признак принадлежности станции\n             ПРУАТГМС          FC(1),             // Признак наличия УАТГМС\n             ПРЕЖЧАСН          FC(1),             // Наличие ежечасных наблюдений\n             ПРАГРОМН          FC(1),             // Наличие агрометеорологических наблюдений\n             ПРПРМОРН          FC(1),             // Наличие прибрежных морских наблюдений\n             ПРГИДРОН          FC(1),             // Наличие гидрологических наблюдений\n             ПРАЭРОН           FC(1),             // Наличие аэрологических наблюдений\n             ПРРАДИОН          FC(1),             // Наличие радиолокационных наблюдений\n             ПРАКТИНН          FC(1),             // Наличие актинометрических наблюдений\n             ПРТЕПЛОБ          FC(1),             // Наличие теплобалансовых наблюдений\n             ПРОЗОНН           FC(1),             // Наличие озонометрических наблюдений\n             ПРАТЭЛЕК          FC(1),             // Наличие набл. атмосферного электричества\n             ПРЗАГРВЗ          FC(1),             // Наличие наблюдений загрязнения воздуха\n             ПРКЛАССТ          FC(1),             // Признак классности станции\n             ПРООЯ             FC(1),             // Классиф.критер.ооя\n             ПРНВИДИМ          FC(1),             // Наблюдения дальности видимости\n             ПРНОБЛАЧ          FC(1),             // Наблюдения над облачностью\n             ПРНВЫСОБ          FC(1),             // Набл. высоты нижней границы облачности\n             ПРСОСТПП          FC(1),             // Наблюдения состояния поверхности почвы\n             ПРНПОГОД          FC(1),             // Наблюдения над погодой\n             ПРНВЕТР           FC(1),             // Наблюдения над ветром\n             ВЫСФЛЛД           FC(5,1),           // Высота флюгера с легкой доской\n             ВЫСФЛТД           FC(5,1),           // Высота флюгера с тяжелой доской\n             ВЫСАНЕМО          FC(5,1),           // Высота анеморумбометра\n             ПРНОСАДК          FC(1),             // Наблюдения над осадками\n             ПРНТЕМПП          FC(1),             // Наблюдения температуры поверхности почвы\n             ПРНТЕМВ           FC(1),             // Наблюдения температуры воздуха\n             ПРНСНЕГ           FC(1),             // Наличие снегосъемок\n             ДЛСНЕГП           FC(3,1),           // Длина полевого маршрута\n             ДЛСНЕГЛ           FC(3,1),           // Длина маршрута по лесу\n             ДЛСНЕГБ           FC(3,1),           // Длина маршрута по балкам\n             ПРНГЕЛИО          FC(1),             // Наличие гелиографа\n             ВЫСГЕЛИО          FC(5,1),           // Высота гелиографа над землей\n             ПРНТЕРМО          FC(1),             // Наличие термографа\n             ПРНГИГРО          FC(1),             // Наличие гигрографа\n             ПРНПЛЮВ           FC(1),             // Наличие плювиографа\n             ПРНОБЛЕД          FC(1),             // Наблюдения обледенения\n             ПРНБАРОМ          FC(1),             // Наличие барометра\n             ВЫСБАРОМ          FC(6,1);           // Высота барометра над уровнем моря\n\n      WA1 =  ДНАЧПНОЧ          FC(2),             // День начала полярной ночи\n             МНАЧПНОЧ          FC(2),             // Месяц начала полярной ночи\n             ДКОНЦАПН          FC(2),             // День окончания полярной ночи\n             МКОНЦАПН          FC(2),             // Месяц окончания полярной ночи\n             НОМЕРАДР          FC(3),             // Номер административного района в УГМС\n             ГОДТЕКУЩ          FC(4),             // Текущий год\n             МЕСЯЦТЕК          FC(2),             // Текущий месяц\n             КОЛДНМЕС          FC(2),             // Количество дней в месяце\n             НМСМОСКВ          FC(2),             // Начало местных суток, МДВ\n             НМСПДЗВ           FC(2),             // Начало местных суток, ПДЗВ\n             ПЧАСНМС           FC(2),             // Первый час от начала местных суток\n             ПСРОКНМС          FC(2),             // Первый срок от начала местных суток\n             СБЛ8ЧАС8          FC(2),             // Срок, ближайший к 8 часам ПДЗВ\n             СБ14ЧАС8          FC(2),             // Срок, ближайший к 14 часам ПДЗВ\n             СБ14ЧАС4          FC(2),             // Срок, ближайший к 14 часам ПДВ (4 срока)\n             ШИРОТА            FC(4,1),           // Широта расположения станции\n             ДОЛГОТА           FC(4,1),           // Долгота расположения станц.\n             ОПРПОЛУШ          FC(1),             // Определитель долготы и полушария\n             ГОДОТКСТ          FC(4),             // Год открытия станции\n             КЗSUTKI           FC(2),             // Количество записей СУТКИ-СРОКИ\n             КЗTPOCHV          FC(2),             // Количество записей ТЕМПЕРАТУРА ПОЧВЫ\n             КЗGELIO           FC(1),             // Количество записей ГЕЛИОГРАФ\n             КЗTGGRAF          FC(1),             // Количество записей ТЕРМОГРАФ\n             КЗSNEG            FC(1),             // Количество записей СНЕГОСЪЕМКИ\n             КЗREGEN           FC(3),             // Количество записей ДОЖДЬ\n             КЗOBLJAW          FC(1),             // Количество записей ОБЛЕДИНЕНИЕ-ООЯ\n             КЗATMOS           FC(2);             // Количество записей АТМОСФЕРНЫЕ ЯВЛЕНИЯ\n     END CONST;\n   END RECORDS;\n	3	2497	Паспортные данные	\N
tmsM_Ov2.aql	// Облачность, видимость                      =_Ov2\nWA1 (10000) CHAR;\n\nIN: STREAM(R) TMSM;\n    PORTION RECORDS.MONAT;\n\n  RECORDS NAT;\n    IF  (СТАНЦИЯ   * 1);\n     IF  (ГОД      * 2);\n     IF  (МЕСЯЦ    * 3);\n     WA1 = СТАНЦИЯ           FC(7),             // Станция\n           ГОД               FC(4),             // Год\n           МЕСЯЦ             FC(2);             // Месяц\n          \n    RBODY MONAT;\n      WA1 = ОБЛОСРМС    FC(4,1),                // Среднее количество общей блачности                 \n            ОБЛОСРМС.Q  FC(1,0),                // Признак качества                                   \n            ОБЛНСРМС    FC(4,1),                // Среднее количество нижней облачности               \n            ОБЛНСРМС.Q  FC(1,0),                // Признак качества                                   \n            ОБОЧЯДМС    FC(2,0),                // Число ясных дней по общей облачности               \n            ОБОЧЯДМС.Q  FC(1,0),                // Признак качества                                   \n            ОБНЧЯДМС    FC(2,0),                // Число ясных дней по нижней облачности              \n            ОБНЧЯДМС.Q  FC(1,0),                // Признак качества                                   \n            ОБОЧПДМС    FC(2,0),                // Число пасмурных дней по общей облачности           \n            ОБОЧПДМС.Q  FC(1,0),                // Признак качества                                   \n            ОБНЧПДМС    FC(2,0),                // Число пасмурных дней по нижней облачности          \n            ОБНЧПДМС.Q  FC(1,0);                // Признак качества                                   \n      GROUP ПОВТФОБЛ;\n        WA1 = ФОРМЫОБЛ    FC(2,0),              // Индекс списка форм облаков    \n              ОБПОФОМС    FC(3,0),              // Повторяемость формы облаков   \n              ОБПОФОМС.Q  FC(1,0);              // Признак качества              \n      END ПОВТФОБЛ;\n      GROUP ЧСЛФОБЛ;\n        WA1 = ФОРМЫОБЛ    FC(2,0),\t\t// Индекс списка случаев облаков     \n              ОБЧСФОМС    FC(3,0),              // Число случаев формы облаков       \n              ОБЧСФОМС.Q  FC(1,0);              // Признак качества                  \n      END ЧСЛФОБЛ;\n      GROUP ВИДИМЧСЛ;\n        WA1 = ГРАДАЦИИ    FC(1,0),              // Номер Градации                                 \n              ВИДЧСГМС    FC(3,0),              // Число случаев дальности видимости по градациям \n              ВИДЧСГМС.Q  FC(1,0);              // Признак качества                               \n      END ВИДИМЧСЛ;\n      GROUP ВИДИМПОВ;\n        WA1 = ГРАДАЦИИ    FC(1,0),              // Номер Градации                           \n              ВИДГПГМС    FC(3,0),              // Повтор дальности видимости по градациям  \n              ВИДГПГМС.Q  FC(1,0);              // Признак качества                         \n      END ВИДИМПОВ;\n    END MONAT;\n  END RECORDS;\n	3	2498	Облачность, видимость	\N
tmsM_Ob2.aql	//  Обледенение                     \t   =_Ob2\n WA1 (32000) CHAR; \n \n IN: STREAM(R) TMSM;\n     PORTION RECORDS;\n \n   RECORDS NAT;\n     IF  (СТАНЦИЯ  * 1);\n     IF  (ГОД      * 2);\n     IF  (МЕСЯЦ    * 3);\n     WA1 = СТАНЦИЯ           FC(7),               // Станция\n           ГОД               FC(4),               // Год\n           МЕСЯЦ             FC(2);               // Месяц\n \n      RBODY ОБЛООЯ;\n         WA1 = СЧОБЛ         FC(2),              // Счетчик случаев обледенения  \n               СЧООЯ         FC(2);              // Счетчик случаев ООЯ          \n         GROUP ОВLЕD;\n         WA1 = КОЛИЧ             FC(2),           // Количество                                                        \n               ОБДНМСЛР          FC(3),           // Порядковый номер случаев обледенения                              \n               ОБДНМСЛР.Q        FC(1);           // Признак качества                                                  \n         GROUP ВИДОБЛ;                            //                                                                   \n           WA1 = ШИФР              FC(1),         // Индекс                                                            \n                 ОБДНВИДВ          FC(2),         // Шифр твердых отложений                                            \n                 ОБДНВИДВ.Q        FC(1);         // Признак качества                                                  \n         END ВИДОБЛ;                                                                                                   \n         WA1 = ОБДНЧИСР          FC(2),           // Дата начала обледенения                                           \n               ОБДВРЕНВ          FC(2),           // Время начала случая обледенения                                   \n               ОБДВРЕНВ.Q        FC(1),           // Признак качества                                                  \n               ОБДПРСТН          FC(4),           // Продолжительность стадии нарастания обледенения                   \n               ОБДПРСТН.Q        FC(1),           // Признак качества                                                  \n               ОБДПРОДВ          FC(4),           // Продолжение всего случая обледенения                              \n               ОБДПРОДВ.Q        FC(1);           // Признак качества                                                  \n         GROUP СТАДИИ;                            //                                                                   \n           WA1 = КСТАДИЙ           FC(1),         // Количество стадий                                                 \n                 ОБДНДИАМ          FC(3),         // Диаметр отложения                                                 \n                 ОБДНДИАМ.Q        FC(1),         // Признак качества                                                  \n                 ОБДТОЛЩМ          FC(3),         // Толщина отложения                                                 \n                 ОБДТОЛЩМ.Q        FC(1),         // Признак качества                                                  \n                 ОБДМАССА          FC(5),         // Масса отложения                                                   \n                 ОБДМАССА.Q        FC(1);         // Признак качества                                                  \n         END СТАДИИ;                                                                                                   \n         WA1 = ОБДТЕМНМ          FC(5,1),         // Температура воздуха в начале обледенения                          \n               ОБДТЕМНМ.Q        FC(1),           // Признак качества                                                  \n               ОБВЕТННМ          FC(3),           // Направление ветра в начале обледенения                            \n               ОБВЕТННМ.Q        FC(1),           // Признак качества                                                  \n               ОБВЕТСНМ          FC(3),           // Скорость ветра в начале обледенения                               \n               ОБВЕТСНМ.Q        FC(1),           // Признак качества                                                  \n               ОБВЕТСНМ.ОБДВПРНЮ FC(1),           // Признак наличия знака > у f                                       \n               ОБДТЕМММ          FC(5,1),         // Темпуратура воздуха при достижении отложений максимального размера\n               ОБДТЕМММ.Q        FC(1),           // Признак качества                                                  \n               ОБВЕТНММ          FC(3),           // Направление ветра при достижении отложений максимального размера  \n               ОБВЕТНММ.Q        FC(1),           // Признак качества                                                  \n               ОБВЕТСММ          FC(2),           // Скорость ветра при достижении отложений максимального размера     \n               ОБВЕТСММ.Q        FC(1),           // Признак качества                                                  \n               ОБВЕТСММ.ОБДВМАНЮ FC(1),           // Признак наличия знака > у f                                       \n               ОБДПРПЕР          FC(1),           // Признак перехода обледенения через границу месяца                 \n               ОБДПРПЕР.Q        FC(1),           // Признак качества                                                  \n               ОБДПРД1Ч          FC(4),           // Продолжительность 1 части обледенения                             \n               ОБДПРД1Ч.Q        FC(1);           // Признак качества                                                  \n       END ОВLЕD;\n       END ОБЛООЯ;\n   END RECORDS;\n	3	2499	Обледенение	\N
tmsM_Sr2.aql	//   Обобщения за месяц по восьми срокам        =_Sr2\n WA1 (32000) CHAR; \n \n IN: STREAM(R) TMSM;\n     PORTION RECORDS;\n \n   RECORDS NAT;\n     IF  (СТАНЦИЯ  * 1);\n     IF  (ГОД      * 2);\n     IF  (МЕСЯЦ    * 3);\n     WA1 = СТАНЦИЯ           FC(7),               // Станция\n           ГОД               FC(4),               // Год\n           МЕСЯЦ             FC(2);               // Месяц\n \n     RBODY СРОКИ;\n       GROUP ВЫВОДЫ;\n         WA1 = СРОКИ             FC(1),           // Обобщения по срокам                                     \n               СРОКНАБЛ          FC(2),           // Срок наблюдения                                         \n               ТЕВССРМС          FC(5,1),         // Среднее значение температуры возд                       \n               ТЕВССРМС.Q        FC(1),           // Признак качества                                        \n               ТППССРМС          FC(5,1),         // Среднее значение температуры поверхности почвы          \n               ТППССРМС.Q        FC(1),           // Признак качества                                        \n               ТТРССРМС          FC(5,1),         // Среднее значение температуры точки росы                 \n               ТТРССРМС.Q        FC(1),           // Признак качества                                        \n               УПРССРМС          FC(5,2),         // Среднее значениепарциальн давления водяного пара        \n               УПРССРМС.Q        FC(1),           // Признак качества                                        \n               УПРССРМС.Q1       FC(1),           // Указатель точности элемента                             \n               ВЛОССРМС          FC(3),           // Среднее значение относительной влажности воздуха        \n               ВЛОССРМС.Q        FC(1),           // Признак качества                                        \n               НЕНССРМС          FC(5,2),         // Среднее значение дефицита насыщения водяного пара       \n               НЕНССРМС.Q        FC(1),           // Признак качества                                        \n               НЕНССРМС.Q1       FC(1),           // указатель точности элемента                             \n               ДАВССРМС          FC(6,1),         // Среднее значение атмосферного давления на уровне станции\n               ДАВССРМС.Q        FC(1),           // Признак качества                                        \n               ДУМССРМС          FC(6,1),         // Среднее значение атмосферного давления на уровне моря   \n               ДУМССРМС.Q        FC(1),           // Признак качества                                        \n               ОБОССРМС          FC(4,1),         // Среднее количество баллов общей облачности              \n               ОБОССРМС.Q        FC(1),           // Признак качества                                        \n               ОБНССРМС          FC(4,1),         // Среднее количествово баллов нижней облачности           \n               ОБНССРМС.Q        FC(1),           // Признак качества                                        \n               ОБУССРМС          FC(3),           // Число случаев облачности ниже уровня станции            \n               ОБУССРМС.Q        FC(1),           // Признак качества                                        \n               ВЕСССРМС          FC(4,1),         // Среднее значение скорости ветра                         \n               ВЕСССРМС.Q        FC(1),           // Признак качества                                        \n               ОСУМСРМС          FC(6,1),         // Суммарное количество во осадков за срок                 \n               ОСУМСРМС.Q        FC(1);           // Признак качества                                        \n         GROUP ТЕМПОГ;                            //                                                         \n           WA1 = ГЛУБИНЫ           FC(1),         // Индекс Под оголенной поверхностью                       \n                 ТЕМПОГМС          FC(5,1),       // Среднее значение температурыры почвы на глубине         \n                 ТЕМПОГМС.Q        FC(1);         // Признак качества                                        \n         END ТЕМПОГ;                                                                                         \n         GROUP ТЕМПЕСТ;                           //                                                         \n           WA1 = ГЛУБИНЫ           FC(1),         // Индекс Под естественным покровом                       \n                 ТЕПЕООМС          FC(5,1),       // Среднее значение температуры почвы на глубине           \n                 ТЕПЕООМС.Q        FC(1);         // Признак качества                                        \n         END ТЕМПЕСТ;\n       END ВЫВОДЫ;\n     END СРОКИ;\n   END RECORDS;\n	3	2500	Обобщения за месяц по восьми срокам	\N
tmsM_Oj2.aql	//  Особо опасные явления\t                   =_Oj2\n WA1 (32000) CHAR; \n \n IN: STREAM(R) TMSM;\n     PORTION RECORDS;\n \n   RECORDS NAT;\n     IF  (СТАНЦИЯ  * 1);\n     IF  (ГОД      * 2);\n     IF  (МЕСЯЦ    * 3);\n     WA1 = СТАНЦИЯ           FC(7),               // Станция\n           ГОД               FC(4),               // Год\n           МЕСЯЦ             FC(2);               // Месяц\n       RBODY ОБЛООЯ;\n              GROUP ОSОВО;\n         WA1 = КООЯ              FC(2),           // Количество   ООЯ                            \n               ООЯЧИСЛН          FC(2),           // Дата начала  ООЯ                            \n               ООЯВРЕМН          FC(2),           // Время начала ООЯ (часы)                     \n               ООЯВРЕМН.Q        FC(1),           // Признак качества                            \n               ООЯВРНМ           FC(2),           // Время начала ООЯ (минуты)                   \n               ООЯВРНМ.Q         FC(1),           // Признак качества                            \n               ООЯЧИСЛК          FC(2),           // Дата окончания ООЯ                          \n               ООЯЧИСЛК.Q        FC(1),           // Признак качества                            \n               ООЯВРЕМК          FC(2),           // Время окончания ООЯ (часы)                  \n               ООЯВРЕМК.Q        FC(1),           // Признак качества                            \n               ООЯВРКМ           FC(2),           // Время окончания ООЯ (минуты)                \n               ООЯВРКМ.Q         FC(1),           // Признак качества                            \n               ООЯВИД            FC(2),           // Вид ООЯ                                     \n               ООЯВИД.Q          FC(1),           // Признак качества                            \n               ООЯXАР1           FC(5),           // Первая характеристика ООЯ                   \n               ООЯXАР1.Q         FC(1),           // В ЯОД точность х1 до цел.                   \n               ООЯXАР2           FC(3),           // Вторая характеристика ООЯ                   \n               ООЯXАР2.Q         FC(1),           // Признак качества                            \n               ООЯПРПЕР          FC(1),           // Признак перехода ООЯ через границу месяца   \n               ООЯПРПЕР.Q        FC(1),           // Признак качества                            \n               ООЯПРО1Ч          FC(4),           // Продолжительность 1-й части ООЯ (часы)      \n               ООЯПРО1Ч.Q        FC(1),           // Признак качества                            \n               ООЯПР1ЧМ          FC(2),           // Продолжительность 1-й части ООЯ (минуты)    \n               ООЯПР1ЧМ.Q        FC(1);           // Признак качества                            \n       END ОSОВО;\n     END ОБЛООЯ;\n   END RECORDS;\n	3	2501	Особо опасные явления	\N
tmsM_Sgm.aql	//  Маршрутные снегосъемки                     =_Sgm\n WA1 (32000) CHAR; \n \n IN: STREAM(R) TMSM;\n     PORTION RECORDS;\n \n   RECORDS NAT;\n     IF  (СТАНЦИЯ  * 1);\n     IF  (ГОД      * 2);\n     IF  (МЕСЯЦ    * 3);\n     WA1 = СТАНЦИЯ           FC(7),               // Станция\n           ГОД               FC(4),               // Год\n           МЕСЯЦ             FC(2);               // Месяц\n  RBODY СНЕГ;\n       GROUP СНСЬЕМКИ;\n         WA1 = КОЛИЧ             FC(2),           // Кол-во снегосъемок \n               МАРШРУТ           AA(5),           // Маршрут снегосъемки \n               ДАТА              FC(2),           // Дата проведения снегос'емки \n               СНЕСТЕПВ          FC(2),           // Степень покрытия окрестностей станции снегом  \n               СНЕСТЕПВ.Q        FC(1),           // Признак качества                              \n               СНЕСТПОК          FC(2),           // Степень покрытия маршрута снегом              \n               СНЕСТПОК.Q        FC(1),           // Признак качества                              \n               СНЕСТПЛК          FC(2),           // Степень покрытия маршрута ледяной коркой      \n               СНЕСТПЛК.Q        FC(1),           // Признак качества                              \n               СНЕГСВЫС          FC(4),           // Средняя высота снежного покрова на маршруте    \n               СНЕГСВЫС.Q        FC(1),           // Признак качества                              \n               СНЕВЫСМА          FC(4),           // Наибольшая высота снежного покрова на маршруте. \n               СНЕВЫСМА.Q        FC(1),           // Признак качества                              \n               СНЕВЫСМИ          FC(4),           // Наименьшая высота снежного покрова на маршруте. \n               СНЕВЫСМИ.Q        FC(1),           // Признак качества                              \n               СНЕГСРПЛ          FC(4,2),         // Средняя плотность снега                       \n               СНЕГСРПЛ.Q        FC(1),           // Признак качества                              \n               СНЕСРТЛК          FC(3),           // Средняя толщина ледяной корки                 \n               СНЕСРТЛК.Q        FC(1),           // Признак качества                              \n               СНЕГТСНВ          FC(3),           // Толщина слоя снега, насыщенногог водой        \n               СНЕГТСНВ.Q        FC(1),           // Признак качества                              \n               СНЕГТСЧВ          FC(2),           // Толщина слоя чистой воды                      \n               СНЕГТСЧВ.Q        FC(1),           // Признак качества                              \n               СПЗВСНЕГ          FC(4),           // Запас воды в снеге                            \n               СПЗВСНЕГ.Q        FC(1),           // Признак качества                              \n               СНПЗВОБЩ          FC(4),           // Запас воды, общий                             \n               СНПЗВОБЩ.Q        FC(1),           // Признак качества                              \n               СНЕГXАРЗ          FC(1),           // Характер залегания снежного покрова           \n               СНЕГXАРЗ.Q        FC(1),           // Признак качества                              \n               СНЕГXАРП          FC(1),           // Характер снежного покрова                     \n               СНЕГXАРП.Q        FC(1);           // Признак качества                              \n       END СНСЬЕМКИ;\n     END СНЕГ;\n    END RECORDS;\n	3	2502	Маршрутные снегосъемки	\N
tmsM_cw2.aql	//  Данные о ветре                             =_cw2 \nWA1 (32000) CHAR; \n \n IN: STREAM(R) TMSM;\n     PORTION RECORDS;\n    RECORDS NAT;\n     IF  (СТАНЦИЯ  * 1);\n     IF  (ГОД      * 2);\n     IF  (МЕСЯЦ    * 3);\n     WA1 = СТАНЦИЯ           FC(7),               // Станция\n           ГОД               FC(4),               // Год\n           МЕСЯЦ             FC(2);               // Месяц\n \n     RBODY ВЕТЕР;\n       WA1 = ВЕСКСРМС          FC(4,1),           // Среднее значение скорости ветра               \n             ВЕСКСРМС.Q        FC(1),             // Признак качества                              \n             ВЕСКМАМС          FC(3),             // Максимальное значение скорости ветра          \n             ВЕСКМАМС.Q        FC(1),             // Признак качества                              \n             ВЕСКЧМА1          FC(2),             // Дата 1-го максимума скорости ветра            \n             ВЕСКЧМА1.Q        FC(1),             // Признак качества                              \n             ВЕСКЧМА2          FC(2),             // Дата посл.максимума значение скорости ветра   \n             ВЕСКЧМА2.Q        FC(1);             // Признак качества                              \n       GROUP ЧСЛСКОРВ;                            //                              \n         WA1 = ГРАДАЦИИ          FC(2),           // Градации                                      \n               ВЕЧСГРСК          FC(3),           // Число случаев ветра по градации скорости ветра\n               ВЕЧСГРСК.Q        FC(1);           // Признак качества                              \n       END ЧСЛСКОРВ;                                                                               \n       WA1 = ВЕЧСШАМС          FC(3),             // Число случаев штиля                           \n             ВЕЧСШАМС.Q        FC(1),             // Признак качества                              \n             ВЕТПШТМС          FC(3),             // Повторяемость штиля                           \n             ВЕТПШТМС.Q        FC(1);             // Признак качества                              \n       GROUP ПОВНАПРВ;                            //                                               \n         WA1 = РУМБЫ16           FC(2),           // Список Румбы16                                \n               ВЕПОООМС          FC(3),           // Повтораемость ветра по направлениям           \n               ВЕПОООМС.Q        FC(1);           // Признак качества                              \n       END ПОВНАПРВ;                                                                               \n       GROUP СКВНАПР;                             //                                               \n         WA1 = РУМБЫ16           FC(2),           // Список Румбы16                                \n               ВЕСОООМС          FC(4,1),         // Сред.скорость ветра по направлениям           \n               ВЕСОООМС.Q        FC(1);           // Признак качества                              \n       END СКВНАПР;                                                                                \n       GROUP ЧСЛУЧНАП;                            //                                               \n         WA1 = РУМБЫ16           FC(2),           // Список Румбы 16                                \n               ВЕЧСНРМС          FC(3),           // Число случаев ветра по направлениям           \n               ВЕЧСНРМС.Q        FC(1);           // Признак качества                              \n       END ЧСЛУЧНАП;                                                                               \n       GROUP ЧСЛНАПРВ;                            //                                               \n         WA1 = РУМБЫ8            FC(1),           // Список Румбы 8                                 \n               ВЕЧС8РМС          FC(3),           // Число случаев ветра по направлениям           \n               ВЕЧС8РМС.Q        FC(1);           // Признак качества                              \n       END ЧСЛНАПРВ;                                                                               \n       GROUP ПОВТНАПР;                            //                                               \n         WA1 = РУМБЫ8            FC(1),           // Список Румбы 8                                 \n               ВЕПО8РМС          FC(3),           // Повторяемость ветра по направлениям           \n               ВЕПО8РМС.Q        FC(1);           // Признак качества                              \n       END ПОВТНАПР;                                                                               \n       GROUP СКВЕТРА;                             //                                               \n         WA1 = РУМБЫ8            FC(1),           // Список Румбы 8                                 \n               ВЕСК8РМС          FC(4,1),         // Сред.скорость ветра по направлениям           \n               ВЕСК8РМС.Q        FC(1);           // Признак качества                              \n       END СКВЕТРА;\n     END ВЕТЕР;\n   END RECORDS;\n	3	2503	Данные о ветре	\N
tmsM_To2.aql	//   Температура почвы на глубинах              =_To2\n WA1 (32000) CHAR; \n \n IN: STREAM(R) TMSM;\n     PORTION RECORDS;\n \n   RECORDS NAT;\n     IF  (СТАНЦИЯ  * 1);\n     IF  (ГОД      * 2);\n     IF  (МЕСЯЦ    * 3);\n     WA1 = СТАНЦИЯ           FC(7),               // Станция\n           ГОД               FC(4),               // Год\n           МЕСЯЦ             FC(2);               // Месяц\n \n     RBODY ТПОЧВЫ;\n       GROUP ТЕМПОГ;                              // Оголенная поверхность                                 \n         WA1 = ГЛУБИНЫ           FC(1);           // Индекс                                                \n         GROUP G1;                                //                                                       \n           WA1 = СРМАКМИН          FC(1),         // Индекс Оголенная поверхность                          \n                 ТЕМПОЧОГ          FC(5,1),       // Средняя макс,мин.температура почвы на глубине 5-20 см. \n                 ТЕМПОЧОГ.Q        FC(1);         // Признак качества                                      \n         END G1;                                                                                           \n       END ТЕМПОГ;                                                                                         \n       GROUP ТПОЧВЕСТ;                            // Естественный покров                                 \n         WA1 = ГЛУБИНЫ           FC(2);           // Индекс                                               \n         GROUP G2;                                //                                                       \n           WA1 = СРМАКМИН          FC(1),         // Индекс естественный покров                            \n                 ТЕМПЕПМС          FC(5,1),       // Сред,макс,мин.темп.почвы на глубине 0,02-3,2м          \n                 ТЕМПЕПМС.Q        FC(1);         // Признак качества                                      \n         END G2;                                                                                           \n       END ТПОЧВЕСТ;                                                                                       \n       GROUP ЧДНСМОР;                             //                                                       \n         WA1 = ГЛУБИНЫ           FC(2),           // Индекс                                                \n               ТПДМООМС          FC(2),           // Число дней с морозом на глубине 0,02-3,2 м.            \n               ТПДМООМС.Q        FC(1);           // Признак качества                                      \n       END ЧДНСМОР;\n     END ТПОЧВЫ;\n   END RECORDS;\n	3	2504	Температура почвы на глубинах	\N
tmsM_cD2.aql	//  Декадные выводы\t\t\t\t   =_cD2\n WA1 (32000) CHAR; \n \n IN: STREAM(R) TMSM;\n     PORTION RECORDS;\n \n   RECORDS NAT;\n     IF  (СТАНЦИЯ  * 1);\n     IF  (ГОД      * 2);\n     IF  (МЕСЯЦ    * 3);\n     WA1 = СТАНЦИЯ           FC(7),               // Станция\n           ГОД               FC(4),               // Год\n           МЕСЯЦ             FC(2);               // Месяц\n \n     RBODY ДЕКАДЫ;\n       GROUP ОБОБЩЕН;\n         WA1 = ДЕКАДЫ            FC(1),           // Индекс                                                         \n               ТЕМВСРДК          FC(5,1),         // Среднее значение темературы воздуха                            \n               ТЕМВСРДК.Q        FC(1),           // Признак качества                                               \n               ТЕВМАКДК          FC(5,1),         // Среднее значение максимальной темературы воздуха               \n               ТЕВМАКДК.Q        FC(1),           // Признак качества                                               \n               ТЕВМИНДК          FC(5,1),         // Среднее значение минимальной темературы воздуха                \n               ТЕВМИНДК.Q        FC(1),           // Признак качества                                               \n               ТЕППСРДК          FC(5,1),         // Среднее значение темературы поверхности почвы                  \n               ТЕППСРДК.Q        FC(1),           // Признак качества                                               \n               ТППСМАДК          FC(5,1),         // Среднее значение максимальной темературы поверхности почвы     \n               ТППСМАДК.Q        FC(1),           // Признак качества                                               \n               ТППСМИДК          FC(5,1),         // Среднее значение минимальной темературы поверхности почвы      \n               ТППСМИДК.Q        FC(1),           // Признак качества                                               \n               ТТРСМИДК          FC(5,1),         // Среднее значение минимальной темературы точки росы             \n               ТТРСМИДК.Q        FC(1),           // Признак качества                                               \n               УПРПСРДК          FC(5,2),         // Сред.знач.парциального давления водяного пара                  \n               УПРПСРДК.Q        FC(1),           // Признак качества                                               \n               УПРПСРДК.Q1       FC(1),           // указатель точности элемента                                    \n               ВЛОТСРДК          FC(3),           // Среднее значение относительной  влажности воздуха              \n               ВЛОТСРДК.Q        FC(1),           // Признак качества                                               \n               ВЛОСМИДК          FC(3),           // Среднее значение минимальной относительной  влажности воздуха  \n               ВЛОСМИДК.Q        FC(1),           // Признак качества                                               \n               НЕНАСРДК          FC(5,2),         // Среднее значение дефицита насыщения водяного пара              \n               НЕНАСРДК.Q        FC(1),           // Признак качества                                               \n               НЕНАСРДК.Q1       FC(1),           // указатель точности элемента                                    \n               НЕНСМАДК          FC(5,2),         // Среднее значение максимального дефицита насыщения водяного пара\n               НЕНСМАДК.Q        FC(1),           // Признак качества                                               \n               НЕНСМАДК.Q1       FC(1),           // указатель точности элемента                                    \n               ДАВВСРДК          FC(6,1),         // Среднее значение атмосферного давления на уровне станции       \n               ДАВВСРДК.Q        FC(1),           // Признак качества                                               \n               ДАУМСРДК          FC(6,1),         // Среднее значение атмосферного давления на уровне моря          \n               ДАУМСРДК.Q        FC(1),           // Признак качества                                               \n               ВЕСКСРДК          FC(4,1),         // Среднее значение скорости ветра                                \n               ВЕСКСРДК.Q        FC(1),           // Признак качества                                               \n               ОСАСРКДК          FC(6,1),         // Суммарное количество осадков за декаду                         \n               ОСАСРКДК.Q        FC(1),           // Признак качества                                               \n               СНВЫСОДК          FC(5,1),         // Средняя высота снежного покрова по 3-м рейкам                  \n               СНВЫСОДК.Q        FC(1);           // Признак качества                                               \n         GROUP ТПОЧВОГ;                           //                                                                \n           WA1 = ГЛУБИНЫ           FC(1),         // Индекс (огол.пов.0,05-0,2м)                                    \n                 ТЕМПОГДК          FC(5,1),       // Среднее значение температуры почвы на глубине                  \n                 ТЕМПОГДК.Q        FC(1);         // Признак качества                                               \n         END ТПОЧВОГ;                                                                                               \n         GROUP ТПОЧВЕСТ;                          //                                                                \n           WA1 = ГЛУБИНЫ           FC(2),         // Индекс (ест.покр.0,02-3,2 м.)                                   \n                 ТЕМПЕПДК          FC(5,1),       // Среднее значение температуры почвы на глубине                  \n                 ТЕМПЕПДК.Q        FC(1);         // Признак качества                                               \n         END ТПОЧВЕСТ;                                                                                              \n         WA1 = СНПСВЫСТ          FC(5,1),         // Средняя высота снежного покрова у почвы термом.                \n               СНПСВЫСТ.Q        FC(1);           // Признак качества                                               \n         GROUP GELIO;                             //                                                                \n           WA1 = ИНТЕРВАЛ          FC(2),         // Интервал                                                       \n                 СССПРЧДК          FC(4,1),       // Суммарная продолжительность солнечного сияния за интервал      \n                 СССПРЧДК.Q        FC(1);         // Признак качества                                               \n         END GELIO;                                                                                                 \n         WA1 = СОЛСПРДК          FC(5,1),         // Суммарная продолжительность солнечного сияния за декаду        \n               СОЛСПРДК.Q        FC(1);           // Признак качества                                               \n       END ОБОБЩЕН;\n     END ДЕКАДЫ;\n   END RECORDS;\n	3	2505	Декадные выводы	\N
tmsM_Aj2.aql	//  Атмосферные явления                        =_Aj2\n\nWA1 (10000) CHAR;\n\nIN: STREAM(R) TMSM;\n    PORTION RECORDS.MONAT;\n\n  RECORDS NAT;\n     IF  (СТАНЦИЯ  * 1);\n     IF  (ГОД      * 2);\n     IF  (МЕСЯЦ    * 3);\n     WA1 = СТАНЦИЯ           FC(7),               // Станция                         \n           ГОД               FC(4),               // Год                      \n           МЕСЯЦ             FC(2);               // Месяц                                   \n    RBODY MONAT;                                                                                              \n      GROUP ЧИСЛДНАЯ;                             //                                                          \n        WA1 = ВИДЫАЯ      FC(2,0),                // Индекс видов АЯ                                                \n              АЯЧДООМС    FC(2,0),                // Число дней с атмосферными явлениями                    \n              АЯЧДООМС.Q  FC(1,0);                // Признак качества                                         \n      END ЧИСЛДНАЯ;                                                                                           \n      GROUP ПРОДОЛАЯ;                             //                                                          \n        WA1 = ВИДЫАЯ      FC(2,0),                // Индекс                                  \n              АЯПРООМС    FC(3,0),                // Продолжительность атмосферного явления  \n              АЯПРООМС.Q  FC(1,0);                // Признак качества                        \n      END ПРОДОЛАЯ;\n    END MONAT;\n  END RECORDS;\n	3	2506	Атмосферные явления	\N
tmsM_Ss2.aql	//  Солнечное сияние                           =_Ss2\n// VVM;\nWA1 (10000) CHAR;\n\nIN: STREAM(R) TMSM;\n    PORTION RECORDS.MONAT;\n\n  RECORDS NAT;\n     IF  (СТАНЦИЯ  * 1);\n     IF  (ГОД      * 2);\n     IF  (МЕСЯЦ    * 3);\n     WA1 = СТАНЦИЯ           FC(7),               // Станция\n           ГОД               FC(4),               // Год\n           МЕСЯЦ             FC(2);               // Месяц\n    RBODY MONAT;\n      GROUP GELIOGR;\n        WA1 = ИНТЕРВАЛ    FC(2,0),              // Интервал                                                     \n              СССПРЧМС    FC(4,1),              // Суммарная продолжительность солнечного сияния за интервал    \n              СССПРЧМС.Q  FC(1,0);              // Признак качества                                             \n      END GELIOGR;\n      WA1 = СОЛСПРМС    FC(5,1),                // Суммарная продолжительность  солнечного сияния за за месяц          \n            СОЛСПРМС.Q  FC(1,0),                // Признак качества                                                    \n            СССПДСМС    FC(4,1),                // Средняя продолжительность солнечного сияния за день с солнцем       \n            СССПДСМС.Q  FC(1,0),                // Признак качества                                                    \n            ССМВПРМС    FC(5,1),                // Максимально возможная продолжительность солнечного сияния           \n            ССМВПРМС.Q  FC(1,0),                // Признак качества                                                    \n            СОЛОТНМС    FC(3,0),                // Относительная продолжительность солнечного сияния                   \n            СОЛОТНМС.Q  FC(1,0),                // Признак качества                                                    \n            ССЧДБСМС    FC(2,0),                // Число дней без солнца                                               \n            ССЧДБСМС.Q  FC(1,0),                // Признак качества                                                    \n            ССЧДБСПН    FC(2,0),                // Число дней без солнца из-за полярной ночи                           \n            ССЧДБСПН.Q  FC(1,0);                // Признак качества                                                    \n        GROUP ПРОДОЛСС;\n        WA1 = ДЕКАДА      FC(1,0),              // Индекс                                                      \n              ССМАКПДК    FC(3,0),              // Максимально возможная продолжит.солнечного сияния за декаду \n              ССМАКПДК.Q  FC(1,0);              // Признак качества                                            \n      END ПРОДОЛСС;\n    END MONAT;\n  END RECORDS;\n	3	2507	Солнечное сияние	\N
tmsM_p22.aql	//  Данные плювиографа    (Интервалы)                     =_P22\n WA1 (32000) CHAR; \n \n IN: STREAM(R) TMSM;\n     PORTION RECORDS;\n \n   RECORDS NAT;\n     IF  (СТАНЦИЯ  * 1);\n     IF  (ГОД      * 2);\n     IF  (МЕСЯЦ    * 3);\n     WA1 = СТАНЦИЯ           FC(7),               // Станция\n           ГОД               FC(4),               // Год\n           МЕСЯЦ             FC(2);               // Месяц\n \n     RBODY REGEN;\n       WA1 = NДОЖДЯ            FC(3);             // Номер дождя                                           \n       GROUP INT;                                 //                                                       \n         WA1 = ИНТЕРВАЛ          FC(3),           // Номер интервала                                       \n               ОСАВКППИ          FC(4),           // Время окончания первого постоянного интервала (часы)  \n               ОСАВКППИ.Q        FC(1),           // Признак качества                                      \n               ОСАВКПИМ          FC(2),           // Время окончания первого постоянного интервала (минуты)\n               ОСАВКПИМ.Q        FC(1),           // Признак качества                                      \n               ОСАККППИ          FC(6,1),         // Количество осадков на конечный период                 \n               ОСАККППИ.Q        FC(1),           // Признак качества                                      \n               ОСАИНТИР          FC(5,2),         // Средняя интенсивность за период                       \n               ОСАИНТИР.Q        FC(1);           // Признак качества                                      \n       END INT;\n     END REGEN;\n   END RECORDS;\n	3	2508	Данные плювиографа (интервалы)	\N
tmsM_p21.aql	//  Данные плювиографа  (Общие)                       =_P21\n WA1 (32000) CHAR; \n \n IN: STREAM(R) TMSM;\n     PORTION RECORDS;\n \n   RECORDS NAT;\n     IF  (СТАНЦИЯ  * 1);\n     IF  (ГОД      * 2);\n     IF  (МЕСЯЦ    * 3);\n     WA1 = СТАНЦИЯ           FC(7),               // Станция\n           ГОД               FC(4),               // Год\n           МЕСЯЦ             FC(2);               // Месяц\n \n     RBODY REGEN;\n       WA1 = NДОЖДЯ            FC(3),             // Номер дождя                                           \n //          СЧINТ             FC(3),             // Счетчик переходов с равной интенсивностью             \n             ОСАПРПЕР          FC(1),             // Признак перехода дождя через границу месяца           \n             ОСАПРПЕР.Q        FC(1),             // Признак качества                                      \n             ОСАДЧИСР          FC(2),             // День начала дождя                                     \n             ОСАДЧИСК          FC(2),             // День окончания дождя                                  \n             ОСАДЧИСК.Q        FC(1),             // Признак качества. Относится к обеим датам             \n             ОСАДВРЕМ          FC(4),             // Время начала дождя (часы)                             \n             ОСАДВРЕМ.Q        FC(1),             // Признак качества                                      \n             ОСАДВРМ           FC(2),             // Время начала дождя (минуты)                           \n             ОСАДВРМ.Q         FC(1),             // Признак качества                                      \n             ОСАКОЛ1Ч          FC(6,1),           // Количество осадков за 1 час дождя                     \n             ОСАКОЛ1Ч.Q        FC(1),             // Признак качества                                      \n             ОСАДПРОД          FC(4),             // Продолжительность дождя (часы)                        \n             ОСАДПРОД.Q        FC(1),             // Признак качества                                      \n             ОСАДПРМ           FC(2),             // Продолжительность дождя (минуты)                      \n             ОСАДПРМ.Q         FC(1),             // Признак качества                                      \n             ОСАКОЛДЖ          FC(6,1),           // Количество осадков за 2 часа дождя                    \n             ОСАКОЛДЖ.Q        FC(1),             // Признак качества                                      \n             ОСАСРИНТ          FC(5,2),           // Средняя интенсивность дождя                           \n             ОСАСРИНТ.Q        FC(1),             // Признак качества                                      \n             ОСАСУМПР          FC(4),             // Суммарная продолжиельность дождя (часы)               \n             ОСАСУМПР.Q        FC(1),             // Признак качества                                      \n             ОСАСУММ           FC(2),             // Суммарная продолжительность дождя (минуты)            \n             ОСАСУММ.Q         FC(1),             // Признак качества                                      \n             ОСАСКОЛД          FC(6,1),           // Суммарное колчество осадков за дождь                  \n             ОСАСКОЛД.Q        FC(1),             // Признак качества                                      \n             ОСАСИНТД          FC(5,2),           // Средняя интенсивность всего дождя                     \n             ОСАСИНТД.Q        FC(1);             // Признак качества                                      \n     END REGEN;\n   END RECORDS;\n	3	2513	Данные плювиографа (общие)	\N
tmsM_Ibj.aql	// Количество информации об обледенении и ОЯ        =_Ibj\n//VVM;\nWA1 (10000) CHAR;\n\nIN: STREAM(R) TMSM;\n    PORTION RECORDS.MONAT;\n\n  RECORDS NAT;\n     IF  (СТАНЦИЯ  * 1);\n     IF  (ГОД      * 2);\n     IF  (МЕСЯЦ    * 3);\n     WA1 = СТАНЦИЯ           FC(7),               // Станция\n           ГОД               FC(4),               // Год\n           МЕСЯЦ             FC(2);               // Месяц\n    RBODY MONAT;\n      WA1 =   КБЛОКОБЛ    FC(3,0),              // Кол-во блоков информ. обледенения за месяц\n              КБЛОКОБЛ.Q  FC(1,0),              // Признак качества                          \n              ООЯЧСЛМС    FC(2,0),              // Кол-во ООЯ за месяц                       \n              ООЯЧСЛМС.Q  FC(1,0);              // Признак качества                          \n     END MONAT;\n   END RECORDS;\n	3	2514	Количество информации об обледенении и ОЯ	\N
tmsM_Sxm.aql	// Характеристики маршрутных сЪемок     =_Sxm\n//VVM;\nWA1 (10000) CHAR;\n\nIN: STREAM(R) TMSM;\n    PORTION RECORDS.MONAT;\n\n  RECORDS NAT;\n     IF  (СТАНЦИЯ  * 1);\n     IF  (ГОД      * 2);\n     IF  (МЕСЯЦ    * 3);\n     WA1 = СТАНЦИЯ           FC(7),               // Станция\n           ГОД               FC(4),               // Год\n           МЕСЯЦ             FC(2);               // Месяц\n    RBODY MONAT;\n        WA1 = КСНЕГОСП    FC(1,0),              // Кол-во снегосъемок по полевому маршруту\n              КСНЕГОСП.Q  FC(1,0),              // Признак качества                       \n              КСНЕГОСЛ    FC(1,0),              // Кол-во снегосъемок по лесному маршруту \n              КСНЕГОСЛ.Q  FC(1,0),              // Признак качества                       \n              КСНЕГОСБ    FC(1,0),              // Кол-во снегосъемок по балкам(оврагам)  \n              КСНЕГОСБ.Q  FC(1,0);              // Признак качества                       \n     END MONAT;\n  END RECORDS;\n	3	2509	Характеристики маршрутных снегосъемок	\N
tmsM_Ad2.aql	// Атмосферное давление, осадки               =_Ad2\n//VVM;\nWA1 (10000) CHAR;\n\nIN: STREAM(R) TMSM;\n    PORTION RECORDS.MONAT;\n\n  RECORDS NAT;\n     IF  (СТАНЦИЯ  * 1);\n     IF  (ГОД      * 2);\n     IF  (МЕСЯЦ    * 3);\n     WA1 = СТАНЦИЯ           FC(7),               // Станция\n           ГОД               FC(4),               // Год\n           МЕСЯЦ             FC(2);               // Месяц\n    RBODY MONAT;\n      WA1 = ДАВВСРМС    FC(6,1),                // Среднее значение атмосферного  давления на уровне станции           \n            ДАВВСРМС.Q  FC(1,0),                // Признак качества                                                    \n            ДАВМАКМС    FC(6,1),                // Абсолютный максимум атмосферного давления на уровне станции         \n            ДАВМАКМС.Q  FC(1,0),                // Признак качества                                                    \n            ДАВЧАМА1    FC(2,0),                // Дата 1-го абсолютного максимума атм.давления на уровне станции      \n            ДАВЧАМА1.Q  FC(1,0),                // Признак качества                                                    \n            ДАВЧАМА2    FC(2,0),                // Дата последнего абсолютного максимума атм.давления на уровне станции\n            ДАВЧАМА2.Q  FC(1,0),                // Признак качества                                                    \n            ДАВАМИМС    FC(6,1),                // Абсолютный минимум атмосферного давления на уровне станции          \n            ДАВАМИМС.Q  FC(1,0),                // Признак качества                                                    \n            ДАВЧАМИ1    FC(2,0),                // Дата 1-го абсолютного минимума атм.давления на уровне станции       \n            ДАВЧАМИ1.Q  FC(1,0),                // Признак качества                                                    \n            ДАВЧАМИ2    FC(2,0),                // Дата последнего абсолютного минимума атм.давления на уровне станции \n            ДАВЧАМИ2.Q  FC(1,0),                // Признак качества                                                    \n            ДАУМСРМС    FC(6,1),                // Среднее значение атмосферного давления на уровне станции            \n            ДАУМСРМС.Q  FC(1,0),                // Признак качества                                                    \n            ОССУМНМС    FC(7,1),                // Месячное количество осадков за ночь                                 \n            ОССУМНМС.Q  FC(1,0),                // Признак качества                                                    \n            ОССУМДМС    FC(7,1),                // Месячное количество осадков за день                                 \n            ОССУМДМС.Q  FC(1,0),                // Признак качества                                                    \n            ОСАСУММС    FC(7,1),                // Сумма осадков                                                       \n            ОСАСУММС.Q  FC(1,0),                // Признак качества                                                    \n            ОССМАУМС    FC(6,1),                // Максимальное количество осадков за сутки                            \n            ОССМАУМС.Q  FC(1,0),                // Признак качества                                                    \n            ОСЧМАУМ1    FC(2,0),                // Дата 1-го максимума осадков за сутки                                \n            ОСЧМАУМ1.Q  FC(1,0),                // Признак качества                                                    \n            ОСЧМАУМ2    FC(2,0),                // Дата последнего максимума осадков за сутки                          \n            ОСЧМАУМ2.Q  FC(1,0),                // Признак качества                                                    \n            ОССУМПМС    FC(4,1),                // Суммарная поправка на смачивание                                    \n            ОССУМПМС.Q  FC(1,0);                // Признак качества                                                    \n      GROUP ЧИСЛОДН;\n        WA1 = ГРАДАЦИИ    FC(2,0),              // Индекс видов атмосферных явлений\n              ОСДСООМС    FC(2,0),              // Число дней с количеством осадков не менее\n              ОСДСООМС.Q  FC(1,0);              // Признак качества\n      END ЧИСЛОДН;\n    END MONAT;\n  END RECORDS;\n	3	2510	Атмосферное давление, осадки	\N
tmsM_Tv2.aql	// Температура воздуха, почвы, влажность      =_Tv2\n// VVM;\nWA1 (10000) CHAR;\n\nIN: STREAM(R) TMSM;\n    PORTION RECORDS.MONAT;\n\n  RECORDS NAT;\n     IF  (СТАНЦИЯ  * 1);\n     IF  (ГОД      * 2);\n     IF  (МЕСЯЦ    * 3);\n     WA1 = СТАНЦИЯ           FC(7),               // Станция\n           ГОД               FC(4),               // Год\n           МЕСЯЦ             FC(2);               // Месяц\n          \n    RBODY MONAT;\n      WA1 = ТЕМВСРМС    FC(5,1),                // Средняя температура воздуха                                                  \n            ТЕМВСРМС.Q  FC(1,0),                // Признак качества                                                             \n            ТЕВМАКМС    FC(5,1),                // Средняя максимальная температура воздуха                                     \n            ТЕВМАКМС.Q  FC(1,0),                // Признак качества                                                             \n            ТЕВМИНМС    FC(5,1),                // Средняя минимальная температура воздуха                                      \n            ТЕВМИНМС.Q  FC(1,0),                // Признак качества                                                             \n            ТЕВАМАМС    FC(6,1),                // Абсолютный максимум температуры воздуха                                      \n            ТЕВАМАМС.Q  FC(1,0),                // Признак качества                                                             \n            ТВЧАМАМ1    FC(2,0),                // Дата 1-го абсолютного максимума температуры воздуха                          \n            ТВЧАМАМ1.Q  FC(1,0),                // Признак качества                                                             \n            ТВЧАМАМ2    FC(2,0),                // Дата последнего абсолютного максимума температуры воздуха                    \n            ТВЧАМАМ2.Q  FC(1,0),                // Признак качества                                                             \n            ТЕВАМИМС    FC(5,1),                // Абсолютный минимум температуры воздуха                                       \n            ТЕВАМИМС.Q  FC(1,0),                // Признак качества                                                             \n            ТВЧАМИМ1    FC(2,0),                // Дата 1-го абсолютного минимума температуры воздуха                           \n            ТВЧАМИМ1.Q  FC(1,0),                // Признак качества                                                             \n            ТВЧАМИМ2    FC(2,0),                // Дата последнего абсолютного минимума температуры воздуха                     \n            ТВЧАМИМ2.Q  FC(1,0),                // Признак качества                                                             \n            ТВЧДБОМС    FC(2,0),                // Число дней без оттепели                                                      \n            ТВЧДБОМС.Q  FC(1,0),                // Признак качества                                                             \n            ТВЧДСММС    FC(2,0),                // Число дней с морозом                                                         \n            ТВЧДСММС.Q  FC(1,0),                // Признак качества                                                             \n            ТЕППСРМС    FC(5,1),                // Средняя температура поверхности почвы                                        \n            ТЕППСРМС.Q  FC(1,0),                // Признак качества                                                             \n            ТППСМАМС    FC(5,1),                // Средняя максимальная температура поверхности почвы                           \n            ТППСМАМС.Q  FC(1,0),                // Признак качества                                                             \n            ТППСМИМС    FC(5,1),                // Средняя минимальная температура поверхности почвы                            \n            ТППСМИМС.Q  FC(1,0),                // Признак качества                                                             \n            ТППАМАМС    FC(5,1),                // Абсолютный максимум температуры поверхности почвы                            \n            ТППАМАМС.Q  FC(1,0),                // Признак качества                                                             \n            ТППЧАМА1    FC(2,0),                // Дата 1-го абсолютного максимума температуры поверхности почвы                \n            ТППЧАМА1.Q  FC(1,0),                // Признак качества                                                             \n            ТППЧАМА2    FC(2,0),                // Дата последнего абсолютного максимума температуры поверхности почвы          \n            ТППЧАМА2.Q  FC(1,0),                // Признак качества                                                             \n            ТППАМИМС    FC(5,1),                // Абсолютный минимум  температуры поверхности почвы                            \n            ТППАМИМС.Q  FC(1,0),                // Признак качества                                                             \n            ТППЧАМИ1    FC(2,0),                // Дата 1-го абсолютного минимума температуры поверхности почвы                 \n            ТППЧАМИ1.Q  FC(1,0),                // Признак качества                                                             \n            ТППЧАМИ2    FC(2,0),                // Дата последнего абсолютного минимума температуры поверхности почвы           \n            ТППЧАМИ2.Q  FC(1,0),                // Признак качества                                                             \n            ТППЧДММС    FC(2,0),                // Число дней с морозом на поверхности почвы                                    \n            ТППЧДММС.Q  FC(1,0),                // Признак качества                                                             \n            УПРПСРМС    FC(5,2),                // Среднее значение парциального давления водяного пара                         \n            УПРПСРМС.Q  FC(1,0),                // Признак качества                                                             \n            УПРПСРМС.Q1 FC(1,0),                // указатель точности элемента                                                  \n            УПРАМАМС    FC(5,2),                // Абсолютный максимум парциального давления водяного пара                      \n            УПРАМАМС.Q  FC(1,0),                // Признак качества                                                             \n            УПРАМАМС.Q1 FC(1,0),                // указатель точности элемента                                                  \n            УПРЧАМА1    FC(2,0),                // Дата 1-го абсолютного макс. парциального давления водяного пара              \n            УПРЧАМА1.Q  FC(1,0),                // Признак качества                                                             \n            УПРЧАМА2    FC(2,0),                // Дата последнего абсолютн максимума парциального давления водяного пара       \n            УПРЧАМА2.Q  FC(1,0),                // Признак качества                                                             \n            УПРАМИМС    FC(5,2),                // Абсолбтный минимум парциального давления водяного пара                       \n            УПРАМИМС.Q  FC(1,0),                // Признак качества                                                             \n            УПРАМИМС.Q1 FC(1,0),                // указатель точности элемента                                                  \n            УПРЧАМИ1    FC(2,0),                // Дата 1-го абсолютного минимума парциального давления водяного пара           \n            УПРЧАМИ1.Q  FC(1,0),                // Признак качества                                                             \n            УПРЧАМИ2    FC(2,0),                // Дата последнего абсолютного минимума парциального давления водяного пара     \n            УПРЧАМИ2.Q  FC(1,0),                // Признак качества                                                             \n            ВЛОТСРМС    FC(3,0),                // Среднее значение относительной влажности воздуха                             \n            ВЛОТСРМС.Q  FC(1,0),                // Признак качества                                                             \n            ВЛОТМИМС    FC(3,0),                // Среднее минимальное значение относительной влажности воздуха                 \n            ВЛОТМИМС.Q  FC(1,0),                // Признак качества                                                             \n            ВЛОАМИМС    FC(3,0),                // Абсолютный минимум относительной влажности воздуха                           \n            ВЛОАМИМС.Q  FC(1,0),                // Признак качества                                                             \n            ВЛОЧАМИ1    FC(2,0),                // Дата 1-го абсолютного минимума относительной влажности воздуха               \n            ВЛОЧАМИ1.Q  FC(1,0),                // Признак качества                                                             \n            ВЛОЧАМИ2    FC(2,0),                // Дата последнего абсолютного минимума относительной влажности воздуха         \n            ВЛОЧАМИ2.Q  FC(1,0),                // Признак качества                                                             \n            ВЛЧД30МС    FC(2,0),                // Число дней с относительной влажностью не более 30%                           \n            ВЛЧД30МС.Q  FC(1,0),                // Признак качества                                                             \n            ВЛЧД80МС    FC(2,0),                // Число дней с относительной влажностью не менее 80%                           \n            ВЛЧД80МС.Q  FC(1,0),                // Признак качества                                                             \n            НЕДНСРМС    FC(5,2),                // Среднее значение дефицита насыщения водяного пара                            \n            НЕДНСРМС.Q  FC(1,0),                // Признак качества                                                             \n            НЕДНСРМС.Q1 FC(1,0),                // указатель точн.элемента                                                      \n            НЕДНМАМС    FC(5,2),                // Среднее значение максимального дефицита насыщености водяного пара            \n            НЕДНМАМС.Q  FC(1,0),                // Признак качества                                                             \n            НЕДНМАМС.Q1 FC(1,0),                // Указатель точности элемента                                                  \n            НЕНАМАМС    FC(5,2),                // Абсолютный максимум дефицита насыщености водяного пара                       \n            НЕНАМАМС.Q  FC(1,0),                // Признак качества                                                             \n            НЕНАМАМС.Q1 FC(1,0),                // Указатель точности элемента                                                  \n            ННЧАМАМ1    FC(2,0),                // Дата 1-го абсолютного максимума дефицита насыщености водяного пара           \n            ННЧАМАМ1.Q  FC(1,0),                // Признак качества                                                             \n            ННЧАМАМ2    FC(2,0),                // Дата последнего абсолютного максимума дефицита насыщености водяного пара     \n            ННЧАМАМ2.Q  FC(1,0),                // Признак качества                                                             \n            РОСАСРМС    FC(5,1),                // Среднне значение температуры точки росы                                      \n            РОСАСРМС.Q  FC(1,0),                // Признак качества                                                             \n            ТТРСМИМС    FC(5,1),                // Среднее значение  минимальной температуры точки росы                         \n            ТТРСМИМС.Q  FC(1,0),                // Признак качества                                                             \n            ТЕДПРЗГД    FC(2,0),                // Дата 1-го мороза в воздухе          \n            ТЕДПРЗГД.Q  FC(1,0),                // Признак качества                    \n            ТЕДПСЗГД    FC(2,0),                // Дата посл.мороза в воздухе          \n            ТЕДПСЗГД.Q  FC(1,0),                // Признак качества                    \n            ТПДПРЗГД    FC(2,0),                // Дата 1-го мороза на почве           \n            ТПДПРЗГД.Q  FC(1,0),                // Признак качества                    \n            ТПДПСЗГД    FC(2,0),                // Дата последнего мороза на почве     \n            ТПДПСЗГД.Q  FC(1,0);                // Признак качества                    \n      GROUP БЕТА;                               //       \n        WA1 = ДЕКАДА      FC(1,0),              // Индекс\n              ПРСУТКСР    FC(1,0),              // Суточн.колич. сроков набл.т-ры.почвы,естест.покр.на глуб.(2-40 см) \n              ПРСУТКСР.Q  FC(1,0);              // Признак качества\n      END БЕТА;\n    END MONAT;\n  END RECORDS;\n	3	2511	Температура воздуха, почвы, влажность	\N
tmsM_Tr2.aql	//  Замена термометров, счетчики               =_Tr2\n// VVM;\nWA1 (10000) CHAR;\n\nIN: STREAM(R) TMSM;\n    PORTION RECORDS.MONAT;\n\n  RECORDS NAT;\n     IF  (СТАНЦИЯ  * 1);\n     IF  (ГОД      * 2);\n     IF  (МЕСЯЦ    * 3);\n     WA1 = СТАНЦИЯ           FC(7),               // Станция\n           ГОД               FC(4),               // Год\n           МЕСЯЦ             FC(2);               // Месяц\n     RBODY MONAT;\n        WA1 = ДЗАМСТЕР    FC(2,0),              // Дата замены термомометра на глубине под естественным покрытием         \n            ДЗАМСТЕР.Q  FC(1,0),                // Признак качества                                                       \n            СРОКЗСТР    FC(2,0),                // Срок замены термометра на глубине под естественным покрытием           \n            СРОКЗСТР.Q  FC(1,0);                // Признак качества                                                       \n      GROUP ЗАММИНТ;\n        WA1 = ЗАМЕНАМТ    FC(1,0),              // Индекс                                     \n              ДАТАЗАМТ    FC(2,0),              // Дата замены минимального термометра        \n              ДАТАЗАМТ.Q  FC(1,0),              // Признак качества                           \n              СРОКЗАМТ    FC(2,0),              // Срок замены минимального термометра        \n              СРОКЗАМТ.Q  FC(1,0);              // Признак качества                           \n      END ЗАММИНТ;\n      GROUP ДЕЛЬТА;\n        WA1 = ДЕКАДА      FC(1,0),              // Индекс                                           \n              ОССУМПДК    FC(3,1),              // Сумарные поправки на смачивание осадковза декаду \n              ОССУМПДК.Q  FC(1,0);              // Признак качества                                 \n      END ДЕЛЬТА;\n      GROUP ДОППТМИН;\n        WA1 = КДОППОПР    FC(1,0),              // Индекс                                                 \n              ДОППМИНТ    FC(2,0),              // Дополнительные  поправки минимального термометра       \n              ДОППМИНТ.Q  FC(1,0);              // Признак качества                                   \n      END ДОППТМИН;\n      WA1 = КОЛДОППР    FC(1,0),                // Количество дополнит. поправок мин.термом.      \n            ПРВВЕДП     FC(1,0);                // Признак введенной поправки                     \n    END MONAT;\n  END RECORDS;\n	3	2512	Замена термометров, счетчики	\N
\.


--
-- Data for Name: countries; Type: TABLE DATA; Schema: public; Owner: aisori
--

COPY public.countries (countryname) FROM stdin;
Albania
Algeria
American Samoa
Andorra
Angola
Antigua And Barbuda
Argentina
Armenia
Aruba
Australia
Austria
Azerbaijan
Bahamas
Bahrain
Bangladesh
Barbados
Belarus
Belgium
Belize
Benin
Bermuda
Bhutan
Bolivia
Bosnia Herzegovina
Botswana
Brazil
British Virgin Islands
Brunei
Bulgaria
Burkina Faso
Burundi
Cambodia
Cameroon
Canada
Cape Verde Islands
Cayman Islands
Central African Republic
Chile
China
Chinese Taipei
Colombia
Comoros
Cook Islands
Costa Rica
Cote d'Ivoire
Croatia
Cuba
Cyprus
Czech Republic
Democratic Republic of Congo
Denmark
Djibouti
Dominica
Dominican Republic
Ecuador
Egypt
El Salvador
Equatorial Guinea
Eritrea
Estonia
Ethiopia
Fiji
Finland
Former Yugoslav Republic of Macedonia
France
Gabon
Gambia
Georgia
Germany
Ghana
Great Britain
Greece
Grenada
Guam
Guatemala
Guinee Conakry
Guyana
Haiti
Honduras
Hong Kong
Hungary
Iceland
India
Indonesia
Iran
Iraq
Ireland
Israel
Italy
Jamaica
Japan
Jordan
Kazakhstan
Kenya
Kiribati
Korea
Kuwait
Kyrgyzstan
Laos
Latvia
Lebanon
Lesotho
Liberia
Libya
Liechtenstein
Lithuania
Luxembourg
Macedonia
Madagascar
Malawi
Malaysia
Maldives
Mali
Malta
Marshall islands
Mauritania
Mauritius
Mexico
Micronesia
Moldova
Monaco
Mongolia
Montenegro
Morocco
Mozambique
Myanmar (Burma)
Namibia
Nauru
Nepal
Netherlands
Netherlands Antilles
New Zealand
Nicaragua
Niger
Nigeria
Norfolk Islands
Northern Mariana Islands
Norway
Oman
Pakistan
Palau
Palestine
Panama
Papua New Guinea
Paraguay
Peru
Philippines
Poland
Portugal
Puerto Rico
Qatar
Republic of the Congo
Romania
Russia
Rwanda
Saint Kitts and Nevis
Saint Lucia
Saint Vincent and the Grenadines
Samoa
San Marino
Saudi Arabia
Senegal
Serbia
Seychelles
Sierra Leone
Singapore
Slovakia
Slovenia
Solomon Islands
Somalia
South Africa
Spain
Sri Lanka
Sudan
Surinam
Swaziland
Sweden
Switzerland
Syria
Tajikistan
Tanzania
Thailand
Togo
Tonga
Trinidad and Tobago
Tunisia
Turkey
Turkmenistan
U.S. Virgin Islands
Uganda
Ukraine
United Arab Emirates
United States of America
Uruguay
Uzbekistan
Vanuatu
Venezuela
Vietnam
Yemen
Zambia
Zimbabwe
other
unknown
\.


--
-- Data for Name: faillog; Type: TABLE DATA; Schema: public; Owner: aisori
--

COPY public.faillog (failid, tstamp, ipadr, logname, pwd, aliasid) FROM stdin;
5901	2019-05-18 19:51:31.064924	31.173.240.177	Valerika	4997@lera	2
5902	2019-05-18 19:56:34.423082	31.173.240.177	4997	lera4997	2
5903	2019-05-19 10:24:25.9956	217.144.175.101	89135914553	1324354657689809	2
5904	2019-05-19 10:24:46.934917	217.144.175.101	89135914553	trewwq54321	2
5905	2019-05-19 10:24:59.384647	217.144.175.101	89135914553	trewq54321	2
5906	2019-05-19 10:27:17.566441	217.144.175.101	89048930023	варвара2005	2
5907	2019-05-19 10:27:31.69985	217.144.175.101	89048930023	dfhfdfhf2005	2
5908	2019-05-19 10:27:31.69985	217.144.175.101	89048930023		2
5909	2019-05-19 10:27:31.69985	217.144.175.101	89048930023	dfhfdfhf2005	2
5910	2019-05-19 10:27:31.69985	217.144.175.101	89048930023	варвара2005	2
5911	2019-05-19 14:12:19.418691	176.59.210.201	woolfwood	totsamiilesha59rus	2
5912	2019-05-19 14:12:37.460636	176.59.210.201	woolfwood	totsamiilesha59rus	2
5913	2019-05-19 17:36:10.891114	109.252.8.110	zumzik	Zumzumzik19	2
5914	2019-05-20 15:48:24.792677	46.39.229.39	afoninnikolay96	satrus	2
5915	2019-05-20 15:48:32.166334	46.39.229.39	afoninnikolay96	satrus	2
\.


--
-- Data for Name: newstext; Type: TABLE DATA; Schema: public; Owner: aisori
--

COPY public.newstext (newsid, tstamp, ntext, aliasid) FROM stdin;
3	2018-02-06 14:25:04.139916+03	Учетные записи пользователей старой технологий Web Аисори и новой Web Аисори-М синхронизированы по состоянию на 06 февраля 2018г.	2
4	2018-02-09 13:31:15.0559+03	В среду 14 февраля 2018г. с 12 до 17 часов будут проводится регламентные работы на сервере нашего сайта.\r\nСайт будет недоступен.	2
7	2019-01-18 09:43:51.334556+03	Добавлены массивы в месячных данных:\r\n\r\nАтмосферное давление на уровне моря\r\nЧисло дней с осадками => 1 мм\r\n	2
6	2018-05-18 11:43:37.535056+03	Добавлены спецмассивы в месячные данные:\r\n\r\nАтмосферное давление на уровне моря, \r\nЧисло дней с осадками => 1 мм\r\n	2
8	2019-03-21 09:13:07.500604+03	Обновлены следующие массивы данных:\r\n - Основные метеорологические параметры (сроки)\r\n - Атмосферные явления (сроки)\r\n - Температура воздуха и количество осадков (ежедневные данные)\r\n - Характеристики снежного покрова (ежедневные данные)\r\n - Маршрутные снегомерные съемки\r\n	2
10	2019-04-19 09:57:22.838133+03	Обновлен массив данных: Продолжительность солнечного сияния	2
\.


--
-- Data for Name: numusers; Type: TABLE DATA; Schema: public; Owner: aisori
--

COPY public.numusers (dummyid, numusers) FROM stdin;
1	16487
\.


--
-- Data for Name: reguser; Type: TABLE DATA; Schema: public; Owner: aisori
--

COPY public.reguser (logname, pwd, fname, iname, email, countryname, cityname, org, uid, aliasid, appr, allugms, ugmsid) FROM stdin;
NICKM82	thothHeocjutBa4hy	Михайлов	Николай	nickolay.mikhaylov@gmail.com	Russia	Казань	Сити Ком ООО	101	2	\N	f	\N
NICKOLA11	Nickola11	Волошин	Николай	qazzaq11@mail.ru	Moldova	Кишинёв	VEC	102	2	\N	f	\N
NICKOLA47	56ghost44	Паздников	Николай	nickola47@mail.ru	Russia	Хабаровск	ООО	103	2	\N	f	\N
NICKOLAEW.BOR	b14221007041959	Николаев	Борис	nickolaew.boria2013@yandex.ru	Russia	Серпухов	ООО Русский стандарт	104	2	\N	f	\N
NICKOLIK	malder1	Конев	Сергей	nickolik@mail.ru	Russia	Москва	DC	105	2	\N	f	\N
NICKSINUS	reinjpthj6333	синицын	никата	nicksinus@yandex.ru	Russia	москва	мгу	106	2	\N	f	\N
NICKST	Rfhfcm	Николай	Стецюк	NickSt@ya.ru	Ukraine	Сарны	Сарненская исследовательская с	107	2	\N	f	\N
NICKSTATIC	65doskid	Рассахан	Никита	rassahan@gmail.com	Russia	Москва	МГТУ Станкин	108	2	\N	f	\N
NICKTORG89	M@radona	Торговкин	Николай	nicktorg@yandex.ru	Russia	Якутск	Инститит мерзлотоведения им.П.	109	2	\N	f	\N
\.


--
-- Data for Name: restmail; Type: TABLE DATA; Schema: public; Owner: aisori
--

COPY public.restmail (eid, uid, tstmp, restored) FROM stdin;
\.


--
-- Data for Name: srsume; Type: TABLE DATA; Schema: public; Owner: aisori
--

COPY public.srsume (aliasid, timeid, tname) FROM stdin;
3	1	Метеорология
0	0	Blocked data
2	1	Сроки
2	2	Сутки
2	3	Месяц
\.


--
-- Data for Name: statfiles; Type: TABLE DATA; Schema: public; Owner: aisori
--

COPY public.statfiles (aliasid, stfileid, stfname) FROM stdin;
2	147	Станции_518.txt
2	148	Станции_517_SnMar.txt
2	149	Станции_(почва).txt
2	150	Станции_620.txt
2	151	Станции_600.txt
2	152	Станции_(почва_KS).txt
2	153	Станции_503.txt
2	154	Станции_13.txt
2	155	Станции_457.txt
2	156	Станции_518.txt
2	157	Станции_411.txt
2	158	Станции_23.txt
3	159	Станции_РФ.lst
\.


--
-- Data for Name: stations; Type: TABLE DATA; Schema: public; Owner: aisori
--

COPY public.stations (stid, stfileid, stline, wmoindex) FROM stdin;
126692	147	20046 Им.Э.Т.Кренкеля,ГМО	20046
126693	147	20069 Визе	20069
126694	147	20087 Голомянный	20087
126695	147	20107 Баренцбург	20107
126696	147	20289 Русский	20289
126697	147	20292 Им.Е.К.Федорова,ГМО	20292
126698	147	20476 Стерлегова	20476
126699	147	20667 Им.М.В.Попова	20667
126700	147	20674 Диксон	20674
126701	147	20744 Малые Кармакулы	20744
126702	147	20891 Хатанга	20891
126703	147	20946 Им.Е.К.Федорова	20946
126704	147	20982 Волочанка	20982
126705	147	21432 Котельный	21432
126706	147	21611 Терпяй-Тумса	21611
126707	147	21647 Шалаурова	21647
126708	147	21802 Саскылах	21802
126709	147	21824 Тикси	21824
126710	147	21908 Джалинда	21908
126711	147	21921 Кюсюр	21921
126712	147	21931 Юбилейная	21931
126713	147	21946 Чокурдах	21946
126714	147	21982 Остров Врангеля	21982
126715	147	22003 Вайда-Губа	22003
126716	147	22019 Полярное	22019
126717	147	22028 Териберка	22028
126718	147	22095 Колгуев Северный	22095
126719	147	22101 Янискоски	22101
126720	147	22113 Мурманск	22113
126721	147	22140 Святой Нос	22140
126722	147	22165 Канин Нос	22165
126723	147	22204 Ковдор	22204
126724	147	22217 Кандалакша	22217
126725	147	22235 Краснощелье	22235
126726	147	22249 Каневка	22249
126727	147	22271 Шойна	22271
126728	147	22292 Индига	22292
126729	147	22324 Умба	22324
126730	147	22355 Сосновец остров	22355
126731	147	22408 Калевала	22408
126732	147	22422 Гридино	22422
126733	147	22438 Жижгин	22438
126734	147	22471 Мезень	22471
126735	147	22520 Кемь-порт	22520
126736	147	22550 Архангельск	22550
126737	147	22583 Койнас	22583
126738	147	22602 Реболы	22602
126739	147	22619 Паданы	22619
126740	147	22641 Онега	22641
126741	147	22676 Сура	22676
126742	147	22768 Шенкурск	22768
126743	147	22802 Сортавала	22802
126744	147	22820 Петрозаводск	22820
126745	147	22837 Вытегра	22837
126746	147	22845 Каргополь	22845
126747	147	22854 Няндома	22854
126748	147	22887 Котлас	22887
126749	147	22892 Выборг	22892
126750	147	22907 Гогланд	22907
126751	147	22981 Великий Устюг	22981
126752	147	23022 Амдерма	23022
126753	147	23032 Марресаля	23032
126754	147	23058 Антипаюта	23058
126755	147	23074 Дудинка	23074
126756	147	23114 Мыс Константиновский	23114
126757	147	23205 Нарьян-Мар	23205
126758	147	23219 Хоседа-Хард	23219
126759	147	23220 Елецкая	23220
126760	147	23242 Новый Порт	23242
126761	147	23256 Тазовск	23256
126762	147	23274 Игарка	23274
126763	147	23324 Петрунь	23324
126764	147	23330 Салехард	23330
126765	147	23331 Ра-Из	23331
126766	147	23345 Ныда	23345
126767	147	23365 Сидоровск	23365
126768	147	23383 Агата	23383
126769	147	23405 Усть-Цильма	23405
126770	147	23412 Усть-Уса	23412
126771	147	23418 Печора	23418
126772	147	23445 Надым	23445
126773	147	23463 Янов Стан	23463
126774	147	23472 Туруханск	23472
126775	147	23514 Ираель	23514
126776	147	23527 Саранпауль	23527
126777	147	23552 Тарко-Сале	23552
126778	147	23589 Тутончаны	23589
126779	147	23631 Березово	23631
126780	147	23656 Халесовая	23656
126781	147	23662 Толька	23662
126782	147	23678 Верхнеимбатск	23678
126783	147	23707 Усть-Вымь	23707
126784	147	23711 Троицко-Печорское	23711
126785	147	23724 Няксимволь	23724
126786	147	23734 Октябрьское	23734
126787	147	23804 Сыктывкар	23804
126788	147	23867 Ларьяк	23867
126789	147	23884 Бор	23884
126790	147	23891 Байкит	23891
126791	147	23904 Койгородок	23904
126792	147	23914 Чердынь	23914
126793	147	23921 Ивдель	23921
126794	147	23933 Ханты-Мансийск	23933
126795	147	23946 Угут	23946
126796	147	23955 Александровское	23955
126797	147	23966 Ванжиль-Кынак	23966
126798	147	23986 Северо-Енисейский	23986
126799	147	24076 Депутатский	24076
126800	147	24105 Ессей	24105
126801	147	24125 Оленек	24125
126802	147	24136 Сухана	24136
126803	147	24143 Джарджан	24143
126804	147	24266 Верхоянск	24266
126805	147	24329 Шелагонцы	24329
126806	147	24343 Жиганск	24343
126807	147	24371 Усть-Чаркы	24371
126808	147	24382 Усть-Мома	24382
126809	147	24507 Тура	24507
126810	147	24538 Чумпурук	24538
126811	147	24606 Кислокан	24606
126812	147	24641 Вилюйск	24641
126813	147	24643 Хатырык-Хомо	24643
126814	147	24661 Сеген-Кюель	24661
126815	147	24671 Томпо	24671
126816	147	24679 Восточная	24679
126817	147	24688 Оймякон	24688
126818	147	24713 Наканно	24713
126819	147	24726 Мирный	24726
126820	147	24738 Сунтар	24738
126821	147	24763 Крест-Хальджай	24763
126822	147	24790 Сусуман	24790
126823	147	24802 Стрелка Чуня	24802
126824	147	24817 Ербогачен	24817
126825	147	24908 Ванавара	24908
126826	147	24923 Ленск	24923
126827	147	24933 Килеер	24933
126828	147	24944 Олекминск	24944
126829	147	24951 Исить	24951
126830	147	24959 Якутск	24959
126831	147	24966 Усть-Мая	24966
126832	147	24967 Тегюльтя	24967
126833	147	24982 Уега	24982
126834	147	25034 Амбарчик бухта	25034
126835	147	25042 Остров Айон	25042
126836	147	25062 Мыс Биллингс	25062
126837	147	25138 Островное	25138
126838	147	25173 Мыс Шмидта	25173
126839	147	25206 Среднеколымск	25206
126840	147	25248 Илирней	25248
126841	147	25282 Мыс Ванкарем	25282
126842	147	25325 Усть-Олой	25325
126843	147	25356 Эньмувеем	25356
126844	147	25372 Амгуэма,87км	25372
126845	147	25378 Эгвекинот	25378
126846	147	25399 Уэлен	25399
126847	147	25400 Зырянка	25400
126848	147	25428 Омолон	25428
126849	147	25503 Коркодон	25503
126850	147	25538 Верхне-Пенжино	25538
126851	147	25551 Марково	25551
126852	147	25563 Анадырь	25563
126853	147	25594 Бухта Провидения	25594
126854	147	25621 Кедон	25621
126855	147	25656 Березово	25656
126856	147	25677 Беринговская	25677
126857	147	25703 Сеймчан	25703
126858	147	25705 Среднекан	25705
126859	147	25744 Каменское	25744
126860	147	25767 Хатырка	25767
126861	147	25777 Гавриила бухта	25777
126862	147	25912 Ола	25912
126863	147	25913 Магадан	25913
126864	147	25916 Мыс Алевина	25916
126865	147	25922 Шелихово	25922
126866	147	25927 Брохово	25927
126867	147	25932 Тайгонос	25932
126868	147	25954 Корф	25954
126869	147	25956 Апука	25956
126870	147	26063 Санкт-Петербург	26063
126871	147	26069 Белогорка	26069
126872	147	26094 Тихвин	26094
126873	147	26157 Гдов	26157
126874	147	26258 Псков	26258
126875	147	26275 Старая Русса	26275
126876	147	26298 Бологое	26298
126877	147	26359 Пушкинские Горы	26359
126878	147	26477 Великие Луки	26477
126879	147	26479 Торопец	26479
126880	147	26499 Старица	26499
126881	147	26614 Советск	26614
126882	147	26701 Балтийск	26701
126883	147	26702 Калининград	26702
126884	147	26706 Железнодорожный	26706
126885	147	26781 Смоленск	26781
126886	147	26898 Брянск	26898
126887	147	26976 Красная Гора	26976
126888	147	26997 Трубчевск	26997
126889	147	27008 Бабаево	27008
126890	147	27037 Вологда,Прилуки	27037
126891	147	27051 Тотьма	27051
126892	147	27066 Никольск	27066
126893	147	27083 Опарино	27083
126894	147	27164 Кологрив	27164
126895	147	27208 Максатиха	27208
126896	147	27225 Рыбинск,ГМО	27225
126897	147	27277 Ветлуга	27277
126898	147	27296 Кумены	27296
126899	147	27333 Кострома	27333
126900	147	27385 Яранск	27385
126901	147	27425 Переславль-Залесский	27425
126902	147	27459 Нижний Новгород	27459
126903	147	27485 Йошкар-Ола	27485
126904	147	27509 Можайск	27509
126905	147	27595 Казань	27595
126906	147	27612 Москва, ВДНХ	27612
126907	147	27625 Коломна	27625
126908	147	27648 Елатьма	27648
126909	147	27665 Лукоянов	27665
126910	147	27675 Порецкое	27675
126911	147	27707 Сухиничи	27707
126912	147	27730 Рязань	27730
126913	147	27756 Краснослободск	27756
126914	147	27814 Плавск	27814
126915	147	27823 Павелец	27823
126916	147	27857 Земетчино	27857
126917	147	27872 Инза	27872
126918	147	27947 Тамбов	27947
126919	147	27962 Пенза	27962
126920	147	27995 Безенчук	27995
126921	147	28009 Кирс	28009
126922	147	28064 Леуши	28064
126923	147	28138 Бисер	28138
126924	147	28144 Верхотурье	28144
126925	147	28224 Пермь	28224
126926	147	28255 Туринск	28255
126927	147	28275 Тобольск	28275
126928	147	28312 Дебессы	28312
126929	147	28367 Тюмень	28367
126930	147	28402 Кильмезь	28402
126931	147	28411 Ижевск	28411
126932	147	28418 Сарапул	28418
126933	147	28419 Янаул	28419
126934	147	28434 Красноуфимск	28434
126935	147	28440 Екатеринбург	28440
126936	147	28445 Верхнее Дуброво	28445
126937	147	28493 Тара	28493
126938	147	28506 Елабуга	28506
126939	147	28537 Дуван	28537
126940	147	28552 Шадринск	28552
126941	147	28561 Памятная	28561
126942	147	28573 Ишим	28573
126943	147	28624 Кушнаренково	28624
126944	147	28630 Златоуст	28630
126945	147	28661 Курган	28661
126946	147	28666 Макушино	28666
126947	147	28698 Омск	28698
126948	147	28704 Чулпаново	28704
126949	147	28719 Аксаково	28719
126950	147	28722 Уфа	28722
126951	147	28748 Троицк	28748
126952	147	28802 Серноводск	28802
126953	147	28823 Тукан	28823
126954	147	28825 Стерлитамак	28825
126955	147	28833 Верхнеуральск	28833
126956	147	28895 Русская Поляна	28895
126957	147	29023 Напас	29023
126958	147	29111 Средний Васюган	29111
126959	147	29154 Усть-Озерное	29154
126960	147	29231 Колпашево	29231
126961	147	29263 Енисейск	29263
126962	147	29282 Богучаны	29282
126963	147	29313 Пудино	29313
126964	147	29328 Бакчар	29328
126965	147	29348 Первомайское	29348
126966	147	29379 Тасеево	29379
126967	147	29393 Червянка	29393
126968	147	29418 Северное	29418
126969	147	29430 Томск	29430
126970	147	29467 Ачинск, ж.д.ст.	29467
126971	147	29539 Болотное	29539
126972	147	29541 Тайга	29541
126973	147	29557 Тисуль	29557
126974	147	29570 Красноярск, оп.п.	29570
126975	147	29580 Солянка	29580
126976	147	29594 Тайшет	29594
126977	147	29605 Татарск	29605
126978	147	29612 Барабинск	29612
126979	147	29638 Огурцово	29638
126980	147	29645 Кемерово	29645
126981	147	29664 Светлолобово	29664
126982	147	29698 Нижнеудинск	29698
126983	147	29752 Ненастная	29752
126984	147	29789 Верхняя Гутара	29789
126985	147	29822 Камень-на-Оби	29822
126986	147	29838 Барнаул	29838
126987	147	29849 Кузедеево	29849
126988	147	29858 Неожиданный	29858
126989	147	29862 Абакан	29862
126990	147	29866 Минусинск	29866
126991	147	29915 Славгород	29915
126992	147	29923 Ребриха	29923
126993	147	29939 Бийск-Зональная	29939
126994	147	29974 Оленья Речка	29974
126995	147	29998 Орлик	29998
126996	147	30028 Ика	30028
126997	147	30054 Витим	30054
126998	147	30069 Перевоз	30069
126999	147	30089 Джикимда	30089
127000	147	30209 Ершово	30209
127001	147	30219 Максимово	30219
127002	147	30230 Киренск	30230
127003	147	30252 Мамакан	30252
127004	147	30253 Бодайбо	30253
127005	147	30309 Братск	30309
127006	147	30328 Орлинга	30328
127007	147	30337 Казачинское	30337
127008	147	30356 Таксимо	30356
127009	147	30372 Чара	30372
127010	147	30385 Усть-Нюкжа	30385
127011	147	30393 Чульман	30393
127012	147	30433 Нижнеангарск	30433
127013	147	30437 Карам	30437
127014	147	30469 Калакан	30469
127015	147	30471 Средний Калар	30471
127016	147	30484 Средняя Олекма	30484
127017	147	30493 Нагорный	30493
127018	147	30504 Тулун	30504
127019	147	30521 Жигалово	30521
127020	147	30536 Баргузинский запов-к	30536
127021	147	30554 Багдарин	30554
127022	147	30555 Троицкий Прииск	30555
127023	147	30565 Усть-Каренга	30565
127024	147	30612 Балаганск	30612
127025	147	30627 Баяндай	30627
127026	147	30632 Большой Ушканий о-в	30632
127027	147	30635 Усть-Баогузин	30635
127028	147	30636 Баргузин	30636
127029	147	30650 Романовка	30650
127030	147	30673 Могоча	30673
127031	147	30692 Сковородино	30692
127032	147	30695 Джалинда	30695
127033	147	30703 Инга	30703
127034	147	30710 Иркутск, обсерв.	30710
127035	147	30716 Хомутово	30716
127036	147	30727 Большое Голоустное	30727
127037	147	30745 Сосново-Озерское	30745
127038	147	30758 Чита	30758
127039	147	30777 Сретенск	30777
127040	147	30811 Тунка	30811
127041	147	30815 Хамар-Дабан	30815
127042	147	30822 Бабушкин	30822
127043	147	30823 Улан-Удэ	30823
127044	147	30825 Иволгинск	30825
127045	147	30844 Хилок	30844
127046	147	30859 Агинское	30859
127047	147	30879 Нерчинский з-д	30879
127048	147	30915 Цакир	30915
127049	147	30925 Кяхта	30925
127050	147	30935 Красный Чикой	30935
127051	147	30949 Кыра	30949
127052	147	30954 Мангут	30954
127053	147	30965 Борзя	30965
127054	147	31004 Алдан	31004
127055	147	31026 Учур	31026
127056	147	31062 Югаренок	31062
127057	147	31088 Охотск	31088
127058	147	31092 Талон	31092
127059	147	31102 Канку	31102
127060	147	31137 Токо	31137
127061	147	31152 Нелькан	31152
127062	147	31168 Аян	31168
127063	147	31174 Большой Шантар	31174
127064	147	31235 Джана	31235
127065	147	31253 Бомнак	31253
127066	147	31285 Удское	31285
127067	147	31329 Экимчан	31329
127068	147	31362 Литке	31362
127069	147	31369 Николаевск-на-Амуре	31369
127070	147	31371 Черняево	31371
127071	147	31388 Норск	31388
127072	147	31416 Им. Полины Осипенко	31416
127073	147	31436 Джаоре	31436
127074	147	31439 Богородское	31439
127075	147	31443 Мазаново	31443
127076	147	31459 Верхняя Томь	31459
127077	147	31478 Софийский Прииск	31478
127078	147	31510 Благовещенск	31510
127079	147	31532 Чекунда	31532
127080	147	31538 Сутур	31538
127081	147	31562 Нижнетамбовское	31562
127082	147	31586 Константиновка	31586
127083	147	31594 Архара	31594
127084	147	31677 Солекуль	31677
127085	147	31707 Екатерино-Никольское	31707
127086	147	31725 Смидович	31725
127087	147	31733 Елабуга	31733
127088	147	31735 Хабаровск	31735
127089	147	31770 Советская Гавань	31770
127090	147	31788 Лермонтовка	31788
127091	147	31829 Золотой	31829
127092	147	31845 Красный Яр	31845
127093	147	31873 Дальнереченск	31873
127094	147	31895 Мельничное	31895
127095	147	31909 Терней	31909
127096	147	31915 Пограничный	31915
127097	147	31931 Свиягино	31931
127098	147	31959 Рудная Пристань	31959
127099	147	31960 Владивосток	31960
127100	147	31961 Тимирязевский	31961
127101	147	31969 Посьет	31969
127102	147	31989 Преображение	31989
127103	147	32014 Москальво	32014
127104	147	32027 Погиби	32027
127105	147	32053 Ноглики	32053
127106	147	32061 Александровск-Сахал.	32061
127107	147	32071 Тымовское	32071
127108	147	32076 Пограничное	32076
127109	147	32088 Углегорск	32088
127110	147	32098 Поронайск	32098
127111	147	32099 Мыс Терпения	32099
127112	147	32121 Ильинский	32121
127113	147	32145 Невельск	32145
127114	147	32149 Мыс Крильон	32149
127115	147	32150 Южно-Сахалинск	32150
127116	147	32165 Южно-Курильск	32165
127117	147	32174 Курильск	32174
127118	147	32213 Мыс Лопатка	32213
127119	147	32246 Оссора	32246
127120	147	32252 Усть-Воямполка	32252
127121	147	32287 Усть-Хайрюзово	32287
127122	147	32363 Эссо	32363
127123	147	32389 Ключи	32389
127124	147	32411 Ича	32411
127125	147	32447 Долиновка	32447
127126	147	32477 Соболево	32477
127127	147	32509 Семячик	32509
127128	147	32539 Начики	32539
127129	147	32547 Сосновка	32547
127130	147	32562 Большерецк	32562
127131	147	32583 Петропавловск-Камчатск.	32583
127132	147	32586 Петропавловский маяк	32586
127133	147	32618 Остров Беринга	32618
127134	147	33166 Рыльск	33166
127135	147	34003 Поныри	34003
127136	147	34009 Курск	34009
127137	147	34026 Конь-Колодезь	34026
127138	147	34059 Росташи	34059
127139	147	34110 Богородицкое-Фенино	34110
127140	147	34123 Воронеж	34123
127141	147	34139 Каменная Степь	34139
127142	147	34152 Балашов	34152
127143	147	34163 Октябрьский городок	34163
127144	147	34172 Саратов	34172
127145	147	34186 Ершов	34186
127146	147	34202 Готня	34202
127147	147	34240 Урюпинск	34240
127148	147	34247 Калач	34247
127149	147	34289 Новоузенск	34289
127150	147	34321 Валуйки	34321
127151	147	34356 Фролово	34356
127152	147	34391 Александров Гай	34391
127153	147	34432 Чертково	34432
127154	147	34476 Эльтон	34476
127155	147	34561 Волгоград	34561
127156	147	34579 Верхний Баскунчак	34579
127157	147	34646 Цимлянск(Волгодонск)	34646
127158	147	34720 Таганрог	34720
127159	147	34730 Ростов-на-Дону	34730
127160	147	34740 Гигант	34740
127161	147	34759 Ремонтное	34759
127162	147	34824 Приморско-Ахтарск	34824
127163	147	34861 Элиста	34861
127164	147	34866 Яшкуль	34866
127165	147	34880 Астрахань	34880
127166	147	34927 Краснодар, Круглик	34927
127167	147	34949 Ставрополь, АМСГ	34949
127168	147	34984 Лагань	34984
127169	147	35007 Перелюб	35007
127170	147	35011 Сорочинск	35011
127171	147	35026 Зилаир	35026
127172	147	35041 Бреды	35041
127173	147	35121 Оренбург	35121
127174	147	35127 Акбулак	35127
127175	147	35233 Домбаровский	35233
127176	147	36034 Рубцовск	36034
127177	147	36038 Змеиногорск	36038
127178	147	36045 Солонешное	36045
127179	147	36055 Кызыл-Озек	36055
127180	147	36064 Яйлю	36064
127181	147	36096 Кызыл	36096
127182	147	36099 Сосновка	36099
127183	147	36103 Тоора-Хем	36103
127184	147	36229 Усть-Кокса	36229
127185	147	36259 Кош-Агач	36259
127186	147	36278 Мугур-Аксы	36278
127187	147	36307 Эрзин	36307
127188	147	36442 Кара-Тюрек	36442
127189	147	37001 Анапа,МГ	37001
127190	147	37018 Туапсе	37018
127191	147	37031 Армавир	37031
127192	147	37054 Минеральные Воды	37054
127193	147	37061 Буденновск	37061
127194	147	37075 Южно-Сухокумск	37075
127195	147	37089 Тюлений остров	37089
127196	147	37099 Сочи	37099
127197	147	37107 Красная Поляна	37107
127198	147	37112 Зеленчукская	37112
127199	147	37123 Кисловодск	37123
127200	147	37126 Шаджатмаз	37126
127201	147	37196 Клухорский перевал	37196
127202	147	37228 Владикавказ	37228
127203	147	37235 Грозный	37235
127204	147	37244 Гудермес	37244
127205	147	37461 Сулак,высокогорная	37461
127206	147	37470 Дербент	37470
127207	147	37471 Буйнакск	37471
127208	147	37472 Махачкала	37472
127209	147	37663 Ахты	37663
127210	148	21802 Саскылах	21802
127211	148	22113 Мурманск	22113
127212	148	22127 Ловозеро	22127
127213	148	22165 Канин Нос	22165
127214	148	22271 Шойна	22271
127215	148	22282 Мыс Микулкин	22282
127216	148	22292 Индига	22292
127217	148	22365 Абрамовский Маяк	22365
127218	148	22383 Нижняя Пеша	22383
127219	148	22408 Калевала	22408
127220	148	22422 Гридино	22422
127221	148	22438 Жижгин	22438
127222	148	22471 Мезень	22471
127223	148	22511 Юшкозеро	22511
127224	148	22529 Колежма	22529
127225	148	22541 Унский маяк	22541
127226	148	22551 Мудьюг остров	22551
127227	148	22559 Холмогоры	22559
127228	148	22563 Пинега	22563
127229	148	22573 Лешуконское,АМСГ	22573
127230	148	22583 Койнас	22583
127231	148	22602 Реболы	22602
127232	148	22619 Паданы	22619
127233	148	22621 Сегежа	22621
127234	148	22641 Онега	22641
127235	148	22648 Турчасово	22648
127236	148	22656 Емецк	22656
127237	148	22676 Сура	22676
127238	148	22686 Вендинга	22686
127239	148	22695 Кослан,АМСГ	22695
127240	148	22721 Медвежьегорск	22721
127241	148	22727 Кондопога	22727
127242	148	22762 Двинской Березник	22762
127243	148	22768 Шенкурск	22768
127244	148	22778 Верхняя Тойма,АМСГ	22778
127245	148	22798 Яренск	22798
127246	148	22802 Сортавала	22802
127247	148	22820 Петрозаводск	22820
127248	148	22831 Пудож,АМСГ	22831
127249	148	22837 Вытегра	22837
127250	148	22845 Каргополь	22845
127251	148	22854 Няндома	22854
127252	148	22867 Вельск	22867
127253	148	22887 Котлас	22887
127254	148	22892 Выборг	22892
127255	148	22912 Олонец	22912
127256	148	22925 Винницы	22925
127257	148	22939 Белозерск	22939
127258	148	22954 Вожега	22954
127259	148	22981 Великий Устюг	22981
127260	148	22996 Объячево	22996
127261	148	23078 Норильск (Тайм.ЦГМС)	23078
127262	148	23207 Коткино	23207
127263	148	23219 Хоседа-Хард	23219
127264	148	23226 Воркута	23226
127265	148	23256 Тазовское	23256
127266	148	23274 Игарка	23274
127267	148	23305 Окунев Нос	23305
127268	148	23324 Петрунь	23324
127269	148	23330 Салехард	23330
127270	148	23383 Агата	23383
127271	148	23405 Усть-Цильма	23405
127272	148	23412 Усть-Уса	23412
127273	148	23418 Печора	23418
127274	148	23445 Надым	23445
127275	148	23472 Туруханск	23472
127276	148	23518 Усть-Щугор	23518
127277	148	23527 Саранпауль	23527
127278	148	23552 Тарко-Сале,ОГМС	23552
127279	148	23606 Ухта	23606
127280	148	23625 Сосьва	23625
127281	148	23631 Березово	23631
127282	148	23662 Толька	23662
127283	148	23678 Верхнеимбатск	23678
127284	148	23701 Весляна	23701
127285	148	23711 Троицко-Печорское	23711
127286	148	23734 Октябрьское	23734
127287	148	23803 Усть-Кулом	23803
127288	148	23867 Ларьяк	23867
127289	148	23884 Бор	23884
127290	148	23929 Шаим	23929
127291	148	23933 Ханты-Мансийск	23933
127292	148	23955 Александровское	23955
127293	148	23966 Ванжиль-Кынак	23966
127294	148	23973 Ворогово	23973
127295	148	23975 Сым	23975
127296	148	23986 Северо-Енисейский	23986
127297	148	23987 Ярцево	23987
127298	148	24136 Сухана	24136
127299	148	24266 Верхоянск	24266
127300	148	24343 Жиганск	24343
127301	148	24382 Усть-Мома	24382
127302	148	24507 Тура	24507
127303	148	24585 Нера,АМСГ	24585
127304	148	24606 Кислокан	24606
127305	148	24641 Вилюйск	24641
127306	148	24652 Сангары,АМСГ	24652
127307	148	24656 Батамай	24656
127308	148	24661 Сеген-Кюель	24661
127309	148	24671 Томпо	24671
127310	148	24688 Оймякон	24688
127311	148	24713 Наканно	24713
127312	148	24724 Чернышевский	24724
127313	148	24738 Сунтар	24738
127314	148	24763 Крест-Хальджай	24763
127315	148	24768 Чурапча	24768
127316	148	24790 Сусуман	24790
127317	148	24856 Покровск	24856
127318	148	24891 Кулу	24891
127319	148	24908 Ванавара	24908
127320	148	24918 Преображенка	24918
127321	148	24923 Ленск	24923
127322	148	24944 Олекминск	24944
127323	148	24951 Исить	24951
127324	148	24959 Якутск	24959
127325	148	24962 Амга,АМСГ	24962
127326	148	24966 Усть-Мая	24966
127327	148	25138 Островное	25138
127328	148	25206 Среднеколымск	25206
127329	148	25325 Усть-Олой	25325
127330	148	25356 Эньмувеем	25356
127331	148	25428 Омолон	25428
127332	148	25503 Коркодон	25503
127333	148	25526 Кегали	25526
127334	148	25563 Анадырь	25563
127335	148	25705 Среднекан	25705
127336	148	25715 Омсукчан	25715
127337	148	26059 Кингисепп	26059
127338	148	26069 Белогорка	26069
127339	148	26094 Тихвин	26094
127340	148	26099 Ефимовская	26099
127341	148	26157 Гдов	26157
127342	148	26179 Новгород	26179
127343	148	26264 Струги Красные	26264
127344	148	26268 Дно	26268
127345	148	26275 Старая Русса	26275
127346	148	26285 Крестцы	26285
127347	148	26298 Бологое	26298
127348	148	26359 Пушкинские Горы	26359
127349	148	26378 Холм	26378
127350	148	26381 Демянск	26381
127351	148	26389 Осташков	26389
127352	148	26393 Вышний Волочек	26393
127353	148	26477 Великие Луки	26477
127354	148	26499 Старица	26499
127355	148	26578 Велиж	26578
127356	148	26695 Вязьма	26695
127357	148	26795 Спас-Деменск	26795
127358	148	26882 Рославль	26882
127359	148	26894 Жуковка	26894
127360	148	26896 Жиздра	26896
127361	148	26898 Брянск	26898
127362	148	26976 Красная Гора	26976
127363	148	26997 Трубчевск	26997
127364	148	27008 Бабаево	27008
127365	148	27026 Коробово	27026
127366	148	27051 Тотьма	27051
127367	148	27066 Никольск	27066
127368	148	27083 Опарино	27083
127369	148	27097 Мураши	27097
127370	148	27108 Охоны	27108
127371	148	27164 Кологрив	27164
127372	148	27208 Максатиха	27208
127373	148	27242 Буй	27242
127374	148	27243 Галич	27243
127375	148	27252 Николо-Полома	27252
127376	148	27271 Шарья	27271
127377	148	27277 Ветлуга	27277
127378	148	27281 Шабалино	27281
127379	148	27283 Котельнич	27283
127380	148	27316 Кашин	27316
127381	148	27321 Углич	27321
127382	148	27329 Ростов	27329
127383	148	27331 Ярославль	27331
127384	148	27333 Кострома	27333
127385	148	27346 Кинешма	27346
127386	148	27355 Юрьевец	27355
127387	148	27369 Красные Баки	27369
127388	148	27373 Шахунья	27373
127389	148	27393 Нолинск	27393
127390	148	27402 Тверь	27402
127391	148	27417 Клин	27417
127392	148	27428 Александров	27428
127393	148	27441 Шуя	27441
127394	148	27462 Семенов	27462
127395	148	27479 Козьмодемьянск	27479
127396	148	27480 Санчурск	27480
127397	148	27491 Новый Торьял	27491
127398	148	27502 Волоколамск	27502
127399	148	27507 Гагарин	27507
127400	148	27509 Можайск	27509
127401	148	27511 Ново-Иерусалим	27511
127402	148	27523 Павловский Посад	27523
127403	148	27532 Владимир,АМСГ	27532
127404	148	27549 Муром	27549
127405	148	27577 Сергач	27577
127406	148	27581 Чебоксары	27581
127407	148	27587 Канаш	27587
127408	148	27606 Малоярославец	27606
127409	148	27611 Наро-Фоминск	27611
127410	148	27618 Серпухов	27618
127411	148	27625 Коломна	27625
127412	148	27643 Выкса	27643
127413	148	27648 Елатьма	27648
127414	148	27653 Арзамас	27653
127415	148	27665 Лукоянов	27665
127416	148	27675 Порецкое	27675
127417	148	27679 Алатырь	27679
127418	148	27697 Тетюши	27697
127419	148	27703 Калуга,Грабцево	27703
127420	148	27707 Сухиничи	27707
127421	148	27719 Тула	27719
127422	148	27729 Михайлов	27729
127423	148	27736 Шилово	27736
127424	148	27745 Сасово	27745
127425	148	27752 Темников	27752
127426	148	27758 Торбеево	27758
127427	148	27760 Саранск	27760
127428	148	27799 Димитровград	27799
127429	148	27817 Мценск	27817
127430	148	27821 Узловая	27821
127431	148	27823 Павелец	27823
127432	148	27835 Ряжск	27835
127433	148	27848 Моршанск	27848
127434	148	27858 Пачелма	27858
127435	148	27891 Сенгилей	27891
127436	148	27894 Новодевичье	27894
127437	148	27906 Орел	27906
127438	148	27921 Ефремов	27921
127439	148	27928 Елец	27928
127440	148	27930 Липецк	27930
127441	148	27935 Мичуринск	27935
127442	148	27957 Кирсанов	27957
127443	148	27962 Пенза,ЦГМС	27962
127444	148	27995 Безенчук	27995
127445	148	28033 Карпинск	28033
127446	148	28224 Пермь	28224
127447	148	28367 Тюмень, АМСГ	28367
127448	148	28383 Тевриз	28383
127449	148	28409 Можга	28409
127450	148	28418 Сарапул	28418
127451	148	28465 Ялуторовск	28465
127452	148	28491 Большие Уки	28491
127453	148	28493 Тара, ОГМС	28493
127454	148	28502 Вятские Поляны	28502
127455	148	28517 Мензелинск,АМСГ	28517
127456	148	28573 Ишим	28573
127457	148	28586 Тюкалинск	28586
127458	148	28593 Большеречье	28593
127459	148	28602 Чистополь,АМСГ	28602
127460	148	28612 Муслюмово	28612
127461	148	28645 Челябинск,город	28645
127462	148	28698 Омск,ОГМС	28698
127463	148	28704 Чулпаново	28704
127464	148	28705 Челно-Вершины	28705
127465	148	28711 Бугульма	28711
127466	148	28719 Аксаково	28719
127467	148	28748 Троицк	28748
127468	148	28786 Полтавка	28786
127469	148	28797 Одесское	28797
127470	148	28799 Черлак	28799
127471	148	28806 Бугуруслан	28806
127472	148	28903 Боровое лесничество	28903
127473	148	28908 Авангард,зерносовхоз	28908
127474	148	29023 Напас	29023
127475	148	29068 Назимово	29068
127476	148	29111 Средний Васюган	29111
127477	148	29128 Парабель	29128
127478	148	29209 Майск	29209
127479	148	29231 Колпашево	29231
127480	148	29253 Лосиноборское	29253
127481	148	29282 Богучаны	29282
127482	148	29313 Пудино	29313
127483	148	29328 Бакчар	29328
127484	148	29332 Молчаново	29332
127485	148	29348 Первомайское	29348
127486	148	29363 Пировское	29363
127487	148	29393 Червянка	29393
127488	148	29405 Кыштовка,АМСГ	29405
127489	148	29418 Северное	29418
127490	148	29430 Томск	29430
127491	148	29456 Тюхтет	29456
127492	148	29464 Большой Улуй	29464
127493	148	29471 Большая Мурта	29471
127494	148	29481 Дзержинское	29481
127495	148	29498 Шиткино	29498
127496	148	29524 Крещенка	29524
127497	148	29541 Тайга	29541
127498	148	29551 Мариинск,ОГМС	29551
127499	148	29552 Тяжин	29552
127500	148	29553 Боготол	29553
127501	148	29557 Тисуль	29557
127502	148	29563 Кача	29563
127503	148	29566 Шумиха	29566
127504	148	29570 Красноярск,оп.п.	29570
127505	148	29576 Уяр	29576
127506	148	29587 Ирбейское	29587
127507	148	29594 Тайшет	29594
127508	148	29602 Чаны	29602
127509	148	29605 Татарск	29605
127510	148	29612 Барабинск	29612
127511	148	29613 Убинское	29613
127512	148	29625 Чулым	29625
127513	148	29626 Коченево	29626
127514	148	29631 Колывань	29631
127515	148	29632 Мошково	29632
127516	148	29636 Тогучин	29636
127517	148	29638 Огурцово	29638
127518	148	29649 Крапивино	29649
127519	148	29653 Ужур,ст.ж.д.	29653
127520	148	29654 Центральный рудник	29654
127521	148	29675 Колба	29675
127522	148	29676 Агинское	29676
127523	148	29706 Купино	29706
127524	148	29712 Здвинск	29712
127525	148	29724 Кочки	29724
127526	148	29726 Ордынское	29726
127527	148	29735 Посевная	29735
127528	148	29736 Маслянино	29736
127529	148	29752 Ненастная	29752
127530	148	29756 Шира,ж.д.	29756
127531	148	29759 Коммунар	29759
127532	148	29766 Идринское	29766
127533	148	29813 Краснозерск,АМСГ	29813
127534	148	29814 Карасук	29814
127535	148	29816 Хабары	29816
127536	148	29822 Камень-на-Оби	29822
127537	148	29827 Баево	29827
127538	148	29832 Тальменка	29832
127539	148	29838 Барнаул	29838
127540	148	29848 Тогул	29848
127541	148	29849 Кузедеево	29849
127542	148	29862 Абакан (Хак. ЦГМС)	29862
127543	148	29864 Уйбат,ж.д.	29864
127544	148	29866 Минусинск	29866
127545	148	29869 Ермаковское	29869
127546	148	29915 Славгород	29915
127547	148	29923 Ребриха	29923
127548	148	29937 Алейская,ж.д.ст.	29937
127549	148	29939 Бийск-Зональная	29939
127550	148	29946 Кондома	29946
127551	148	29956 Таштып	29956
127552	148	29962 Бея	29962
127553	148	29974 Оленья Речка	29974
127554	148	30054 Витим	30054
127555	148	30089 Джикимда	30089
127556	148	30138 Чечуйск	30138
127557	148	30157 Мама	30157
127558	148	30229 Верхне-Марково	30229
127559	148	30230 Киренск	30230
127560	148	30252 Мамакан	30252
127561	148	30328 Орлинга	30328
127562	148	30337 Казачинское	30337
127563	148	30372 Чара	30372
127564	148	30385 Усть-Нюкжа	30385
127565	148	30393 Чульман	30393
127566	148	30433 Нижнеангарск	30433
127567	148	30455 Уакит	30455
127568	148	30457 Баунт	30457
127569	148	30469 Калакан	30469
127570	148	30471 Средний Калар	30471
127571	148	30493 Нагорный	30493
127572	148	30499 Тында	30499
127573	148	30504 Тулун	30504
127574	148	30507 Икей	30507
127575	148	30514 Усть-Уда	30514
127576	148	30537 Солнечная	30537
127577	148	30554 Багдарин	30554
127578	148	30555 Троицкий прииск	30555
127579	148	30576 Тупик	30576
127580	148	30603 Зима	30603
127581	148	30606 Залари	30606
127582	148	30612 Балаганск	30612
127583	148	30618 Бохан	30618
127584	148	30627 Баяндай	30627
127585	148	30635 Усть-Баргузин	30635
127586	148	30636 Баргузин	30636
127587	148	30650 Романовка,АМСГ	30650
127588	148	30664 Тункогочен	30664
127589	148	30673 Могоча	30673
127590	148	30682 Амазар	30682
127591	148	30683 Ерофей Павлович	30683
127592	148	30686 Игнашино	30686
127593	148	30692 Сковородино	30692
127594	148	30695 Джалинда	30695
127595	148	30729 Кабанск	30729
127596	148	30731 Горячинск	30731
127597	148	30739 Хоринск	30739
127598	148	30741 Замакта	30741
127599	148	30745 Сосново-Озерское	30745
127600	148	30758 Чита	30758
127601	148	30764 Усугли	30764
127602	148	30765 Зюльзя	30765
127603	148	30766 Чернышевск	30766
127604	148	30768 Нерчинск,АМСГ	30768
127605	148	30772 Усть-Карск	30772
127606	148	30777 Сретенск	30777
127607	148	30811 Тунка	30811
127608	148	30823 Улан-Удэ,город	30823
127609	148	30829 Новоселенгинск	30829
127610	148	30844 Хилок	30844
127611	148	30846 Улеты	30846
127612	148	30853 Карымская	30853
127613	148	30859 Агинское	30859
127614	148	30862 Шилка	30862
127615	148	30874 Шелопугино	30874
127616	148	30879 Нерчинский з-д	30879
127617	148	30925 Кяхта	30925
127618	148	30934 Бичура	30934
127619	148	30935 Красный Чикой	30935
127620	148	30938 Менза	30938
127621	148	30949 Кыра	30949
127622	148	30957 Акша	30957
127623	148	30961 Оловянная	30961
127624	148	30965 Борзя	30965
127625	148	30967 Соловьевск	30967
127626	148	30971 Александровский з-д	30971
127627	148	30972 Доно	30972
127628	148	30975 Приаргунск	30975
127629	148	30978 Кайластуй	30978
127630	148	31005 Томмот	31005
127631	148	31026 Учур	31026
127632	148	31062 Югаренок	31062
127633	148	31088 Охотск	31088
127634	148	31152 Нелькан	31152
127635	148	31286 Чумикан	31286
127636	148	31329 Экимчан	31329
127637	148	31373 Октябрьский Прииск	31373
127638	148	31392 Стойба	31392
127639	148	31418 Веселая горка	31418
127640	148	31439 Богородское	31439
127641	148	31443 Мазаново	31443
127642	148	31445 Свободный	31445
127643	148	31474 Усть-Умальта	31474
127644	148	31478 Софийский прииск	31478
127645	148	31489 Горин	31489
127646	148	31521 Братолюбовка	31521
127647	148	31527 Завитая	31527
127648	148	31583 Малиновка	31583
127649	148	31587 Поярково	31587
127650	148	31594 Архара	31594
127651	148	31624 Урми	31624
127652	148	31655 Троицкое	31655
127653	148	31733 Елабуга	31733
127654	148	31788 Лермонтовка	31788
127655	148	31801 Гвасюги	31801
127656	148	31825 Агзу	31825
127657	148	31845 Красный Яр	31845
127658	148	31873 Дальнереченск	31873
127659	148	31884 Малиново	31884
127660	148	31909 Терней	31909
127661	148	31921 Астраханка	31921
127662	148	31924 Хороль	31924
127663	148	31931 Свиягино	31931
127664	148	31935 Яковлевка	31935
127665	148	31939 Чугуевка	31939
127666	148	31961 Тимирязевский(Приморская	31961
127667	148	31969 Посьет	31969
127668	148	31981 Анучино	31981
127669	148	31987 Партизанск	31987
127670	148	32053 Ноглики	32053
127671	148	32061 Александровск-Сахал.	32061
127672	148	32071 Тымовское	32071
127673	148	32077 Онор	32077
127674	148	32133 Долинск	32133
127675	148	32150 Южно-Сахалинск	32150
127676	148	32158 Корсаков	32158
127677	148	32287 Усть-Хайрюзово	32287
127678	148	32408 Усть-Камчатск	32408
127679	148	32477 Соболево	32477
127680	148	32539 Начики	32539
127681	148	32594 Озерная	32594
127682	148	34003 Поныри	34003
127683	148	34013 Ливны	34013
127684	148	34056 Ртищево	34056
127685	148	34063 Петровск	34063
127686	148	34069 Аткарск	34069
127687	148	34072 Карабулак	34072
127688	148	34098 Пугачев	34098
127689	148	34109 Обоянь	34109
127690	148	34116 Старый Оскол	34116
127691	148	34146 Борисоглебск	34146
127692	148	34152 Балашов	34152
127693	148	34163 Октябрьский Городок	34163
127694	148	34186 Ершов	34186
127695	148	34199 Озинки	34199
127696	148	34202 Готня	34202
127697	148	34213 Новый Оскол	34213
127698	148	34231 Лиски	34231
127699	148	34238 Анна	34238
127700	148	34247 Калач	34247
127701	148	34321 Валуйки	34321
127702	148	34336 Богучар	34336
127703	148	34391 Александров Гай	34391
127704	148	34432 Чертково	34432
127705	148	34740 Гигант	34740
127706	148	35001 Большая Глушица	35001
127707	148	35011 Сорочинск	35011
127708	148	35015 Новосергиевка	35015
127709	148	35037 Акъяр	35037
127710	148	35121 Оренбург ЦГМС	35121
127711	148	35125 Беляевка	35125
127712	148	35127 Акбулак	35127
127713	148	35138 Орск	35138
127714	148	36020 Родино	36020
127715	148	36021 Ключи	36021
127716	148	36022 Волчиха	36022
127717	148	36034 Рубцовск	36034
127718	148	36038 Змеиногорск	36038
127719	148	36058 Чемал	36058
127720	148	36061 Турочак	36061
127721	148	36064 Яйлю	36064
127722	148	36229 Усть-Кокса	36229
127723	148	36231 Онгудай	36231
127724	148	36259 Кош-Агач	36259
127725	148	36307 Эрзин	36307
127726	148	37126 Шаджатмаз	37126
127727	149	20069\tО.Визе	20069
127728	149	20087\tО.Голомянный	20087
127729	149	20292\tИм.Е.К.Федорова	20292
127730	149	20674\tО.Диксон	20674
127731	149	21921\tКюсюр	21921
127732	149	22100 Верховье р.Лотты	22100
127733	149	22106\tПадун	22106
127734	149	22213\tАпатиты	22213
127735	149	22217\tКандалакша	22217
127736	149	22235\tКраснощелье	22235
127737	149	22249\tКаневка	22249
127738	149	22292\tИндига	22292
127739	149	22349\tПялица	22349
127740	149	22408\tКалевала	22408
127741	149	22438\tЖижгин,остров	22438
127742	149	22471\tМезень	22471
127743	149	22550\tАрхангельск	22550
127744	149	22559\tХолмогоры	22559
127745	149	22563\tПинега	22563
127746	149	22583\tКойнас	22583
127747	149	22602\tРеболы	22602
127748	149	22621\tСегежа	22621
127749	149	22641\tОнега	22641
127750	149	22676\tСура	22676
127751	149	22721\tМедвежьегорск	22721
127752	149	22768\tШенкурск	22768
127753	149	22778\tВерхняя Тойма, АМСГ	22778
127754	149	22798\tЯренск	22798
127755	149	22802\tСортавала	22802
127756	149	22820\tПетрозаводск	22820
127757	149	22837\tВытегра	22837
127758	149	22845\tКаргополь	22845
127759	149	22867\tВельск	22867
127760	149	22912\tОлонец	22912
127761	149	22951\tКоноша	22951
127762	149	22981\tВеликий Устюг	22981
127763	149	22983\tЛальск	22983
127764	149	22996\tОбъячево	22996
127765	149	23078\tНорильск (Тайм.ЦГМС)	23078
127766	149	23205\tНарьян-Мар	23205
127767	149	23207\tКоткино	23207
127768	149	23219\tХоседа-Хард	23219
127769	149	23274\tИгарка	23274
127770	149	23324\tПетрунь	23324
127771	149	23383\tАгата	23383
127772	149	23405\tУсть-Цильма	23405
127773	149	23412\tУсть-Уса	23412
127774	149	23418\tПечора	23418
127775	149	23463\tЯнов Стан	23463
127776	149	23472\tТуруханск	23472
127777	149	23518\tУсть-Щугор	23518
127778	149	23527\tСаранпауль	23527
127779	149	23552\tТарко-Сале	23552
127780	149	23578\tВерещагино	23578
127781	149	23606\tУхта	23606
127782	149	23625\tСосьва	23625
127783	149	23631\tБерезово	23631
127784	149	23656\tХалесовая	23656
127785	149	23662\tТолька	23662
127786	149	23678\tВерхнеимбатск	23678
127787	149	23711\tТроицко-Печорское	23711
127788	149	23724\tНяксимволь	23724
127789	149	23734\tОктябрьское	23734
127790	149	23748\tКогалым	23748
127791	149	23788\tКузьмовка	23788
127792	149	23804\tСыктывкар	23804
127793	149	23823\tВоньеган	23823
127794	149	23847\tСытомино	23847
127795	149	23849\tСургут,АМСГ	23849
127796	149	23862\tКорлики	23862
127797	149	23867\tЛарьяк	23867
127798	149	23884\tБор	23884
127799	149	23891\tБайкит	23891
127800	149	23921\tИвдель	23921
127801	149	23929\tШаим	23929
127802	149	23933\tХанты-Мансийск	23933
127803	149	23939\tАлтай	23939
127804	149	23955\tАлександровское	23955
127805	149	23982\tВельмо	23982
127806	149	23986\tСеверо-Енисейский	23986
127807	149	23987\tЯрцево	23987
127808	149	24125\tОленек	24125
127809	149	24136\tСухана	24136
127810	149	24143\tДжарджан	24143
127811	149	24266\tВерхоянск	24266
127812	149	24343\tЖиганск	24343
127813	149	24382\tУсть-Мома	24382
127814	149	24507\tТура	24507
127815	149	24606\tКислокан	24606
127816	149	24639\tНюрба	24639
127817	149	24641\tВилюйск	24641
127818	149	24652\tСангары,	24652
127819	149	24688\tОймякон	24688
127820	149	24738\tСунтар	24738
127821	149	24768\tЧурапча	24768
127822	149	24790\tСусуман	24790
127823	149	24802\tСтрелка Чуня	24802
127824	149	24817\tЕрбогачен	24817
127825	149	24856\tПокровск	24856
127826	149	24908\tВанавара	24908
127827	149	24923\tЛенск	24923
127828	149	24944\tОлекминск	24944
127829	149	24951\tИсить	24951
127830	149	24959\tЯкутск	24959
127831	149	24962\tАмга,АМСГ	24962
127832	149	24966\tУсть-Мая	24966
127833	149	25138\tОстровное	25138
127834	149	25206\tСреднеколымск	25206
127835	149	25400\tЗырянка	25400
127836	149	25428\tОмолон	25428
127837	149	25551\tМарково	25551
127838	149	25705\tСреднекан	25705
127839	149	25913\tМагадан, Нагаева бухта	25913
127840	149	26063\tСанкт-Петербург	26063
127841	149	26069\tБелогорка	26069
127842	149	26094\tТихвин	26094
127843	149	26099\tЕфимовская	26099
127844	149	26167\tНиколаевское	26167
127845	149	26258\tПсков	26258
127846	149	26291\tБоровичи	26291
127847	149	26298\tБологое	26298
127848	149	26359\tПушкинские Горы	26359
127849	149	26389\tОсташков	26389
127850	149	26393\tВышний Волочек	26393
127851	149	26477\tВеликие Луки	26477
127852	149	26479\tТоропец	26479
127853	149	26585\tБелый	26585
127854	149	26781\tСмоленск	26781
127855	149	26795\tСпас-Деменск	26795
127856	149	26898\tБрянск, АМСГ	26898
127857	149	27037\tВологда, Прилуки	27037
127858	149	27051\tТотьма	27051
127859	149	27066\tНикольск	27066
127860	149	27113\tЧереповец	27113
127861	149	27164\tКологрив	27164
127862	149	27223\tПошехонье-Володарск	27223
127863	149	27296\tКумены	27296
127864	149	27329\tРостов	27329
127865	149	27333\tКострома	27333
127866	149	27369\tКрасные Баки	27369
127867	149	27373\tШахунья	27373
127868	149	27393\tНолинск	27393
127869	149	27402\tТверь	27402
127870	149	27428\tАлександров	27428
127871	149	27441\tШуя	27441
127872	149	27453\tГородец (Волжск.ГМО)	27453
127873	149	27485\tЙошкар-Ола	27485
127874	149	27509\tМожайск	27509
127875	149	27523\tПавловский Посад	27523
127876	149	27532\tВладимир, АМСГ	27532
127877	149	27577\tСергач	27577
127878	149	27581\tЧебоксары	27581
127879	149	27625\tКоломна	27625
127880	149	27648\tЕлатьма	27648
127881	149	27653\tАрзамас	27653
127882	149	27675\tПорецкое	27675
127883	149	27707\tСухиничи	27707
127884	149	27719\tТула	27719
127885	149	27745\tСасово	27745
127886	149	27786\tУльяновск	27786
127887	149	27821\tУзловая	27821
127888	149	27823\tПавелец	27823
127889	149	27848\tМоршанск	27848
127890	149	27857\tЗеметчино	27857
127891	149	27858\tПачелма	27858
127892	149	27906\tОрел,АМСГ	27906
127893	149	27921\tЕфремов	27921
127894	149	27928\tЕлец	27928
127895	149	27930\tЛипецк,АМСГ	27930
127896	149	27935\tМичуринск	27935
127897	149	27947\tТамбов	27947
127898	149	27962\tПенза,ГМО	27962
127899	149	27995\tБезенчук	27995
127900	149	28044\tСеров	28044
127901	149	28049\tГари	28049
127902	149	28064\tЛеуши	28064
127903	149	28076\tДемьянское	28076
127904	149	28097\tТаурово	28097
127905	149	28116\tКудымкар	28116
127906	149	28138\tБисер	28138
127907	149	28224\tПермь	28224
127908	149	28240\tНижний Тагил	28240
127909	149	28248\tАлапаевск	28248
127910	149	28255\tТуринск	28255
127911	149	28264\tТавда	28264
127912	149	28275\tТобольск	28275
127913	149	28302\tУни	28302
127914	149	28319\tНожовка	28319
127915	149	28346\tАртемовский	28346
127916	149	28366\tЯрково	28366
127917	149	28367\tТюмень	28367
127918	149	28383\tТевриз	28383
127919	149	28411\tИжевск	28411
127920	149	28418\tСарапул	28418
127921	149	28434\tКрасноуфимск	28434
127922	149	28445\tВерхнее дуброво	28445
127923	149	28449\tКаменск- Уральский	28449
127924	149	28456\tШатрово	28456
127925	149	28465\tЯлуторовск	28465
127926	149	28481\tВикулово	28481
127927	149	28491\tБольшие Уки	28491
127928	149	28493\tТара	28493
127929	149	28517\tМензелинск, АМСГ	28517
127930	149	28522\tАскино	28522
127931	149	28537\tДуван	28537
127932	149	28552\tШадринск	28552
127933	149	28573\tИшим	28573
127934	149	28586\tТюкалинск	28586
127935	149	28588\tНазываевск	28588
127936	149	28593\tБольшеречье	28593
127937	149	28598\tСаргатское	28598
127938	149	28615\tБакалы	28615
127939	149	28630\tЗлатоуст	28630
127940	149	28659\tКуртамыш	28659
127941	149	28661\tКурган, Вороновка	28661
127942	149	28666\tМакушино	28666
127943	149	28688\tИсилькуль	28688
127944	149	28696\tКалачинск	28696
127945	149	28698\tОмск,степная	28698
127946	149	28704\tЧулпаново	28704
127947	149	28710\tРаевский	28710
127948	149	28711\tБугульма	28711
127949	149	28786\tПолтавка	28786
127950	149	28791\tШербакуль	28791
127951	149	28797\tОдесское	28797
127952	149	28799\tЧерлак	28799
127953	149	28806\tБугуруслан	28806
127954	149	28825\tСтерлитамак	28825
127955	149	28833\tВерхнеуральск	28833
127956	149	28838\tМагнитогорск	28838
127957	149	28941\tКарталы	28941
127958	149	29023\tНапас	29023
127959	149	29111\tСредний Васюган	29111
127960	149	29128\tПарабель	29128
127961	149	29149\tСтепановка	29149
127962	149	29231\tКолпашево	29231
127963	149	29253\tЛосиноборское	29253
127964	149	29263\tЕнисейск	29263
127965	149	29282\tБогучаны	29282
127966	149	29313\tПудино	29313
127967	149	29328\tБакчар	29328
127968	149	29348\tПервомайское	29348
127969	149	29374\tКазачинское	29374
127970	149	29393\tЧервянка	29393
127971	149	29418\tСеверное	29418
127972	149	29430\tТомск	29430
127973	149	29464\tБольшой Улуй	29464
127974	149	29467\tАчинск,ж.д.ст.	29467
127975	149	29481\tДзержинское	29481
127976	149	29498\tШиткино	29498
127977	149	29541\tТайга	29541
127978	149	29552\tТяжин	29552
127979	149	29553\tБоготол	29553
127980	149	29558\tШарыпово	29558
127981	149	29563\tКача	29563
127982	149	29570\tКрасноярск, оп.п.	29570
127983	149	29576\tУяр	29576
127984	149	29578\tШалинское	29578
127985	149	29580\tСолянка	29580
127986	149	29587\tИрбейское	29587
127987	149	29594\tТайшет	29594
127988	149	29605\tТатарск	29605
127989	149	29612\tБарабинск	29612
127990	149	29626\tКоченево	29626
127991	149	29638\tОгурцово	29638
127992	149	29645\tКемерово,АГРО	29645
127993	149	29653\tУжур,ст.ж.д.	29653
127994	149	29654\tЦентральный рудник	29654
127995	149	29662\tБалахта	29662
127996	149	29664\tСветлолобово	29664
127997	149	29676\tАгинское	29676
127998	149	29698\tНижнеудинск	29698
127999	149	29706\tКупино	29706
128000	149	29735\tПосевная	29735
128001	149	29745\tБелово	29745
128002	149	29756\tШира,ж.д.	29756
128003	149	29766\tИдринское	29766
128004	149	29772\tАртемовск	29772
128005	149	29816\tХабары	29816
128006	149	29822\tКамень-на-Оби	29822
128007	149	29838\tБарнаул	29838
128008	149	29849\tКузедеево	29849
128009	149	29862\tАбакан (Хак. ЦГМС)	29862
128010	149	29866\tМинусинск	29866
128011	149	29869\tЕрмаковское	29869
128012	149	29874\tКаратузское	29874
128013	149	29894\tАлыгджер	29894
128014	149	29915\tСлавгород	29915
128015	149	29923\tРебриха	29923
128016	149	29937\tАлейская,ж.д.ст.	29937
128017	149	29939\tБийск- Зональная	29939
128018	149	29956\tТаштып	29956
128019	149	29962\tБея	29962
128020	149	30054\tВитим	30054
128021	149	30127\tТокма	30127
128022	149	30157\tМама	30157
128023	149	30165\tСветлый	30165
128024	149	30230\tКиренск	30230
128025	149	30252\tМамакан	30252
128026	149	30309\tБратск,обс.	30309
128027	149	30328\tОрлинга	30328
128028	149	30337\tКазачинское, АМСГ	30337
128029	149	30372\tЧара	30372
128030	149	30385\tУсть-Нюкжа	30385
128031	149	30405\tТангуй	30405
128032	149	30433\tНижнеангарск	30433
128033	149	30469\tКалакан	30469
128034	149	30493\tНагорный	30493
128035	149	30504\tТулун	30504
128036	149	30521\tЖигалово	30521
128037	149	30526\tТырка	30526
128038	149	30555\tТроицкий прииск	30555
128039	149	30603\tЗима	30603
128040	149	30612\tБалаганск	30612
128041	149	30618\tБохан	30618
128042	149	30627\tБаяндай	30627
128043	149	30636\tБаргузин	30636
128044	149	30637\tУзур	30637
128045	149	30673\tМогоча	30673
128046	149	30683\tЕрофей Павлович	30683
128047	149	30692\tСковородино	30692
128048	149	30710\tИркутск,обс.	30710
128049	149	30712\tУсолье- Сибирское	30712
128050	149	30715\tАнгарск	30715
128051	149	30729\tКабанск	30729
128052	149	30731\tГорячинск	30731
128053	149	30739\tХоринск	30739
128054	149	30745\tСосново-Озерское	30745
128055	149	30758\tЧита	30758
128056	149	30768\tНерчинск,АМСГ	30768
128057	149	30772\tУсть-Карск	30772
128058	149	30777\tСретенск	30777
128059	149	30811\tТунка	30811
128060	149	30822\tБабушкин	30822
128061	149	30823\tУлан-Удэ,город	30823
128062	149	30846\tУлеты	30846
128063	149	30859\tАгинское	30859
128064	149	30874\tШелопугино	30874
128065	149	30879\tНерчинский з-д	30879
128066	149	30925\tКяхта	30925
128067	149	30935\tКрасный Чикой	30935
128068	149	30949\tКыра	30949
128069	149	30957\tАкша	30957
128070	149	30965\tБорзя	30965
128071	149	31088\tОхотск	31088
128072	149	31168\tАян	31168
128073	149	31174\tБольшой Шантар	31174
128074	149	31253\tБомнак	31253
128075	149	31371\tЧерняево	31371
128076	149	31388\tНорск	31388
128077	149	31416\tИм.П.Осипенко	31416
128078	149	31439\tБогородское	31439
128079	149	31442\tШимановск	31442
128080	149	31443\tМазаново	31443
128081	149	31445\tСвободный	31445
128082	149	31510\tБлаговещенск	31510
128083	149	31513\tБелогорск	31513
128084	149	31527\tЗавитая	31527
128085	149	31532\tЧекунда	31532
128086	149	31561\tКомсомольск-на-Амуре	31561
128087	149	31587\tПоярково	31587
128088	149	31594\tАрхара	31594
128089	149	31707\tЕкатерино- Никольское	31707
128090	149	31725\tСмидович	31725
128091	149	31733\tЕлабуга	31733
128092	149	31770\tСоветская Гавань	31770
128093	149	31786\tВяземская	31786
128094	149	31788\tЛермонтовка	31788
128095	149	31792\tБичевая	31792
128096	149	31829\tЗолотой	31829
128097	149	31832\tБикин	31832
128098	149	31845\tКрасный Яр	31845
128099	149	31873\tДальнереченск	31873
128100	149	31884\tМалиново	31884
128101	149	31915\tПограничный	31915
128102	149	31921\tАстраханка	31921
128103	149	31931\tСвиягино	31931
128104	149	31960\tВладивосток,порт	31960
128105	149	31961\tТимирязевский	31961
128106	149	31969\tПосьет	31969
128107	149	32061\tАлександровск- Сахал.	32061
128108	149	32071\tТымовское	32071
128109	149	32088\tУглегорск	32088
128110	149	32099\tМыс Терпения	32099
128111	149	32128\tХолмск	32128
128112	149	32150\tЮжно-Сахалинск	32150
128113	149	32165\tЮжно-Курильск	32165
128114	149	32213\tМыс Лопатка	32213
128115	149	32287\tУсть-Хайрюзово	32287
128116	149	32389\tКлючи	32389
128117	149	32408\tУсть-Камчатск	32408
128118	149	32618\tНикольское (О.Беринга)	32618
128119	149	34003\tПоныри	34003
128120	149	34009\tКурск,АЭ	34009
128121	149	34013\tЛивны	34013
128122	149	34110\tБогородицкое-Фенино	34110
128123	149	34123\tВоронеж,АГРО	34123
128124	149	34139\tКаменная степь	34139
128125	149	34163\tОктябрьский Городок	34163
128126	149	34172\tСаратов,цгмс	34172
128127	149	34186\tЕршов\t51.36	34186
128128	149	34214\tБелгород, АМСГ	34214
128129	149	34240\tУрюпинск	34240
128130	149	34262\tРудня	34262
128131	149	34321\tВалуйки	34321
128132	149	34344\tКазанская	34344
128133	149	34356\tФролово	34356
128134	149	34391\tАлександров Гай	34391
128135	149	34432\tЧертково	34432
128136	149	34438\tМиллеров	34438
128137	149	34476\tЭльтон	34476
128138	149	34545\tМорозовск	34545
128139	149	34578\tЧерный Яр	34578
128140	149	34579\tВерхний Баскунчак	34579
128141	149	34646\tЦимлянск	34646
128142	149	34655\tКотельниково	34655
128143	149	34720\tТаганрог	34720
128144	149	34731\tРостов-на-Дону,АМС	34731
128145	149	34740\tГигант	34740
128146	149	34743\tЗимовники	34743
128147	149	34824\tПриморско-Ахтарск	34824
128148	149	34838\tТихорецк	34838
128149	149	34861\tЭлиста,АМСГ	34861
128150	149	34866\tЯшкуль	34866
128151	149	34880\tАстрахань,ГМО	34880
128152	149	34887\tЛиман	34887
128153	149	34949\tСтаврополь, АМСГ	34949
128154	149	34954\tСветлоград	34954
128155	149	34964\tАрзгир	34964
128156	149	35001\tБольшая Глушица	35001
128157	149	35026\tЗилаир	35026
128158	149	35041\tБреды	35041
128159	149	35121\tОренбург,ЗГМО	35121
128160	149	36020\tРодино	36020
128161	149	36034\tРубцовск	36034
128162	149	36038\tЗмеиногорск	36038
128163	149	36064\tЯйлю	36064
128164	149	36091\tНижне- Усинское	36091
128165	149	36096\tКызыл (Тув. ЦГМС)	36096
128166	149	36103\tТоора-Хем	36103
128167	149	36229\tУсть-Кокса	36229
128168	149	36231\tОнгудай	36231
128169	149	36259\tКош-Агач	36259
128170	149	36307\tЭрзин	36307
128171	149	37021\tМайкоп	37021
128172	149	37061\tБуденновск	37061
128173	149	37099\tСочи,ГМО	37099
128174	149	37126\tШаджатмаз	37126
128175	149	37145\tМоздок	37145
128176	149	37163\tКизляр,АМСГ	37163
128177	149	37193\tТеберда	37193
128178	149	37212\tНальчик	37212
128179	149	37235\tГрозный,АМСГ	37235
128180	149	37248\tХасавюрт	37248
128181	149	37470\tДербент	37470
128182	149	37472\tМахачкала	37472
128183	149	37597\tКасумкент	37597
128184	149	37663\tАхты	37663
128185	150	20046 Им.Э.Т.Кренкеля,ГМО        Россия	20046
128186	150	20069 Визе                       Россия	20069
128187	150	20087 Голомянный                 Россия	20087
128188	150	20107 Баренцбург                 Россия	20107
128189	150	20289 Русский                    Россия	20289
128190	150	20292 Им.Е.К.Федорова,ГМО        Россия	20292
128191	150	20476 Стерлегова                 Россия	20476
128192	150	20667 Им.М.В.Попова              Россия	20667
128193	150	20674 Диксон                     Россия	20674
128194	150	20744 Малые Кармакулы            Россия	20744
128195	150	20891 Хатанга                    Россия	20891
128196	150	20946 Им.Е.К.Федорова            Россия	20946
128197	150	20982 Волочанка                  Россия	20982
128198	150	21432 Котельный                  Россия	21432
128199	150	21611 Терпяй-Тумса               Россия	21611
128200	150	21647 Шалаурова                  Россия	21647
128201	150	21802 Саскылах                   Россия	21802
128202	150	21824 Тикси                      Россия	21824
128203	150	21908 Джалинда                   Россия	21908
128204	150	21921 Кюсюр                      Россия	21921
128205	150	21931 Юбилейная                  Россия	21931
128206	150	21946 Чокурдах                   Россия	21946
128207	150	21982 Остров Врангеля            Россия	21982
128208	150	22003 Вайда-Губа                 Россия	22003
128209	150	22019 Полярное                   Россия	22019
128210	150	22028 Териберка                  Россия	22028
128211	150	22095 Колгуев Северный           Россия	22095
128212	150	22101 Янискоски                  Россия	22101
128213	150	22113 Мурманск                   Россия	22113
128214	150	22140 Святой Нос                 Россия	22140
128215	150	22165 Канин Нос                  Россия	22165
128216	150	22204 Ковдор                     Россия	22204
128217	150	22217 Кандалакша                 Россия	22217
128218	150	22235 Краснощелье                Россия	22235
128219	150	22249 Каневка                    Россия	22249
128220	150	22271 Шойна                      Россия	22271
128221	150	22292 Индига                     Россия	22292
128222	150	22324 Умба                       Россия	22324
128223	150	22355 Сосновец остров            Россия	22355
128224	150	22408 Калевала                   Россия	22408
128225	150	22422 Гридино                    Россия	22422
128226	150	22438 Жижгин                     Россия	22438
128227	150	22471 Мезень                     Россия	22471
128228	150	22520 Кемь-порт                  Россия	22520
128229	150	22550 Архангельск                Россия	22550
128230	150	22583 Койнас                     Россия	22583
128231	150	22602 Реболы                     Россия	22602
128232	150	22619 Паданы                     Россия	22619
128233	150	22641 Онега                      Россия	22641
128234	150	22676 Сура                       Россия	22676
128235	150	22768 Шенкурск                   Россия	22768
128236	150	22802 Сортавала                  Россия	22802
128237	150	22820 Петрозаводск               Россия	22820
128238	150	22837 Вытегра                    Россия	22837
128239	150	22845 Каргополь                  Россия	22845
128240	150	22854 Няндома                    Россия	22854
128241	150	22887 Котлас                     Россия	22887
128242	150	22892 Выборг                     Россия	22892
128243	150	22907 Гогланд                    Россия	22907
128244	150	22981 Великий Устюг              Россия	22981
128245	150	23022 Амдерма                    Россия	23022
128246	150	23032 Марресаля                  Россия	23032
128247	150	23058 Антипаюта                  Россия	23058
128248	150	23074 Дудинка                    Россия	23074
128249	150	23114 Мыс Константиновский       Россия	23114
128250	150	23146 Мыс Каменный               Россия	23146
128251	150	23205 Нарьян-Мар                 Россия	23205
128252	150	23219 Хоседа-Хард                Россия	23219
128253	150	23220 Елецкая                    Россия	23220
128254	150	23242 Новый Порт                 Россия	23242
128255	150	23256 Тазовск                    Россия	23256
128256	150	23274 Игарка                     Россия	23274
128257	150	23324 Петрунь                    Россия	23324
128258	150	23330 Салехард                   Россия	23330
128259	150	23331 Ра-Из                      Россия	23331
128260	150	23345 Ныда                       Россия	23345
128261	150	23365 Сидоровск                  Россия	23365
128262	150	23383 Агата                      Россия	23383
128263	150	23405 Усть-Цильма                Россия	23405
128264	150	23412 Усть-Уса                   Россия	23412
128265	150	23418 Печора                     Россия	23418
128266	150	23445 Надым                      Россия	23445
128267	150	23463 Янов Стан                  Россия	23463
128268	150	23472 Туруханск                  Россия	23472
128269	150	23514 Ираель                     Россия	23514
128270	150	23527 Саранпауль                 Россия	23527
128271	150	23552 Тарко-Сале                 Россия	23552
128272	150	23589 Тутончаны                  Россия	23589
128273	150	23631 Березово                   Россия	23631
128274	150	23656 Халесовая                  Россия	23656
128275	150	23662 Толька                     Россия	23662
128276	150	23678 Верхнеимбатск              Россия	23678
128277	150	23707 Усть-Вымь                  Россия	23707
128278	150	23711 Троицко-Печорское          Россия	23711
128279	150	23724 Няксимволь                 Россия	23724
128280	150	23734 Октябрьское                Россия	23734
128281	150	23804 Сыктывкар                  Россия	23804
128282	150	23849 Сургут                     Россия	23849
128283	150	23867 Ларьяк                     Россия	23867
128284	150	23884 Бор                        Россия	23884
128285	150	23891 Байкит                     Россия	23891
128286	150	23904 Койгородок                 Россия	23904
128287	150	23914 Чердынь                    Россия	23914
128288	150	23921 Ивдель                     Россия	23921
128289	150	23933 Ханты-Мансийск             Россия	23933
128290	150	23946 Угут                       Россия	23946
128291	150	23955 Александровское            Россия	23955
128292	150	23966 Ванжиль-Кынак              Россия	23966
128293	150	23986 Северо-Енисейский          Россия	23986
128294	150	24076 Депутатский                Россия	24076
128295	150	24105 Ессей                      Россия	24105
128296	150	24125 Оленек                     Россия	24125
128297	150	24136 Сухана                     Россия	24136
128298	150	24143 Джарджан                   Россия	24143
128299	150	24266 Верхоянск                  Россия	24266
128300	150	24329 Шелагонцы                  Россия	24329
128301	150	24343 Жиганск                    Россия	24343
128302	150	24371 Усть-Чаркы                 Россия	24371
128303	150	24382 Усть-Мома                  Россия	24382
128304	150	24507 Тура                       Россия	24507
128305	150	24538 Чумпурук                   Россия	24538
128306	150	24606 Кислокан                   Россия	24606
128307	150	24639 Нюрба                      Россия	24639
128308	150	24641 Вилюйск                    Россия	24641
128309	150	24643 Хатырык-Хомо               Россия	24643
128310	150	24661 Сеген-Кюель                Россия	24661
128311	150	24671 Томпо                      Россия	24671
128312	150	24679 Восточная                  Россия	24679
128313	150	24688 Оймякон                    Россия	24688
128314	150	24713 Наканно                    Россия	24713
128315	150	24726 Мирный                     Россия	24726
128316	150	24738 Сунтар                     Россия	24738
128317	150	24763 Крест-Хальджай             Россия	24763
128318	150	24768 Чурапча                    Россия	24768
128319	150	24790 Сусуман                    Россия	24790
128320	150	24802 Стрелка Чуня               Россия	24802
128321	150	24817 Ербогачен                  Россия	24817
128322	150	24908 Ванавара                   Россия	24908
128323	150	24923 Ленск                      Россия	24923
128324	150	24933 Килеер                     Россия	24933
128325	150	24944 Олекминск                  Россия	24944
128326	150	24951 Исить                      Россия	24951
128327	150	24959 Якутск                     Россия	24959
128328	150	24966 Усть-Мая                   Россия	24966
128329	150	24967 Тегюльтя                   Россия	24967
128330	150	24982 Уега                       Россия	24982
128331	150	25034 Амбарчик бухта             Россия	25034
128332	150	25042 Остров Айон                Россия	25042
128333	150	25062 Мыс Биллингс               Россия	25062
128334	150	25138 Островное                  Россия	25138
128335	150	25173 Мыс Шмидта                 Россия	25173
128336	150	25206 Среднеколымск              Россия	25206
128337	150	25248 Илирней                    Россия	25248
128338	150	25282 Мыс Ванкарем               Россия	25282
128339	150	25325 Усть-Олой                  Россия	25325
128340	150	25356 Эньмувеем                  Россия	25356
128341	150	25372 Амгуэма,87км               Россия	25372
128342	150	25378 Эгвекинот                  Россия	25378
128343	150	25399 Уэлен                      Россия	25399
128344	150	25400 Зырянка                    Россия	25400
128345	150	25428 Омолон                     Россия	25428
128346	150	25503 Коркодон                   Россия	25503
128347	150	25538 Верхне-Пенжино             Россия	25538
128348	150	25551 Марково                    Россия	25551
128349	150	25563 Анадырь                    Россия	25563
128350	150	25594 Бухта Провидения           Россия	25594
128351	150	25621 Кедон                      Россия	25621
128352	150	25656 Березово                   Россия	25656
128353	150	25677 Беринговская               Россия	25677
128354	150	25703 Сеймчан                    Россия	25703
128355	150	25705 Среднекан                  Россия	25705
128356	150	25744 Каменское                  Россия	25744
128357	150	25767 Хатырка                    Россия	25767
128358	150	25777 Гавриила бухта             Россия	25777
128359	150	25912 Ола                        Россия	25912
128360	150	25913 Магадан                    Россия	25913
128361	150	25916 Мыс Алевина                Россия	25916
128362	150	25922 Шелихово                   Россия	25922
128363	150	25927 Брохово                    Россия	25927
128364	150	25932 Тайгонос                   Россия	25932
128365	150	25954 Корф                       Россия	25954
128366	150	25956 Апука                      Россия	25956
128367	150	26038 Таллинн                    Эстония	26038
128368	150	26063 Санкт-Петербург            Россия	26063
128369	150	26069 Белогорка                  Россия	26069
128370	150	26094 Тихвин                     Россия	26094
128371	150	26157 Гдов                       Россия	26157
128372	150	26188 Веребье                    Россия	26188
128373	150	26231 Пярну                      Эстония	26231
128374	150	26258 Псков                      Россия	26258
128375	150	26275 Старая Русса               Россия	26275
128376	150	26298 Бологое                    Россия	26298
128377	150	26359 Пушкинские Горы            Россия	26359
128378	150	26393 Вышний Волочек             Россия	26393
128379	150	26406 Лиепая                     Латвия	26406
128380	150	26422 Рига                       Латвия	26422
128381	150	26477 Великие Луки               Россия	26477
128382	150	26479 Торопец                    Россия	26479
128383	150	26499 Старица                    Россия	26499
128384	150	26614 Советск                    Россия	26614
128385	150	26629 Каунас                     Литва	26629
128386	150	26701 Балтийск                   Россия	26701
128387	150	26702 Калининград                Россия	26702
128388	150	26706 Железнодорожный            Россия	26706
128389	150	26730 Вильнюс                    Литва	26730
128390	150	26781 Смоленск                   Россия	26781
128391	150	26850 Минск                      Беларусь	26850
128392	150	26898 Брянск                     Россия	26898
128393	150	26976 Красная Гора               Россия	26976
128394	150	26997 Трубчевск                  Россия	26997
128395	150	27008 Бабаево                    Россия	27008
128396	150	27037 Вологда,Прилуки            Россия	27037
128397	150	27051 Тотьма                     Россия	27051
128398	150	27066 Никольск                   Россия	27066
128399	150	27083 Опарино                    Россия	27083
128400	150	27164 Кологрив                   Россия	27164
128401	150	27199 Киров                      Россия	27199
128402	150	27208 Максатиха                  Россия	27208
128403	150	27225 Рыбинск,ГМО                Россия	27225
128404	150	27277 Ветлуга                    Россия	27277
128405	150	27296 Кумены                     Россия	27296
128406	150	27333 Кострома                   Россия	27333
128407	150	27385 Яранск                     Россия	27385
128408	150	27425 Переславль-Залесский       Россия	27425
128409	150	27459 Нижний Новгород            Россия	27459
128410	150	27485 Йошкар-Ола                 Россия	27485
128411	150	27509 Можайск                    Россия	27509
128412	150	27595 Казань                     Россия	27595
128413	150	27612 Москва, ВДНХ               Россия	27612
128414	150	27625 Коломна                    Россия	27625
128415	150	27648 Елатьма                    Россия	27648
128416	150	27665 Лукоянов                   Россия	27665
128417	150	27675 Порецкое                   Россия	27675
128418	150	27707 Сухиничи                   Россия	27707
128419	150	27730 Рязань                     Россия	27730
128420	150	27756 Краснослободск             Россия	27756
128421	150	27814 Плавск                     Россия	27814
128422	150	27823 Павелец                    Россия	27823
128423	150	27857 Земетчино                  Россия	27857
128424	150	27872 Инза                       Россия	27872
128425	150	27935 Мичуринск                  Россия	27935
128426	150	27947 Тамбов                     Россия	27947
128427	150	27962 Пенза                      Россия	27962
128428	150	27995 Безенчук                   Россия	27995
128429	150	28009 Кирс                       Россия	28009
128430	150	28064 Леуши                      Россия	28064
128431	150	28138 Бисер                      Россия	28138
128432	150	28144 Верхотурье                 Россия	28144
128433	150	28224 Пермь                      Россия	28224
128434	150	28240 Нижний Тагил               Россия	28240
128435	150	28255 Туринск                    Россия	28255
128436	150	28275 Тобольск                   Россия	28275
128437	150	28312 Дебессы                    Россия	28312
128438	150	28367 Тюмень                     Россия	28367
128439	150	28402 Кильмезь                   Россия	28402
128440	150	28411 Ижевск                     Россия	28411
128441	150	28418 Сарапул                    Россия	28418
128442	150	28419 Янаул                      Россия	28419
128443	150	28434 Красноуфимск               Россия	28434
128444	150	28440 Екатеринбург               Россия	28440
128445	150	28445 Верхнее Дуброво            Россия	28445
128446	150	28493 Тара                       Россия	28493
128447	150	28506 Елабуга                    Россия	28506
128448	150	28537 Дуван                      Россия	28537
128449	150	28552 Шадринск                   Россия	28552
128450	150	28561 Памятная                   Россия	28561
128451	150	28573 Ишим                       Россия	28573
128452	150	28624 Кушнаренково               Россия	28624
128453	150	28630 Златоуст                   Россия	28630
128454	150	28645 Челябинск                  Россия	28645
128455	150	28661 Курган                     Россия	28661
128456	150	28666 Макушино                   Россия	28666
128457	150	28679 Петропавловск              Казахстан	28679
128458	150	28698 Омск                       Россия	28698
128459	150	28704 Чулпаново                  Россия	28704
128460	150	28711 Бугульма                   Россия	28711
128461	150	28719 Аксаково                   Россия	28719
128462	150	28722 Уфа                        Россия	28722
128463	150	28748 Троицк                     Россия	28748
128464	150	28802 Серноводск                 Россия	28802
128465	150	28823 Тукан                      Россия	28823
128466	150	28825 Стерлитамак                Россия	28825
128467	150	28833 Верхнеуральск              Россия	28833
128468	150	28895 Русская Поляна             Россия	28895
128469	150	28900 Самара                     Россия	28900
128470	150	28925 Мелеуз                     Россия	28925
128471	150	28952 Кустанай/Костанай          Казахстан	28952
128472	150	29023 Напас                      Россия	29023
128473	150	29111 Средний Васюган            Россия	29111
128474	150	29154 Усть-Озерное               Россия	29154
128475	150	29231 Колпашево                  Россия	29231
129483	152	26898 Брянск,АМСГ	26898
128476	150	29263 Енисейск                   Россия	29263
128477	150	29282 Богучаны                   Россия	29282
128478	150	29313 Пудино                     Россия	29313
128479	150	29328 Бакчар                     Россия	29328
128480	150	29348 Первомайское               Россия	29348
128481	150	29379 Тасеево                    Россия	29379
128482	150	29393 Червянка                   Россия	29393
128483	150	29418 Северное                   Россия	29418
128484	150	29430 Томск                      Россия	29430
128485	150	29467 Ачинск, ж.д.ст.            Россия	29467
128486	150	29539 Болотное                   Россия	29539
128487	150	29541 Тайга                      Россия	29541
128488	150	29557 Тисуль                     Россия	29557
128489	150	29570 Красноярск, оп.п.          Россия	29570
128490	150	29580 Солянка                    Россия	29580
128491	150	29594 Тайшет                     Россия	29594
128492	150	29605 Татарск                    Россия	29605
128493	150	29612 Барабинск                  Россия	29612
128494	150	29638 Огурцово                   Россия	29638
128495	150	29645 Кемерово                   Россия	29645
128496	150	29664 Светлолобово               Россия	29664
128497	150	29698 Нижнеудинск                Россия	29698
128498	150	29736 Маслянино                  Россия	29736
128499	150	29752 Ненастная                  Россия	29752
128500	150	29789 Верхняя Гутара             Россия	29789
128501	150	29807 Иртышск                    Казахстан	29807
128502	150	29822 Камень-на-Оби              Россия	29822
128503	150	29838 Барнаул                    Россия	29838
128504	150	29849 Кузедеево                  Россия	29849
128505	150	29858 Неожиданный                Россия	29858
128506	150	29862 Абакан                     Россия	29862
128507	150	29866 Минусинск                  Россия	29866
128508	150	29869 Ермаковское                Россия	29869
128509	150	29915 Славгород                  Россия	29915
128510	150	29923 Ребриха                    Россия	29923
128511	150	29939 Бийск-Зональная            Россия	29939
128512	150	29956 Таштып                     Россия	29956
128513	150	29974 Оленья Речка               Россия	29974
128514	150	29998 Орлик                      Россия	29998
128515	150	30028 Ика                        Россия	30028
128516	150	30054 Витим                      Россия	30054
128517	150	30069 Перевоз                    Россия	30069
128518	150	30089 Джикимда                   Россия	30089
128519	150	30209 Ершово                     Россия	30209
128520	150	30219 Максимово                  Россия	30219
128521	150	30230 Киренск                    Россия	30230
128522	150	30252 Мамакан                    Россия	30252
128523	150	30253 Бодайбо                    Россия	30253
128524	150	30309 Братск                     Россия	30309
128525	150	30328 Орлинга                    Россия	30328
128526	150	30337 Казачинское                Россия	30337
128527	150	30356 Таксимо                    Россия	30356
128528	150	30372 Чара                       Россия	30372
128529	150	30385 Усть-Нюкжа                 Россия	30385
128530	150	30393 Чульман                    Россия	30393
128531	150	30433 Нижнеангарск               Россия	30433
128532	150	30437 Карам                      Россия	30437
128533	150	30469 Калакан                    Россия	30469
128534	150	30471 Средний Калар              Россия	30471
128535	150	30484 Средняя Олекма             Россия	30484
128536	150	30493 Нагорный                   Россия	30493
128537	150	30499 Тында                      Россия	30499
128538	150	30504 Тулун                      Россия	30504
128539	150	30521 Жигалово                   Россия	30521
128540	150	30536 Баргузинский запов-к       Россия	30536
128541	150	30554 Багдарин                   Россия	30554
128542	150	30555 Троицкий Прииск            Россия	30555
128543	150	30565 Усть-Каренга               Россия	30565
128544	150	30612 Балаганск                  Россия	30612
128545	150	30627 Баяндай                    Россия	30627
128546	150	30632 Большой Ушканий о-в        Россия	30632
128547	150	30635 Усть-Баогузин              Россия	30635
128548	150	30636 Баргузин                   Россия	30636
128549	150	30650 Романовка                  Россия	30650
128550	150	30673 Могоча                     Россия	30673
128551	150	30683 Ерофей Павлович            Россия	30683
128552	150	30692 Сковородино                Россия	30692
128553	150	30695 Джалинда                   Россия	30695
128554	150	30703 Инга                       Россия	30703
128555	150	30710 Иркутск, обсерв.           Россия	30710
128556	150	30716 Хомутово                   Россия	30716
128557	150	30727 Большое Голоустное         Россия	30727
129603	152	30815 Хамар-Дабан	30815
128558	150	30745 Сосново-Озерское           Россия	30745
128559	150	30758 Чита                       Россия	30758
128560	150	30777 Сретенск                   Россия	30777
128561	150	30811 Тунка                      Россия	30811
128562	150	30815 Хамар-Дабан                Россия	30815
128563	150	30822 Бабушкин                   Россия	30822
128564	150	30823 Улан-Удэ                   Россия	30823
128565	150	30825 Иволгинск                  Россия	30825
128566	150	30844 Хилок                      Россия	30844
128567	150	30859 Агинское                   Россия	30859
128568	150	30879 Нерчинский з-д             Россия	30879
128569	150	30915 Цакир                      Россия	30915
128570	150	30925 Кяхта                      Россия	30925
128571	150	30935 Красный Чикой              Россия	30935
128572	150	30949 Кыра                       Россия	30949
128573	150	30954 Мангут                     Россия	30954
128574	150	30965 Борзя                      Россия	30965
128575	150	31004 Алдан                      Россия	31004
128576	150	31026 Учур                       Россия	31026
128577	150	31062 Югаренок                   Россия	31062
128578	150	31088 Охотск                     Россия	31088
128579	150	31092 Талон                      Россия	31092
128580	150	31102 Канку                      Россия	31102
128581	150	31137 Токо                       Россия	31137
128582	150	31152 Нелькан                    Россия	31152
128583	150	31168 Аян                        Россия	31168
128584	150	31174 Большой Шантар             Россия	31174
128585	150	31235 Джана                      Россия	31235
128586	150	31253 Бомнак                     Россия	31253
128587	150	31285 Удское                     Россия	31285
128588	150	31318 Дугда                      Россия	31318
128589	150	31329 Экимчан                    Россия	31329
128590	150	31362 Литке                      Россия	31362
128591	150	31369 Николаевск-на-Амуре        Россия	31369
128592	150	31371 Черняево                   Россия	31371
128593	150	31388 Норск                      Россия	31388
128594	150	31416 Им. Полины Осипенко        Россия	31416
128595	150	31436 Джаоре                     Россия	31436
128596	150	31439 Богородское                Россия	31439
128597	150	31443 Мазаново                   Россия	31443
128598	150	31459 Верхняя Томь               Россия	31459
128599	150	31478 Софийский Прииск           Россия	31478
128600	150	31510 Благовещенск               Россия	31510
128601	150	31532 Чекунда                    Россия	31532
128602	150	31538 Сутур                      Россия	31538
128603	150	31562 Нижнетамбовское            Россия	31562
128604	150	31586 Константиновка             Россия	31586
128605	150	31594 Архара                     Россия	31594
128606	150	31677 Солекуль                   Россия	31677
128607	150	31702 Облучье                    Россия	31702
128608	150	31707 Екатерино-Никольское       Россия	31707
128609	150	31725 Смидович                   Россия	31725
128610	150	31733 Елабуга                    Россия	31733
128611	150	31735 Хабаровск                  Россия	31735
128612	150	31770 Советская Гавань           Россия	31770
128613	150	31788 Лермонтовка                Россия	31788
128614	150	31829 Золотой                    Россия	31829
128615	150	31832 Бикин                      Россия	31832
128616	150	31845 Красный Яр                 Россия	31845
128617	150	31873 Дальнереченск              Россия	31873
128618	150	31895 Мельничное                 Россия	31895
128619	150	31909 Терней                     Россия	31909
128620	150	31915 Пограничный                Россия	31915
128621	150	31931 Свиягино                   Россия	31931
128622	150	31959 Рудная Пристань            Россия	31959
128623	150	31960 Владивосток                Россия	31960
128624	150	31961 Тимирязевский              Россия	31961
128625	150	31969 Посьет                     Россия	31969
128626	150	31989 Преображение               Россия	31989
128627	150	32014 Москальво                  Россия	32014
128628	150	32027 Погиби                     Россия	32027
128629	150	32053 Ноглики                    Россия	32053
128630	150	32061 Александровск-Сахал.       Россия	32061
128631	150	32071 Тымовское                  Россия	32071
128632	150	32076 Пограничное                Россия	32076
128633	150	32088 Углегорск                  Россия	32088
128634	150	32098 Поронайск                  Россия	32098
128635	150	32099 Мыс Терпения               Россия	32099
128636	150	32121 Ильинский                  Россия	32121
128637	150	32145 Невельск                   Россия	32145
128638	150	32149 Мыс Крильон                Россия	32149
128639	150	32150 Южно-Сахалинск             Россия	32150
128640	150	32165 Южно-Курильск              Россия	32165
128641	150	32174 Курильск                   Россия	32174
128642	150	32213 Мыс Лопатка                Россия	32213
128643	150	32246 Оссора                     Россия	32246
128644	150	32252 Усть-Воямполка             Россия	32252
128645	150	32287 Усть-Хайрюзово             Россия	32287
128646	150	32363 Эссо                       Россия	32363
128647	150	32389 Ключи                      Россия	32389
128648	150	32411 Ича                        Россия	32411
128649	150	32447 Долиновка                  Россия	32447
128650	150	32477 Соболево                   Россия	32477
128651	150	32509 Семячик                    Россия	32509
128652	150	32539 Начики                     Россия	32539
128653	150	32547 Сосновка                   Россия	32547
128654	150	32562 Большерецк                 Россия	32562
128655	150	32564 Октябрьская                Россия	32564
128656	150	32583 Петропавловск-Камчатск.    Россия	32583
128657	150	32586 Петропавловский маяк       Россия	32586
128658	150	32618 Остров Беринга             Россия	32618
128659	150	33008 Брест                      Беларусь	33008
128660	150	33038 Василевичи                 Беларусь	33038
128661	150	33166 Рыльск                     Россия	33166
128662	150	33345 Киев                       Украина	33345
128663	150	33377 Лубны                      Украина	33377
128664	150	33393 Львов                      Украина	33393
128665	150	33562 Винница                    Украина	33562
128666	150	33631 Ужгород                    Украина	33631
128667	150	33658 Черновцы                   Украина	33658
128668	150	33815 Кишинев                    Молдова	33815
128669	150	33837 Одесса                     Украина	33837
128670	150	33889 Измаил                     Украина	33889
128671	150	33910 Геническ                   Украина	33910
128672	150	33915 Аскания-Нова               Украина	33915
128673	150	33946 Симферополь                Россия	33946
128674	150	33976 Феодосия                   Россия	33976
128675	150	33983 Керчь                      Россия	33983
128676	150	34003 Поныри                     Россия	34003
128677	150	34009 Курск                      Россия	34009
128678	150	34026 Конь-Колодезь              Россия	34026
128679	150	34056 Ртищево                    Россия	34056
128680	150	34059 Росташи                    Россия	34059
128681	150	34110 Богородицкое-Фенино        Россия	34110
128682	150	34123 Воронеж                    Россия	34123
128683	150	34139 Каменная Степь             Россия	34139
128684	150	34152 Балашов                    Россия	34152
128685	150	34163 Октябрьский городок        Россия	34163
128686	150	34172 Саратов                    Россия	34172
128687	150	34186 Ершов                      Россия	34186
128688	150	34202 Готня                      Россия	34202
128689	150	34240 Урюпинск                   Россия	34240
128690	150	34247 Калач                      Россия	34247
128691	150	34289 Новоузенск                 Россия	34289
128692	150	34300 Харьков                    Украина	34300
128693	150	34321 Валуйки                    Россия	34321
128694	150	34356 Фролово                    Россия	34356
128695	150	34391 Александров Гай            Россия	34391
128696	150	34432 Чертково                   Россия	34432
128697	150	34476 Эльтон                     Россия	34476
128698	150	34524 Дебальцево                 Украина	34524
128699	150	34561 Волгоград                  Россия	34561
128700	150	34579 Верхний Баскунчак          Россия	34579
128701	150	34646 Цимлянск(Волгодонск)       Россия	34646
128702	150	34720 Таганрог                   Россия	34720
128703	150	34730 Ростов-на-Дону             Россия	34730
128704	150	34740 Гигант                     Россия	34740
128705	150	34747 Целина                     Россия	34747
128706	150	34759 Ремонтное                  Россия	34759
128707	150	34824 Приморско-Ахтарск          Россия	34824
128708	150	34861 Элиста                     Россия	34861
128709	150	34866 Яшкуль                     Россия	34866
128710	150	34880 Астрахань                  Россия	34880
128711	150	34927 Краснодар, Круглик         Россия	34927
128712	150	34949 Ставрополь, АМСГ           Россия	34949
128713	150	34964 Арзгир                     Россия	34964
128714	150	34984 Лагань                     Россия	34984
128715	150	35007 Перелюб                    Россия	35007
128716	150	35011 Сорочинск                  Россия	35011
128717	150	35026 Зилаир                     Россия	35026
128718	150	35041 Бреды                      Россия	35041
128719	150	35078 Атбасар                    Казахстан	35078
128720	150	35108 Уральск                    Казахстан	35108
128721	150	35121 Оренбург                   Россия	35121
128722	150	35127 Акбулак                    Россия	35127
129840	153	24641 Вилюйск	24641
128723	150	35133 Адамовка                   Россия	35133
128724	150	35188 Целиноград/Астана          Казахстан	35188
128725	150	35229 Актюбинск/Актобе           Казахстан	35229
128726	150	35233 Домбаровский               Россия	35233
128727	150	35358 Тургай/Торгай              Казахстан	35358
128728	150	35394 Караганда                  Казахстан	35394
128729	150	35406 Калмыково                  Казахстан	35406
128730	150	35416 Уил                        Казахстан	35416
128731	150	35542 Иргиз                      Казахстан	35542
128732	150	35576 Кызылжар                   Казахстан	35576
128733	150	35663 Карсакпай                  Казахстан	35663
128734	150	35700 Гурьев/Атырау              Казахстан	35700
128735	150	35746 Аральское море             Казахстан	35746
128736	150	35796 Балхаш                     Казахстан	35796
128737	150	36034 Рубцовск                   Россия	36034
128738	150	36038 Змеиногорск                Россия	36038
128739	150	36045 Солонешное                 Россия	36045
128740	150	36055 Кызыл-Озек                 Россия	36055
128741	150	36061 Турочак                    Россия	36061
128742	150	36064 Яйлю                       Россия	36064
128743	150	36096 Кызыл                      Россия	36096
128744	150	36099 Сосновка                   Россия	36099
128745	150	36103 Тоора-Хем                  Россия	36103
128746	150	36177 Семипалатинск/Семей        Казахстан	36177
128747	150	36229 Усть-Кокса                 Россия	36229
128748	150	36259 Кош-Агач                   Россия	36259
128749	150	36278 Мугур-Аксы                 Россия	36278
128750	150	36307 Эрзин                      Россия	36307
128751	150	36442 Кара-Тюрек                 Россия	36442
128752	150	36665 Зайсан                     Казахстан	36665
128753	150	36729 Учарал                     Казахстан	36729
128754	150	36859 Панфилов                   Казахстан	36859
128755	150	36870 Алматы/Алма-Ата            Казахстан	36870
128756	150	36974 Нарын                      Кыргызстан	36974
128757	150	37001 Анапа,МГ                   Россия	37001
128758	150	37018 Туапсе                     Россия	37018
128759	150	37031 Армавир                    Россия	37031
128760	150	37050 Пятигорск                  Россия	37050
128761	150	37054 Минеральные Воды           Россия	37054
128762	150	37061 Буденновск                 Россия	37061
128763	150	37075 Южно-Сухокумск             Россия	37075
128764	150	37089 Тюлений остров             Россия	37089
128765	150	37099 Сочи                       Россия	37099
128766	150	37107 Красная Поляна             Россия	37107
128767	150	37112 Зеленчукская               Россия	37112
128768	150	37123 Кисловодск                 Россия	37123
128769	150	37126 Шаджатмаз                  Россия	37126
128770	150	37196 Клухорский перевал         Россия	37196
128771	150	37212 Нальчик                    Россия	37212
128772	150	37228 Владикавказ                Россия	37228
128773	150	37235 Грозный                    Россия	37235
128774	150	37244 Гудермес                   Россия	37244
128775	150	37385 Самтредиа                  Грузия	37385
128776	150	37461 Сулак,высокогорная         Россия	37461
128777	150	37470 Дербент                    Россия	37470
128778	150	37471 Буйнакск                   Россия	37471
128779	150	37472 Махачкала                  Россия	37472
128780	150	37549 Тбилиси                    Грузия	37549
128781	150	37663 Ахты                       Россия	37663
128782	150	37686 Ленинакан/Гумри            Армения	37686
128783	150	37735 Кировобад/Гянжа            Азербайджан	37735
128784	150	37789 Ереван                     Армения	37789
128785	150	38198 Туркестан                  Казахстан	38198
128786	150	38262 Чимбай                     Узбекистан	38262
128787	150	38353 Фрунзе/Бишкек              Кыргызстан	38353
128788	150	38413 Тамды                      Узбекистан	38413
128789	150	38457 Ташкент                    Узбекистан	38457
128790	150	38507 Красноводск/Туркменбаши    Туркменистан	38507
128791	150	38599 Ленинабад/Худжент          Таджикистан	38599
128792	150	38618 Фергана                    Узбекистан	38618
128793	150	38687 Чарджоу/Чарджев            Туркменистан	38687
128794	150	38696 Самарканд                  Узбекистан	38696
128795	150	38750 Гасан-Кули/Эсенгули        Туркмениcтан	38750
128796	150	38763 Кизыл-Арват/Гизыларбат     Туркменистан	38763
128797	150	38836 Душанбе                    Таджикистан	38836
128798	150	38880 Ашхабад/Ашгабат            Туркменистан	38880
128799	150	38895 Байрам-Али/Байрамалы       Туркменистан	38895
128800	150	38927 Термез                     Узбекистан	38927
128883	151	23405 Усть-Цильма                Россия	23405
128801	150	38933 Курган-Тюбе                Таджикистан	38933
128802	150	38954 Хорог                      Таджикистан	38954
128803	150	38974 Серахс/Сарагт              Туркменистан	38974
128804	150	38987 Кушка/Гышгы                Туркменистан	38987
128805	151	20046 Им.Э.Т.Кренкеля,ГМО        Россия	20046
128806	151	20069 Визе                       Россия	20069
128807	151	20087 Голомянный                 Россия	20087
128808	151	20107 Баренцбург                 Россия	20107
128809	151	20289 Русский                    Россия	20289
128810	151	20292 Им.Е.К.Федорова,ГМО        Россия	20292
128811	151	20476 Стерлегова                 Россия	20476
128812	151	20667 Им.М.В.Попова              Россия	20667
128813	151	20674 Диксон                     Россия	20674
128814	151	20744 Малые Кармакулы            Россия	20744
128815	151	20891 Хатанга                    Россия	20891
128816	151	20946 Им.Е.К.Федорова            Россия	20946
128817	151	20982 Волочанка                  Россия	20982
128818	151	21432 Котельный                  Россия	21432
128819	151	21611 Терпяй-Тумса               Россия	21611
128820	151	21647 Шалаурова                  Россия	21647
128821	151	21802 Саскылах                   Россия	21802
128822	151	21824 Тикси                      Россия	21824
128823	151	21908 Джалинда                   Россия	21908
128824	151	21921 Кюсюр                      Россия	21921
128825	151	21931 Юбилейная                  Россия	21931
128826	151	21946 Чокурдах                   Россия	21946
128827	151	21982 Остров Врангеля            Россия	21982
128828	151	22003 Вайда-Губа                 Россия	22003
128829	151	22019 Полярное                   Россия	22019
128830	151	22028 Териберка                  Россия	22028
128831	151	22095 Колгуев Северный           Россия	22095
128832	151	22101 Янискоски                  Россия	22101
128833	151	22113 Мурманск                   Россия	22113
128834	151	22140 Святой Нос                 Россия	22140
128835	151	22165 Канин Нос                  Россия	22165
128836	151	22204 Ковдор                     Россия	22204
128837	151	22217 Кандалакша                 Россия	22217
128838	151	22235 Краснощелье                Россия	22235
128839	151	22249 Каневка                    Россия	22249
128840	151	22271 Шойна                      Россия	22271
128841	151	22292 Индига                     Россия	22292
128842	151	22324 Умба                       Россия	22324
128843	151	22355 Сосновец остров            Россия	22355
128844	151	22408 Калевала                   Россия	22408
128845	151	22422 Гридино                    Россия	22422
128846	151	22438 Жижгин                     Россия	22438
128847	151	22471 Мезень                     Россия	22471
128848	151	22520 Кемь-порт                  Россия	22520
128849	151	22550 Архангельск                Россия	22550
128850	151	22583 Койнас                     Россия	22583
128851	151	22602 Реболы                     Россия	22602
128852	151	22619 Паданы                     Россия	22619
128853	151	22641 Онега                      Россия	22641
128854	151	22676 Сура                       Россия	22676
128855	151	22768 Шенкурск                   Россия	22768
128856	151	22802 Сортавала                  Россия	22802
128857	151	22820 Петрозаводск               Россия	22820
128858	151	22837 Вытегра                    Россия	22837
128859	151	22845 Каргополь                  Россия	22845
128860	151	22854 Няндома                    Россия	22854
128861	151	22887 Котлас                     Россия	22887
128862	151	22892 Выборг                     Россия	22892
128863	151	22907 Гогланд                    Россия	22907
128864	151	22981 Великий Устюг              Россия	22981
128865	151	23022 Амдерма                    Россия	23022
128866	151	23032 Марресаля                  Россия	23032
128867	151	23058 Антипаюта                  Россия	23058
128868	151	23074 Дудинка                    Россия	23074
128869	151	23114 Мыс Константиновский       Россия	23114
128870	151	23146 Мыс Каменный               Россия	23146
128871	151	23205 Нарьян-Мар                 Россия	23205
128872	151	23219 Хоседа-Хард                Россия	23219
128873	151	23220 Елецкая                    Россия	23220
128874	151	23242 Новый Порт                 Россия	23242
128875	151	23256 Тазовск                    Россия	23256
128876	151	23274 Игарка                     Россия	23274
128877	151	23324 Петрунь                    Россия	23324
128878	151	23330 Салехард                   Россия	23330
128879	151	23331 Ра-Из                      Россия	23331
128880	151	23345 Ныда                       Россия	23345
128881	151	23365 Сидоровск                  Россия	23365
128882	151	23383 Агата                      Россия	23383
128884	151	23412 Усть-Уса                   Россия	23412
128885	151	23418 Печора                     Россия	23418
128886	151	23445 Надым                      Россия	23445
128887	151	23463 Янов Стан                  Россия	23463
128888	151	23472 Туруханск                  Россия	23472
128889	151	23514 Ираель                     Россия	23514
128890	151	23527 Саранпауль                 Россия	23527
128891	151	23552 Тарко-Сале                 Россия	23552
128892	151	23589 Тутончаны                  Россия	23589
128893	151	23631 Березово                   Россия	23631
128894	151	23656 Халесовая                  Россия	23656
128895	151	23662 Толька                     Россия	23662
128896	151	23678 Верхнеимбатск              Россия	23678
128897	151	23707 Усть-Вымь                  Россия	23707
128898	151	23711 Троицко-Печорское          Россия	23711
128899	151	23724 Няксимволь                 Россия	23724
128900	151	23734 Октябрьское                Россия	23734
128901	151	23804 Сыктывкар                  Россия	23804
128902	151	23849 Сургут                     Россия	23849
128903	151	23867 Ларьяк                     Россия	23867
128904	151	23884 Бор                        Россия	23884
128905	151	23891 Байкит                     Россия	23891
128906	151	23904 Койгородок                 Россия	23904
128907	151	23914 Чердынь                    Россия	23914
128908	151	23921 Ивдель                     Россия	23921
128909	151	23933 Ханты-Мансийск             Россия	23933
128910	151	23946 Угут                       Россия	23946
128911	151	23955 Александровское            Россия	23955
128912	151	23966 Ванжиль-Кынак              Россия	23966
128913	151	23986 Северо-Енисейский          Россия	23986
128914	151	24076 Депутатский                Россия	24076
128915	151	24105 Ессей                      Россия	24105
128916	151	24125 Оленек                     Россия	24125
128917	151	24136 Сухана                     Россия	24136
128918	151	24143 Джарджан                   Россия	24143
128919	151	24266 Верхоянск                  Россия	24266
128920	151	24329 Шелагонцы                  Россия	24329
128921	151	24343 Жиганск                    Россия	24343
128922	151	24371 Усть-Чаркы                 Россия	24371
128923	151	24382 Усть-Мома                  Россия	24382
128924	151	24507 Тура                       Россия	24507
128925	151	24538 Чумпурук                   Россия	24538
128926	151	24606 Кислокан                   Россия	24606
128927	151	24641 Вилюйск                    Россия	24641
128928	151	24643 Хатырык-Хомо               Россия	24643
128929	151	24661 Сеген-Кюель                Россия	24661
128930	151	24671 Томпо                      Россия	24671
128931	151	24679 Восточная                  Россия	24679
128932	151	24688 Оймякон                    Россия	24688
128933	151	24713 Наканно                    Россия	24713
128934	151	24726 Мирный                     Россия	24726
128935	151	24738 Сунтар                     Россия	24738
128936	151	24763 Крест-Хальджай             Россия	24763
128937	151	24790 Сусуман                    Россия	24790
128938	151	24802 Стрелка Чуня               Россия	24802
128939	151	24817 Ербогачен                  Россия	24817
128940	151	24908 Ванавара                   Россия	24908
128941	151	24923 Ленск                      Россия	24923
128942	151	24933 Килеер                     Россия	24933
128943	151	24944 Олекминск                  Россия	24944
128944	151	24951 Исить                      Россия	24951
128945	151	24959 Якутск                     Россия	24959
128946	151	24966 Усть-Мая                   Россия	24966
128947	151	24967 Тегюльтя                   Россия	24967
128948	151	24982 Уега                       Россия	24982
128949	151	25034 Амбарчик бухта             Россия	25034
128950	151	25042 Остров Айон                Россия	25042
128951	151	25062 Мыс Биллингс               Россия	25062
128952	151	25138 Островное                  Россия	25138
128953	151	25173 Мыс Шмидта                 Россия	25173
128954	151	25206 Среднеколымск              Россия	25206
128955	151	25248 Илирней                    Россия	25248
128956	151	25282 Мыс Ванкарем               Россия	25282
128957	151	25325 Усть-Олой                  Россия	25325
128958	151	25356 Эньмувеем                  Россия	25356
128959	151	25372 Амгуэма,87км               Россия	25372
128960	151	25378 Эгвекинот                  Россия	25378
128961	151	25399 Уэлен                      Россия	25399
128962	151	25400 Зырянка                    Россия	25400
128963	151	25428 Омолон                     Россия	25428
128964	151	25503 Коркодон                   Россия	25503
128965	151	25538 Верхне-Пенжино             Россия	25538
128966	151	25551 Марково                    Россия	25551
128967	151	25563 Анадырь                    Россия	25563
128968	151	25594 Бухта Провидения           Россия	25594
128969	151	25621 Кедон                      Россия	25621
128970	151	25656 Березово                   Россия	25656
128971	151	25677 Беринговская               Россия	25677
128972	151	25703 Сеймчан                    Россия	25703
128973	151	25705 Среднекан                  Россия	25705
128974	151	25744 Каменское                  Россия	25744
128975	151	25767 Хатырка                    Россия	25767
128976	151	25777 Гавриила бухта             Россия	25777
128977	151	25912 Ола                        Россия	25912
128978	151	25913 Магадан                    Россия	25913
128979	151	25916 Мыс Алевина                Россия	25916
128980	151	25922 Шелихово                   Россия	25922
128981	151	25927 Брохово                    Россия	25927
128982	151	25932 Тайгонос                   Россия	25932
128983	151	25954 Корф                       Россия	25954
128984	151	25956 Апука                      Россия	25956
128985	151	26038 Таллинн                    Эстония	26038
128986	151	26063 Санкт-Петербург            Россия	26063
128987	151	26069 Белогорка                  Россия	26069
128988	151	26094 Тихвин                     Россия	26094
128989	151	26157 Гдов                       Россия	26157
128990	151	26188 Веребье                    Россия	26188
128991	151	26231 Пярну                      Эстония	26231
128992	151	26258 Псков                      Россия	26258
128993	151	26275 Старая Русса               Россия	26275
128994	151	26298 Бологое                    Россия	26298
128995	151	26359 Пушкинские Горы            Россия	26359
128996	151	26406 Лиепая                     Латвия	26406
128997	151	26422 Рига                       Латвия	26422
128998	151	26477 Великие Луки               Россия	26477
128999	151	26479 Торопец                    Россия	26479
129000	151	26499 Старица                    Россия	26499
129001	151	26614 Советск                    Россия	26614
129002	151	26629 Каунас                     Литва	26629
129003	151	26701 Балтийск                   Россия	26701
129004	151	26702 Калининград                Россия	26702
129005	151	26706 Железнодорожный            Россия	26706
129006	151	26730 Вильнюс                    Литва	26730
129007	151	26781 Смоленск                   Россия	26781
129008	151	26850 Минск                      Беларусь	26850
129009	151	26898 Брянск                     Россия	26898
129010	151	26976 Красная Гора               Россия	26976
129011	151	26997 Трубчевск                  Россия	26997
129012	151	27008 Бабаево                    Россия	27008
129013	151	27037 Вологда,Прилуки            Россия	27037
129014	151	27051 Тотьма                     Россия	27051
129015	151	27066 Никольск                   Россия	27066
129016	151	27083 Опарино                    Россия	27083
129017	151	27164 Кологрив                   Россия	27164
129018	151	27199 Киров                      Россия	27199
129019	151	27208 Максатиха                  Россия	27208
129020	151	27225 Рыбинск,ГМО                Россия	27225
129021	151	27277 Ветлуга                    Россия	27277
129022	151	27296 Кумены                     Россия	27296
129023	151	27333 Кострома                   Россия	27333
129024	151	27385 Яранск                     Россия	27385
129025	151	27425 Переславль-Залесский       Россия	27425
129026	151	27459 Нижний Новгород            Россия	27459
129027	151	27485 Йошкар-Ола                 Россия	27485
129028	151	27509 Можайск                    Россия	27509
129029	151	27595 Казань                     Россия	27595
129030	151	27612 Москва, ВДНХ               Россия	27612
129031	151	27625 Коломна                    Россия	27625
129032	151	27648 Елатьма                    Россия	27648
129033	151	27665 Лукоянов                   Россия	27665
129034	151	27675 Порецкое                   Россия	27675
129035	151	27707 Сухиничи                   Россия	27707
129036	151	27730 Рязань                     Россия	27730
129037	151	27756 Краснослободск             Россия	27756
129038	151	27814 Плавск                     Россия	27814
129039	151	27823 Павелец                    Россия	27823
129040	151	27857 Земетчино                  Россия	27857
129041	151	27872 Инза                       Россия	27872
129042	151	27947 Тамбов                     Россия	27947
129043	151	27962 Пенза                      Россия	27962
129044	151	27995 Безенчук                   Россия	27995
129045	151	28009 Кирс                       Россия	28009
129046	151	28064 Леуши                      Россия	28064
129047	151	28138 Бисер                      Россия	28138
129048	151	28144 Верхотурье                 Россия	28144
129049	151	28224 Пермь                      Россия	28224
129050	151	28255 Туринск                    Россия	28255
129051	151	28275 Тобольск                   Россия	28275
129052	151	28312 Дебессы                    Россия	28312
129053	151	28367 Тюмень                     Россия	28367
129054	151	28402 Кильмезь                   Россия	28402
129055	151	28411 Ижевск                     Россия	28411
129056	151	28418 Сарапул                    Россия	28418
129057	151	28419 Янаул                      Россия	28419
129058	151	28434 Красноуфимск               Россия	28434
129059	151	28440 Екатеринбург               Россия	28440
129060	151	28445 Верхнее Дуброво            Россия	28445
129061	151	28493 Тара                       Россия	28493
129062	151	28506 Елабуга                    Россия	28506
129063	151	28537 Дуван                      Россия	28537
129064	151	28552 Шадринск                   Россия	28552
129065	151	28561 Памятная                   Россия	28561
129066	151	28573 Ишим                       Россия	28573
129067	151	28624 Кушнаренково               Россия	28624
129068	151	28630 Златоуст                   Россия	28630
129069	151	28661 Курган                     Россия	28661
129070	151	28666 Макушино                   Россия	28666
129071	151	28679 Петропавловск              Казахстан	28679
129072	151	28698 Омск                       Россия	28698
129073	151	28704 Чулпаново                  Россия	28704
129074	151	28719 Аксаково                   Россия	28719
129075	151	28722 Уфа                        Россия	28722
129076	151	28748 Троицк                     Россия	28748
129077	151	28802 Серноводск                 Россия	28802
129078	151	28823 Тукан                      Россия	28823
129079	151	28825 Стерлитамак                Россия	28825
129080	151	28833 Верхнеуральск              Россия	28833
129081	151	28895 Русская Поляна             Россия	28895
129082	151	28900 Самара                     Россия	28900
129083	151	28952 Кустанай/Костанай          Казахстан	28952
129084	151	29023 Напас                      Россия	29023
129085	151	29111 Средний Васюган            Россия	29111
129086	151	29154 Усть-Озерное               Россия	29154
129087	151	29231 Колпашево                  Россия	29231
129088	151	29263 Енисейск                   Россия	29263
129089	151	29282 Богучаны                   Россия	29282
129090	151	29313 Пудино                     Россия	29313
129091	151	29328 Бакчар                     Россия	29328
129092	151	29348 Первомайское               Россия	29348
129093	151	29379 Тасеево                    Россия	29379
129094	151	29393 Червянка                   Россия	29393
129095	151	29418 Северное                   Россия	29418
129096	151	29430 Томск                      Россия	29430
129097	151	29467 Ачинск, ж.д.ст.            Россия	29467
129098	151	29539 Болотное                   Россия	29539
129099	151	29541 Тайга                      Россия	29541
129100	151	29557 Тисуль                     Россия	29557
129101	151	29570 Красноярск, оп.п.          Россия	29570
129102	151	29580 Солянка                    Россия	29580
129103	151	29594 Тайшет                     Россия	29594
129104	151	29605 Татарск                    Россия	29605
129105	151	29612 Барабинск                  Россия	29612
129106	151	29638 Огурцово                   Россия	29638
129107	151	29645 Кемерово                   Россия	29645
129108	151	29664 Светлолобово               Россия	29664
129109	151	29698 Нижнеудинск                Россия	29698
129110	151	29752 Ненастная                  Россия	29752
129111	151	29789 Верхняя Гутара             Россия	29789
129112	151	29807 Иртышск                    Казахстан	29807
129113	151	29822 Камень-на-Оби              Россия	29822
129114	151	29838 Барнаул                    Россия	29838
129115	151	29849 Кузедеево                  Россия	29849
129116	151	29858 Неожиданный                Россия	29858
129117	151	29862 Абакан                     Россия	29862
129118	151	29866 Минусинск                  Россия	29866
129119	151	29915 Славгород                  Россия	29915
129120	151	29923 Ребриха                    Россия	29923
129121	151	29939 Бийск-Зональная            Россия	29939
129122	151	29974 Оленья Речка               Россия	29974
129123	151	29998 Орлик                      Россия	29998
129124	151	30028 Ика                        Россия	30028
129125	151	30054 Витим                      Россия	30054
129126	151	30069 Перевоз                    Россия	30069
129127	151	30089 Джикимда                   Россия	30089
129128	151	30209 Ершово                     Россия	30209
129129	151	30219 Максимово                  Россия	30219
129130	151	30230 Киренск                    Россия	30230
129131	151	30252 Мамакан                    Россия	30252
129132	151	30253 Бодайбо                    Россия	30253
129133	151	30309 Братск                     Россия	30309
129134	151	30328 Орлинга                    Россия	30328
129135	151	30337 Казачинское                Россия	30337
129136	151	30356 Таксимо                    Россия	30356
129137	151	30372 Чара                       Россия	30372
129138	151	30385 Усть-Нюкжа                 Россия	30385
129139	151	30393 Чульман                    Россия	30393
129140	151	30433 Нижнеангарск               Россия	30433
129141	151	30437 Карам                      Россия	30437
129142	151	30469 Калакан                    Россия	30469
129143	151	30471 Средний Калар              Россия	30471
129144	151	30484 Средняя Олекма             Россия	30484
129145	151	30493 Нагорный                   Россия	30493
129146	151	30504 Тулун                      Россия	30504
129147	151	30521 Жигалово                   Россия	30521
129148	151	30536 Баргузинский запов-к       Россия	30536
129149	151	30554 Багдарин                   Россия	30554
129150	151	30555 Троицкий Прииск            Россия	30555
129151	151	30565 Усть-Каренга               Россия	30565
129152	151	30612 Балаганск                  Россия	30612
129153	151	30627 Баяндай                    Россия	30627
129154	151	30632 Большой Ушканий о-в        Россия	30632
129155	151	30635 Усть-Баогузин              Россия	30635
129156	151	30636 Баргузин                   Россия	30636
129157	151	30650 Романовка                  Россия	30650
129158	151	30673 Могоча                     Россия	30673
129159	151	30692 Сковородино                Россия	30692
129160	151	30695 Джалинда                   Россия	30695
129161	151	30703 Инга                       Россия	30703
129162	151	30710 Иркутск, обсерв.           Россия	30710
129163	151	30716 Хомутово                   Россия	30716
129164	151	30727 Большое Голоустное         Россия	30727
129165	151	30745 Сосново-Озерское           Россия	30745
129166	151	30758 Чита                       Россия	30758
129167	151	30777 Сретенск                   Россия	30777
129168	151	30811 Тунка                      Россия	30811
129169	151	30815 Хамар-Дабан                Россия	30815
129170	151	30822 Бабушкин                   Россия	30822
129171	151	30823 Улан-Удэ                   Россия	30823
129172	151	30825 Иволгинск                  Россия	30825
129173	151	30844 Хилок                      Россия	30844
129174	151	30859 Агинское                   Россия	30859
129175	151	30879 Нерчинский з-д             Россия	30879
129176	151	30915 Цакир                      Россия	30915
129177	151	30925 Кяхта                      Россия	30925
129178	151	30935 Красный Чикой              Россия	30935
129179	151	30949 Кыра                       Россия	30949
129180	151	30954 Мангут                     Россия	30954
129181	151	30965 Борзя                      Россия	30965
129182	151	31004 Алдан                      Россия	31004
129183	151	31026 Учур                       Россия	31026
129184	151	31062 Югаренок                   Россия	31062
129185	151	31088 Охотск                     Россия	31088
129186	151	31092 Талон                      Россия	31092
129187	151	31102 Канку                      Россия	31102
129188	151	31137 Токо                       Россия	31137
129189	151	31152 Нелькан                    Россия	31152
129190	151	31168 Аян                        Россия	31168
129191	151	31174 Большой Шантар             Россия	31174
129192	151	31235 Джана                      Россия	31235
129193	151	31253 Бомнак                     Россия	31253
129194	151	31285 Удское                     Россия	31285
129195	151	31329 Экимчан                    Россия	31329
129196	151	31362 Литке                      Россия	31362
129197	151	31369 Николаевск-на-Амуре        Россия	31369
129198	151	31371 Черняево                   Россия	31371
129199	151	31388 Норск                      Россия	31388
129200	151	31416 Им. Полины Осипенко        Россия	31416
129201	151	31436 Джаоре                     Россия	31436
129202	151	31439 Богородское                Россия	31439
129203	151	31443 Мазаново                   Россия	31443
129204	151	31459 Верхняя Томь               Россия	31459
129205	151	31478 Софийский Прииск           Россия	31478
129206	151	31510 Благовещенск               Россия	31510
129207	151	31532 Чекунда                    Россия	31532
129208	151	31538 Сутур                      Россия	31538
129209	151	31562 Нижнетамбовское            Россия	31562
129210	151	31586 Константиновка             Россия	31586
129211	151	31594 Архара                     Россия	31594
129212	151	31677 Солекуль                   Россия	31677
129213	151	31707 Екатерино-Никольское       Россия	31707
129214	151	31725 Смидович                   Россия	31725
129215	151	31733 Елабуга                    Россия	31733
129216	151	31735 Хабаровск                  Россия	31735
129217	151	31770 Советская Гавань           Россия	31770
129218	151	31788 Лермонтовка                Россия	31788
129219	151	31829 Золотой                    Россия	31829
129220	151	31845 Красный Яр                 Россия	31845
129221	151	31873 Дальнереченск              Россия	31873
129222	151	31895 Мельничное                 Россия	31895
129223	151	31909 Терней                     Россия	31909
129224	151	31915 Пограничный                Россия	31915
129225	151	31931 Свиягино                   Россия	31931
129226	151	31959 Рудная Пристань            Россия	31959
129227	151	31960 Владивосток                Россия	31960
129228	151	31961 Тимирязевский              Россия	31961
129229	151	31969 Посьет                     Россия	31969
129230	151	31989 Преображение               Россия	31989
129231	151	32014 Москальво                  Россия	32014
129232	151	32027 Погиби                     Россия	32027
129233	151	32053 Ноглики                    Россия	32053
129234	151	32061 Александровск-Сахал.       Россия	32061
129235	151	32071 Тымовское                  Россия	32071
129236	151	32076 Пограничное                Россия	32076
129237	151	32088 Углегорск                  Россия	32088
129238	151	32098 Поронайск                  Россия	32098
129239	151	32099 Мыс Терпения               Россия	32099
129240	151	32121 Ильинский                  Россия	32121
129241	151	32145 Невельск                   Россия	32145
129242	151	32149 Мыс Крильон                Россия	32149
129243	151	32150 Южно-Сахалинск             Россия	32150
129244	151	32165 Южно-Курильск              Россия	32165
129245	151	32174 Курильск                   Россия	32174
129246	151	32213 Мыс Лопатка                Россия	32213
129247	151	32246 Оссора                     Россия	32246
129248	151	32252 Усть-Воямполка             Россия	32252
129249	151	32287 Усть-Хайрюзово             Россия	32287
129250	151	32363 Эссо                       Россия	32363
129251	151	32389 Ключи                      Россия	32389
129252	151	32411 Ича                        Россия	32411
129253	151	32447 Долиновка                  Россия	32447
129254	151	32477 Соболево                   Россия	32477
129255	151	32509 Семячик                    Россия	32509
129256	151	32539 Начики                     Россия	32539
129257	151	32547 Сосновка                   Россия	32547
129258	151	32562 Большерецк                 Россия	32562
129259	151	32564 Октябрьская                Россия	32564
129260	151	32583 Петропавловск-Камчатск.    Россия	32583
129261	151	32586 Петропавловский маяк       Россия	32586
129262	151	32618 Остров Беринга             Россия	32618
129263	151	33008 Брест                      Беларусь	33008
129264	151	33038 Василевичи                 Беларусь	33038
129265	151	33166 Рыльск                     Россия	33166
129266	151	33345 Киев                       Украина	33345
129267	151	33377 Лубны                      Украина	33377
129268	151	33393 Львов                      Украина	33393
129269	151	33562 Винница                    Украина	33562
129270	151	33631 Ужгород                    Украина	33631
129271	151	33658 Черновцы                   Украина	33658
129272	151	33815 Кишинев                    Молдова	33815
129273	151	33837 Одесса                     Украина	33837
129274	151	33889 Измаил                     Украина	33889
129275	151	33910 Геническ                   Украина	33910
129276	151	33915 Аскания-Нова               Украина	33915
129277	151	33946 Симферополь                Россия	33946
129278	151	33976 Феодосия                   Россия	33976
129279	151	33983 Керчь                      Россия	33983
129280	151	34003 Поныри                     Россия	34003
129281	151	34009 Курск                      Россия	34009
129282	151	34026 Конь-Колодезь              Россия	34026
129283	151	34059 Росташи                    Россия	34059
129284	151	34110 Богородицкое-Фенино        Россия	34110
129285	151	34123 Воронеж                    Россия	34123
129286	151	34139 Каменная Степь             Россия	34139
129287	151	34152 Балашов                    Россия	34152
129288	151	34163 Октябрьский городок        Россия	34163
129289	151	34172 Саратов                    Россия	34172
129290	151	34186 Ершов                      Россия	34186
129291	151	34202 Готня                      Россия	34202
129292	151	34240 Урюпинск                   Россия	34240
129293	151	34247 Калач                      Россия	34247
129294	151	34289 Новоузенск                 Россия	34289
129295	151	34300 Харьков                    Украина	34300
129296	151	34321 Валуйки                    Россия	34321
129297	151	34356 Фролово                    Россия	34356
129298	151	34391 Александров Гай            Россия	34391
129299	151	34432 Чертково                   Россия	34432
129300	151	34476 Эльтон                     Россия	34476
129301	151	34524 Дебальцево                 Украина	34524
129302	151	34561 Волгоград                  Россия	34561
129303	151	34579 Верхний Баскунчак          Россия	34579
129304	151	34646 Цимлянск(Волгодонск)       Россия	34646
129305	151	34720 Таганрог                   Россия	34720
129306	151	34730 Ростов-на-Дону             Россия	34730
129307	151	34740 Гигант                     Россия	34740
129308	151	34747 Целина                     Россия	34747
129309	151	34759 Ремонтное                  Россия	34759
129310	151	34824 Приморско-Ахтарск          Россия	34824
129311	151	34861 Элиста                     Россия	34861
129312	151	34866 Яшкуль                     Россия	34866
129313	151	34880 Астрахань                  Россия	34880
129314	151	34927 Краснодар, Круглик         Россия	34927
129315	151	34949 Ставрополь, АМСГ           Россия	34949
129316	151	34984 Лагань                     Россия	34984
129317	151	35007 Перелюб                    Россия	35007
129318	151	35011 Сорочинск                  Россия	35011
129319	151	35026 Зилаир                     Россия	35026
129320	151	35041 Бреды                      Россия	35041
129321	151	35078 Атбасар                    Казахстан	35078
129322	151	35108 Уральск                    Казахстан	35108
129323	151	35121 Оренбург                   Россия	35121
129324	151	35127 Акбулак                    Россия	35127
129325	151	35133 Адамовка                   Россия	35133
129326	151	35188 Целиноград/Астана          Казахстан	35188
129327	151	35229 Актюбинск/Актобе           Казахстан	35229
129328	151	35233 Домбаровский               Россия	35233
129329	151	35358 Тургай/Торгай              Казахстан	35358
129330	151	35394 Караганда                  Казахстан	35394
129331	151	35406 Калмыково                  Казахстан	35406
129332	151	35416 Уил                        Казахстан	35416
129333	151	35542 Иргиз                      Казахстан	35542
129334	151	35576 Кызылжар                   Казахстан	35576
129335	151	35663 Карсакпай                  Казахстан	35663
129336	151	35700 Гурьев/Атырау              Казахстан	35700
129337	151	35746 Аральское море             Казахстан	35746
129338	151	35796 Балхаш                     Казахстан	35796
129339	151	36034 Рубцовск                   Россия	36034
129340	151	36038 Змеиногорск                Россия	36038
129341	151	36045 Солонешное                 Россия	36045
129342	151	36055 Кызыл-Озек                 Россия	36055
129343	151	36064 Яйлю                       Россия	36064
129344	151	36096 Кызыл                      Россия	36096
129345	151	36099 Сосновка                   Россия	36099
129346	151	36103 Тоора-Хем                  Россия	36103
129347	151	36177 Семипалатинск/Семей        Казахстан	36177
129348	151	36229 Усть-Кокса                 Россия	36229
129349	151	36259 Кош-Агач                   Россия	36259
129350	151	36278 Мугур-Аксы                 Россия	36278
129351	151	36307 Эрзин                      Россия	36307
129352	151	36442 Кара-Тюрек                 Россия	36442
129353	151	36665 Зайсан                     Казахстан	36665
129354	151	36729 Учарал                     Казахстан	36729
129355	151	36859 Панфилов                   Казахстан	36859
129356	151	36870 Алматы/Алма-Ата            Казахстан	36870
129357	151	36974 Нарын                      Кыргызстан	36974
129358	151	37001 Анапа,МГ                   Россия	37001
129359	151	37018 Туапсе                     Россия	37018
129360	151	37031 Армавир                    Россия	37031
129361	151	37050 Пятигорск                  Россия	37050
129362	151	37054 Минеральные Воды           Россия	37054
129363	151	37061 Буденновск                 Россия	37061
129364	151	37075 Южно-Сухокумск             Россия	37075
129365	151	37089 Тюлений остров             Россия	37089
129366	151	37099 Сочи                       Россия	37099
129367	151	37107 Красная Поляна             Россия	37107
129368	151	37112 Зеленчукская               Россия	37112
129369	151	37123 Кисловодск                 Россия	37123
129370	151	37126 Шаджатмаз                  Россия	37126
129371	151	37196 Клухорский перевал         Россия	37196
129372	151	37228 Владикавказ                Россия	37228
129373	151	37235 Грозный                    Россия	37235
129374	151	37244 Гудермес                   Россия	37244
129375	151	37385 Самтредиа                  Грузия	37385
129376	151	37461 Сулак,высокогорная         Россия	37461
129377	151	37470 Дербент                    Россия	37470
129378	151	37471 Буйнакск                   Россия	37471
129379	151	37472 Махачкала                  Россия	37472
129380	151	37549 Тбилиси                    Грузия	37549
129381	151	37663 Ахты                       Россия	37663
129382	151	37686 Ленинакан/Гумри            Армения	37686
129383	151	37735 Кировобад/Гянжа            Азербайджан	37735
129384	151	37789 Ереван                     Армения	37789
129385	151	38198 Туркестан                  Казахстан	38198
129386	151	38262 Чимбай                     Узбекистан	38262
129387	151	38353 Фрунзе/Бишкек              Кыргызстан	38353
129388	151	38413 Тамды                      Узбекистан	38413
129389	151	38457 Ташкент                    Узбекистан	38457
129390	151	38507 Красноводск/Туркменбаши    Туркменистан	38507
129391	151	38599 Ленинабад/Худжент          Таджикистан	38599
129392	151	38618 Фергана                    Узбекистан	38618
129393	151	38687 Чарджоу/Чарджев            Туркменистан	38687
129394	151	38696 Самарканд                  Узбекистан	38696
129395	151	38750 Гасан-Кули/Эсенгули        Туркмениcтан	38750
129396	151	38763 Кизыл-Арват/Гизыларбат     Туркменистан	38763
129397	151	38836 Душанбе                    Таджикистан	38836
129398	151	38880 Ашхабад/Ашгабат            Туркменистан	38880
129399	151	38895 Байрам-Али/Байрамалы       Туркменистан	38895
129400	151	38927 Термез                     Узбекистан	38927
129401	151	38933 Курган-Тюбе                Таджикистан	38933
129402	151	38954 Хорог                      Таджикистан	38954
129403	151	38974 Серахс/Сарагт              Туркменистан	38974
129404	151	38987 Кушка/Гышгы                Туркменистан	38987
129405	152	22217 Кандалакша	22217
129406	152	22235 Краснощелье	22235
129407	152	22324 Умба	22324
129408	152	22408 Калевала	22408
129409	152	22471 Мезень	22471
129410	152	22583 Койнас	22583
129411	152	22602 Реболы	22602
129412	152	22619 Паданы	22619
129413	152	22641 Онега	22641
129414	152	22676 Сура	22676
129415	152	22768 Шенкурск	22768
129416	152	22802 Сортавала	22802
129417	152	22820 Петрозаводск	22820
129418	152	22837 Вытегра	22837
129419	152	22845 Каргополь	22845
129420	152	22981 Великий Устюг	22981
129421	152	23205 Нарьян-Мар	23205
129422	152	23330 Салехард	23330
129423	152	23405 Усть-Цильма	23405
129424	152	23412 Усть-Уса	23412
129425	152	23631 Березово	23631
129426	152	23678 Верхнеимбатск	23678
129427	152	23707 Усть-Вымь	23707
129428	152	23711 Троицко-Печорское	23711
129429	152	23804 Сыктывкар	23804
129430	152	23867 Ларьяк	23867
129431	152	23904 Койгородок,АМСГ	23904
129432	152	23914 Чердынь	23914
129433	152	23921 Ивдель	23921
129434	152	23955 Александровское	23955
129435	152	24507 Тура	24507
129436	152	24606 Кислокан	24606
129437	152	24713 Наканно,АМСГ	24713
129438	152	24738 Сунтар	24738
129439	152	24763 Крест-Хальджай	24763
129440	152	24790 Сусуман	24790
129441	152	24817 Ербогачен	24817
129442	152	24908 Ванавара	24908
129443	152	24923 Ленск	24923
129444	152	24944 Олекминск	24944
129445	152	24951 Исить	24951
129446	152	24959 Якутск	24959
129447	152	24966 Усть-Мая	24966
129448	152	24982 Уега	24982
129449	152	25138 Островное	25138
129450	152	25248 Илирней	25248
129451	152	25356 Эньмувеем	25356
129452	152	25372 Амгуэма,87 км	25372
129453	152	25428 Омолон	25428
129454	152	25503 Коркодон	25503
129455	152	25551 Марково	25551
129456	152	25563 Анадырь	25563
129457	152	25677 Беринговская	25677
129458	152	25705 Среднекан	25705
129459	152	25744 Каменское	25744
129460	152	25767 Хатырка	25767
129461	152	25912 Ола	25912
129462	152	25913 Магадан,Нагаева бухта	25913
129463	152	25922 Шелихово	25922
129464	152	25927 Брохово	25927
129465	152	25954 Корф	25954
129466	152	25956 Апука	25956
129467	152	26063 Санкт-Петербург	26063
129468	152	26069 Белогорка	26069
129469	152	26094 Тихвин	26094
129470	152	26157 Гдов	26157
129471	152	26188 Веребье	26188
129472	152	26258 Псков	26258
129473	152	26275 Старая Русса	26275
129474	152	26298 Бологое	26298
129475	152	26359 Пушкинские Горы	26359
129476	152	26477 Великие Луки	26477
129477	152	26479 Торопец	26479
129478	152	26614 Советск	26614
129479	152	26701 Балтийск	26701
129480	152	26702 Калининград	26702
129481	152	26706 Железнодорожный	26706
129482	152	26781 Смоленск	26781
129484	152	26976 Красная Гора	26976
129485	152	26997 Трубчевск	26997
129486	152	27008 Бабаево	27008
129487	152	27037 Вологда,Прилуки	27037
129488	152	27051 Тотьма	27051
129489	152	27066 Никольск	27066
129490	152	27083 Опарино	27083
129491	152	27164 Кологрив	27164
129492	152	27277 Ветлуга	27277
129493	152	27296 Кумены	27296
129494	152	27333 Кострома	27333
129495	152	27385 Яранск	27385
129496	152	27485 Йошкар-Ола	27485
129497	152	27509 Можайск	27509
129498	152	27612 Москва,ВДНХ	27612
129499	152	27625 Коломна	27625
129500	152	27648 Елатьма	27648
129501	152	27665 Лукоянов	27665
129502	152	27675 Порецкое	27675
129503	152	27707 Сухиничи	27707
129504	152	27756 Краснослободск	27756
129505	152	27814 Плавск	27814
129506	152	27823 Павелец	27823
129507	152	27857 Земетчино	27857
129508	152	27947 Тамбов	27947
129509	152	27962 Пенза,ГМО	27962
129510	152	27995 Безенчук	27995
129511	152	28009 Кирс	28009
129512	152	28064 Леуши	28064
129513	152	28138 Бисер	28138
129514	152	28144 Верхотурье	28144
129515	152	28224 Пермь	28224
129516	152	28255 Туринск	28255
129517	152	28275 Тобольск	28275
129518	152	28312 Дебессы	28312
129519	152	28367 Тюмень	28367
129520	152	28402 Кильмезь	28402
129521	152	28418 Сарапул	28418
129522	152	28419 Янаул	28419
129523	152	28434 Красноуфимск	28434
129524	152	28445 Верхнее дуброво	28445
129525	152	28493 Тара	28493
129526	152	28537 Дуван	28537
129527	152	28552 Шадринск	28552
129528	152	28561 Памятная	28561
129529	152	28573 Ишим	28573
129530	152	28624 Кушнаренково	28624
129531	152	28630 Златоуст	28630
129532	152	28661 Курган,Вороновка	28661
129533	152	28666 Макушино	28666
129534	152	28698 Омск,степная	28698
129535	152	28704 Чулпаново	28704
129536	152	28719 Аксаково	28719
129537	152	28748 Троицк	28748
129538	152	28825 Стерлитамак	28825
129539	152	28833 Верхнеуральск	28833
129540	152	28895 Русская Поляна	28895
129541	152	28900 Самара,ОГМС	28900
129542	152	29023 Напас	29023
129543	152	29111 Средний Васюган	29111
129544	152	29154 Усть-Озерное	29154
129545	152	29231 Колпашево	29231
129546	152	29263 Енисейск	29263
129547	152	29282 Богучаны	29282
129548	152	29313 Пудино	29313
129549	152	29328 Бакчар	29328
129550	152	29348 Первомайское	29348
129551	152	29379 Тасеево	29379
129552	152	29393 Червянка	29393
129553	152	29418 Северное	29418
129554	152	29430 Томск	29430
129555	152	29467 Ачинск,ж.д.ст.	29467
129556	152	29539 Болотное	29539
129557	152	29541 Тайга	29541
129558	152	29557 Тисуль	29557
129559	152	29570 Красноярск,оп.п.	29570
129560	152	29580 Солянка	29580
129561	152	29594 Тайшет	29594
129562	152	29605 Татарск	29605
129563	152	29612 Барабинск	29612
129564	152	29638 Огурцово	29638
129565	152	29645 Кемерово,АГРО	29645
129566	152	29664 Светлолобово	29664
129567	152	29698 Нижнеудинск	29698
129568	152	29789 Верхняя Гутара	29789
129569	152	29822 Камень-на-Оби	29822
129570	152	29838 Барнаул	29838
129571	152	29849 Кузедеево	29849
129572	152	29862 Абакан (Хак. ЦГМС)	29862
129573	152	29866 Минусинск	29866
129574	152	29915 Славгород	29915
129575	152	29923 Ребриха	29923
129576	152	29939 Бийск-Зональная	29939
129577	152	30054 Витим	30054
129578	152	30069 Перевоз	30069
129579	152	30219 Максимово	30219
129580	152	30230 Киренск	30230
129581	152	30309 Братск,обс.	30309
129582	152	30328 Орлинга	30328
129583	152	30337 Казачинское,АМСГ	30337
129584	152	30356 Таксимо	30356
129585	152	30372 Чара	30372
129586	152	30437 Карам	30437
129587	152	30504 Тулун	30504
129588	152	30521 Жигалово	30521
129589	152	30536 Баргузинский заповед	30536
129590	152	30554 Богдарин	30554
129591	152	30612 Балаганск	30612
129592	152	30627 Баяндай	30627
129593	152	30632 Большой Ушканий,о.	30632
129594	152	30636 Баргузин	30636
129595	152	30673 Могоча	30673
129596	152	30692 Сковородино	30692
129597	152	30710 Иркутск,обс.	30710
129598	152	30716 Хомутово	30716
129599	152	30745 Сосново-Озерское	30745
129600	152	30758 Чита	30758
129601	152	30777 Сретенск	30777
129602	152	30811 Тунка	30811
129604	152	30823 Улан-Удэ,город	30823
129605	152	30825 Иволгинск	30825
129606	152	30844 Хилок	30844
129607	152	30859 Агинское	30859
129608	152	30879 Нерчинский з-д	30879
129609	152	30915 Цакир	30915
129610	152	30925 Кяхта	30925
129611	152	30935 Красный Чикой	30935
129612	152	30949 Кыра	30949
129613	152	30954 Мангут	30954
129614	152	30965 Борзя	30965
129615	152	31088 Охотск	31088
129616	152	31092 Талон	31092
129617	152	31168 Аян	31168
129618	152	31253 Бомнак	31253
129619	152	31369 Николаевск-на-Амуре	31369
129620	152	31371 Черняево	31371
129621	152	31416 Им.П.Осипенко	31416
129622	152	31439 Богородское	31439
129623	152	31443 Мазаново	31443
129624	152	31510 Благовещенск	31510
129625	152	31586 Константиновка	31586
129626	152	31594 Архара	31594
129627	152	31707 Екатерино-Никольское	31707
129628	152	31725 Смидович	31725
129629	152	31788 Лермонтовка	31788
129630	152	31873 Дальнереченск	31873
129631	152	31909 Терней	31909
129632	152	31915 Пограничный	31915
129633	152	31931 Свиягино	31931
129634	152	31960 Владивосток,порт	31960
129635	152	31961 Тимирязевский	31961
129636	152	31969 Посьет	31969
129637	152	32053 Ноглики	32053
129638	152	32061 Александровск-Сахал.	32061
129639	152	32071 Тымовское	32071
129640	152	32088 Углегорск	32088
129641	152	32099 Мыс Терпения	32099
129642	152	32121 Ильинский	32121
129643	152	32145 Невельск	32145
129644	152	32149 Мыс Крильон	32149
129645	152	32150 Южно-Сахалинск	32150
129646	152	32165 Южно-Курильск	32165
129647	152	32174 Курильск	32174
129648	152	32213 Мыс Лопатка	32213
129649	152	32252 Усть-Воямполка	32252
129650	152	32287 Усть-Хайрюзово	32287
129651	152	32363 Эссо	32363
129652	152	32389 Ключи	32389
129653	152	32411 Ича	32411
129654	152	32447 Долиновка	32447
129655	152	32477 Соболево	32477
129656	152	32539 Начики	32539
129657	152	32547 Сосновка	32547
129658	152	32562 Большерецк	32562
129659	152	32564 Октябрьская	32564
129660	152	32586 Петроп.-Камч.,маяк	32586
129661	152	32618 Никольское(О.Беринга)	32618
129662	152	33166 Рыльск	33166
129663	152	34003 Поныри	34003
129664	152	34009 Курск,АЭ	34009
129665	152	34059 Ростоши	34059
129666	152	34110 Богородицкое-Фенино	34110
129667	152	34123 Воронеж,АГРО	34123
129668	152	34139 Каменная степь	34139
129669	152	34163 Октябрьский Городок	34163
129670	152	34172 Саратов,цгмс	34172
129671	152	34186 Ершов	34186
129672	152	34202 Готня	34202
129673	152	34240 Урюпинск	34240
129674	152	34247 Калач,аэ	34247
129675	152	34321 Валуйки	34321
129676	152	34356 Фролово	34356
129677	152	34391 Александров Гай	34391
129678	152	34432 Чертково	34432
129679	152	34476 Эльтон	34476
129680	152	34579 Верхний Баскунчак	34579
129681	152	34646 Цимлянск	34646
129682	152	34720 Таганрог	34720
129683	152	34740 Гигант	34740
129684	152	34747 Целина	34747
129685	152	34759 Ремонтное	34759
129686	152	34824 Приморско-Ахтарск	34824
129687	152	34861 Элиста,АМСГ	34861
129688	152	34880 Астрахань,ГМО	34880
129689	152	34949 Ставрополь,АМСГ	34949
129690	152	35026 Зилаир	35026
129691	152	35041 Бреды	35041
129692	152	35121 Оренбург,ЗГМО	35121
129693	152	35133 Адамовка,АМСГ	35133
129694	152	35233 Домбаровский	35233
129695	152	36034 Рубцовск	36034
129696	152	36038 Змеиногорск	36038
129697	152	36045 Солонешное	36045
129698	152	36055 Кызыл-Озек	36055
129699	152	36064 Яйлю	36064
129700	152	36096 Кызыл (Тув. ЦГМС)	36096
129701	152	36099 Сосновка	36099
129702	152	36229 Усть-Кокса	36229
129703	152	36259 Кош-Агач	36259
129704	152	36307 Эрзин	36307
129705	152	37001 Анапа,МГ	37001
129706	152	37031 Армавир,АМСГ	37031
129707	152	37050 Пятигорск,АМСГ	37050
129708	152	37061 Буденновск	37061
129709	152	37075 Южно-Сухокумск	37075
129710	152	37099 Сочи,ГМО	37099
129711	152	37112 Зеленчукская	37112
129712	152	37123 Кисловодск	37123
129713	152	37126 Шаджатмаз	37126
129714	152	37235 Грозный,АМСГ	37235
129715	152	37244 Гудермес	37244
129716	152	37470 Дербент	37470
129717	152	37471 Буйнакск	37471
129718	152	37472 Махачкала	37472
129719	152	37663 Ахты	37663
129720	153	20046 Им.Э.Т.Кренкеля,ГМО	20046
129721	153	20069 Визе	20069
129722	153	20087 Голомянный	20087
129723	153	20107 Баренцбург	20107
129724	153	20289 Русский	20289
129725	153	20292 Им.Е.К.Федорова,ГМО	20292
129726	153	20476 Стерлегова	20476
129727	153	20667 Им.М.В.Попова	20667
129728	153	20674 Диксон	20674
129729	153	20744 Малые Кармакулы	20744
129730	153	20891 Хатанга	20891
129731	153	20946 Им.Е.К.Федорова	20946
129732	153	20982 Волочанка	20982
129733	153	21432 Котельный	21432
129734	153	21611 Терпяй-Тумса	21611
129735	153	21647 Шалаурова	21647
129736	153	21802 Саскылах	21802
129737	153	21824 Тикси	21824
129738	153	21908 Джалинда	21908
129739	153	21921 Кюсюр	21921
129740	153	21931 Юбилейная	21931
129741	153	21946 Чокурдах	21946
129742	153	21982 Остров Врангеля	21982
129743	153	22003 Вайда-Губа	22003
129744	153	22019 Полярное	22019
129745	153	22028 Териберка	22028
129746	153	22095 Колгуев Северный	22095
129747	153	22101 Янискоски	22101
129748	153	22113 Мурманск	22113
129749	153	22140 Святой Нос	22140
129750	153	22165 Канин Нос	22165
129751	153	22204 Ковдор	22204
129752	153	22217 Кандалакша	22217
129753	153	22235 Краснощелье	22235
129754	153	22249 Каневка	22249
129755	153	22271 Шойна	22271
129756	153	22292 Индига	22292
129757	153	22324 Умба	22324
129758	153	22355 Сосновец остров	22355
129759	153	22408 Калевала	22408
129760	153	22422 Гридино	22422
129761	153	22438 Жижгин	22438
129762	153	22471 Мезень	22471
129763	153	22520 Кемь-порт	22520
129764	153	22550 Архангельск	22550
129765	153	22583 Койнас	22583
129766	153	22602 Реболы	22602
129767	153	22619 Паданы	22619
129768	153	22641 Онега	22641
129769	153	22676 Сура	22676
129770	153	22768 Шенкурск	22768
129771	153	22802 Сортавала	22802
129772	153	22820 Петрозаводск	22820
129773	153	22837 Вытегра	22837
129774	153	22845 Каргополь	22845
129775	153	22854 Няндома	22854
129776	153	22887 Котлас	22887
129777	153	22892 Выборг	22892
129778	153	22907 Гогланд	22907
129779	153	22981 Великий Устюг	22981
129780	153	23022 Амдерма	23022
129781	153	23032 Марресаля	23032
129782	153	23058 Антипаюта	23058
129783	153	23074 Дудинка	23074
129784	153	23114 Мыс Константиновский	23114
129785	153	23205 Нарьян-Мар	23205
129786	153	23219 Хоседа-Хард	23219
129787	153	23220 Елецкая	23220
129788	153	23242 Новый Порт	23242
129789	153	23256 Тазовск	23256
129790	153	23274 Игарка	23274
129791	153	23324 Петрунь	23324
129792	153	23330 Салехард	23330
129793	153	23331 Ра-Из	23331
129794	153	23345 Ныда	23345
129795	153	23365 Сидоровск	23365
129796	153	23383 Агата	23383
129797	153	23405 Усть-Цильма	23405
129798	153	23412 Усть-Уса	23412
129799	153	23418 Печора	23418
129800	153	23445 Надым	23445
129801	153	23463 Янов Стан	23463
129802	153	23472 Туруханск	23472
129803	153	23514 Ираель	23514
129804	153	23527 Саранпауль	23527
129805	153	23552 Тарко-Сале	23552
129806	153	23589 Тутончаны	23589
129807	153	23631 Березово	23631
129808	153	23656 Халесовая	23656
129809	153	23662 Толька	23662
129810	153	23678 Верхнеимбатск	23678
129811	153	23707 Усть-Вымь	23707
129812	153	23711 Троицко-Печорское	23711
129813	153	23724 Няксимволь	23724
129814	153	23734 Октябрьское	23734
129815	153	23804 Сыктывкар	23804
129816	153	23867 Ларьяк	23867
129817	153	23884 Бор	23884
129818	153	23891 Байкит	23891
129819	153	23904 Койгородок	23904
129820	153	23914 Чердынь	23914
129821	153	23921 Ивдель	23921
129822	153	23933 Ханты-Мансийск	23933
129823	153	23946 Угут	23946
129824	153	23955 Александровское	23955
129825	153	23966 Ванжиль-Кынак	23966
129826	153	23986 Северо-Енисейский	23986
129827	153	24076 Депутатский	24076
129828	153	24105 Ессей	24105
129829	153	24125 Оленек	24125
129830	153	24136 Сухана	24136
129831	153	24143 Джарджан	24143
129832	153	24266 Верхоянск	24266
129833	153	24329 Шелагонцы	24329
129834	153	24343 Жиганск	24343
129835	153	24371 Усть-Чаркы	24371
129836	153	24382 Усть-Мома	24382
129837	153	24507 Тура	24507
129838	153	24538 Чумпурук	24538
129839	153	24606 Кислокан	24606
129841	153	24643 Хатырык-Хомо	24643
129842	153	24661 Сеген-Кюель	24661
129843	153	24671 Томпо	24671
129844	153	24688 Оймякон	24688
129845	153	24713 Наканно	24713
129846	153	24726 Мирный	24726
129847	153	24738 Сунтар	24738
129848	153	24763 Крест-Хальджай	24763
129849	153	24790 Сусуман	24790
129850	153	24802 Стрелка Чуня	24802
129851	153	24817 Ербогачен	24817
129852	153	24908 Ванавара	24908
129853	153	24923 Ленск	24923
129854	153	24933 Килеер	24933
129855	153	24944 Олекминск	24944
129856	153	24951 Исить	24951
129857	153	24959 Якутск	24959
129858	153	24966 Усть-Мая	24966
129859	153	24967 Тегюльтя	24967
129860	153	24982 Уега	24982
129861	153	25034 Амбарчик бухта	25034
129862	153	25042 Остров Айон	25042
129863	153	25062 Мыс Биллингс	25062
129864	153	25138 Островное	25138
129865	153	25173 Мыс Шмидта	25173
129866	153	25206 Среднеколымск	25206
129867	153	25248 Илирней	25248
129868	153	25282 Мыс Ванкарем	25282
129869	153	25325 Усть-Олой	25325
129870	153	25356 Эньмувеем	25356
129871	153	25372 Амгуэма,87км	25372
129872	153	25378 Эгвекинот	25378
129873	153	25399 Уэлен	25399
129874	153	25400 Зырянка	25400
129875	153	25428 Омолон	25428
129876	153	25503 Коркодон	25503
129877	153	25538 Верхне-Пенжино	25538
129878	153	25551 Марково	25551
129879	153	25563 Анадырь	25563
129880	153	25594 Бухта Провидения	25594
129881	153	25621 Кедон	25621
129882	153	25656 Березово	25656
129883	153	25677 Беринговская	25677
129884	153	25703 Сеймчан	25703
129885	153	25705 Среднекан	25705
129886	153	25744 Каменское	25744
129887	153	25767 Хатырка	25767
129888	153	25777 Гавриила бухта	25777
129889	153	25912 Ола	25912
129890	153	25913 Магадан	25913
129891	153	25916 Мыс Алевина	25916
129892	153	25922 Шелихово	25922
129893	153	25927 Брохово	25927
129894	153	25932 Тайгонос	25932
129895	153	25954 Корф	25954
129896	153	25956 Апука	25956
129897	153	26063 Санкт-Петербург	26063
129898	153	26069 Белогорка	26069
129899	153	26094 Тихвин	26094
129900	153	26157 Гдов	26157
129901	153	26258 Псков	26258
129902	153	26275 Старая Русса	26275
129903	153	26298 Бологое	26298
129904	153	26359 Пушкинские Горы	26359
129905	153	26477 Великие Луки	26477
129906	153	26479 Торопец	26479
129907	153	26499 Старица	26499
129908	153	26614 Советск	26614
129909	153	26701 Балтийск	26701
129910	153	26702 Калининград	26702
129911	153	26706 Железнодорожный	26706
129912	153	26781 Смоленск	26781
129913	153	26898 Брянск	26898
129914	153	26976 Красная Гора	26976
129915	153	26997 Трубчевск	26997
129916	153	27008 Бабаево	27008
129917	153	27037 Вологда,Прилуки	27037
129918	153	27051 Тотьма	27051
129919	153	27066 Никольск	27066
129920	153	27083 Опарино	27083
129921	153	27164 Кологрив	27164
129922	153	27208 Максатиха	27208
129923	153	27225 Рыбинск,ГМО	27225
129924	153	27277 Ветлуга	27277
129925	153	27296 Кумены	27296
129926	153	27333 Кострома	27333
129927	153	27385 Яранск	27385
129928	153	27425 Переславль-Залесский	27425
129929	153	27459 Нижний Новгород	27459
129930	153	27485 Йошкар-Ола	27485
129931	153	27509 Можайск	27509
129932	153	27595 Казань	27595
129933	153	27612 Москва, ВДНХ	27612
129934	153	27625 Коломна	27625
129935	153	27648 Елатьма	27648
129936	153	27665 Лукоянов	27665
129937	153	27675 Порецкое	27675
129938	153	27707 Сухиничи	27707
129939	153	27730 Рязань	27730
129940	153	27756 Краснослободск	27756
129941	153	27814 Плавск	27814
129942	153	27823 Павелец	27823
129943	153	27857 Земетчино	27857
129944	153	27872 Инза	27872
129945	153	27947 Тамбов	27947
129946	153	27962 Пенза	27962
129947	153	27995 Безенчук	27995
129948	153	28009 Кирс	28009
129949	153	28064 Леуши	28064
129950	153	28138 Бисер	28138
129951	153	28144 Верхотурье	28144
129952	153	28224 Пермь	28224
129953	153	28255 Туринск	28255
129954	153	28275 Тобольск	28275
129955	153	28312 Дебессы	28312
129956	153	28367 Тюмень	28367
129957	153	28402 Кильмезь	28402
129958	153	28411 Ижевск	28411
129959	153	28418 Сарапул	28418
129960	153	28419 Янаул	28419
129961	153	28434 Красноуфимск	28434
129962	153	28440 Екатеринбург	28440
129963	153	28445 Верхнее Дуброво	28445
129964	153	28493 Тара	28493
129965	153	28506 Елабуга	28506
129966	153	28537 Дуван	28537
129967	153	28552 Шадринск	28552
129968	153	28561 Памятная	28561
129969	153	28573 Ишим	28573
129970	153	28624 Кушнаренково	28624
129971	153	28630 Златоуст	28630
129972	153	28661 Курган	28661
129973	153	28666 Макушино	28666
129974	153	28698 Омск	28698
129975	153	28704 Чулпаново	28704
129976	153	28719 Аксаково	28719
129977	153	28722 Уфа	28722
129978	153	28748 Троицк	28748
129979	153	28802 Серноводск	28802
129980	153	28823 Тукан	28823
129981	153	28825 Стерлитамак	28825
129982	153	28833 Верхнеуральск	28833
129983	153	28895 Русская Поляна	28895
129984	153	29023 Напас	29023
129985	153	29111 Средний Васюган	29111
129986	153	29154 Усть-Озерное	29154
129987	153	29231 Колпашево	29231
129988	153	29263 Енисейск	29263
129989	153	29282 Богучаны	29282
129990	153	29313 Пудино	29313
129991	153	29328 Бакчар	29328
129992	153	29348 Первомайское	29348
129993	153	29379 Тасеево	29379
129994	153	29393 Червянка	29393
129995	153	29418 Северное	29418
129996	153	29430 Томск	29430
129997	153	29467 Ачинск, ж.д.ст.	29467
129998	153	29539 Болотное	29539
129999	153	29541 Тайга	29541
130000	153	29557 Тисуль	29557
130001	153	29570 Красноярск, оп.п.	29570
130002	153	29580 Солянка	29580
130003	153	29594 Тайшет	29594
130004	153	29605 Татарск	29605
130005	153	29612 Барабинск	29612
130006	153	29638 Огурцово	29638
130007	153	29645 Кемерово	29645
130008	153	29664 Светлолобово	29664
130009	153	29698 Нижнеудинск	29698
130010	153	29789 Верхняя Гутара	29789
130011	153	29822 Камень-на-Оби	29822
130012	153	29838 Барнаул	29838
130013	153	29849 Кузедеево	29849
130014	153	29858 Неожиданный	29858
130015	153	29862 Абакан	29862
130016	153	29866 Минусинск	29866
130017	153	29915 Славгород	29915
130018	153	29923 Ребриха	29923
130019	153	29939 Бийск-Зональная	29939
130020	153	30028 Ика	30028
130021	153	30054 Витим	30054
130022	153	30069 Перевоз	30069
130023	153	30089 Джикимда	30089
130024	153	30209 Ершово	30209
130025	153	30219 Максимово	30219
130026	153	30230 Киренск	30230
130027	153	30252 Мамакан	30252
130028	153	30253 Бодайбо	30253
130029	153	30309 Братск	30309
130030	153	30328 Орлинга	30328
130031	153	30337 Казачинское	30337
130032	153	30356 Таксимо	30356
130033	153	30372 Чара	30372
130034	153	30385 Усть-Нюкжа	30385
130035	153	30393 Чульман	30393
130036	153	30433 Нижнеангарск	30433
130037	153	30437 Карам	30437
130038	153	30469 Калакан	30469
130039	153	30471 Средний Калар	30471
130040	153	30484 Средняя Олекма	30484
130041	153	30493 Нагорный	30493
130042	153	30504 Тулун	30504
130043	153	30521 Жигалово	30521
130044	153	30536 Баргузинский запов-к	30536
130045	153	30554 Багдарин	30554
130046	153	30565 Усть-Каренга	30565
130047	153	30612 Балаганск	30612
130048	153	30627 Баяндай	30627
130049	153	30632 Большой Ушканий о-в	30632
130050	153	30635 Усть-Баогузин	30635
130051	153	30636 Баргузин	30636
130052	153	30650 Романовка	30650
130053	153	30673 Могоча	30673
130054	153	30692 Сковородино	30692
130055	153	30695 Джалинда	30695
130056	153	30703 Инга	30703
130057	153	30710 Иркутск, обсерв.	30710
130058	153	30716 Хомутово	30716
130059	153	30727 Большое Голоустное	30727
130060	153	30745 Сосново-Озерское	30745
130061	153	30758 Чита	30758
130062	153	30777 Сретенск	30777
130063	153	30811 Тунка	30811
130064	153	30822 Бабушкин	30822
130065	153	30823 Улан-Удэ	30823
130066	153	30825 Иволгинск	30825
130067	153	30844 Хилок	30844
130068	153	30859 Агинское	30859
130069	153	30879 Нерчинский з-д	30879
130070	153	30915 Цакир	30915
130071	153	30925 Кяхта	30925
130072	153	30935 Красный Чикой	30935
130073	153	30949 Кыра	30949
130074	153	30954 Мангут	30954
130075	153	30965 Борзя	30965
130076	153	31004 Алдан	31004
130077	153	31026 Учур	31026
130078	153	31062 Югаренок	31062
130079	153	31088 Охотск	31088
130080	153	31092 Талон	31092
130081	153	31137 Токо	31137
130082	153	31152 Нелькан	31152
130083	153	31168 Аян	31168
130084	153	31174 Большой Шантар	31174
130085	153	31235 Джана	31235
130086	153	31253 Бомнак	31253
130087	153	31285 Удское	31285
130088	153	31329 Экимчан	31329
130089	153	31362 Литке	31362
130090	153	31369 Николаевск-на-Амуре	31369
130091	153	31371 Черняево	31371
130092	153	31388 Норск	31388
130093	153	31416 Им. Полины Осипенко	31416
130094	153	31436 Джаоре	31436
130095	153	31439 Богородское	31439
130096	153	31443 Мазаново	31443
130097	153	31459 Верхняя Томь	31459
130098	153	31478 Софийский Прииск	31478
130099	153	31510 Благовещенск	31510
130100	153	31532 Чекунда	31532
130101	153	31538 Сутур	31538
130102	153	31562 Нижнетамбовское	31562
130103	153	31586 Константиновка	31586
130104	153	31594 Архара	31594
130105	153	31677 Солекуль	31677
130106	153	31707 Екатерино-Никольское	31707
130107	153	31725 Смидович	31725
130108	153	31733 Елабуга	31733
130109	153	31735 Хабаровск	31735
130110	153	31770 Советская Гавань	31770
130111	153	31788 Лермонтовка	31788
130112	153	31829 Золотой	31829
130113	153	31845 Красный Яр	31845
130114	153	31873 Дальнереченск	31873
130115	153	31895 Мельничное	31895
130116	153	31909 Терней	31909
130117	153	31915 Пограничный	31915
130118	153	31931 Свиягино	31931
130119	153	31959 Рудная Пристань	31959
130120	153	31960 Владивосток	31960
130121	153	31961 Тимирязевский	31961
130122	153	31969 Посьет	31969
130123	153	31989 Преображение	31989
130124	153	32014 Москальво	32014
130125	153	32027 Погиби	32027
130126	153	32053 Ноглики	32053
130127	153	32061 Александровск-Сахал.	32061
130128	153	32071 Тымовское	32071
130129	153	32076 Пограничное	32076
130130	153	32088 Углегорск	32088
130131	153	32098 Поронайск	32098
130132	153	32099 Мыс Терпения	32099
130133	153	32121 Ильинский	32121
130134	153	32145 Невельск	32145
130135	153	32149 Мыс Крильон	32149
130136	153	32150 Южно-Сахалинск	32150
130137	153	32165 Южно-Курильск	32165
130138	153	32174 Курильск	32174
130139	153	32213 Мыс Лопатка	32213
130140	153	32246 Оссора	32246
130141	153	32252 Усть-Воямполка	32252
130142	153	32287 Усть-Хайрюзово	32287
130143	153	32363 Эссо	32363
130144	153	32389 Ключи	32389
130145	153	32411 Ича	32411
130146	153	32447 Долиновка	32447
130147	153	32477 Соболево	32477
130148	153	32509 Семячик	32509
130149	153	32539 Начики	32539
130150	153	32547 Сосновка	32547
130151	153	32562 Большерецк	32562
130152	153	32583 Петропавловск-Камчатск.	32583
130153	153	32586 Петропавловский маяк	32586
130154	153	32618 Остров Беринга	32618
130155	153	33166 Рыльск	33166
130156	153	34003 Поныри	34003
130157	153	34009 Курск	34009
130158	153	34026 Конь-Колодезь	34026
130159	153	34059 Росташи	34059
130160	153	34110 Богородицкое-Фенино	34110
130161	153	34123 Воронеж	34123
130162	153	34139 Каменная Степь	34139
130163	153	34152 Балашов	34152
130164	153	34163 Октябрьский городок	34163
130165	153	34172 Саратов	34172
130166	153	34186 Ершов	34186
130167	153	34202 Готня	34202
130168	153	34240 Урюпинск	34240
130169	153	34247 Калач	34247
130170	153	34289 Новоузенск	34289
130171	153	34321 Валуйки	34321
130172	153	34356 Фролово	34356
130173	153	34391 Александров Гай	34391
130174	153	34432 Чертково	34432
130175	153	34476 Эльтон	34476
130176	153	34561 Волгоград	34561
130177	153	34579 Верхний Баскунчак	34579
130178	153	34646 Цимлянск(Волгодонск)	34646
130179	153	34720 Таганрог	34720
130180	153	34730 Ростов-на-Дону	34730
130181	153	34740 Гигант	34740
130182	153	34759 Ремонтное	34759
130183	153	34824 Приморско-Ахтарск	34824
130184	153	34861 Элиста	34861
130185	153	34866 Яшкуль	34866
130186	153	34880 Астрахань	34880
130187	153	34927 Краснодар, Круглик	34927
130188	153	34949 Ставрополь, АМСГ	34949
130189	153	34984 Лагань	34984
130190	153	35007 Перелюб	35007
130191	153	35011 Сорочинск	35011
130192	153	35026 Зилаир	35026
130193	153	35041 Бреды	35041
130194	153	35121 Оренбург	35121
130195	153	35127 Акбулак	35127
130196	153	35233 Домбаровский	35233
130197	153	36034 Рубцовск	36034
130198	153	36038 Змеиногорск	36038
130199	153	36045 Солонешное	36045
130200	153	36055 Кызыл-Озек	36055
130201	153	36064 Яйлю	36064
130202	153	36096 Кызыл	36096
130203	153	36099 Сосновка	36099
130204	153	36103 Тоора-Хем	36103
130205	153	36229 Усть-Кокса	36229
130206	153	37001 Анапа,МГ	37001
130207	153	37018 Туапсе	37018
130208	153	37031 Армавир	37031
130209	153	37054 Минеральные Воды	37054
130210	153	37061 Буденновск	37061
130211	153	37075 Южно-Сухокумск	37075
130212	153	37089 Тюлений остров	37089
130213	153	37099 Сочи	37099
130214	153	37107 Красная Поляна	37107
130215	153	37112 Зеленчукская	37112
130216	153	37123 Кисловодск	37123
130217	153	37228 Владикавказ	37228
130218	153	37235 Грозный	37235
130219	153	37244 Гудермес	37244
130220	153	37470 Дербент	37470
130221	153	37471 Буйнакск	37471
130222	153	37472 Махачкала	37472
130223	154	20674 Остров Диксон	20674
130224	154	21824 Тикси	21824
130225	154	22113 Мурманск	22113
130226	154	22217 Кандалакша	22217
130227	154	22271 Шойна	22271
130228	154	23078 Норильск	23078
130229	154	23205 Нарьян-Мар	23205
130230	154	23330 Салехард	23330
130231	154	24125 Оленек	24125
130232	154	24266 Верхоянск	24266
130233	154	24343 Жиганск	24343
130234	154	89512 Новолазаревская	89512
130235	154	89592 Мирный	89592
130236	155	20046 Им.Э.Т.Кренкеля,ГМО	20046
130237	155	20087 Голомянный	20087
130238	155	20292 Им.Е.К.Федорова,ГМО	20292
130239	155	20476 Стерлегова	20476
130240	155	20674 Диксон	20674
130241	155	20744 Малые Кармакулы	20744
130242	155	20891 Хатанга	20891
130243	155	20982 Волочанка	20982
130244	155	21432 Котельный	21432
130245	155	21802 Саскылах	21802
130246	155	21824 Тикси	21824
130247	155	21908 Джалинда	21908
130248	155	21921 Кюсюр	21921
130249	155	21931 Юбилейная	21931
130250	155	21946 Чокурдах	21946
130251	155	21982 Остров Врангеля	21982
130252	155	22003 Вайда-Губа	22003
130253	155	22019 Полярное	22019
130254	155	22113 Мурманск	22113
130255	155	22140 Святой Нос	22140
130256	155	22204 Ковдор	22204
130257	155	22217 Кандалакша	22217
130258	155	22235 Краснощелье	22235
130259	155	22249 Каневка	22249
130260	155	22271 Шойна	22271
130261	155	22355 Сосновец остров	22355
130262	155	22408 Калевала	22408
130263	155	22422 Гридино	22422
130264	155	22471 Мезень	22471
130265	155	22520 Кемь-порт	22520
130266	155	22550 Архангельск	22550
130267	155	22583 Койнас	22583
130268	155	22602 Реболы	22602
130269	155	22619 Паданы	22619
130270	155	22641 Онега	22641
130271	155	22676 Сура	22676
130272	155	22768 Шенкурск	22768
130273	155	22802 Сортавала	22802
130274	155	22820 Петрозаводск	22820
130275	155	22837 Вытегра	22837
130276	155	22845 Каргополь	22845
130277	155	22854 Няндома	22854
130278	155	22887 Котлас	22887
130279	155	22892 Выборг	22892
130280	155	22981 Великий Устюг	22981
130281	155	23022 Амдерма	23022
130282	155	23074 Дудинка	23074
130283	155	23114 Мыс Константиновский	23114
130284	155	23205 Нарьян-Мар	23205
130285	155	23219 Хоседа-Хард	23219
130286	155	23220 Елецкая	23220
130287	155	23242 Новый Порт	23242
130288	155	23256 Тазовск	23256
130289	155	23274 Игарка	23274
130290	155	23324 Петрунь	23324
130291	155	23330 Салехард	23330
130292	155	23345 Ныда	23345
130293	155	23365 Сидоровск	23365
130294	155	23405 Усть-Цильма	23405
130295	155	23412 Усть-Уса	23412
130296	155	23418 Печора	23418
130297	155	23445 Надым	23445
130298	155	23463 Янов Стан	23463
130299	155	23472 Туруханск	23472
130300	155	23527 Саранпауль	23527
130301	155	23552 Тарко-Сале	23552
130302	155	23589 Тутончаны	23589
130303	155	23631 Березово	23631
130304	155	23656 Халесовая	23656
130305	155	23662 Толька	23662
130306	155	23678 Верхнеимбатск	23678
130307	155	23707 Усть-Вымь	23707
130308	155	23711 Троицко-Печорское	23711
130309	155	23724 Няксимволь	23724
130310	155	23734 Октябрьское	23734
130311	155	23804 Сыктывкар	23804
130312	155	23867 Ларьяк	23867
130313	155	23884 Бор	23884
130314	155	23891 Байкит	23891
130315	155	23904 Койгородок	23904
130316	155	23914 Чердынь	23914
130317	155	23921 Ивдель	23921
130318	155	23933 Ханты-Мансийск	23933
130319	155	23946 Угут	23946
130320	155	23955 Александровское	23955
130321	155	23966 Ванжиль-Кынак	23966
130322	155	23986 Северо-Енисейский	23986
130323	155	24076 Депутатский	24076
130324	155	24125 Оленек	24125
130325	155	24136 Сухана	24136
130326	155	24143 Джарджан	24143
130327	155	24266 Верхоянск	24266
130328	155	24329 Шелагонцы	24329
130329	155	24343 Жиганск	24343
130330	155	24371 Усть-Чаркы	24371
130331	155	24382 Усть-Мома	24382
130332	155	24507 Тура	24507
130333	155	24538 Чумпурук	24538
130334	155	24606 Кислокан	24606
130335	155	24641 Вилюйск	24641
130336	155	24643 Хатырык-Хомо	24643
130337	155	24661 Сеген-Кюель	24661
130338	155	24688 Оймякон	24688
130339	155	24713 Наканно	24713
130340	155	24726 Мирный	24726
130341	155	24738 Сунтар	24738
130342	155	24790 Сусуман	24790
130343	155	24802 Стрелка Чуня	24802
130344	155	24817 Ербогачен	24817
130345	155	24908 Ванавара	24908
130346	155	24923 Ленск	24923
130347	155	24933 Килеер	24933
130348	155	24944 Олекминск	24944
130349	155	24951 Исить	24951
130350	155	24959 Якутск	24959
130351	155	24967 Тегюльтя	24967
130352	155	24982 Уега	24982
130353	155	25034 Амбарчик бухта	25034
130354	155	25042 Остров Айон	25042
130355	155	25062 Мыс Биллингс	25062
130356	155	25138 Островное	25138
130357	155	25173 Мыс Шмидта	25173
130358	155	25206 Среднеколымск	25206
130359	155	25282 Мыс Ванкарем	25282
130360	155	25325 Усть-Олой	25325
130361	155	25356 Эньмувеем	25356
130362	155	25378 Эгвекинот	25378
130363	155	25399 Уэлен	25399
130364	155	25400 Зырянка	25400
130365	155	25428 Омолон	25428
130366	155	25503 Коркодон	25503
130367	155	25538 Верхне-Пенжино	25538
130368	155	25563 Анадырь	25563
130369	155	25594 Бухта Провидения	25594
130370	155	25677 Беринговская	25677
130371	155	25703 Сеймчан	25703
130372	155	25705 Среднекан	25705
130373	155	25744 Каменское	25744
130374	155	25912 Ола	25912
130375	155	25913 Магадан	25913
130376	155	25916 Мыс Алевина	25916
130377	155	25927 Брохово	25927
130378	155	25954 Корф	25954
130379	155	25956 Апука	25956
130380	155	26063 Санкт-Петербург	26063
130381	155	26069 Белогорка	26069
130382	155	26094 Тихвин	26094
130383	155	26157 Гдов	26157
130384	155	26275 Старая Русса	26275
130385	155	26298 Бологое	26298
130386	155	26359 Пушкинские Горы	26359
130387	155	26477 Великие Луки	26477
130388	155	26479 Торопец	26479
130389	155	26499 Старица	26499
130390	155	26614 Советск	26614
130391	155	26701 Балтийск	26701
130392	155	26702 Калининград	26702
130393	155	26706 Железнодорожный	26706
130394	155	26781 Смоленск	26781
130395	155	26898 Брянск	26898
130396	155	26976 Красная Гора	26976
130397	155	26997 Трубчевск	26997
130398	155	27008 Бабаево	27008
130399	155	27037 Вологда,Прилуки	27037
130400	155	27051 Тотьма	27051
130401	155	27066 Никольск	27066
130402	155	27083 Опарино	27083
130403	155	27164 Кологрив	27164
130404	155	27208 Максатиха	27208
130405	155	27277 Ветлуга	27277
130406	155	27296 Кумены	27296
130407	155	27333 Кострома	27333
130408	155	27385 Яранск	27385
130409	155	27425 Переславль-Залесский	27425
130410	155	27459 Нижний Новгород	27459
130411	155	27485 Йошкар-Ола	27485
130412	155	27509 Можайск	27509
130413	155	27595 Казань	27595
130414	155	27612 Москва, ВДНХ	27612
130415	155	27625 Коломна	27625
130416	155	27648 Елатьма	27648
130417	155	27665 Лукоянов	27665
130418	155	27675 Порецкое	27675
130419	155	27707 Сухиничи	27707
130420	155	27730 Рязань	27730
130421	155	27756 Краснослободск	27756
130422	155	27814 Плавск	27814
130423	155	27823 Павелец	27823
130424	155	27857 Земетчино	27857
130425	155	27872 Инза	27872
130426	155	27962 Пенза	27962
130427	155	27995 Безенчук	27995
130428	155	28009 Кирс	28009
130429	155	28064 Леуши	28064
130430	155	28138 Бисер	28138
130431	155	28144 Верхотурье	28144
130432	155	28224 Пермь	28224
130433	155	28255 Туринск	28255
130434	155	28275 Тобольск	28275
130435	155	28312 Дебессы	28312
130436	155	28367 Тюмень	28367
130437	155	28402 Кильмезь	28402
130438	155	28411 Ижевск	28411
130439	155	28418 Сарапул	28418
130440	155	28419 Янаул	28419
130441	155	28434 Красноуфимск	28434
130442	155	28440 Екатеринбург	28440
130443	155	28445 Верхнее Дуброво	28445
130444	155	28506 Елабуга	28506
130445	155	28537 Дуван	28537
130446	155	28552 Шадринск	28552
130447	155	28561 Памятная	28561
130448	155	28573 Ишим	28573
130449	155	28624 Кушнаренково	28624
130450	155	28630 Златоуст	28630
130451	155	28661 Курган	28661
130452	155	28666 Макушино	28666
130453	155	28698 Омск	28698
130454	155	28704 Чулпаново	28704
130455	155	28719 Аксаково	28719
130456	155	28748 Троицк	28748
130457	155	28802 Серноводск	28802
130458	155	28823 Тукан	28823
130459	155	28825 Стерлитамак	28825
130460	155	28833 Верхнеуральск	28833
130461	155	28895 Русская Поляна	28895
130462	155	29023 Напас	29023
130463	155	29111 Средний Васюган	29111
130464	155	29154 Усть-Озерное	29154
130465	155	29263 Енисейск	29263
130466	155	29282 Богучаны	29282
130467	155	29313 Пудино	29313
130468	155	29328 Бакчар	29328
130469	155	29348 Первомайское	29348
130470	155	29393 Червянка	29393
130471	155	29418 Северное	29418
130472	155	29430 Томск	29430
130473	155	29467 Ачинск, ж.д.ст.	29467
130474	155	29539 Болотное	29539
130475	155	29541 Тайга	29541
130476	155	29557 Тисуль	29557
130477	155	29570 Красноярск, оп.п.	29570
130478	155	29580 Солянка	29580
130479	155	29594 Тайшет	29594
130480	155	29605 Татарск	29605
130481	155	29612 Барабинск	29612
130482	155	29638 Огурцово	29638
130483	155	29645 Кемерово	29645
130484	155	29664 Светлолобово	29664
130485	155	29698 Нижнеудинск	29698
130486	155	29752 Ненастная	29752
130487	155	29789 Верхняя Гутара	29789
130488	155	29822 Камень-на-Оби	29822
130489	155	29838 Барнаул	29838
130490	155	29849 Кузедеево	29849
130491	155	29858 Неожиданный	29858
130492	155	29862 Абакан	29862
130493	155	29866 Минусинск	29866
130494	155	29915 Славгород	29915
130495	155	29923 Ребриха	29923
130496	155	29939 Бийск-Зональная	29939
130497	155	29974 Оленья Речка	29974
130498	155	29998 Орлик	29998
130499	155	30028 Ика	30028
130500	155	30054 Витим	30054
130501	155	30069 Перевоз	30069
130502	155	30089 Джикимда	30089
130503	155	30219 Максимово	30219
130504	155	30230 Киренск	30230
130505	155	30252 Мамакан	30252
130506	155	30253 Бодайбо	30253
130507	155	30309 Братск	30309
130508	155	30328 Орлинга	30328
130509	155	30337 Казачинское	30337
130510	155	30372 Чара	30372
130511	155	30385 Усть-Нюкжа	30385
130512	155	30393 Чульман	30393
130513	155	30433 Нижнеангарск	30433
130514	155	30437 Карам	30437
130515	155	30469 Калакан	30469
130516	155	30471 Средний Калар	30471
130517	155	30484 Средняя Олекма	30484
130518	155	30493 Нагорный	30493
130519	155	30504 Тулун	30504
130520	155	30521 Жигалово	30521
130521	155	30536 Баргузинский запов-к	30536
130522	155	30554 Багдарин	30554
130523	155	30555 Троицкий Прииск	30555
130524	155	30565 Усть-Каренга	30565
130525	155	30612 Балаганск	30612
130526	155	30627 Баяндай	30627
130527	155	30632 Большой Ушканий о-в	30632
130528	155	30635 Усть-Баогузин	30635
130529	155	30636 Баргузин	30636
130530	155	30650 Романовка	30650
130531	155	30673 Могоча	30673
130532	155	30692 Сковородино	30692
130533	155	30695 Джалинда	30695
130534	155	30703 Инга	30703
130535	155	30710 Иркутск, обсерв.	30710
130536	155	30716 Хомутово	30716
130537	155	30727 Большое Голоустное	30727
130538	155	30745 Сосново-Озерское	30745
130539	155	30758 Чита	30758
130540	155	30777 Сретенск	30777
130541	155	30811 Тунка	30811
130542	155	30815 Хамар-Дабан	30815
130543	155	30822 Бабушкин	30822
130544	155	30823 Улан-Удэ	30823
130545	155	30844 Хилок	30844
130546	155	30859 Агинское	30859
130547	155	30879 Нерчинский з-д	30879
130548	155	30915 Цакир	30915
130549	155	30925 Кяхта	30925
130550	155	30935 Красный Чикой	30935
130551	155	30949 Кыра	30949
130552	155	30954 Мангут	30954
130553	155	30965 Борзя	30965
130554	155	31004 Алдан	31004
130555	155	31026 Учур	31026
130556	155	31088 Охотск	31088
130557	155	31092 Талон	31092
130558	155	31102 Канку	31102
130559	155	31137 Токо	31137
130560	155	31152 Нелькан	31152
130561	155	31168 Аян	31168
130562	155	31174 Большой Шантар	31174
130563	155	31235 Джана	31235
130564	155	31253 Бомнак	31253
130565	155	31285 Удское	31285
130566	155	31329 Экимчан	31329
130567	155	31362 Литке	31362
130568	155	31369 Николаевск-на-Амуре	31369
130569	155	31371 Черняево	31371
130570	155	31388 Норск	31388
130571	155	31416 Им. Полины Осипенко	31416
130572	155	31436 Джаоре	31436
130573	155	31439 Богородское	31439
130574	155	31443 Мазаново	31443
130575	155	31478 Софийский Прииск	31478
130576	155	31510 Благовещенск	31510
130577	155	31532 Чекунда	31532
130578	155	31538 Сутур	31538
130579	155	31562 Нижнетамбовское	31562
130580	155	31586 Константиновка	31586
130581	155	31594 Архара	31594
130582	155	31677 Солекуль	31677
130583	155	31707 Екатерино-Никольское	31707
130584	155	31725 Смидович	31725
130585	155	31733 Елабуга	31733
130586	155	31770 Советская Гавань	31770
130587	155	31788 Лермонтовка	31788
130588	155	31829 Золотой	31829
130589	155	31845 Красный Яр	31845
130590	155	31873 Дальнереченск	31873
130591	155	31895 Мельничное	31895
130592	155	31909 Терней	31909
130593	155	31915 Пограничный	31915
130594	155	31931 Свиягино	31931
130595	155	31959 Рудная Пристань	31959
130596	155	31960 Владивосток	31960
130597	155	31961 Тимирязевский	31961
130598	155	31969 Посьет	31969
130599	155	31989 Преображение	31989
130600	155	32014 Москальво	32014
130601	155	32027 Погиби	32027
130602	155	32053 Ноглики	32053
130603	155	32061 Александровск-Сахал.	32061
130604	155	32071 Тымовское	32071
130605	155	32076 Пограничное	32076
130606	155	32088 Углегорск	32088
130607	155	32098 Поронайск	32098
130608	155	32099 Мыс Терпения	32099
130609	155	32121 Ильинский	32121
130610	155	32145 Невельск	32145
130611	155	32149 Мыс Крильон	32149
130612	155	32150 Южно-Сахалинск	32150
130613	155	32165 Южно-Курильск	32165
130614	155	32174 Курильск	32174
130615	155	32213 Мыс Лопатка	32213
130616	155	32246 Оссора	32246
130617	155	32252 Усть-Воямполка	32252
130618	155	32287 Усть-Хайрюзово	32287
130619	155	32363 Эссо	32363
130620	155	32389 Ключи	32389
130621	155	32411 Ича	32411
130622	155	32447 Долиновка	32447
130623	155	32477 Соболево	32477
130624	155	32509 Семячик	32509
130625	155	32539 Начики	32539
130626	155	32547 Сосновка	32547
130627	155	32562 Большерецк	32562
130628	155	32583 Петропавловск-Камчатск.	32583
130629	155	32586 Петропавловский маяк	32586
130630	155	32618 Остров Беринга	32618
130631	155	33166 Рыльск	33166
130632	155	34003 Поныри	34003
130633	155	34009 Курск	34009
130634	155	34059 Росташи	34059
130635	155	34110 Богородицкое-Фенино	34110
130636	155	34152 Балашов	34152
130637	155	34163 Октябрьский городок	34163
130638	155	34186 Ершов	34186
130639	155	34202 Готня	34202
130640	155	34240 Урюпинск	34240
130641	155	34289 Новоузенск	34289
130642	155	34321 Валуйки	34321
130643	155	34356 Фролово	34356
130644	155	34391 Александров Гай	34391
130645	155	34432 Чертково	34432
130646	155	34476 Эльтон	34476
130647	155	34561 Волгоград	34561
130648	155	34579 Верхний Баскунчак	34579
130649	155	34740 Гигант	34740
130650	155	34759 Ремонтное	34759
130651	155	34824 Приморско-Ахтарск	34824
130652	155	34861 Элиста	34861
130653	155	34866 Яшкуль	34866
130654	155	34880 Астрахань	34880
130655	155	34927 Краснодар, Круглик	34927
130656	155	34949 Ставрополь, АМСГ	34949
130657	155	34984 Лагань	34984
130658	155	35007 Перелюб	35007
130659	155	35011 Сорочинск	35011
130660	155	35026 Зилаир	35026
130661	155	35041 Бреды	35041
130662	155	35121 Оренбург	35121
130663	155	35127 Акбулак	35127
130664	155	35233 Домбаровский	35233
130665	155	36034 Рубцовск	36034
130666	155	36038 Змеиногорск	36038
130667	155	36045 Солонешное	36045
130668	155	36055 Кызыл-Озек	36055
130669	155	36064 Яйлю	36064
130670	155	36096 Кызыл	36096
130671	155	36099 Сосновка	36099
130672	155	36103 Тоора-Хем	36103
130673	155	36229 Усть-Кокса	36229
130674	155	36259 Кош-Агач	36259
130675	155	36278 Мугур-Аксы	36278
130676	155	36307 Эрзин	36307
130677	155	36442 Кара-Тюрек	36442
130678	155	37001 Анапа,МГ	37001
130679	155	37018 Туапсе	37018
130680	155	37031 Армавир	37031
130681	155	37061 Буденновск	37061
130682	155	37089 Тюлений остров	37089
130683	155	37099 Сочи	37099
130684	155	37107 Красная Поляна	37107
130685	155	37112 Зеленчукская	37112
130686	155	37123 Кисловодск	37123
130687	155	37126 Шаджатмаз	37126
130688	155	37196 Клухорский перевал	37196
130689	155	37235 Грозный	37235
130690	155	37244 Гудермес	37244
130691	155	37461 Сулак,высокогорная	37461
130692	155	37470 Дербент	37470
130693	156	20046 Им.Э.Т.Кренкеля,ГМО	20046
130694	156	20069 Визе	20069
130695	156	20087 Голомянный	20087
130696	156	20107 Баренцбург	20107
130697	156	20289 Русский	20289
130698	156	20292 Им.Е.К.Федорова,ГМО	20292
130699	156	20476 Стерлегова	20476
130700	156	20667 Им.М.В.Попова	20667
130701	156	20674 Диксон	20674
130702	156	20744 Малые Кармакулы	20744
130703	156	20891 Хатанга	20891
130704	156	20946 Им.Е.К.Федорова	20946
130705	156	20982 Волочанка	20982
130706	156	21432 Котельный	21432
130707	156	21611 Терпяй-Тумса	21611
130708	156	21647 Шалаурова	21647
130709	156	21802 Саскылах	21802
130710	156	21824 Тикси	21824
130711	156	21908 Джалинда	21908
130712	156	21921 Кюсюр	21921
130713	156	21931 Юбилейная	21931
130714	156	21946 Чокурдах	21946
130715	156	21982 Остров Врангеля	21982
130716	156	22003 Вайда-Губа	22003
130717	156	22019 Полярное	22019
130718	156	22028 Териберка	22028
130719	156	22095 Колгуев Северный	22095
130720	156	22101 Янискоски	22101
130721	156	22113 Мурманск	22113
130722	156	22140 Святой Нос	22140
130723	156	22165 Канин Нос	22165
130724	156	22204 Ковдор	22204
130725	156	22217 Кандалакша	22217
130726	156	22235 Краснощелье	22235
130727	156	22249 Каневка	22249
130728	156	22271 Шойна	22271
130729	156	22292 Индига	22292
130730	156	22324 Умба	22324
130731	156	22355 Сосновец остров	22355
130732	156	22408 Калевала	22408
130733	156	22422 Гридино	22422
130734	156	22438 Жижгин	22438
130735	156	22471 Мезень	22471
130736	156	22520 Кемь-порт	22520
130737	156	22550 Архангельск	22550
130738	156	22583 Койнас	22583
130739	156	22602 Реболы	22602
130740	156	22619 Паданы	22619
130741	156	22641 Онега	22641
130742	156	22676 Сура	22676
130743	156	22768 Шенкурск	22768
130744	156	22802 Сортавала	22802
130745	156	22820 Петрозаводск	22820
130746	156	22837 Вытегра	22837
130747	156	22845 Каргополь	22845
130748	156	22854 Няндома	22854
130749	156	22887 Котлас	22887
130750	156	22892 Выборг	22892
130751	156	22907 Гогланд	22907
130752	156	22981 Великий Устюг	22981
130753	156	23022 Амдерма	23022
130754	156	23032 Марресаля	23032
130755	156	23058 Антипаюта	23058
130756	156	23074 Дудинка	23074
130757	156	23114 Мыс Константиновский	23114
130758	156	23205 Нарьян-Мар	23205
130759	156	23219 Хоседа-Хард	23219
130760	156	23220 Елецкая	23220
130761	156	23242 Новый Порт	23242
130762	156	23256 Тазовск	23256
130763	156	23274 Игарка	23274
130764	156	23324 Петрунь	23324
130765	156	23330 Салехард	23330
130766	156	23331 Ра-Из	23331
130767	156	23345 Ныда	23345
130768	156	23365 Сидоровск	23365
130769	156	23383 Агата	23383
130770	156	23405 Усть-Цильма	23405
130771	156	23412 Усть-Уса	23412
130772	156	23418 Печора	23418
130773	156	23445 Надым	23445
130774	156	23463 Янов Стан	23463
130775	156	23472 Туруханск	23472
130776	156	23514 Ираель	23514
130777	156	23527 Саранпауль	23527
130778	156	23552 Тарко-Сале	23552
130779	156	23589 Тутончаны	23589
130780	156	23631 Березово	23631
130781	156	23656 Халесовая	23656
130782	156	23662 Толька	23662
130783	156	23678 Верхнеимбатск	23678
130784	156	23707 Усть-Вымь	23707
130785	156	23711 Троицко-Печорское	23711
130786	156	23724 Няксимволь	23724
130787	156	23734 Октябрьское	23734
130788	156	23804 Сыктывкар	23804
130789	156	23867 Ларьяк	23867
130790	156	23884 Бор	23884
130791	156	23891 Байкит	23891
130792	156	23904 Койгородок	23904
130793	156	23914 Чердынь	23914
130794	156	23921 Ивдель	23921
130795	156	23933 Ханты-Мансийск	23933
130796	156	23946 Угут	23946
130797	156	23955 Александровское	23955
130798	156	23966 Ванжиль-Кынак	23966
130799	156	23986 Северо-Енисейский	23986
130800	156	24076 Депутатский	24076
130801	156	24105 Ессей	24105
130802	156	24125 Оленек	24125
130803	156	24136 Сухана	24136
130804	156	24143 Джарджан	24143
130805	156	24266 Верхоянск	24266
130806	156	24329 Шелагонцы	24329
130807	156	24343 Жиганск	24343
130808	156	24371 Усть-Чаркы	24371
130809	156	24382 Усть-Мома	24382
130810	156	24507 Тура	24507
130811	156	24538 Чумпурук	24538
130812	156	24606 Кислокан	24606
130813	156	24641 Вилюйск	24641
130814	156	24643 Хатырык-Хомо	24643
130815	156	24661 Сеген-Кюель	24661
130816	156	24671 Томпо	24671
130817	156	24679 Восточная	24679
130818	156	24688 Оймякон	24688
130819	156	24713 Наканно	24713
130820	156	24726 Мирный	24726
130821	156	24738 Сунтар	24738
130822	156	24763 Крест-Хальджай	24763
130823	156	24790 Сусуман	24790
130824	156	24802 Стрелка Чуня	24802
130825	156	24817 Ербогачен	24817
130826	156	24908 Ванавара	24908
130827	156	24923 Ленск	24923
130828	156	24933 Килеер	24933
130829	156	24944 Олекминск	24944
130830	156	24951 Исить	24951
130831	156	24959 Якутск	24959
130832	156	24966 Усть-Мая	24966
130833	156	24967 Тегюльтя	24967
130834	156	24982 Уега	24982
130835	156	25034 Амбарчик бухта	25034
130836	156	25042 Остров Айон	25042
130837	156	25062 Мыс Биллингс	25062
130838	156	25138 Островное	25138
130839	156	25173 Мыс Шмидта	25173
130840	156	25206 Среднеколымск	25206
130841	156	25248 Илирней	25248
130842	156	25282 Мыс Ванкарем	25282
130843	156	25325 Усть-Олой	25325
130844	156	25356 Эньмувеем	25356
130845	156	25372 Амгуэма,87км	25372
130846	156	25378 Эгвекинот	25378
130847	156	25399 Уэлен	25399
130848	156	25400 Зырянка	25400
130849	156	25428 Омолон	25428
130850	156	25503 Коркодон	25503
130851	156	25538 Верхне-Пенжино	25538
130852	156	25551 Марково	25551
130853	156	25563 Анадырь	25563
130854	156	25594 Бухта Провидения	25594
130855	156	25621 Кедон	25621
130856	156	25656 Березово	25656
130857	156	25677 Беринговская	25677
130858	156	25703 Сеймчан	25703
130859	156	25705 Среднекан	25705
130860	156	25744 Каменское	25744
130861	156	25767 Хатырка	25767
130862	156	25777 Гавриила бухта	25777
130863	156	25912 Ола	25912
130864	156	25913 Магадан	25913
130865	156	25916 Мыс Алевина	25916
130866	156	25922 Шелихово	25922
130867	156	25927 Брохово	25927
130868	156	25932 Тайгонос	25932
130869	156	25954 Корф	25954
130870	156	25956 Апука	25956
130871	156	26063 Санкт-Петербург	26063
130872	156	26069 Белогорка	26069
130873	156	26094 Тихвин	26094
130874	156	26157 Гдов	26157
130875	156	26258 Псков	26258
130876	156	26275 Старая Русса	26275
130877	156	26298 Бологое	26298
130878	156	26359 Пушкинские Горы	26359
130879	156	26477 Великие Луки	26477
130880	156	26479 Торопец	26479
130881	156	26499 Старица	26499
130882	156	26614 Советск	26614
130883	156	26701 Балтийск	26701
130884	156	26702 Калининград	26702
130885	156	26706 Железнодорожный	26706
130886	156	26781 Смоленск	26781
130887	156	26898 Брянск	26898
130888	156	26976 Красная Гора	26976
130889	156	26997 Трубчевск	26997
130890	156	27008 Бабаево	27008
130891	156	27037 Вологда,Прилуки	27037
130892	156	27051 Тотьма	27051
130893	156	27066 Никольск	27066
130894	156	27083 Опарино	27083
130895	156	27164 Кологрив	27164
130896	156	27208 Максатиха	27208
130897	156	27225 Рыбинск,ГМО	27225
130898	156	27277 Ветлуга	27277
130899	156	27296 Кумены	27296
130900	156	27333 Кострома	27333
130901	156	27385 Яранск	27385
130902	156	27425 Переславль-Залесский	27425
130903	156	27459 Нижний Новгород	27459
130904	156	27485 Йошкар-Ола	27485
130905	156	27509 Можайск	27509
130906	156	27595 Казань	27595
130907	156	27612 Москва, ВДНХ	27612
130908	156	27625 Коломна	27625
130909	156	27648 Елатьма	27648
130910	156	27665 Лукоянов	27665
130911	156	27675 Порецкое	27675
130912	156	27707 Сухиничи	27707
130913	156	27730 Рязань	27730
130914	156	27756 Краснослободск	27756
130915	156	27814 Плавск	27814
130916	156	27823 Павелец	27823
130917	156	27857 Земетчино	27857
130918	156	27872 Инза	27872
130919	156	27947 Тамбов	27947
130920	156	27962 Пенза	27962
130921	156	27995 Безенчук	27995
130922	156	28009 Кирс	28009
130923	156	28064 Леуши	28064
130924	156	28138 Бисер	28138
130925	156	28144 Верхотурье	28144
130926	156	28224 Пермь	28224
130927	156	28255 Туринск	28255
130928	156	28275 Тобольск	28275
130929	156	28312 Дебессы	28312
130930	156	28367 Тюмень	28367
130931	156	28402 Кильмезь	28402
130932	156	28411 Ижевск	28411
130933	156	28418 Сарапул	28418
130934	156	28419 Янаул	28419
130935	156	28434 Красноуфимск	28434
130936	156	28440 Екатеринбург	28440
130937	156	28445 Верхнее Дуброво	28445
130938	156	28493 Тара	28493
130939	156	28506 Елабуга	28506
130940	156	28537 Дуван	28537
130941	156	28552 Шадринск	28552
130942	156	28561 Памятная	28561
130943	156	28573 Ишим	28573
130944	156	28624 Кушнаренково	28624
130945	156	28630 Златоуст	28630
130946	156	28661 Курган	28661
130947	156	28666 Макушино	28666
130948	156	28698 Омск	28698
130949	156	28704 Чулпаново	28704
130950	156	28719 Аксаково	28719
130951	156	28722 Уфа	28722
130952	156	28748 Троицк	28748
130953	156	28802 Серноводск	28802
130954	156	28823 Тукан	28823
130955	156	28825 Стерлитамак	28825
130956	156	28833 Верхнеуральск	28833
130957	156	28895 Русская Поляна	28895
130958	156	29023 Напас	29023
130959	156	29111 Средний Васюган	29111
130960	156	29154 Усть-Озерное	29154
130961	156	29231 Колпашево	29231
130962	156	29263 Енисейск	29263
130963	156	29282 Богучаны	29282
130964	156	29313 Пудино	29313
130965	156	29328 Бакчар	29328
130966	156	29348 Первомайское	29348
130967	156	29379 Тасеево	29379
130968	156	29393 Червянка	29393
130969	156	29418 Северное	29418
130970	156	29430 Томск	29430
130971	156	29467 Ачинск, ж.д.ст.	29467
130972	156	29539 Болотное	29539
130973	156	29541 Тайга	29541
130974	156	29557 Тисуль	29557
130975	156	29570 Красноярск, оп.п.	29570
130976	156	29580 Солянка	29580
130977	156	29594 Тайшет	29594
130978	156	29605 Татарск	29605
130979	156	29612 Барабинск	29612
130980	156	29638 Огурцово	29638
130981	156	29645 Кемерово	29645
130982	156	29664 Светлолобово	29664
130983	156	29698 Нижнеудинск	29698
130984	156	29752 Ненастная	29752
130985	156	29789 Верхняя Гутара	29789
130986	156	29822 Камень-на-Оби	29822
130987	156	29838 Барнаул	29838
130988	156	29849 Кузедеево	29849
130989	156	29858 Неожиданный	29858
130990	156	29862 Абакан	29862
130991	156	29866 Минусинск	29866
130992	156	29915 Славгород	29915
130993	156	29923 Ребриха	29923
130994	156	29939 Бийск-Зональная	29939
130995	156	29974 Оленья Речка	29974
130996	156	29998 Орлик	29998
130997	156	30028 Ика	30028
130998	156	30054 Витим	30054
130999	156	30069 Перевоз	30069
131000	156	30089 Джикимда	30089
131001	156	30209 Ершово	30209
131002	156	30219 Максимово	30219
131003	156	30230 Киренск	30230
131004	156	30252 Мамакан	30252
131005	156	30253 Бодайбо	30253
131006	156	30309 Братск	30309
131007	156	30328 Орлинга	30328
131008	156	30337 Казачинское	30337
131009	156	30356 Таксимо	30356
131010	156	30372 Чара	30372
131011	156	30385 Усть-Нюкжа	30385
131012	156	30393 Чульман	30393
131013	156	30433 Нижнеангарск	30433
131014	156	30437 Карам	30437
131015	156	30469 Калакан	30469
131016	156	30471 Средний Калар	30471
131017	156	30484 Средняя Олекма	30484
131018	156	30493 Нагорный	30493
131019	156	30504 Тулун	30504
131020	156	30521 Жигалово	30521
131021	156	30536 Баргузинский запов-к	30536
131022	156	30554 Багдарин	30554
131023	156	30555 Троицкий Прииск	30555
131024	156	30565 Усть-Каренга	30565
131025	156	30612 Балаганск	30612
131026	156	30627 Баяндай	30627
131027	156	30632 Большой Ушканий о-в	30632
131028	156	30635 Усть-Баогузин	30635
131029	156	30636 Баргузин	30636
131030	156	30650 Романовка	30650
131031	156	30673 Могоча	30673
131032	156	30692 Сковородино	30692
131033	156	30695 Джалинда	30695
131034	156	30703 Инга	30703
131035	156	30710 Иркутск, обсерв.	30710
131036	156	30716 Хомутово	30716
131037	156	30727 Большое Голоустное	30727
131038	156	30745 Сосново-Озерское	30745
131039	156	30758 Чита	30758
131040	156	30777 Сретенск	30777
131041	156	30811 Тунка	30811
131042	156	30815 Хамар-Дабан	30815
131043	156	30822 Бабушкин	30822
131044	156	30823 Улан-Удэ	30823
131045	156	30825 Иволгинск	30825
131046	156	30844 Хилок	30844
131047	156	30859 Агинское	30859
131048	156	30879 Нерчинский з-д	30879
131049	156	30915 Цакир	30915
131050	156	30925 Кяхта	30925
131051	156	30935 Красный Чикой	30935
131052	156	30949 Кыра	30949
131053	156	30954 Мангут	30954
131054	156	30965 Борзя	30965
131055	156	31004 Алдан	31004
131056	156	31026 Учур	31026
131057	156	31062 Югаренок	31062
131058	156	31088 Охотск	31088
131059	156	31092 Талон	31092
131060	156	31102 Канку	31102
131061	156	31137 Токо	31137
131062	156	31152 Нелькан	31152
131063	156	31168 Аян	31168
131064	156	31174 Большой Шантар	31174
131065	156	31235 Джана	31235
131066	156	31253 Бомнак	31253
131067	156	31285 Удское	31285
131068	156	31329 Экимчан	31329
131069	156	31362 Литке	31362
131070	156	31369 Николаевск-на-Амуре	31369
131071	156	31371 Черняево	31371
131072	156	31388 Норск	31388
131073	156	31416 Им. Полины Осипенко	31416
131074	156	31436 Джаоре	31436
131075	156	31439 Богородское	31439
131076	156	31443 Мазаново	31443
131077	156	31459 Верхняя Томь	31459
131078	156	31478 Софийский Прииск	31478
131079	156	31510 Благовещенск	31510
131080	156	31532 Чекунда	31532
131081	156	31538 Сутур	31538
131082	156	31562 Нижнетамбовское	31562
131083	156	31586 Константиновка	31586
131084	156	31594 Архара	31594
131085	156	31677 Солекуль	31677
131086	156	31707 Екатерино-Никольское	31707
131087	156	31725 Смидович	31725
131088	156	31733 Елабуга	31733
131089	156	31735 Хабаровск	31735
131090	156	31770 Советская Гавань	31770
131091	156	31788 Лермонтовка	31788
131092	156	31829 Золотой	31829
131093	156	31845 Красный Яр	31845
131094	156	31873 Дальнереченск	31873
131095	156	31895 Мельничное	31895
131096	156	31909 Терней	31909
131097	156	31915 Пограничный	31915
131098	156	31931 Свиягино	31931
131099	156	31959 Рудная Пристань	31959
131100	156	31960 Владивосток	31960
131101	156	31961 Тимирязевский	31961
131102	156	31969 Посьет	31969
131103	156	31989 Преображение	31989
131104	156	32014 Москальво	32014
131105	156	32027 Погиби	32027
131106	156	32053 Ноглики	32053
131107	156	32061 Александровск-Сахал.	32061
131108	156	32071 Тымовское	32071
131109	156	32076 Пограничное	32076
131110	156	32088 Углегорск	32088
131111	156	32098 Поронайск	32098
131112	156	32099 Мыс Терпения	32099
131113	156	32121 Ильинский	32121
131114	156	32145 Невельск	32145
131115	156	32149 Мыс Крильон	32149
131116	156	32150 Южно-Сахалинск	32150
131117	156	32165 Южно-Курильск	32165
131118	156	32174 Курильск	32174
131119	156	32213 Мыс Лопатка	32213
131120	156	32246 Оссора	32246
131121	156	32252 Усть-Воямполка	32252
131122	156	32287 Усть-Хайрюзово	32287
131123	156	32363 Эссо	32363
131124	156	32389 Ключи	32389
131125	156	32411 Ича	32411
131126	156	32447 Долиновка	32447
131127	156	32477 Соболево	32477
131128	156	32509 Семячик	32509
131129	156	32539 Начики	32539
131130	156	32547 Сосновка	32547
131131	156	32562 Большерецк	32562
131132	156	32583 Петропавловск-Камчатск.	32583
131133	156	32586 Петропавловский маяк	32586
131134	156	32618 Остров Беринга	32618
131135	156	33166 Рыльск	33166
131136	156	34003 Поныри	34003
131137	156	34009 Курск	34009
131138	156	34026 Конь-Колодезь	34026
131139	156	34059 Росташи	34059
131140	156	34110 Богородицкое-Фенино	34110
131141	156	34123 Воронеж	34123
131142	156	34139 Каменная Степь	34139
131143	156	34152 Балашов	34152
131144	156	34163 Октябрьский городок	34163
131145	156	34172 Саратов	34172
131146	156	34186 Ершов	34186
131147	156	34202 Готня	34202
131148	156	34240 Урюпинск	34240
131149	156	34247 Калач	34247
131150	156	34289 Новоузенск	34289
131151	156	34321 Валуйки	34321
131152	156	34356 Фролово	34356
131153	156	34391 Александров Гай	34391
131154	156	34432 Чертково	34432
131155	156	34476 Эльтон	34476
131156	156	34561 Волгоград	34561
131157	156	34579 Верхний Баскунчак	34579
131158	156	34646 Цимлянск(Волгодонск)	34646
131159	156	34720 Таганрог	34720
131160	156	34730 Ростов-на-Дону	34730
131161	156	34740 Гигант	34740
131162	156	34759 Ремонтное	34759
131163	156	34824 Приморско-Ахтарск	34824
131164	156	34861 Элиста	34861
131165	156	34866 Яшкуль	34866
131166	156	34880 Астрахань	34880
131167	156	34927 Краснодар, Круглик	34927
131168	156	34949 Ставрополь, АМСГ	34949
131169	156	34984 Лагань	34984
131170	156	35007 Перелюб	35007
131171	156	35011 Сорочинск	35011
131172	156	35026 Зилаир	35026
131173	156	35041 Бреды	35041
131174	156	35121 Оренбург	35121
131175	156	35127 Акбулак	35127
131176	156	35233 Домбаровский	35233
131177	156	36034 Рубцовск	36034
131178	156	36038 Змеиногорск	36038
131179	156	36045 Солонешное	36045
131180	156	36055 Кызыл-Озек	36055
131181	156	36064 Яйлю	36064
131182	156	36096 Кызыл	36096
131183	156	36099 Сосновка	36099
131184	156	36103 Тоора-Хем	36103
131185	156	36229 Усть-Кокса	36229
131186	156	36259 Кош-Агач	36259
131187	156	36278 Мугур-Аксы	36278
131188	156	36307 Эрзин	36307
131189	156	36442 Кара-Тюрек	36442
131190	156	37001 Анапа,МГ	37001
131191	156	37018 Туапсе	37018
131192	156	37031 Армавир	37031
131193	156	37054 Минеральные Воды	37054
131194	156	37061 Буденновск	37061
131195	156	37075 Южно-Сухокумск	37075
131196	156	37089 Тюлений остров	37089
131197	156	37099 Сочи	37099
131198	156	37107 Красная Поляна	37107
131199	156	37112 Зеленчукская	37112
131200	156	37123 Кисловодск	37123
131201	156	37126 Шаджатмаз	37126
131202	156	37196 Клухорский перевал	37196
131203	156	37228 Владикавказ	37228
131204	156	37235 Грозный	37235
131205	156	37244 Гудермес	37244
131206	156	37461 Сулак,высокогорная	37461
131207	156	37470 Дербент	37470
131208	156	37471 Буйнакск	37471
131209	156	37472 Махачкала	37472
131210	156	37663 Ахты	37663
131211	157	20046 Им.Э.Т.Кренкеля,ГМО	20046
131212	157	20069 Визе	20069
131213	157	20087 Голомянный	20087
131214	157	20107 Баренцбург	20107
131215	157	20289 Русский	20289
131216	157	20292 Им.Е.К.Федорова,ГМО	20292
131217	157	20667 Им.М.В.Попова	20667
131218	157	20674 Диксон	20674
131219	157	20744 Малые Кармакулы	20744
131220	157	20891 Хатанга	20891
131221	157	20982 Волочанка	20982
131222	157	21432 Котельный	21432
131223	157	21647 Шалаурова	21647
131224	157	21802 Саскылах	21802
131225	157	21824 Тикси	21824
131226	157	21908 Джалинда	21908
131227	157	21921 Кюсюр	21921
131228	157	21931 Юбилейная	21931
131229	157	21946 Чокурдах	21946
131230	157	21982 Остров Врангеля	21982
131231	157	22003 Вайда-Губа	22003
131232	157	22028 Териберка	22028
131233	157	22095 Колгуев Северный	22095
131234	157	22101 Янискоски	22101
131235	157	22113 Мурманск	22113
131236	157	22140 Святой Нос	22140
131237	157	22165 Канин Нос	22165
131238	157	22204 Ковдор	22204
131239	157	22217 Кандалакша	22217
131240	157	22235 Краснощелье	22235
131241	157	22292 Индига	22292
131242	157	22324 Умба	22324
131243	157	22355 Сосновец остров	22355
131244	157	22408 Калевала	22408
131245	157	22438 Жижгин	22438
131246	157	22471 Мезень	22471
131247	157	22520 Кемь-порт	22520
131248	157	22550 Архангельск	22550
131249	157	22583 Койнас	22583
131250	157	22602 Реболы	22602
131251	157	22619 Паданы	22619
131252	157	22641 Онега	22641
131253	157	22768 Шенкурск	22768
131254	157	22802 Сортавала	22802
131255	157	22820 Петрозаводск	22820
131256	157	22837 Вытегра	22837
131257	157	22845 Каргополь	22845
131258	157	22854 Няндома	22854
131259	157	22887 Котлас	22887
131260	157	22892 Выборг	22892
131261	157	22907 Гогланд	22907
131262	157	23022 Амдерма	23022
131263	157	23032 Марресаля	23032
131264	157	23074 Дудинка	23074
131265	157	23205 Нарьян-Мар	23205
131266	157	23219 Хоседа-Хард	23219
131267	157	23220 Елецкая	23220
131268	157	23242 Новый Порт	23242
131269	157	23256 Тазовск	23256
131270	157	23274 Игарка	23274
131271	157	23324 Петрунь	23324
131272	157	23330 Салехард	23330
131273	157	23331 Ра-Из	23331
131274	157	23345 Ныда	23345
131275	157	23383 Агата	23383
131276	157	23405 Усть-Цильма	23405
131277	157	23412 Усть-Уса	23412
131278	157	23418 Печора	23418
131279	157	23472 Туруханск	23472
131280	157	23514 Ираель	23514
131281	157	23527 Саранпауль	23527
131282	157	23552 Тарко-Сале	23552
131283	157	23589 Тутончаны	23589
131284	157	23631 Березово	23631
131285	157	23656 Халесовая	23656
131286	157	23662 Толька	23662
131287	157	23678 Верхнеимбатск	23678
131288	157	23707 Усть-Вымь	23707
131289	157	23711 Троицко-Печорское	23711
131290	157	23724 Няксимволь	23724
131291	157	23734 Октябрьское	23734
131292	157	23804 Сыктывкар	23804
131293	157	23867 Ларьяк	23867
131294	157	23884 Бор	23884
131295	157	23891 Байкит	23891
131296	157	23914 Чердынь	23914
131297	157	23921 Ивдель	23921
131298	157	23933 Ханты-Мансийск	23933
131299	157	23955 Александровское	23955
131300	157	23966 Ванжиль-Кынак	23966
131301	157	23986 Северо-Енисейский	23986
131302	157	24076 Депутатский	24076
131303	157	24105 Ессей	24105
131304	157	24125 Оленек	24125
131305	157	24136 Сухана	24136
131306	157	24266 Верхоянск	24266
131307	157	24329 Шелагонцы	24329
131308	157	24343 Жиганск	24343
131309	157	24382 Усть-Мома	24382
131310	157	24507 Тура	24507
131311	157	24606 Кислокан	24606
131312	157	24641 Вилюйск	24641
131313	157	24643 Хатырык-Хомо	24643
131314	157	24671 Томпо	24671
131315	157	24679 Восточная	24679
131316	157	24688 Оймякон	24688
131317	157	24713 Наканно	24713
131318	157	24738 Сунтар	24738
131319	157	24763 Крест-Хальджай	24763
131320	157	24790 Сусуман	24790
131321	157	24802 Стрелка Чуня	24802
131322	157	24817 Ербогачен	24817
131323	157	24908 Ванавара	24908
131324	157	24933 Килеер	24933
131325	157	24944 Олекминск	24944
131326	157	24959 Якутск	24959
131327	157	24966 Усть-Мая	24966
131328	157	24982 Уега	24982
131329	157	25042 Остров Айон	25042
131330	157	25138 Островное	25138
131331	157	25173 Мыс Шмидта	25173
131332	157	25206 Среднеколымск	25206
131333	157	25248 Илирней	25248
131334	157	25282 Мыс Ванкарем	25282
131335	157	25325 Усть-Олой	25325
131336	157	25356 Эньмувеем	25356
131337	157	25372 Амгуэма,87км	25372
131338	157	25399 Уэлен	25399
131339	157	25400 Зырянка	25400
131340	157	25428 Омолон	25428
131341	157	25503 Коркодон	25503
131342	157	25538 Верхне-Пенжино	25538
131343	157	25551 Марково	25551
131344	157	25563 Анадырь	25563
131345	157	25594 Бухта Провидения	25594
131346	157	25621 Кедон	25621
131347	157	25656 Березово	25656
131348	157	25677 Беринговская	25677
131349	157	25703 Сеймчан	25703
131350	157	25705 Среднекан	25705
131351	157	25744 Каменское	25744
131352	157	25767 Хатырка	25767
131353	157	25912 Ола	25912
131354	157	25913 Магадан	25913
131355	157	25916 Мыс Алевина	25916
131356	157	25922 Шелихово	25922
131357	157	25927 Брохово	25927
131358	157	25932 Тайгонос	25932
131359	157	25954 Корф	25954
131360	157	25956 Апука	25956
131361	157	26063 Санкт-Петербург	26063
131362	157	26069 Белогорка	26069
131363	157	26094 Тихвин	26094
131364	157	26157 Гдов	26157
131365	157	26258 Псков	26258
131366	157	26275 Старая Русса	26275
131367	157	26298 Бологое	26298
131368	157	26477 Великие Луки	26477
131369	157	26479 Торопец	26479
131370	157	26614 Советск	26614
131371	157	26702 Калининград	26702
131372	157	26781 Смоленск	26781
131373	157	26898 Брянск	26898
131374	157	27008 Бабаево	27008
131375	157	27037 Вологда,Прилуки	27037
131376	157	27051 Тотьма	27051
131377	157	27066 Никольск	27066
131378	157	27225 Рыбинск,ГМО	27225
131379	157	27296 Кумены	27296
131380	157	27333 Кострома	27333
131381	157	27459 Нижний Новгород	27459
131382	157	27485 Йошкар-Ола	27485
131383	157	27509 Можайск	27509
131384	157	27595 Казань	27595
131385	157	27612 Москва, ВДНХ	27612
131386	157	27648 Елатьма	27648
131387	157	27675 Порецкое	27675
131388	157	27707 Сухиничи	27707
131389	157	27730 Рязань	27730
131390	157	27814 Плавск	27814
131391	157	27823 Павелец	27823
131392	157	27857 Земетчино	27857
131393	157	27947 Тамбов	27947
131394	157	27962 Пенза	27962
131395	157	27995 Безенчук	27995
131396	157	28064 Леуши	28064
131397	157	28138 Бисер	28138
131398	157	28144 Верхотурье	28144
131399	157	28224 Пермь	28224
131400	157	28255 Туринск	28255
131401	157	28275 Тобольск	28275
131402	157	28367 Тюмень	28367
131403	157	28411 Ижевск	28411
131404	157	28418 Сарапул	28418
131405	157	28419 Янаул	28419
131406	157	28434 Красноуфимск	28434
131407	157	28440 Екатеринбург	28440
131408	157	28445 Верхнее Дуброво	28445
131409	157	28493 Тара	28493
131410	157	28537 Дуван	28537
131411	157	28552 Шадринск	28552
131412	157	28561 Памятная	28561
131413	157	28573 Ишим	28573
131414	157	28624 Кушнаренково	28624
131415	157	28630 Златоуст	28630
131416	157	28661 Курган	28661
131417	157	28666 Макушино	28666
131418	157	28698 Омск	28698
131419	157	28704 Чулпаново	28704
131420	157	28722 Уфа	28722
131421	157	28748 Троицк	28748
131422	157	28825 Стерлитамак	28825
131423	157	28833 Верхнеуральск	28833
131424	157	28895 Русская Поляна	28895
131425	157	29023 Напас	29023
131426	157	29111 Средний Васюган	29111
131427	157	29154 Усть-Озерное	29154
131428	157	29231 Колпашево	29231
131429	157	29263 Енисейск	29263
131430	157	29282 Богучаны	29282
131431	157	29313 Пудино	29313
131432	157	29328 Бакчар	29328
131433	157	29393 Червянка	29393
131434	157	29418 Северное	29418
131435	157	29430 Томск	29430
131436	157	29467 Ачинск, ж.д.ст.	29467
131437	157	29539 Болотное	29539
131438	157	29541 Тайга	29541
131439	157	29557 Тисуль	29557
131440	157	29580 Солянка	29580
131441	157	29594 Тайшет	29594
131442	157	29605 Татарск	29605
131443	157	29612 Барабинск	29612
131444	157	29638 Огурцово	29638
131445	157	29645 Кемерово	29645
131446	157	29698 Нижнеудинск	29698
131447	157	29752 Ненастная	29752
131448	157	29789 Верхняя Гутара	29789
131449	157	29822 Камень-на-Оби	29822
131450	157	29838 Барнаул	29838
131451	157	29849 Кузедеево	29849
131452	157	29862 Абакан	29862
131453	157	29866 Минусинск	29866
131454	157	29923 Ребриха	29923
131455	157	29974 Оленья Речка	29974
131456	157	29998 Орлик	29998
131457	157	30054 Витим	30054
131458	157	30069 Перевоз	30069
131459	157	30209 Ершово	30209
131460	157	30219 Максимово	30219
131461	157	30230 Киренск	30230
131462	157	30252 Мамакан	30252
131463	157	30309 Братск	30309
131464	157	30328 Орлинга	30328
131465	157	30337 Казачинское	30337
131466	157	30356 Таксимо	30356
131467	157	30372 Чара	30372
131468	157	30385 Усть-Нюкжа	30385
131469	157	30433 Нижнеангарск	30433
131470	157	30437 Карам	30437
131471	157	30469 Калакан	30469
131472	157	30471 Средний Калар	30471
131473	157	30484 Средняя Олекма	30484
131474	157	30493 Нагорный	30493
131475	157	30504 Тулун	30504
131476	157	30521 Жигалово	30521
131477	157	30536 Баргузинский запов-к	30536
131478	157	30554 Багдарин	30554
131479	157	30555 Троицкий Прииск	30555
131480	157	30612 Балаганск	30612
131481	157	30627 Баяндай	30627
131482	157	30632 Большой Ушканий о-в	30632
131483	157	30636 Баргузин	30636
131484	157	30673 Могоча	30673
131485	157	30692 Сковородино	30692
131486	157	30703 Инга	30703
131487	157	30710 Иркутск, обсерв.	30710
131488	157	30716 Хомутово	30716
131489	157	30727 Большое Голоустное	30727
131490	157	30745 Сосново-Озерское	30745
131491	157	30758 Чита	30758
131492	157	30777 Сретенск	30777
131493	157	30811 Тунка	30811
131494	157	30815 Хамар-Дабан	30815
131495	157	30822 Бабушкин	30822
131496	157	30823 Улан-Удэ	30823
131497	157	30825 Иволгинск	30825
131498	157	30879 Нерчинский з-д	30879
131499	157	30915 Цакир	30915
131500	157	30925 Кяхта	30925
131501	157	30935 Красный Чикой	30935
131502	157	30949 Кыра	30949
131503	157	30954 Мангут	30954
131504	157	30965 Борзя	30965
131505	157	31004 Алдан	31004
131506	157	31026 Учур	31026
131507	157	31088 Охотск	31088
131508	157	31092 Талон	31092
131509	157	31102 Канку	31102
131510	157	31152 Нелькан	31152
131511	157	31168 Аян	31168
131512	157	31174 Большой Шантар	31174
131513	157	31253 Бомнак	31253
131514	157	31329 Экимчан	31329
131515	157	31371 Черняево	31371
131516	157	31388 Норск	31388
131517	157	31416 Им. Полины Осипенко	31416
131518	157	31443 Мазаново	31443
131519	157	31478 Софийский Прииск	31478
131520	157	31510 Благовещенск	31510
131521	157	31532 Чекунда	31532
131522	157	31586 Константиновка	31586
131523	157	31677 Солекуль	31677
131524	157	31707 Екатерино-Никольское	31707
131525	157	31735 Хабаровск	31735
131526	157	31770 Советская Гавань	31770
131527	157	31788 Лермонтовка	31788
131528	157	31829 Золотой	31829
131529	157	31845 Красный Яр	31845
131530	157	31873 Дальнереченск	31873
131531	157	31895 Мельничное	31895
131532	157	31909 Терней	31909
131533	157	31915 Пограничный	31915
131534	157	31959 Рудная Пристань	31959
131535	157	31960 Владивосток	31960
131536	157	31961 Тимирязевский	31961
131537	157	31969 Посьет	31969
131538	157	31989 Преображение	31989
131539	157	32027 Погиби	32027
131540	157	32061 Александровск-Сахал.	32061
131541	157	32071 Тымовское	32071
131542	157	32076 Пограничное	32076
131543	157	32088 Углегорск	32088
131544	157	32098 Поронайск	32098
131545	157	32099 Мыс Терпения	32099
131546	157	32121 Ильинский	32121
131547	157	32145 Невельск	32145
131548	157	32149 Мыс Крильон	32149
131549	157	32150 Южно-Сахалинск	32150
131550	157	32165 Южно-Курильск	32165
131551	157	32174 Курильск	32174
131552	157	32213 Мыс Лопатка	32213
131553	157	32252 Усть-Воямполка	32252
131554	157	32287 Усть-Хайрюзово	32287
131555	157	32363 Эссо	32363
131556	157	32389 Ключи	32389
131557	157	32411 Ича	32411
131558	157	32447 Долиновка	32447
131559	157	32477 Соболево	32477
131560	157	32509 Семячик	32509
131561	157	32539 Начики	32539
131562	157	32547 Сосновка	32547
131563	157	32562 Большерецк	32562
131564	157	32583 Петропавловск-Камчатск.	32583
131565	157	32586 Петропавловский маяк	32586
131566	157	32618 Остров Беринга	32618
131567	157	34009 Курск	34009
131568	157	34026 Конь-Колодезь	34026
131569	157	34059 Росташи	34059
131570	157	34110 Богородицкое-Фенино	34110
131571	157	34123 Воронеж	34123
131572	157	34139 Каменная Степь	34139
131573	157	34163 Октябрьский городок	34163
131574	157	34172 Саратов	34172
131575	157	34186 Ершов	34186
131576	157	34240 Урюпинск	34240
131577	157	34289 Новоузенск	34289
131578	157	34321 Валуйки	34321
131579	157	34356 Фролово	34356
131580	157	34476 Эльтон	34476
131581	157	34561 Волгоград	34561
131582	157	34579 Верхний Баскунчак	34579
131583	157	34646 Цимлянск(Волгодонск)	34646
131584	157	34720 Таганрог	34720
131585	157	34730 Ростов-на-Дону	34730
131586	157	34740 Гигант	34740
131587	157	34824 Приморско-Ахтарск	34824
131588	157	34861 Элиста	34861
131589	157	34866 Яшкуль	34866
131590	157	34880 Астрахань	34880
131591	157	34927 Краснодар, Круглик	34927
131592	157	34949 Ставрополь, АМСГ	34949
131593	157	35026 Зилаир	35026
131594	157	35121 Оренбург	35121
131595	157	36038 Змеиногорск	36038
131596	157	36055 Кызыл-Озек	36055
131597	157	36064 Яйлю	36064
131598	157	36096 Кызыл	36096
131599	157	36099 Сосновка	36099
131600	157	36103 Тоора-Хем	36103
131601	157	36229 Усть-Кокса	36229
131602	157	36259 Кош-Агач	36259
131603	157	36307 Эрзин	36307
131604	157	36442 Кара-Тюрек	36442
131605	157	37001 Анапа,МГ	37001
131606	157	37018 Туапсе	37018
131607	157	37031 Армавир	37031
131608	157	37061 Буденновск	37061
131609	157	37075 Южно-Сухокумск	37075
131610	157	37099 Сочи	37099
131611	157	37107 Красная Поляна	37107
131612	157	37112 Зеленчукская	37112
131613	157	37123 Кисловодск	37123
131614	157	37126 Шаджатмаз	37126
131615	157	37196 Клухорский перевал	37196
131616	157	37228 Владикавказ	37228
131617	157	37235 Грозный	37235
131618	157	37461 Сулак,высокогорная	37461
131619	157	37470 Дербент	37470
131620	157	37472 Махачкала	37472
131621	157	37663 Ахты	37663
131622	158	20674 Остров Диксон	20674
131623	158	21824 Тикси	21824
131624	158	22113 Мурманск	22113
131625	158	22217 Кандалакша	22217
131626	158	22271 Шойна	22271
131627	158	22543 Архангельск	22543
131628	158	23078 Норильск	23078
131629	158	23205 Нарьян-Мар	23205
131630	158	23330 Салехард	23330
131631	158	23472 Туруханск	23472
131632	158	23921 Ивдель	23921
131633	158	24125 Оленек	24125
131634	158	24266 Верхоянск	24266
131635	158	24343 Жиганск	24343
131636	158	27459 Нижний Новгород	27459
131637	158	28698 Омск	28698
131638	158	29862 Хакасская	29862
131639	158	30230 Киренск	30230
131640	158	31088 Охотск	31088
131641	158	32540 Петропавловск-К	32540
131642	158	35121 Оренбург	35121
131643	158	89512 Новолазаревская	89512
131644	158	89592 Мирный	89592
133370	159	5628960 Боготол                21	5628960
133371	159	5629260 Емельяново             21	5629260
133372	159	5629530 Солянка                21	5629530
133373	159	5629570 Канск                  21	5629570
131645	159	4154770 Ахты                   13	4154770
131646	159	4174820 Касумкент              13	4174820
131647	159	4214640 Тлярата                13	4214640
131648	159	4214710 Кумух,АМСГ             13	4214710
131649	159	4214780 Маджалис               13	4214780
131650	159	4214810 Дербент                13	4214810
131651	159	4214830 Дербент                13	4214830
131652	159	4214840 Дербент                13	4214840
131653	159	4224710 Кумух                  13	4224710
131654	159	4244630 Сулак,высокогорная     13	4244630
131655	159	4244690 Гуниб                  13	4244690
131656	159	4244700 Гуниб                  13	4244700
131657	159	4244730 Леваши                 13	4244730
131658	159	4254770 Сергокала              13	4254770
131659	159	4254790 Изберг                 13	4254790
131660	159	4254800 Изберг                 13	4254800
131661	159	4263081 Посьет                 26	4263081
131662	159	4263131 Гамов                  26	4263131
131663	159	4264410 Рокский перевал        13	4264410
131664	159	4264670 Хунзах,АМСГ            13	4264670
131665	159	4273241 Аскольд,остров         26	4273241
131666	159	4273301 Поворотный             26	4273301
131667	159	4274620 Ботлих                 13	4274620
131668	159	4283291 Находка                26	4283291
131669	159	4284470 Армхи(Дарьяли)         13	4284470
131670	159	4284710 Буйнакск               13	4284710
131671	159	4293391 Преображение           26	4293391
131672	159	4294440 Даргавс                13	4294440
131673	159	4294450 Кармадон               13	4294450
131674	159	4294570 Шатой                  13	4294570
131675	159	4294610 Ведено                 13	4294610
131676	159	4304420 Алагир                 13	4304420
131677	159	4304460 Владикавказ            13	4304460
131678	159	4304470 Владикавказ,цгмс       13	4304470
131679	159	4304750 Махачкала              13	4304750
131680	159	4304760 Махачкала              13	4304760
131681	159	4313181 Владивосток,порт       26	4313181
131682	159	4313191 Владивосток,порт       26	4313191
131683	159	4313231 Большой Камень         26	4313231
131684	159	4313431 Валентин               26	4313431
131685	159	4314460 Михайловское,АГРО      13	4314460
131686	159	4314570 Шали                   13	4314570
131687	159	4323151 Барабаш                26	4323151
131688	159	4323281 Воробей                26	4323281
131689	159	4323301 Партизанск             26	4323301
131690	159	4324250 Терскол                13	4324250
131691	159	4324390 Чикола                 13	4324390
131692	159	4324480 Назрань                13	4324480
131693	159	4333201 Сад-Город,грязелечеб.  26	4333201
131694	159	4333211 Сад-Город,АЭРО         26	4333211
131695	159	4333221 Трудовое               26	4333221
131696	159	4334180 Клухорский,перевал     13	4334180
131697	159	4334250 Терскол                13	4334250
131698	159	4334260 Чегет                  13	4334260
131699	159	4334440 Заманкул               13	4334440
131700	159	4334510 Орджоникидзевская      13	4334510
131701	159	4334520 Cерноводская           13	4334520
131702	159	4334660 Хасавюрт               13	4334660
131703	159	4334750 Сулак                  13	4334750
131704	159	4343221 Артем                  26	4343221
131705	159	4343241 Майхе                  26	4343241
131706	159	4343391 Лазо                   26	4343391
131707	159	4343491 Маргаритово            26	4343491
131708	159	4343990 Сочи(адлер)            13	4343990
131709	159	4344570 Грозный,АМСГ           13	4344570
131710	159	4344610 Гудермес               13	4344610
131711	159	4353251 Многоудобное           26	4353251
131712	159	4353341 Молчановка             26	4353341
131713	159	4353980 Сочи,ГМО               13	4353980
131714	159	4354170 Теберда                13	4354170
131715	159	4354210 Учкулан                13	4354210
131716	159	4354360 Нальчик                13	4354360
131717	159	4354420 Терек                  13	4354420
131718	159	4354510 Горагорская            13	4354510
131719	159	4354611 Зеленовск              34	4354611
131720	159	4354630 Шелковская             13	4354630
131721	159	4363131 Полковница             26	4363131
131722	159	4363221 Приморская             26	4363221
131723	159	4363251 Ново-Хатуничи          26	4363251
131724	159	4363421 Березняки              26	4363421
131725	159	4364020 Красная Поляна         13	4364020
131726	159	4364130 Архыз                  13	4364130
131727	159	4364680 Бабаюрт                13	4364680
131728	159	4373191 Тереховка              26	4373191
131729	159	4373221 Горнотаежная           26	4373221
131730	159	4373990 Калиновое озеро        13	4373990
131731	159	4374020 Ачишхо                 13	4374020
131732	159	4374030 Кордон Лаура           13	4374030
131733	159	4374240 Бермамыт               13	4374240
131734	159	4374270 Шаджатмаз              13	4374270
131735	159	4374310 Каменномостское        13	4374310
131736	159	4374350 Баксан                 13	4374350
131737	159	4374470 Моздок                 13	4374470
131738	159	4374530 Наурская               13	4374530
131739	159	4383531 Ольга                  26	4383531
131740	159	4384190 Карачаевск,АМСГ        13	4384190
131741	159	4384410 Прохладная             13	4384410
131742	159	4384670 Кизляр,АМСГ            13	4384670
131743	159	4384680 Кизляр,город           13	4384680
131744	159	4393191 Тимирязевский          26	4393191
131745	159	4393311 Анучино                26	4393311
131746	159	4393471 Фурманово              26	4393471
131747	159	4393561 Балюзек                26	4393561
131748	159	4393940 Лазаревское            13	4393940
131749	159	4394160 Зеленчукская           13	4394160
131750	159	4394270 Кисловодск             13	4394270
131751	159	4394360 Ново-Павловская        13	4394360
131752	159	4394670 Кизляр                 13	4394670
131753	159	4394681 Малокурильское         34	4394681
131754	159	4403131 Полтавка               26	4403131
131755	159	4404010 Гузерипль              13	4404010
131756	159	4404040 Зубровый парк          13	4404040
131757	159	4404070 Бурное                 13	4404070
131758	159	4404310 Пятигорск              13	4404310
131759	159	4404581 Южно-Курильск          34	4404581
131760	159	4404740 Крайновка              13	4404740
131761	159	4404760 Чечень,ос.             13	4404760
131762	159	4413910 Туапсе                 13	4413910
131763	159	4414080 Псебай                 13	4414080
131764	159	4414290 Золотуха               13	4414290
131765	159	4414300 Пятигорск,АМСГ         13	4414300
131766	159	4414590 Терекли-Мектеб         13	4414590
131767	159	4423391 Чугуевка               26	4423391
131768	159	4423501 Кавалерово,АМСГ        26	4423501
131769	159	4424020 Даховская              13	4424020
131770	159	4424200 Черкесск               13	4424200
131771	159	4424210 Черкесск               13	4424210
131772	159	4424310 Минеральные Воды       13	4424310
131773	159	4424350 Георгиевск             13	4424350
131774	159	4424520 Рощино                 13	4424520
131775	159	4433241 Халкидон               26	4433241
131776	159	4433331 Арсеньев,АМСГ          26	4433331
131777	159	4433351 Богополь               26	4433351
131778	159	4433551 Богополь               26	4433551
131779	159	4433870 Джубга                 13	4433870
131780	159	4433930 Горный                 13	4433930
131781	159	4434010 Шунтук                 13	4434010
131782	159	4434440 Ольгино                13	4434440
131783	159	4434700 Брянская коса          13	4434700
131784	159	4443141 Пограничный            26	4443141
131785	159	4443211 Хороль                 26	4443211
131786	159	4443351 Яковлевка              26	4443351
131787	159	4443491 Перевальная            26	4443491
131788	159	4443591 Рудная пристань        26	4443591
131789	159	4444150 Отрадная               13	4444150
131790	159	4444390 Зеленокумск            13	4444390
131791	159	4444550 Южно-Сухокумск         13	4444550
131792	159	4444660 Кочубей                13	4444660
131793	159	4453410 Ай-Петри               10	4453410
131794	159	4453410 Ай-Петри               47	4453410
131795	159	4453420 Ялта                   10	4453420
131796	159	4453420 Ялта                   47	4453420
131797	159	4453430 Никитский сад          10	4453430
131798	159	4453430 Никитский сад          47	4453430
131799	159	4454250 Курсавка               13	4454250
131800	159	4454750 Тюлений,ос.            13	4454750
131801	159	4463181 Жариково               26	4463181
131802	159	4463281 Спасск-Дальний         26	4463281
131803	159	4463330 Камышевая,бухта        10	4463330
131804	159	4463330 Камышевая,бухта        47	4463330
131805	159	4463340 Херсонесский,маяк      10	4463340
131806	159	4463340 Херсонесский,маяк      47	4463340
131807	159	4463350 Севастополь            10	4463350
131808	159	4463350 Севастополь            47	4463350
131809	159	4463390 Голубинка              10	4463390
131810	159	4463390 Голубинка              47	4463390
131811	159	4463410 Счастливое             10	4463410
131812	159	4463410 Счастливое             47	4463410
131813	159	4463551 Дальнегорск            26	4463551
131814	159	4463800 Геленджик,АМСГ         13	4463800
131815	159	4463910 Горячий Ключ           13	4463910
131816	159	4464010 Майкоп                 13	4464010
131817	159	4464070 Лабинск,АМСГ           13	4464070
131818	159	4464190 Невинномысск           13	4464190
131819	159	4464220 Киан                   13	4464220
131820	159	4464480 Ачикулак               13	4464480
131821	159	4464560 Бажиган                13	4464560
131822	159	4473211 Астраханка             26	4473211
131823	159	4473440 Алушта                 10	4473440
131824	159	4473440 Алушта                 47	4473440
131825	159	4473760 Абрау-Дюрсо,АГРО       13	4473760
131826	159	4473780 Новороссийск           13	4473780
131827	159	4474300 Александровское        13	4474300
131828	159	4483281 Новосельское           26	4483281
131829	159	4483390 Почтовое               10	4483390
131830	159	4483390 Почтовое               47	4483390
131831	159	4483421 Самарка                26	4483421
131832	159	4483430 Ангарский,перевал      10	4483430
131833	159	4483430 Ангарский,перевал      47	4483430
131834	159	4483451 Журавлевка             26	4483451
131835	159	4483780 Мархотский,перевал     13	4483780
131836	159	4483990 Белореченск            13	4483990
131837	159	4484410 Буденновск             13	4484410
131838	159	4484500 Нефтекумск             13	4484500
131839	159	4493311 Свиягино               26	4493311
131840	159	4493450 Караби-Яйла            10	4493450
131841	159	4493450 Караби-Яйла            47	4493450
131842	159	4493490 Судак                  10	4493490
131843	159	4493490 Судак                  47	4493490
131844	159	4493520 Карадаг                10	4493520
131845	159	4493520 Карадаг                47	4493520
131846	159	4493730 Анапа,МГ               13	4493730
131847	159	4493800 Крымск                 13	4493800
131848	159	4494270 Сергиевка              13	4494270
131849	159	4494480 Южно-Сухокумск,АМСГ    13	4494480
131850	159	4494510 Величаевское           13	4494510
131851	159	4494670 Артезиан               13	4494670
131852	159	4503400 Симферополь, АМСГ      10	4503400
131853	159	4503400 Симферополь, АМСГ      47	4503400
131854	159	4503410 Симферополь            10	4503410
131855	159	4503410 Симферополь            47	4503410
131856	159	4503540 Феодосия               10	4503540
131857	159	4503540 Феодосия               47	4503540
131858	159	4503661 Терней                 26	4503661
131859	159	4503671 Терней                 26	4503671
131860	159	4503890 Краснодар,гор.уч.      13	4503890
131861	159	4503900 Краснодар,Витим        13	4503900
131862	159	4503920 Краснодар,АМСГ         13	4503920
131863	159	4504120 Армавир,АМСГ           13	4504120
131864	159	4504200 Ставрополь,АМСГ        13	4504200
131865	159	4513351 Кировский              26	4513351
131866	159	4513460 Крымская (Белогорск)   10	4513460
131867	159	4513460 Крымская (Белогорск)   47	4513460
131868	159	4513870 Белозерный             13	4513870
131869	159	4513880 Белозерный             13	4513880
131870	159	4513900 Краснодар,круглик      13	4513900
131871	159	4514030 Темиргоевская          13	4514030
131872	159	4514200 Ставрополь,АМСГ        13	4514200
131873	159	4514210 Ставрополь,АМСГ        13	4514210
131874	159	4514340 Благодарный            13	4514340
131875	159	4523201 Турий Рог              26	4523201
131876	159	4523340 Евпатория,порт         10	4523340
131877	159	4523340 Евпатория,порт         47	4523340
131878	159	4523540 Владиславовка,х/свх.   10	4523540
131879	159	4523540 Владиславовка,х/свх.   47	4523540
131880	159	4523670 Тамань                 13	4523670
131881	159	4523970 Усть-Лабинск           13	4523970
131882	159	4524791 Курильск               34	4524791
131883	159	4533410 Хлопковое              10	4533410
131884	159	4533410 Хлопковое              47	4533410
131885	159	4533650 Керчь,порт             10	4533650
131886	159	4533650 Керчь,порт             47	4533650
131887	159	4533740 Кубанская(Темрюк)      13	4533740
131888	159	4533810 Славянск-на-Кубани     13	4533810
131889	159	4543431 Малиново               26	4543431
131890	159	4543620 Чистополье             10	4543620
131891	159	4543620 Чистополье             47	4543620
131892	159	4543640 Керчь,АМСГ             10	4543640
131893	159	4543640 Керчь,АМСГ             47	4543640
131894	159	4543660 Опасное                10	4543660
131895	159	4543660 Опасное                47	4543660
131896	159	4543721 Малая Кема             26	4543721
131897	159	4544060 Кропоткин              13	4544060
131898	159	4544170 Изобильный             13	4544170
131899	159	4544290 Светлоград             13	4544290
131900	159	4544420 Арзгир                 13	4544420
131901	159	4544600 Комсомольский          13	4544600
131902	159	4544660 Нарын-Худук            13	4544660
131903	159	4544740 Лагань(Каспийский)     13	4544740
131904	159	4544780 Искусственный,ос.      13	4544780
131905	159	4553270 Черноморское           10	4553270
131906	159	4553270 Черноморское           47	4553270
131907	159	4553310 Кировский з-свх        10	4553310
131908	159	4553310 Кировский з-свх        47	4553310
131909	159	4553341 Лесозаводск            26	4553341
131910	159	4553420 Клепинино              10	4553420
131911	159	4553420 Клепинино              47	4553420
131912	159	4553470 Нижнегорск             10	4553470
131913	159	4553470 Нижнегорск             47	4553470
131914	159	4553551 Мельничное             26	4553551
131915	159	4553580 Мысовое                10	4553580
131916	159	4553580 Мысовое                47	4553580
131917	159	4553950 Кореновск              13	4553950
131918	159	4554120 Новоалександровск      13	4554120
131919	159	4554210 Труновское             13	4554210
131920	159	4563360 Воронки                10	4563360
131921	159	4563360 Воронки                47	4563360
131922	159	4563810 Демин-Ерик             13	4563810
131923	159	4563890 Тимашевск              13	4563890
131924	159	4564941 Вандерлинда,мыс        34	4564941
131925	159	4573440 Джанкой                10	4573440
131926	159	4573440 Джанкой                47	4573440
131927	159	4574760 Бирючья Коса           13	4574760
131928	159	4583320 Стерегущий             10	4583320
131929	159	4583320 Стерегущий             47	4583320
131930	159	4583350 Раздольное             10	4583350
131931	159	4583350 Раздольное             47	4583350
131932	159	4583771 Белкин                 26	4583771
131933	159	4584460 Ики-Бурул              13	4584460
131934	159	4584570 Адык                   13	4584570
131935	159	4584720 Лиман                  13	4584720
131936	159	4584790 Дамчик                 13	4584790
131937	159	4593371 Дальнереченск          26	4593371
131938	159	4593380 Ишунь                  10	4593380
131939	159	4593380 Ишунь                  47	4593380
131940	159	4593490 Стрелковое             10	4593490
131941	159	4593490 Стрелковое             47	4593490
131942	159	4593491 Рощино                 26	4593491
131943	159	4593651 Молодежное             26	4593651
131944	159	4594010 Тихорецк               13	4594010
131945	159	4594150 Красногвардейское      13	4594150
131946	159	4594201 Мыс Крильон            34	4594201
131947	159	4594270 Большая Джалга         13	4594270
131948	159	4594340 Дивное                 13	4594340
131949	159	4594630 Красный Коневод        13	4594630
131950	159	4594810 Караульное             13	4594810
131951	159	4603820 Приморско-Ахтарск      13	4603820
131952	159	4613541 Глубинное              26	4613541
131953	159	4613681 Высота 1647            26	4613681
131954	159	4613791 Кхуцин                 26	4613791
131955	159	4613890 Каневская              13	4613890
131956	159	4613980 Сосыка                 13	4613980
131957	159	4614090 Белая Глина            13	4614090
131958	159	4614190 Городовиковск          13	4614190
131959	159	4614810 Табола                 13	4614810
131960	159	4623401 Губерово               26	4623401
131961	159	4624341 Южное                  34	4624341
131962	159	4624350 Калач-на-Дону          13	4624350
131963	159	4624540 Яшкуль                 13	4624540
131964	159	4624860 Зеленга                13	4624860
131965	159	4625051 Уруп                   34	4625051
131966	159	4634131 Монерон                34	4634131
131967	159	4634420 Элиста,АМСГ            13	4634420
131968	159	4643790 Камышеватская          13	4643790
131969	159	4644231 Кириллово              34	4644231
131970	159	4644270 Маныч-Грузское         13	4644270
131971	159	4644341 Новиково               34	4644341
131972	159	4644600 Утта                   13	4644600
131973	159	4644800 Астрахань,ГМО          13	4644800
131974	159	4644810 Астрахань,ГМО          13	4644810
131975	159	4653531 Красный Яр             26	4653531
131976	159	4653581 Восток                 26	4653581
131977	159	4653691 Охотничий              26	4653691
131978	159	4653831 Сосуново               26	4653831
131979	159	4653910 Староминская           13	4653910
131980	159	4654130 Гигант                 13	4654130
131981	159	4654150 Сальск,АМСГ            13	4654150
131982	159	4663780 Должанская             13	4663780
131983	159	4663960 Кущевская              13	4663960
131984	159	4664110 Целина                 13	4664110
131985	159	4664281 Корсаков               34	4664281
131986	159	4664370 Ремонтное              13	4664370
131987	159	4673621 Родниковая             26	4673621
131988	159	4673830 Ейск                   13	4673830
131989	159	4674170 Пролетарск             13	4674170
131990	159	4674191 Невельск               34	4674191
131991	159	4683431 Бикин                  25	4683431
131992	159	4684030 Зерноград              13	4684030
131993	159	4684241 Огоньки                34	4684241
131994	159	4685181 Симушир                34	4685181
131995	159	4693890 Маргаритово            13	4693890
131996	159	4694270 Мокрый Гашун           13	4694270
131997	159	4694271 Южно-Сахалинск         34	4694271
131998	159	4694351 Свободный,мыс          34	4694351
131999	159	4694790 Досанг                 13	4694790
132000	159	4704271 Сахалинский АМЦ        34	4704271
132001	159	4713431 Лермонтовка            25	4713431
132002	159	4713940 Донская(азов)          13	4713940
132003	159	4714080 Веселый                13	4714080
132004	159	4714211 Холмск                 34	4714211
132005	159	4714251 Перевал                34	4714251
132006	159	4714261 Сахалин,санаторий      34	4714261
132007	159	4714271 Новоалександровск      34	4714271
132008	159	4714390 Заветное,АМСГ          13	4714390
132009	159	4714550 Сарпа                  13	4714550
132010	159	4714630 Юста                   13	4714630
132011	159	4723890 Таганрог               13	4723890
132012	159	4723900 Таганрог               13	4723900
132013	159	4723980 Ростов-на-Дону,АМСГ    13	4723980
132014	159	4724040 Веселовская,АГРО       13	4724040
132015	159	4724120 Мартыновский,в-сх      13	4724120
132016	159	4724170 Большая Мартыновка     13	4724170
132017	159	4724250 Зимовники              13	4724250
132018	159	4724700 Енотаевка              13	4724700
132019	159	4733561 Матай                  25	4733561
132020	159	4733901 Золотой                26	4733901
132021	159	4733970 Ростов-на-Дону,ГМО     13	4733970
132022	159	4733980 Ростов-на-Дону         13	4733980
132023	159	4734281 Долинск                34	4734281
132024	159	4734460 Кетченеры(Советский)   13	4734460
132025	159	4744010 Новочеркасск           13	4744010
132026	159	4744270 Дубовское,ГМО          13	4744270
132027	159	4744281 Стародубское           34	4744281
132028	159	4744730 Харабали               13	4744730
132029	159	4754080 Семикаракорск          13	4754080
132030	159	4754191 Чехов                  34	4754191
132031	159	4754780 Кордон                 13	4754780
132032	159	4763481 Вяземская              25	4763481
132033	159	4763841 Агзу                   26	4763841
132034	159	4763890 Матвеев Курган         13	4763890
132035	159	4764110 Константиновск,АМСГ    13	4764110
132036	159	4764320 Котельниково           13	4764320
132037	159	4764450 Аршань-Зельмень        13	4764450
132038	159	4773101 Екатерино-Никольское   25	4773101
132039	159	4773621 Гвасюги                25	4773621
132040	159	4773751 Сукпай                 25	4773751
132041	159	4773930 Лысогорская            13	4773930
132042	159	4774030 Шахты,АМСГ             13	4774030
132043	159	4774210 Цимлянск               13	4774210
132044	159	4774230 Цимлянск               13	4774230
132045	159	4783561 Бичевая                25	4783561
132046	159	4784640 Никольское             13	4784640
132047	159	4793261 Ленинское              25	4793261
132048	159	4793521 Георгиевка             25	4793521
132049	159	4793951 Гроссевичи             34	4793951
132050	159	4794251 Взморье                34	4794251
132051	159	4794310 Красноярский           13	4794310
132052	159	4794470 Малые Дербеты          13	4794470
132053	159	4803261 Ленинское              25	4803261
132054	159	4803521 Георгиевка             25	4803521
132055	159	4803681 Черинай                25	4803681
132056	159	4803691 Черинай                25	4803691
132057	159	4804221 Ильинский              34	4804221
132058	159	4814390 Гнилоаксайская         13	4814390
132059	159	4814610 Черный Яр              13	4814610
132060	159	4815331 Матуа                  34	4815331
132061	159	4823191 Новотроицкое           25	4823191
132062	159	4823831 Юге                    26	4823831
132063	159	4824020 Лихая                  13	4824020
132064	159	4824080 Белая Калитва,АМСГ     13	4824080
132065	159	4824130 Тацинский              13	4824130
132066	159	4824670 Верхний Баскунчак      13	4824670
132067	159	4833201 Новотроицкое           25	4833201
132068	159	4833321 Надеждинское           25	4833321
132069	159	4834030 Каменск-Шахтинский     13	4834030
132070	159	4843081 Помпеевка              25	4843081
132071	159	4843281 Биробиджан             25	4843281
132072	159	4844190 Морозовск              13	4844190
132073	159	4844211 Краскогорск            34	4844211
132074	159	4844310 Нижний Чир             13	4844310
132075	159	4853511 Хабаровск              25	4853511
132076	159	4853711 Тивяку                 25	4853711
132077	159	4854250 Обливская              13	4854250
132078	159	4863381 Смидович               25	4863381
132079	159	4863501 Хабаровск,АМСГ         25	4863501
132080	159	4863711 Тивяку                 25	4863711
132081	159	4863891 Иоли                   25	4863891
132082	159	4863901 Иоли                   25	4863901
132083	159	4864021 Иннокентьевка          34	4864021
132084	159	4864281 Макаров                34	4864281
132085	159	4864410 Береславский           13	4864410
132086	159	4864440 Волгоград,СХИ          13	4864440
132087	159	4864471 Мыс Терпения           34	4864471
132088	159	4864570 Капустин Яр            13	4864570
132089	159	4873291 Биробиджан             25	4873291
132090	159	4873301 Биробиджан             25	4873301
132091	159	4874120 Индустрия              13	4874120
132092	159	4874350 Калач-на-Дону          13	4874350
132093	159	4874440 Волгоград,СХИ          13	4874440
132094	159	4874450 Волгоград,опорная      13	4874450
132095	159	4874480 Краснослободск,АГРО    13	4874480
132096	159	4883291 Биробиджан             25	4883291
132097	159	4883591 Елабуга                25	4883591
132098	159	4884440 Волгоград,АМСГ         13	4884440
132099	159	4884470 Волжский,ГМО           13	4884470
132100	159	4894050 Миллерово              13	4894050
132101	159	4903111 Облучье                25	4903111
132102	159	4903171 Биракан                25	4903171
132103	159	4903251 Бира                   25	4903251
132104	159	4904031 Советская Гавань       25	4904031
132105	159	4913451 Иванковцы              25	4913451
132106	159	4914211 Углегорск              34	4914211
132107	159	4914690 Эльтон                 13	4914690
132108	159	4923521 Литовко                25	4923521
132109	159	4923711 Анюй                   25	4923711
132110	159	4923801 Солекуль               25	4923801
132111	159	4923811 Солекуль               25	4923811
132112	159	4923891 Мопау                  25	4923891
132113	159	4924011 Дюанка                 25	4924011
132114	159	4924180 Боковская              13	4924180
132115	159	4924311 Поронайск              34	4924311
132116	159	4933801 Солекуль               25	4933801
132117	159	4934310 Клетский               13	4934310
132118	159	4934400 Иловля                 13	4934400
132119	159	4934401 Владимирово            34	4934401
132120	159	4938760 Бертек                 20	4938760
132121	159	4940891 Менза                  23	4940891
132122	159	4943011 Архара                 25	4943011
132123	159	4943321 Урми                   25	4943321
132124	159	4944020 Чертково               13	4944020
132125	159	4951111 Букукун                23	4951111
132126	159	4953661 Троицкое               25	4953661
132127	159	4961191 Кыра                   23	4961191
132128	159	4961731 Забайкальск            23	4961731
132129	159	4962791 Константиновка         25	4962791
132130	159	4962801 Константиновка         25	4962801
132131	159	4962871 Поярково               25	4962871
132132	159	4963471 Неран                  25	4963471
132133	159	4964170 Вешенская              13	4964170
132134	159	4964270 Серафимович            13	4964270
132135	159	4964280 Серафимович,Г          13	4964280
132136	159	4964510 Горный Балыклей        13	4964510
132137	159	4964530 Быково                 13	4964530
132138	159	4971271 Мангут                 23	4971271
132139	159	4974011 Тумнин                 25	4974011
132140	159	4978740 Джазатор               20	4978740
132141	159	4978910 Уландрык               20	4978910
132142	159	4981841 Кайластуй              23	4981841
132143	159	4982991 Малиновка              25	4982991
132144	159	4983091 Хара                   25	4983091
132145	159	4983461 Кур                    25	4983461
132146	159	4983681 Верхний Нерген         25	4983681
132147	159	4984120 Казанская              13	4984120
132148	159	4984281 Победино               34	4984281
132149	159	4984370 Фролово                13	4984370
132150	159	4991051 Верхний Чикой          23	4991051
132151	159	4991581 Соловьевск             23	4991581
132152	159	4993461 Кур                    25	4993461
132153	159	4993611 Болонь                 25	4993611
132154	159	4993621 Болонь                 25	4993621
132155	159	4993970 Митрофановка           28	4993970
132156	159	4994060 Богучар                28	4994060
132157	159	4994460 Ольховка               13	4994460
132158	159	4994540 Кислово                13	4994540
132159	159	4998640 Кара-Тюрек             20	4998640
132160	159	4998650 Ак-Кем                 20	4998650
132161	159	5001121 Грязи                  23	5001121
132162	159	5004331 Первомайское           34	5004331
132163	159	5004510 Камышин,ж.д            13	5004510
132164	159	5004530 Камышин,озерная        13	5004530
132165	159	5004540 Камышин                13	5004540
132166	159	5005541 Васильева,мыс          34	5005541
132167	159	5008870 Кош-Агач               20	5008870
132168	159	5010751 Хамнигадайская         23	5010751
132169	159	5010791 Урлук                  23	5010791
132170	159	5011011 Шумиловка              23	5011011
132171	159	5011281 Курулга                23	5011281
132172	159	5011711 Красный Великан        23	5011711
132173	159	5011811 Краснокаменск          23	5011811
132174	159	5012951 Завитая                25	5012951
132175	159	5013211 Сутур                  25	5013211
132176	159	5013361 Верховье Урми          25	5013361
132177	159	5014071 Сюркум                 34	5014071
132178	159	5014221 Пильво                 34	5014221
132179	159	5014330 Михайловка             13	5014330
132180	159	5014540 Камышин                13	5014540
132181	159	5014690 Палласовка             13	5014690
132182	159	5018780 Актру                  20	5018780
132183	159	5022791 Садовое                25	5022791
132184	159	5023021 Пайкан                 25	5023021
132185	159	5023810 Валуйки                28	5023810
132186	159	5023901 Сихотэ-Алинь           25	5023901
132187	159	5023980 Россашь                28	5023980
132188	159	5024261 Онор                   34	5024261
132189	159	5024860 Александров Гай        12	5024860
132190	159	5028620 Катанда                20	5028620
132191	159	5031331 Акша                   23	5031331
132192	159	5031911 Приаргунск             23	5031911
132193	159	5032751 Благовещенск           25	5032751
132194	159	5032761 Благовещенск           25	5032761
132195	159	5032911 Екатеринославка        25	5032911
132196	159	5034170 Динамо                 13	5034170
132197	159	5038560 Усть-Кокса             20	5038560
132198	159	5039510 Эрзин                  21	5039510
132199	159	5040361 Цакир                  23	5040361
132200	159	5040421 Михайловка             23	5040421
132201	159	5040651 Кяхта                  23	5040651
132202	159	5040881 Красный Чикой          23	5040881
132203	159	5041371 Усть-Иля               23	5041371
132204	159	5041651 Борзя                  23	5041651
132205	159	5041911 Ново-Цурухайтуй        23	5041911
132206	159	5042911 Екатеринославка        25	5042911
132207	159	5043101 Сектагли               25	5043101
132208	159	5043841 Сегжема                25	5043841
132209	159	5044110 Калач,аэ               28	5044110
132210	159	5044381 Пограничное            34	5044381
132211	159	5044410 Даниловка              13	5044410
132212	159	5044650 Костычевка             13	5044650
132213	159	5044810 Новоузенск             12	5044810
132214	159	5045611 Северо-Курильск        34	5045611
132215	159	5049040 Мугур-Аксы             21	5049040
132216	159	5050481 Торей                  23	5050481
132217	159	5051481 Кубухай                23	5051481
132218	159	5051511 Hижний Цасучей         23	5051511
132219	159	5053650 Белгород,Агро          28	5053650
132220	159	5053701 Комсомольск-на-Амуре   25	5053701
132221	159	5054010 Павловск               28	5054010
132222	159	5054270 Новоаннинский          13	5054270
132223	159	5054760 Малый Узень            12	5054760
132224	159	5060531 Петропавловка          23	5060531
132225	159	5060711 Окино-Ключи            23	5060711
132226	159	5060761 Бичура                 23	5060761
132227	159	5061021 Черемхово              23	5061021
132228	159	5061511 Нижний Часучей         23	5061511
132229	159	5063381 Ирумка                 25	5063381
132230	159	5063660 Белгород,АМСГ          28	5063660
132231	159	5063730 Больше-Троицкое        28	5063730
132232	159	5063870 Алексеевка             28	5063870
132233	159	5068790 Усть-Улаган            20	5068790
132234	159	5069750 Кунгур-Тук             21	5069750
132235	159	5070281 Санага                 23	5070281
132236	159	5071031 Черемховский перевал   23	5071031
132237	159	5071361 Дульдурга              23	5071361
132238	159	5071601 Бырка                  23	5071601
132239	159	5071861 Бырка                  23	5071861
132240	159	5073591 Верховье Горина        25	5073591
132241	159	5073671 Солнечный              25	5073671
132242	159	5074041 Сиземан                34	5074041
132243	159	5074271 Тымовское              34	5074271
132244	159	5075611 Северо-Курильск        34	5075611
132245	159	5075641 Шумшу                  34	5075641
132246	159	5080841 Малета                 23	5080841
132247	159	5081831 Удокан                 23	5081831
132248	159	5082731 Сергеевка              25	5082731
132249	159	5082931 Братолюбовка           25	5082931
132250	159	5083221 Чекунда                25	5083221
132251	159	5083321 Солони                 25	5083321
132252	159	5083580 Готня                  28	5083580
132253	159	5083790 Новый Оскол            28	5083790
132254	159	5084060 Бутурлиновка           28	5084060
132255	159	5084200 Урюпинск               13	5084200
132256	159	5084460 Рудня                  13	5084460
132257	159	5084590 Золотое                12	5084590
132258	159	5085960 Домбаровский           12	5085960
132259	159	5088610 Онгудай                20	5088610
132260	159	5091561 Оловянная              23	5091561
132261	159	5091791 Александровский з-д    23	5091791
132262	159	5091861 Доно                   23	5091861
132263	159	5092851 Белогорск              25	5092851
132264	159	5093231 Чекунда                25	5093231
132265	159	5093301 Солони                 25	5093301
132266	159	5093811 Нижне-Тамбовское       25	5093811
132267	159	5093821 Нижне-Тамбовское       25	5093821
132268	159	5093910 Острогожск             28	5093910
132269	159	5093950 Лиски                  28	5093950
132270	159	5094221 Александровск-Сахал.   34	5094221
132271	159	5094380 Елань                  13	5094380
132272	159	5094690 Красный Кут,АМСГ       12	5094690
132273	159	5094820 Орлов Гай              12	5094820
132274	159	5095450 Буранное               12	5095450
132275	159	5095671 Мыс Лопатка            27	5095671
132276	159	5098480 Усть-Кан               20	5098480
132277	159	5100591 Иро                    23	5100591
132278	159	5100781 Мухоршибирь            23	5100781
132279	159	5104240 Новониколаевский       13	5104240
132280	159	5104280 Хоперский з/совхоз     13	5104280
132281	159	5105560 Акбулак                12	5105560
132282	159	5108140 Горняк                 20	5108140
132283	159	5108150 Успенское              20	5108150
132284	159	5109020 Тэли                   21	5109020
132285	159	5110671 Новоселенгинск         23	5110671
132286	159	5111191 Горекацан              23	5111191
132287	159	5111461 Агинское               23	5111461
132288	159	5113741 Бактор                 25	5113741
132289	159	5114060 Каменная степь         28	5114060
132290	159	5114070 Каменная степь         28	5114070
132291	159	5114170 Новохоперск            28	5114170
132292	159	5114271 Адо-Тымово             34	5114271
132293	159	5114361 Комрво                 34	5114361
132294	159	5114540 Сплавнуха              12	5114540
132295	159	5115500 Соль-Илецк             12	5115500
132296	159	5115860 Орск,АМСГ              12	5115860
132297	159	5116090 Зерн. с/х Озерный      12	5116090
132298	159	5118130 Гилево                 20	5118130
132299	159	5119380 Хову-Аксы              21	5119380
132300	159	5120811 Эрдэм                  23	5120811
132301	159	5121371 Дарасун                23	5121371
132302	159	5123291 Чегдомын               25	5123291
132303	159	5123301 Чегдомын               25	5123301
132304	159	5123630 Обоянь                 28	5123630
132305	159	5123681 Горин                  25	5123681
132306	159	5123740 Богородицкое-Фенино    28	5123740
132307	159	5124880 Дергачи                12	5124880
132308	159	5124980 Озинки                 12	5124980
132309	159	5128220 Змеиногорск            20	5128220
132310	159	5129340 Ак-Тал                 21	5129340
132311	159	5129450 Сосновка               21	5129450
132312	159	5130661 Гусиноозерск           23	5130661
132313	159	5130721 Верхний Жирим          23	5130721
132314	159	5130891 Петровский Завод       23	5130891
132315	159	5131961 Нерчинский з-д         23	5131961
132316	159	5132921 Маргаритовка           25	5132921
132317	159	5133661 Горин                  25	5133661
132318	159	5133670 Ржава                  28	5133670
132319	159	5133790 Старый Оскол           28	5133790
132320	159	5133920 Нововоронеж            28	5133920
132321	159	5133931 Циммермановка          25	5133931
132322	159	5134460 Свердлово              12	5134460
132323	159	5134690 Урбах                  12	5134690
132324	159	5135860 Орск,АМСГ              12	5135860
132325	159	5138570 Шебалино               20	5138570
132326	159	5139160 Чадан                  21	5139160
132327	159	5140661 Тохой                  23	5140661
132328	159	5140981 Бада                   23	5140981
132329	159	5141051 Хилок                  23	5141051
132330	159	5141251 Улеты                  23	5141251
132331	159	5141621 Ундино-Поселье         23	5141621
132332	159	5142801 Свободный              25	5142801
132333	159	5142911 Маргаритовка           25	5142911
132334	159	5143041 Верхняя Томь           25	5143041
132335	159	5143421 Иппата                 25	5143421
132336	159	5143511 Хуларин                25	5143511
132337	159	5143620 Петринка               28	5143620
132338	159	5143911 Сухановка              25	5143911
132339	159	5144210 Борисоглебск           28	5144210
132340	159	5144680 Степное                12	5144680
132341	159	5144830 Ершов                  12	5144830
132342	159	5145650 Беляевка               12	5145650
132343	159	5145681 Паужетка               27	5145681
132344	159	5148020 Угловское              20	5148020
132345	159	5148360 Чарышское              20	5148360
132346	159	5148600 Чемал                  20	5148600
132347	159	5148780 Беля                   20	5148780
132348	159	5149150 Теве-Хая               21	5149150
132349	159	5149270 Шагонар                21	5149270
132350	159	5150361 Хамар-Дабан            22	5150361
132351	159	5150411 Байкальск              22	5150411
132352	159	5150421 Байкальск              22	5150421
132353	159	5150471 Выдрино                23	5150471
132354	159	5150741 Тарбагатай             23	5150741
132355	159	5151461 Седловая               23	5151461
132356	159	5151831 Ямкун                  23	5151831
132357	159	5152811 Свободный              25	5152811
132358	159	5153401 Усмань                 25	5153401
132359	159	5153421 Усмань                 25	5153421
132360	159	5154040 Анна                   28	5154040
132361	159	5154081 Де-Кастри              34	5154081
132362	159	5154281 Ныш                    34	5154281
132363	159	5154370 Гусевка                12	5154370
132364	159	5154450 Калининск              12	5154450
132365	159	5154600 Саратов,южный          12	5154600
132366	159	5154610 Энгельс                12	5154610
132367	159	5154750 Федоровский,з/свх      12	5154750
132368	159	5155150 Тепловка               12	5155150
132369	159	5155340 Илек                   12	5155340
132370	159	5155651 Озерная                27	5155651
132371	159	5155740 Кувандык               12	5155740
132372	159	5155790 Сара                   12	5155790
132373	159	5155990 Адамовка,АМСГ          12	5155990
132374	159	5158120 Рубцовск               20	5158120
132375	159	5159560 Сарыг-Сеп              21	5159560
132376	159	5160511 Танхой                 23	5160511
132377	159	5161121 Харагун                23	5161121
132378	159	5161431 Карымская              23	5161431
132379	159	5161671 Балей,АМСГ             23	5161671
132380	159	5162001 Аргунск                23	5162001
132381	159	5162671 Кумара                 25	5162671
132382	159	5162691 Саскаль                25	5162691
132383	159	5162881 Мазаново               25	5162881
132384	159	5163331 Усть-Умальта           25	5163331
132385	159	5163470 Рыльск                 28	5163470
132386	159	5163530 Льгов                  28	5163530
132387	159	5163570 Курчатов               28	5163570
132388	159	5163610 Стрелецкая степь       28	5163610
132389	159	5163620 Петринка               28	5163620
132390	159	5163710 Тим                    28	5163710
132391	159	5163840 Нижнедевицк            28	5163840
132392	159	5164191 Виахту                 34	5164191
132393	159	5164320 Балашов                12	5164320
132394	159	5164550 Октябрьский Городок    12	5164550
132395	159	5164600 Саратов,цгмс           12	5164600
132396	159	5168230 Курья                  20	5168230
132397	159	5169160 Ийме                   21	5169160
132398	159	5170101 Монды                  23	5170101
132399	159	5170221 Кырен,АМСГ             23	5170221
132400	159	5170251 Тунка                  23	5170251
132401	159	5170371 Култук                 22	5170371
132402	159	5170591 Бабушкин               23	5170591
132403	159	5170851 Илька                  23	5170851
132404	159	5171191 Могзон                 23	5171191
132405	159	5171261 Тургутуй               23	5171261
132406	159	5171391 Ульзутуевская          23	5171391
132407	159	5171691 Унда                   23	5171691
132408	159	5171761 Шелопугино             23	5171761
132409	159	5172691 Саскаль                25	5172691
132410	159	5173591 Дуки                   25	5173591
132411	159	5173910 Воронеж,АГРО           28	5173910
132412	159	5174021 Мариинск               25	5174021
132413	159	5174670 Маркс                  12	5174670
132414	159	5175870 Ириклинский            12	5175870
132415	159	5177980 Михайловский,содо/к.   20	5177980
132416	159	5178270 Краснощеково           20	5178270
132417	159	5178430 Солонешное             20	5178430
132418	159	5179440 Кызыл (Тув. ЦГМС)      21	5179440
132419	159	5179450 Кызыл (Тув. ЦГМС)      21	5179450
132420	159	5180371 Култук                 22	5180371
132421	159	5180731 Иволгинск              23	5180731
132422	159	5180741 Улан-Удэ,город         23	5180741
132423	159	5180761 Улан-Удэ,город         23	5180761
132424	159	5180781 Улан-Удэ               23	5180781
132425	159	5182830 Лельчицы               07	5182830
132426	159	5183030 Брагин,АМСГ            07	5183030
132427	159	5183620 Курск,АЭ               28	5183620
132428	159	5183630 Ушаково                28	5183630
132429	159	5183810 Ново-Касторное         28	5183810
132430	159	5184150 Жердевка               28	5184150
132431	159	5185510 Оренбург,ГМО           12	5185510
132432	159	5185520 Оренбург,ЗГМО          12	5185520
132433	159	5185811 Водопадная             27	5185811
132434	159	5185880 Энергетик              12	5185880
132435	159	5188760 Яйлю                   20	5188760
132436	159	5190241 Аршан                  22	5190241
132437	159	5190381 Подкаменная            22	5190381
132438	159	5190481 Исток Ангары           22	5190481
132439	159	5190801 Онохой                 23	5190801
132440	159	5190991 Кижинга                23	5190991
132441	159	5191501 Таланча                23	5191501
132442	159	5191601 Шилка                  23	5191601
132443	159	5192771 Шимановск              25	5192771
132444	159	5192961 Ульма                  25	5192961
132445	159	5193460 Хомутовка              28	5193460
132446	159	5193690 Щигры                  28	5193690
132447	159	5193821 Бичи                   25	5193821
132448	159	5194230 Обловка                28	5194230
132449	159	5194311 Ноглики                34	5194311
132450	159	5194370 Ростоши                12	5194370
132451	159	5194500 Аткарск                12	5194500
132452	159	5195030 Перелюб                12	5195030
132453	159	5195160 Первомайский           12	5195160
132454	159	5195190 Сергиевский            12	5195190
132455	159	5195270 Им.Калинина,свх.       12	5195270
132456	159	5195450 Сырт                   12	5195450
132457	159	5195570 Чебеньки               12	5195570
132458	159	5195820 Акъяр                  41	5195820
132459	159	5195990 Айдырля                12	5195990
132460	159	5198490 Белокуриха             20	5198490
132461	159	5198530 Алтайское,АМСГ         20	5198530
132462	159	5198600 Кызыл-Озек             20	5198600
132463	159	5200541 Большое Голоустное     22	5200541
132464	159	5201321 Чита,АГРО              23	5201321
132465	159	5201651 Нерчинск,АМСГ          23	5201651
132466	159	5202771 Шимановск              25	5202771
132467	159	5202920 Мозырь,АМСГ            07	5202920
132468	159	5203821 Бичи                   25	5203821
132469	159	5204780 Балаково,ГМБ           12	5204780
132470	159	5204880 Пугачев                12	5204880
132471	159	5208040 Волчиха                20	5208040
132472	159	5208180 Поспелиха              20	5208180
132473	159	5208600 Горно-Алтайск,АМСГ     20	5208600
132474	159	5209220 Усть-Уса               21	5209220
132475	159	5210041 Хоре                   22	5210041
132476	159	5210111 Ильчир                 23	5210111
132477	159	5210271 Дабады                 22	5210271
132478	159	5210451 Патроны                22	5210451
132479	159	5210631 Исток                  22	5210631
132480	159	5210671 Кабанск                23	5210671
132481	159	5210851 Новая Курба            23	5210851
132482	159	5211271 Беклемишево            23	5211271
132483	159	5211351 Чита                   23	5211351
132484	159	5211591 Верхняя Хила           23	5211591
132485	159	5211881 Батакан                23	5211881
132486	159	5212370 Брест,зональная        07	5212370
132487	159	5212610 Пинск,АМСГ             07	5212610
132488	159	5212930 Мозырь,АМСГ            07	5212930
132489	159	5212990 Ведрич                 07	5212990
132490	159	5213450 Севск                  28	5213450
132491	159	5213510 Дмитриев               28	5213510
132492	159	5213590 Фатеж                  28	5213590
132493	159	5213671 Чукчагирское           25	5213671
132494	159	5214740 Привольская            12	5214740
132495	159	5215360 Новосергиевка          12	5215360
132496	159	5218340 Усть-Калманка          20	5218340
132497	159	5218980 Большой Он             21	5218980
132498	159	5219230 Усть-Уса               21	5219230
132499	159	5219390 Туран                  21	5219390
132500	159	5220111 Самарта                22	5220111
132501	159	5220411 Шелехов                22	5220411
132502	159	5220421 Смоленщина             22	5220421
132503	159	5220441 Молодежный,учхоз       22	5220441
132504	159	5220921 Удинск                 23	5220921
132505	159	5220981 Хоринск                23	5220981
132506	159	5221681 Комсомолец             23	5221681
132507	159	5222071 Усть-Уров              23	5222071
132508	159	5222510 Дрогичин               07	5222510
132509	159	5222661 Аносово                25	5222661
132510	159	5222790 Житковичи              07	5222790
132511	159	5223920 Конь-Колодезь          28	5223920
132512	159	5223921 Сомнительный прииск    25	5223921
132513	159	5224090 Им.Ленина,совхоз       28	5224090
132514	159	5224161 Погиби                 34	5224161
132515	159	5224190 Чакино                 28	5224190
132516	159	5225740 Зилаир                 41	5225740
132517	159	5225860 Целинное               41	5225860
132518	159	5225960 Им.Кирова,з-свх        12	5225960
132519	159	5228230 Шипуново               20	5228230
132520	159	5228570 Урожайный,совхоз       20	5228570
132521	159	5230431 Иркутск,обс.           22	5230431
132522	159	5230461 Худяково               22	5230461
132523	159	5231501 Эдакуй                 23	5231501
132524	159	5231771 Сретенск               23	5231771
132525	159	5232670 Полесская,болотная     07	5232670
132526	159	5232980 Василевичи,АГРО        07	5232980
132527	159	5233391 Софийский прииск       25	5233391
132528	159	5233401 Софийский прииск       25	5233401
132529	159	5233540 Железногорск           28	5233540
132530	159	5233581 Веселая горка          25	5233581
132531	159	5233630 Поныри                 28	5233630
132532	159	5234380 Ртищево                12	5234380
132533	159	5234540 Петровск               12	5234540
132534	159	5234640 Карабулак              12	5234640
132535	159	5235190 Андреевка              12	5235190
132536	159	5235640 Троицкое Т.            12	5235640
132537	159	5237910 Ключи                  20	5237910
132538	159	5238720 Турочак                20	5238720
132539	159	5239080 Кантегир               21	5239080
132540	159	5239300 Нижне-Усинское         21	5239300
132541	159	5240791 Нестерово              23	5240791
132542	159	5241081 Эгитуйская             23	5241081
132543	159	5241381 Бургень                23	5241381
132544	159	5242340 Высокое                07	5242340
132545	159	5242991 Норск                  25	5242991
132546	159	5243100 Гомель,АМСГ            07	5243100
132547	159	5243131 Бысса                  25	5243131
132548	159	5243651 Им.П.Осипенко          25	5243651
132549	159	5244051 Богородское            25	5244051
132550	159	5244331 Вал                    34	5244331
132551	159	5244720 Черкасское             12	5244720
132552	159	5245050 Большая Глушица        12	5245050
132553	159	5245310 Сорочинск              12	5245310
132554	159	5245550 Октябрьское            12	5245550
132555	159	5246040 Бреды                  09	5246040
132556	159	5248370 Усть-Чарышская прист   20	5248370
132557	159	5249240 Кара-Кем               21	5249240
132558	159	5250281 Дабады                 22	5250281
132559	159	5250391 Ангарск                22	5250391
132560	159	5250441 Хомутово               22	5250441
132561	159	5251151 Сосново-Озерское       23	5251151
132562	159	5251701 Чернышевск             23	5251701
132563	159	5253091 Февральск              25	5253091
132564	159	5253170 Злынка                 28	5253170
132565	159	5253520 Дмитровск-Орловский    28	5253520
132566	159	5253760 Ливны                  28	5253760
132567	159	5253990 Грязи                  28	5253990
132568	159	5254810 Хвалынск               12	5254810
132569	159	5257890 Кулунда                20	5257890
132570	159	5258020 Родино                 20	5258020
132571	159	5258280 Алейская               20	5258280
132572	159	5259610 Тоора-Хем              21	5259610
132573	159	5259980 Орлик,АМСГ             23	5259980
132574	159	5260391 Ангарск                22	5260391
132575	159	5260611 Бугульдейка            22	5260611
132576	159	5260711 Сухая                  23	5260711
132577	159	5261621 Зюльзя                 23	5261621
132578	159	5262450 Пружаны                07	5262450
132579	159	5262890 Октябрь                07	5262890
132580	159	5262911 Гарь                   25	5262911
132581	159	5263111 Селемджинское          25	5263111
132582	159	5263280 Стародуб               28	5263280
132583	159	5263380 Трубчевск              28	5263380
132584	159	5263960 Липецк,АМСГ            28	5263960
132585	159	5264580 Лопатино               12	5264580
132586	159	5264950 Марьевка               12	5264950
132587	159	5265130 Авангард,зерносовхоз   12	5265130
132588	159	5265400 Ясногорский            12	5265400
132589	159	5265830 Баймак                 41	5265830
132590	159	5268520 Бийск                  20	5268520
132591	159	5271171 Сурхепта               23	5271171
132592	159	5271331 Телемба                23	5271331
132593	159	5271521 Усугли                 23	5271521
132594	159	5271881 Усть-Карск             23	5271881
132595	159	5272540 Ивацевичи              07	5272540
132596	159	5272601 Черняево               25	5272601
132597	159	5273751 Гуга                   25	5273751
132598	159	5273850 Елец                   28	5273850
132599	159	5274131 Джаоре                 25	5274131
132600	159	5274150 Тамбов                 28	5274150
132601	159	5274181 Теньги                 34	5274181
132602	159	5274270 Кирсанов               28	5274270
132603	159	5274720 Павловка               12	5274720
132604	159	5275020 Им.Ленина,свх          12	5275020
132605	159	5275230 Бузулук                12	5275230
132606	159	5275621 Октябрьская            27	5275621
132607	159	5275660 Мраково                41	5275660
132608	159	5275870 Сибай                  41	5275870
132609	159	5275890 Кизильское             09	5275890
132610	159	5278160 Мамонтово              20	5278160
132611	159	5278500 Бийск-Зональная        20	5278500
132612	159	5279010 Абаза                  21	5279010
132613	159	5279140 Крутой Поворот         21	5279140
132614	159	5280011 Бурун-Гол              22	5280011
132615	159	5280111 Белореченская          22	5280111
132616	159	5280371 Усолье-Сибирское       22	5280371
132617	159	5280481 Усть-Ордынский         22	5280481
132618	159	5280651 Еланцы                 22	5280651
132619	159	5280811 Черемухово             23	5280811
132620	159	5280991 Замакта                23	5280991
132621	159	5281171 Гунда                  23	5281171
132622	159	5281731 Жирекен                23	5281731
132623	159	5282001 Урюпино                23	5282001
132624	159	5282601 Черняево               25	5282601
132625	159	5282650 Ганцевичи              07	5282650
132626	159	5282781 Аяк                    25	5282781
132627	159	5282800 Любань                 07	5282800
132628	159	5283171 Стойба                 25	5283171
132629	159	5283230 Клинцы,АМСГ            28	5283230
132630	159	5283270 Унеча                  28	5283270
132631	159	5283450 Навля                  28	5283450
132632	159	5283730 Верховье               28	5283730
132633	159	5284121 Алеевка                25	5284121
132634	159	5284150 Тамбов                 28	5284150
132635	159	5284510 Кондоль                12	5284510
132636	159	5285220 Бузулук                12	5285220
132637	159	5285580 Кумертау               41	5285580
132638	159	5285750 Кананикольское         41	5285750
132639	159	5285830 Баймак                 41	5285830
132640	159	5287980 Благовещенка           20	5287980
132641	159	5288090 Завьялово              20	5288090
132642	159	5288730 Кондома                20	5288730
132643	159	5288780 Спасск,АМСГ            20	5288780
132644	159	5288790 Таштагол               20	5288790
132645	159	5288840 Усть-Кабырза           20	5288840
132646	159	5288990 Таштып                 21	5288990
132647	159	5289140 Черемушки              21	5289140
132648	159	5289320 Оленья Речка           21	5289320
132649	159	5290191 Инга                   22	5290191
132650	159	5290331 Половина               22	5290331
132651	159	5293000 Жлобин                 07	5293000
132652	159	5293090 Чечерск                07	5293090
132653	159	5293350 Почеп                  28	5293350
132654	159	5293891 Удинское               25	5293891
132655	159	5294001 Воскресенское          25	5294001
132656	159	5294050 Мичуринск              28	5294050
132657	159	5294340 Белинский              12	5294340
132658	159	5294610 Русский Камешкир       12	5294610
132659	159	5295010 Аглос                  12	5295010
132660	159	5295470 Шарлык                 12	5295470
132661	159	5295590 Мелеуз                 41	5295590
132662	159	5295661 Большерецк             27	5295661
132663	159	5295721 Апача                  27	5295721
132664	159	5295821 Тепличная              27	5295821
132665	159	5295861 Петропавловск-Камчат   27	5295861
132666	159	5295871 Петропавловскии маяк   27	5295871
132667	159	5300691 Ташкай                 22	5300691
132668	159	5300831 Горячинск              23	5300831
132669	159	5301691 Букачача               23	5301691
132670	159	5302760 Слуцк                  07	5302760
132671	159	5302871 Октябрьский Прииск     25	5302871
132672	159	5303160 Красная Гора           28	5303160
132673	159	5303590 Орел,Агро              28	5303590
132674	159	5303600 Орел,АМСГ              28	5303600
132675	159	5304640 Радищево               12	5304640
132676	159	5304940 Безенчук               12	5304940
132677	159	5305210 Боровое лесничество    12	5305210
132678	159	5307870 Славгород              20	5307870
132679	159	5308470 Троицкое               20	5308470
132680	159	5308760 Амзас                  20	5308760
132681	159	5310331 Саянск                 22	5310331
132682	159	5310551 Баяндай                22	5310551
132683	159	5310691 Сарма                  22	5310691
132684	159	5311751 Зилово                 23	5311751
132685	159	5311921 Горбица                23	5311921
132686	159	5312600 Барановичи             07	5312600
132687	159	5312641 Тыгда                  25	5312641
132688	159	5312830 Старые Дороги          07	5312830
132689	159	5312930 Бобруйск,АМСГ          07	5312930
132690	159	5313001 Нора                   25	5313001
132691	159	5313291 Экимчан                25	5313291
132692	159	5313301 Экимчан                25	5313301
132693	159	5313391 Селемджа               25	5313391
132694	159	5313401 Селемджа               25	5313401
132695	159	5313410 Данков                 28	5313410
132696	159	5313500 Карачев                28	5313500
132697	159	5313601 Бурукан                25	5313601
132698	159	5313910 Данков                 28	5313910
132699	159	5314081 Николаевск-на-Амуре    25	5314081
132700	159	5314660 Кузнецк,АМСГ           12	5314660
132701	159	5315510 Федоровка              41	5315510
132702	159	5315771 Начики                 27	5315771
132703	159	5315821 Сосновка               27	5315821
132704	159	5315861 Пионерская             27	5315861
132705	159	5316011 Мыс Шипунский          27	5316011
132706	159	5316070 Карталы                09	5316070
132707	159	5318230 Ребриха                20	5318230
132708	159	5318590 Целинное               20	5318590
132709	159	5319050 Аскиз                  21	5319050
132710	159	5319090 Бея                    21	5319090
132711	159	5319140 Саяногорск             21	5319140
132712	159	5319150 Маинский рудник        21	5319150
132713	159	5319450 Верхний Амыл           21	5319450
132714	159	5320301 Черемхово              22	5320301
132715	159	5320381 Бохан                  22	5320381
132716	159	5320731 Хужир                  22	5320731
132717	159	5321171 Усть-Заза              23	5321171
132718	159	5321281 Романовка,АМСГ         23	5321281
132719	159	5321581 Кыкер                  23	5321581
132720	159	5322450 Волковыск              07	5322450
132721	159	5323430 Брянск,Агро            28	5323430
132722	159	5323810 Ефремов                08	5323810
132723	159	5323950 Лев Толстой            28	5323950
132724	159	5324071 Николаевск-на-Амуре    25	5324071
132725	159	5324410 Каменка Белинская      12	5324410
132726	159	5324500 Пенза,ГМО              12	5324500
132727	159	5324750 Канадей                12	5324750
132728	159	5324850 Сызрань                12	5324850
132729	159	5325841 Елизово                27	5325841
132730	159	5325851 Елизово                27	5325851
132731	159	5327950 Знаменка               20	5327950
132732	159	5328150 Тюменцево              20	5328150
132733	159	5329170 Очуры                  21	5329170
132734	159	5330121 Сарам                  22	5330121
132735	159	5330771 Узур                   22	5330771
132736	159	5331311 Жидохон                23	5331311
132737	159	5333420 Брянск,АМСГ            28	5333420
132738	159	5334151 Байдуков               25	5334151
132739	159	5334181 Рыбновск               34	5334181
132740	159	5334330 Пачелма                12	5334330
132741	159	5334570 Городище               12	5334570
132742	159	5334950 Сосновый Солонец       12	5334950
132743	159	5335020 Самара,ОГМС            12	5335020
132744	159	5335060 Кинель                 12	5335060
132745	159	5335120 Кротовка               12	5335120
132746	159	5335280 Троицкое,АС            12	5335280
132747	159	5335400 Фадеевский             12	5335400
132748	159	5335580 Салават                41	5335580
132749	159	5335780 Башгосзаповедник       41	5335780
132750	159	5336120 Варненский совхоз      09	5336120
132751	159	5338080 Баево                  20	5338080
132752	159	5338390 Барнаул,ГМО            20	5338390
132753	159	5338510 Ново-Кытманово         20	5338510
132754	159	5338720 Кузедеево              20	5338720
132755	159	5338910 Неожиданный            21	5338910
132756	159	5339240 Ермаковское            21	5339240
132757	159	5339830 Алыгджер               22	5339830
132758	159	5340261 Кутулик                22	5340261
132759	159	5340271 Головинское            22	5340271
132760	159	5340381 Кутулик                22	5340381
132761	159	5340391 Оса                    22	5340391
132762	159	5340561 Кырма                  22	5340561
132763	159	5340891 Усть-Баргузин          23	5340891
132764	159	5341991 Часовая                23	5341991
132765	159	5342161 Покровка               23	5342161
132766	159	5343001 Дугда                  25	5343001
132767	159	5343210 Костюковичи            07	5343210
132768	159	5343600 Болхов                 28	5343600
132769	159	5343650 Мценск                 28	5343650
132770	159	5344321 Одопту                 34	5344321
132771	159	5344460 Мокшан                 12	5344460
132772	159	5345530 Стерлибашево           41	5345530
132773	159	5345600 Салават                41	5345600
132774	159	5345611 Кихчик                 27	5345611
132775	159	5345790 Башгосзаповедник       41	5345790
132776	159	5345850 Аскарово               41	5345850
132777	159	5345880 Красная Башкирия       41	5345880
132778	159	5346100 Варна                  09	5346100
132779	159	5348260 Шелаболиха             20	5348260
132780	159	5348370 Барнаул                20	5348370
132781	159	5350851 Нижнее Изголовье       22	5350851
132782	159	5351871 Ксеньевская            23	5351871
132783	159	5352241 Игнашино               25	5352241
132784	159	5352391 Джалинда               25	5352391
132785	159	5352581 Магдагачи              25	5352581
132786	159	5352670 Столбцы                07	5352670
132787	159	5352700 Городище,лес           07	5352700
132788	159	5352710 Городище,вбс           07	5352710
132789	159	5352810 Марьина Горка          07	5352810
132790	159	5352881 Деп-Долбырь            25	5352881
132791	159	5352930 Кличев                 07	5352930
132792	159	5353100 Славгород              07	5353100
132793	159	5353181 Шевли                  25	5353181
132794	159	5353380 Жуковка                28	5353380
132795	159	5353690 Чернь                  08	5353690
132796	159	5354180 Моршанск               28	5354180
132797	159	5354260 Земетчино              12	5354260
132798	159	5354370 Нижний Ломов           12	5354370
132799	159	5354790 Безводовка             12	5354790
132800	159	5354950 Тольятти               12	5354950
132801	159	5355170 Кинель-Черкассы        12	5355170
132802	159	5355920 Магнитогорск           09	5355920
132803	159	5355980 Фершампенуаз           09	5355980
132804	159	5358590 Тогул                  20	5358590
132805	159	5358950 Бискамжа               21	5358950
132806	159	5359330 Верхний Кужебар        21	5359330
132807	159	5360051 Белозиминская          22	5360051
132808	159	5360251 Залари                 22	5360251
132809	159	5360761 Онгурен                22	5360761
132810	159	5360961 Баргузин               23	5360961
132811	159	5361411 Юмурчен                23	5361411
132812	159	5362480 Щучин                  07	5362480
132813	159	5362590 Новогрудок             07	5362590
132814	159	5362710 Негорелое              07	5362710
132815	159	5363720 Плавск                 08	5363720
132816	159	5363800 Волово                 08	5363800
132817	159	5363951 Кульчи                 25	5363951
132818	159	5363971 Кульчи                 25	5363971
132819	159	5364251 Москальво              34	5364251
132820	159	5364291 Оха                    34	5364291
132821	159	5364520 Лунино                 12	5364520
132822	159	5364880 Новодевичье            12	5364880
132823	159	5365240 Бугуруслан             12	5365240
132824	159	5365600 Стерлитамак            41	5365600
132825	159	5367960 Хабары                 20	5367960
132826	159	5368890 Лужба                  20	5368890
132827	159	5369290 Каратузское            21	5369290
132828	159	5370141 Зулумай                22	5370141
132829	159	5370271 Новонукутск            22	5370271
132830	159	5370331 Балаганск              22	5370331
132831	159	5371191 Усть-Джилинда          23	5371191
132832	159	5371581 Тункогочен             23	5371581
132833	159	5371981 Могоча                 23	5371981
132834	159	5372380 Гродно,АМСГ            07	5372380
132835	159	5372481 Талдан                 25	5372481
132836	159	5372731 Зея                    25	5372731
132837	159	5372750 Минск,АС               07	5372750
132838	159	5373311 Баладек                25	5373311
132839	159	5373550 Ульяново               08	5373550
132840	159	5374010 Ряжск                  08	5374010
132841	159	5374100 Сараи                  08	5374100
132842	159	5375370 Абдулино               12	5375370
132843	159	5375420 Шкапово                41	5375420
132844	159	5375761 Ганалы                 27	5375761
132845	159	5376040 Светлое                09	5376040
132846	159	5377810 Карасук                20	5377810
132847	159	5378730 Новокузнецк            20	5378730
132848	159	5378810 Междуреченск           20	5378810
132849	159	5379040 Уйбат,ж.д.             21	5379040
132850	159	5379170 Минусинск              21	5379170
132851	159	5379420 Казыр                  21	5379420
132852	159	5382731 Зея                    25	5382731
132853	159	5382890 Березино               07	5382890
132854	159	5383470 Жиздра                 08	5383470
132855	159	5383610 Белев                  08	5383610
132856	159	5383681 Тугур                  25	5383681
132857	159	5383930 Павелец                08	5383930
132858	159	5384490 Анучино                12	5384490
132859	159	5385410 Шкапово                41	5385410
132860	159	5387390 Русская Поляна         17	5387390
132861	159	5388040 Панкрушиха             20	5388040
132862	159	5388130 Камень-на-Оби          20	5388130
132863	159	5388230 Сузун                  20	5388230
132864	159	5388360 Тальменка              20	5388360
132865	159	5388490 Заринск                20	5388490
132866	159	5388690 Новокузнецк            20	5388690
132867	159	5389130 Абакан (Хак. ЦГМС)     21	5389130
132868	159	5389140 Абакан,АМСГ            21	5389140
132869	159	5390211 Зима                   22	5390211
132870	159	5390861 Большой Ушканий,о.     22	5390861
132871	159	5391011 Хилгана                23	5391011
132872	159	5391321 Усть-Антосе            23	5391321
132873	159	5392091 Амазар                 23	5392091
132874	159	5392530 Лида                   07	5392530
132875	159	5392911 Огорон                 25	5392911
132876	159	5393030 Могилев,АМСГ           07	5393030
132877	159	5393290 Рославль               08	5393290
132878	159	5394031 Литке                  25	5394031
132879	159	5394370 Наровчат               12	5394370
132880	159	5394440 Инсар                  29	5394440
132881	159	5394640 Инза                   12	5394640
132882	159	5395040 Красное Поселение      12	5395040
132883	159	5395130 Серноводск             12	5395130
132884	159	5395740 Тукан                  41	5395740
132885	159	5395830 Белорецк               41	5395830
132886	159	5395920 Верхнеуральск          09	5395920
132887	159	5397920 Краснозерск            20	5397920
132888	159	5398570 Тягун                  20	5398570
132889	159	5399270 Курагино               21	5399270
132890	159	5399880 Хадама                 22	5399880
132891	159	5400211 Саянск                 22	5400211
132892	159	5400301 Балаганск              22	5400301
132893	159	5400591 Качуг                  22	5400591
132894	159	5400831 Солнечная              22	5400831
132895	159	5401501 Хулугли                23	5401501
132896	159	5402191 Ерофей Павлович        25	5402191
132897	159	5402291 Уруша                  25	5402291
132898	159	5402391 Сковородино            25	5402391
132899	159	5402401 Сковородино            25	5402401
132900	159	5402760 Минск,ГМО              07	5402760
132901	159	5402780 Колодище               07	5402780
132902	159	5402911 Огорон                 25	5402911
132903	159	5403760 Советск                28	5403760
132904	159	5403820 Узловая                08	5403820
132905	159	5404031 Литке                  25	5404031
132906	159	5404190 Шацк                   08	5404190
132907	159	5404880 Сенгилей               12	5404880
132908	159	5405420 Аксаково               41	5405420
132909	159	5406010 Петропавловский        09	5406010
132910	159	5407870 Веселовка              20	5407870
132911	159	5408670 Киселевск              20	5408670
132912	159	5411941 Николаевский           23	5411941
132913	159	5412481 Тыган-Уркан            25	5412481
132914	159	5412650 Воложин                07	5412650
132915	159	5413440 Фаянсовая              08	5413440
132916	159	5413530 Сухиничи               08	5413530
132917	159	5413581 Тором                  25	5413581
132918	159	5413650 Суворов                08	5413650
132919	159	5414330 Торбеево               29	5414330
132920	159	5414740 Анненково              12	5414740
132921	159	5415490 Раевский               41	5415490
132922	159	5415991 Семячик                27	5415991
132923	159	5416160 Троицк                 09	5416160
132924	159	5417770 Баган                  20	5417770
132925	159	5419740 Покровский Прииск      22	5419740
132926	159	5420011 Икей                   22	5420011
132927	159	5420171 Харик                  22	5420171
132928	159	5420301 Усть-Уда               22	5420301
132929	159	5420471 Лукиново               22	5420471
132930	159	5421191 Карафтит               23	5421191
132931	159	5422730 Радошковичи            07	5422730
132932	159	5422850 Борисов                07	5422850
132933	159	5423760 Тула                   28	5423760
132934	159	5423770 Тула                   08	5423770
132935	159	5423900 Михайлов               08	5423900
132936	159	5423981 Александра,мыс         25	5423981
132937	159	5424510 Саранск                29	5424510
132938	159	5424520 Саранск                29	5424520
132939	159	5424590 Большие Березники      29	5424590
132940	159	5424970 Димитровград           12	5424970
132941	159	5425210 Клявлино               12	5425210
132942	159	5425750 Инзер                  41	5425750
132943	159	5425801 Пущино                 27	5425801
132944	159	5427290 Одесское               17	5427290
132945	159	5427360 Павлоградка            17	5427360
132946	159	5427480 Черлак                 17	5427480
132947	159	5428780 Макариха               20	5428780
132948	159	5428940 Коммунар               21	5428940
132949	159	5429160 Лебяжье                21	5429160
132950	159	5429260 Лебяжье                21	5429260
132951	159	5429690 Верхняя Гутара         22	5429690
132952	159	5430151 Куйтун                 22	5430151
132953	159	5430951 Баргузинский заповед   22	5430951
132954	159	5431031 Курумкан               23	5431031
132955	159	5432661 Золотая Гора           25	5432661
132956	159	5432761 Дамбуки                25	5432761
132957	159	5432940 Славное                07	5432940
132958	159	5433090 Горки                  07	5433090
132959	159	5434000 Старожилово            08	5434000
132960	159	5434090 Шилово                 08	5434090
132961	159	5434261 Ныврово                34	5434261
132962	159	5434271 Елизаветы,мыс          34	5434271
132963	159	5434450 Старо-Шайгово          29	5434450
132964	159	5434830 Ульяновск              12	5434830
132965	159	5434840 Ульяновск              12	5434840
132966	159	5434870 Октябрьский            12	5434870
132967	159	5435591 Соболево               27	5435591
132968	159	5436390 Усть-Уйское            09	5436390
132969	159	5437740 Зятьково               20	5437740
132970	159	5438050 Кочки                  20	5438050
132971	159	5438350 Посевная               20	5438350
132972	159	5438420 Маслянино              20	5438420
132973	159	5438590 Гурьевск               20	5438590
132974	159	5439150 Краснотуранск          21	5439150
132975	159	5440331 Усть-Уда               22	5440331
132976	159	5440391 Оса                    22	5440391
132977	159	5441151 Икатский перевал       23	5441151
132978	159	5441651 Усть-Каренга           23	5441651
132979	159	5441991 Тупик                  23	5441991
132980	159	5442060 Багратионовск          06	5442060
132981	159	5442130 Железнодорожный        06	5442130
132982	159	5442590 Ошмяны                 07	5442590
132983	159	5442741 Береговой              25	5442741
132984	159	5442980 Толочин                07	5442980
132985	159	5442981 Унья                   25	5442981
132986	159	5443250 Починок                08	5443250
132987	159	5443400 Спас-Деменск           08	5443400
132988	159	5443610 Воротынск,АГРО         08	5443610
132989	159	5444190 Сасово                 08	5444190
132990	159	5444380 Краснослободск         29	5444380
132991	159	5445110 Челно-Вершины          12	5445110
132992	159	5445680 Архангельское          41	5445680
132993	159	5445940 Учалы                  41	5445940
132994	159	5446130 Южноуральск            09	5446130
132995	159	5446270 Октябрьское            09	5446270
132996	159	5447180 Полтавка               17	5447180
132997	159	5447730 Купино                 20	5447730
132998	159	5448190 Ордынское              20	5448190
132999	159	5449210 Идринское              21	5449210
133000	159	5450431 Балыхта                22	5450431
133001	159	5450711 Тырка                  22	5450711
133002	159	5451321 Усойский хребет        23	5451321
133003	159	5451361 Богдарин               23	5451361
133004	159	5451990 Мамоново               06	5451990
133005	159	5452690 Вилейка                07	5452690
133006	159	5453040 Орша                   07	5453040
133007	159	5453441 Удское                 25	5453441
133008	159	5453500 Мосальск               08	5453500
133009	159	5453620 Калуга,Грабцево        08	5453620
133010	159	5453710 Алексин                29	5453710
133011	159	5454670 Сурское                12	5454670
133012	159	5455040 Чулпаново              42	5455040
133013	159	5456370 Целинное               09	5456370
133014	159	5456490 Звериноголовское       09	5456490
133015	159	5457440 Иртыш                  17	5457440
133016	159	5457970 Довольное              20	5457970
133017	159	5458230 О.Дальний              20	5458230
133018	159	5458640 Белово                 20	5458640
133019	159	5458990 Шира,ж.д.              21	5458990
133020	159	5459340 Артемовск              21	5459340
133021	159	5459350 Щетинкино              21	5459350
133022	159	5459770 Бирюса,рудник          22	5459770
133023	159	5459780 Нерой                  22	5459780
133024	159	5460061 Тулун                  22	5460061
133025	159	5461311 Троицкий прииск        23	5461311
133026	159	5461990 Балтийск               06	5461990
133027	159	5462180 Черняховск             06	5462180
133028	159	5462920 Новолукомль            07	5462920
133029	159	5463320 Ельня                  08	5463320
133030	159	5463980 Рязань,Сысоево,АС      08	5463980
133031	159	5463990 Рязань,Турлатово       08	5463990
133032	159	5464320 Темников               29	5464320
133033	159	5465150 Черемшан               42	5465150
133034	159	5465280 Бугульма               42	5465280
133035	159	5465370 Туймазы                41	5465370
133036	159	5465450 Буздяк                 41	5465450
133037	159	5465540 Чишмы                  41	5465540
133038	159	5465830 Верхний Катаев         09	5465830
133039	159	5466030 Мирный                 09	5466030
133040	159	5466121 Кроноки                27	5466121
133041	159	5467240 Шербакуль              17	5467240
133042	159	5467260 Борисовский,з/совхоз   17	5467260
133043	159	5468540 Красное                20	5468540
133044	159	5469080 Первомайское           21	5469080
133045	159	5469090 Буденновская           21	5469090
133046	159	5470491 Знаменка               22	5470491
133047	159	5472060 Калининград            06	5472060
133048	159	5472091 Гуля                   23	5472091
133049	159	5472110 Гвардейск              06	5472110
133050	159	5472840 Березинский,заповед.   07	5472840
133051	159	5472891 Бомнак                 25	5472891
133052	159	5473041 Локшак                 25	5473041
133053	159	5473051 Локшак                 25	5473051
133054	159	5473531 Чумикан                25	5473531
133055	159	5474490 Починки                29	5474490
133056	159	5474760 Дрожжаное              42	5474760
133057	159	5475580 Уфа,Дема               41	5475580
133058	159	5475861 Мильково               27	5475861
133059	159	5477510 Любимовка              17	5477510
133060	159	5477660 Чистоозерное           20	5477660
133061	159	5477870 Здвинск                20	5477870
133062	159	5478110 Ужаниха                20	5478110
133063	159	5478290 Лысая Гора             20	5478290
133064	159	5478330 Искитим                20	5478330
133065	159	5478380 Легостаево             20	5478380
133066	159	5478620 Кольчугино             20	5478620
133067	159	5479090 Разлив                 21	5479090
133068	159	5479960 Худоеланское           22	5479960
133069	159	5480521 Жигалово               22	5480521
133070	159	5481891 Моклакан               23	5481891
133071	159	5482970 Сенно                  07	5482970
133072	159	5483210 Смоленск               08	5483210
133073	159	5483751 Большой Шантар         25	5483751
133074	159	5483820 Кашира                 08	5483820
133075	159	5483890 Зарайск                08	5483890
133076	159	5485600 Уфа,Дема               41	5485600
133077	159	5485820 Катав-Ивановск         09	5485820
133078	159	5486600 Половинное             09	5486600
133079	159	5486751 Преображенское         27	5486751
133080	159	5488290 Обская ГМО (Новосиб)   20	5488290
133081	159	5488470 Коурак                 20	5488470
133082	159	5488880 Ненастная              21	5488880
133083	159	5491121 Тасса                  23	5491121
133084	159	5491311 Верхний Ципикан        23	5491311
133085	159	5492020 Светлогорск            06	5492020
133086	159	5492670 Нарочь,озерная         07	5492670
133087	159	5492780 Докшицы                07	5492780
133088	159	5492870 Лепель                 07	5492870
133089	159	5493750 Серпухов               08	5493750
133090	159	5493751 Большой Шантар         25	5493751
133091	159	5494660 Алатырь                29	5494660
133092	159	5494830 Буинск                 42	5494830
133093	159	5494890 Тетюши                 42	5494890
133094	159	5494940 Отрада                 42	5494940
133095	159	5495080 Аксубаево              42	5495080
133096	159	5495310 Азнакаево              42	5495310
133097	159	5495690 Улу-Теляк              41	5495690
133098	159	5496041 Кроноцкое,озеро        27	5496041
133099	159	5496080 Тимирязевская          09	5496080
133100	159	5496440 Куртамыш               09	5496440
133101	159	5497130 Исилькуль              17	5497130
133102	159	5498290 Учебная ГМС            20	5498290
133103	159	5498570 Промышленная           20	5498570
133104	159	5499900 Нижнеудинск            22	5499900
133105	159	5502020 Пионерский             06	5502020
133106	159	5502681 Унаха                  25	5502681
133107	159	5503110 Рудня                  08	5503110
133108	159	5503240 Шокино,АГРО            08	5503240
133109	159	5503650 Малоярославец          08	5503650
133110	159	5504180 Елатьма                08	5504180
133111	159	5504450 Лукоянов               29	5504450
133112	159	5504530 Большое Болдино        29	5504530
133113	159	5505210 Акташ                  42	5505210
133114	159	5505790 Кропачево              09	5505790
133115	159	5506010 Миасс                  09	5506010
133116	159	5506260 Сафакулево             09	5506260
133117	159	5507340 Омск,степная           17	5507340
133118	159	5507460 Калачинск              17	5507460
133119	159	5507790 Квашнино               20	5507790
133120	159	5508220 Коченево               20	5508220
133121	159	5508300 Новосибирск,ГМО        20	5508300
133122	159	5508680 Крапивино              20	5508680
133123	159	5508850 Белогорск              20	5508850
133124	159	5510521 Грузновка              22	5510521
133125	159	5510971 Томпа                  22	5510971
133126	159	5512190 Советск                06	5512190
133127	159	5512630 Лынтупы                07	5512630
133128	159	5513330 Сафоново               08	5513330
133129	159	5513440 Вязьма                 08	5513440
133130	159	5513500 Темкино                08	5513500
133131	159	5513800 Михнево                08	5513800
133132	159	5513870 Коломна                08	5513870
133133	159	5514060 Тума                   08	5514060
133134	159	5514760 Батырево               29	5514760
133135	159	5515140 Слобода Петропавл      42	5515140
133136	159	5515540 Кушнаренково           41	5515540
133137	159	5515911 Долиновка              27	5515911
133138	159	5516790 Петухово               09	5516790
133139	159	5518090 Чулым                  20	5518090
133140	159	5518300 Огурцово               20	5518300
133141	159	5519080 Светлолобово           21	5519080
133142	159	5519340 Колба                  21	5519340
133143	159	5520331 Распутино              22	5520331
133144	159	5520341 Подволочное            22	5520341
133145	159	5520761 Карам                  22	5520761
133146	159	5521311 Баунт                  23	5521311
133147	159	5521681 Калакан                23	5521681
133148	159	5522351 Средняя Нюкжа          25	5522351
133149	159	5522471 Тында                  25	5522471
133150	159	5523010 Витебск,АМСГ           07	5523010
133151	159	5523430 Вязьма,АМСГ            08	5523430
133152	159	5523440 Вязьма                 08	5523440
133153	159	5524310 Ардатов                29	5524310
133154	159	5524630 Порецкое               29	5524630
133155	159	5525380 Бакалы                 41	5525380
133156	159	5525670 Красная Горка          41	5525670
133157	159	5525740 Зилаир                 41	5525740
133158	159	5525910 Бердяуш                09	5525910
133159	159	5525970 Златоуст               09	5525970
133160	159	5526130 Челябинск,город        09	5526130
133161	159	5526330 Шумиха                 09	5526330
133162	159	5526510 Садовое                09	5526510
133163	159	5526591 Никольское(О.Беринга)  27	5526591
133164	159	5526730 Макушино               09	5526730
133165	159	5527600 Татарск                20	5527600
133166	159	5528030 Каргат                 20	5528030
133167	159	5528440 Тогучин                20	5528440
133168	159	5528620 Кемерово,АГРО          20	5528620
133169	159	5528770 Центральный рудник     20	5528770
133170	159	5529140 Приморск               21	5529140
133171	159	5530921 Байкальское            22	5530921
133172	159	5531311 Баунт                  23	5531311
133173	159	5532321 Усть-Уркима            25	5532321
133174	159	5533150 Демидов                08	5533150
133175	159	5533451 Джана                  25	5533451
133176	159	5534220 Выкса                  29	5534220
133177	159	5535060 Чистополь,АМСГ         42	5535060
133178	159	5535320 Муслюмово              42	5535320
133179	159	5536650 Лебяжье                09	5536650
133180	159	5536730 Макушино               09	5536730
133181	159	5537680 Чаны                   20	5537680
133182	159	5537840 Барабинск              20	5537840
133183	159	5537960 Убинское               20	5537960
133184	159	5538280 Колывань               20	5538280
133185	159	5538360 Мошково                20	5538360
133186	159	5538560 Топки                  20	5538560
133187	159	5538980 Ужур,ст.ж.д.           21	5538980
133188	159	5539430 Вершино-Рыбное         21	5539430
133189	159	5539490 Агинское               21	5539490
133190	159	5540091 Тангуй                 22	5540091
133191	159	5540101 Тангуй                 22	5540101
133192	159	5540541 Коношаново             22	5540541
133193	159	5540551 Головское              22	5540551
133194	159	5542061 Средняя Олекма         23	5542061
133195	159	5542750 Шарковщина             07	5542750
133196	159	5543680 Наро-Фоминск           08	5543680
133197	159	5543900 Егорьевск              08	5543900
133198	159	5544370 Арзамас                29	5544370
133199	159	5544820 Большие Кайбицы        42	5544820
133200	159	5544960 Лаишево                42	5544960
133201	159	5545060 Чистополь              42	5545060
133202	159	5545430 Верхнеяркеево          41	5545430
133203	159	5545470 Дюртюли                41	5545470
133204	159	5545550 Бирск                  41	5545550
133205	159	5545660 Павловка               41	5545660
133206	159	5545990 Таганай,гора           09	5545990
133207	159	5546540 Курган,Вороновка       09	5546540
133208	159	5547030 Сладково               17	5547030
133209	159	5548610 Кемерово               20	5548610
133210	159	5549170 Балахта                21	5549170
133211	159	5549230 Дербино                21	5549230
133212	159	5549240 Вознесенка             21	5549240
133213	159	5549940 Широково               22	5549940
133214	159	5551361 Уакит                  23	5551361
133215	159	5552880 Полоцк                 07	5552880
133216	159	5553240 Ново-Пречистое         08	5553240
133217	159	5553500 Гагарин                08	5553500
133218	159	5553600 Можайск                08	5553600
133219	159	5554550 Сергач                 29	5554550
133220	159	5554750 Канаш                  29	5554750
133221	159	5556930 Ильинка                17	5556930
133222	159	5557030 Сладково               17	5557030
133223	159	5558160 Пеньки                 20	5558160
133224	159	5558920 Шарыпово               21	5558920
133225	159	5560931 Северобайкальск        23	5560931
133226	159	5561451 Ую                     23	5561451
133227	159	5563120 Велиж                  08	5563120
133228	159	5563720 Москва,им.небольсина   08	5563720
133229	159	5563760 Ленино-Дачное          08	5563760
133230	159	5563890 Куровское              08	5563890
133231	159	5564000 Черусти                08	5564000
133232	159	5564070 Гусь-Хрустальный       08	5564070
133233	159	5564200 Муром                  08	5564200
133234	159	5565310 Мензелинск,АМСГ        42	5565310
133235	159	5565561 Ича                    27	5565561
133236	159	5566090 Аргаяш                 09	5566090
133237	159	5566210 Бродокалмак            09	5566210
133238	159	5566310 Малая Рига             09	5566310
133239	159	5567140 Называевск             17	5567140
133240	159	5567350 Саргатское             17	5567350
133241	159	5567530 Еланское               20	5567530
133242	159	5567570 Усть-Тарка             20	5567570
133243	159	5568990 Михайловка             21	5568990
133244	159	5569120 Курбатово              21	5569120
133245	159	5569550 Ирбейское              21	5569550
133246	159	5570181 Калтук                 22	5570181
133247	159	5570911 Гоуджекит              23	5570911
133248	159	5573621 Немуй                  25	5573621
133249	159	5573631 Немуй                  25	5573631
133250	159	5573671 Укой                   25	5573671
133251	159	5573720 Подмосковная           08	5573720
133252	159	5573740 Немчиновка             08	5573740
133253	159	5573750 Москва,обс.МГУ         08	5573750
133254	159	5573770 Москва,Сокольники      08	5573770
133255	159	5575140 Мамадыш                42	5575140
133256	159	5575230 Набережные Челны       42	5575230
133257	159	5575790 Дуван                  41	5575790
133258	159	5576150 Кунашак                09	5576150
133259	159	5576181 Шуберта,мыс            27	5576181
133260	159	5577680 Венгерово              20	5577680
133261	159	5577910 Чумаково               20	5577910
133262	159	5578440 Болотное               20	5578440
133263	159	5578480 Юрга                   20	5578480
133264	159	5578630 Барзас                 20	5578630
133265	159	5579000 Крутоярский з-с        21	5579000
133266	159	5579380 Шалинское              21	5579380
133267	159	5580841 Кунерма                22	5580841
133268	159	5580881 Даван                  23	5580881
133269	159	5580961 Нижнеангарск           23	5580961
133270	159	5581541 Тилишма                23	5581541
133271	159	5582271 Лопча                  25	5582271
133272	159	5582281 Лопча                  25	5582281
133273	159	5582790 Верхнедвинск           07	5582790
133274	159	5583000 Езерище                07	5583000
133275	159	5583430 Сычевка                08	5583430
133276	159	5583740 Москва,крылатское      08	5583740
133277	159	5583750 Москва,балчуг          08	5583750
133278	159	5583760 Москва,им.михельсона   08	5583760
133279	159	5583870 Павловский Посад       08	5583870
133280	159	5584410 Дальне-Константиново   29	5584410
133281	159	5584610 Курмыш                 29	5584610
133282	159	5584750 Цивильск,АГРО          29	5584750
133283	159	5584850 Вязовые                42	5584850
133284	159	5584910 Казань,университет     42	5584910
133285	159	5584930 Казань,цгмс            42	5584930
133286	159	5585210 Елабуга                42	5585210
133287	159	5585690 Караидель,АМСГ         41	5585690
133288	159	5586450 Твердыш                09	5586450
133289	159	5586680 Мокроусово             09	5586680
133290	159	5586830 Бердюжье               17	5586830
133291	159	5588830 Тисуль                 20	5588830
133292	159	5589430 Уяр                    21	5589430
133293	159	5589620 Юж-Александровка       21	5589620
133294	159	5590411 Коченга                22	5590411
133295	159	5591111 Ченча                  23	5591111
133296	159	5591121 Кумора                 23	5591121
133297	159	5591751 Средний Калар          23	5591751
133298	159	5592491 Нагорный               24	5592491
133299	159	5593290 Белый                  08	5593290
133300	159	5593680 Ново-Иерусалим         08	5593680
133301	159	5593720 Москва,ВДНХ            08	5593720
133302	159	5593740 Тушино                 08	5593740
133303	159	5593760 Москва,ВДНХ            08	5593760
133304	159	5593770 Москва,Лосиноос..      08	5593770
133305	159	5593950 Петушки                08	5593950
133306	159	5594300 Павлово                29	5594300
133307	159	5595860 Емаши                  41	5595860
133308	159	5595871 Эссо                   27	5595871
133309	159	5596180 Тахталым               09	5596180
133310	159	5597220 Тюкалинск              17	5597220
133311	159	5598000 Крещенка               20	5598000
133312	159	5598270 Пихтовка               20	5598270
133313	159	5598960 Березовское            21	5598960
133314	159	5599230 Шумиха                 21	5599230
133315	159	5599340 Сорокино               21	5599340
133316	159	5599800 Тайшет                 22	5599800
133317	159	5600301 Ново-Шумилово          22	5600301
133318	159	5602761 Сутам                  24	5602761
133319	159	5603590 Волоколамск            08	5603590
133320	159	5604170 Селиваново,оп.п.       08	5604170
133321	159	5606440 Каргаполье             09	5606440
133322	159	5606570 Памятная               09	5606570
133323	159	5609030 Назарово               21	5609030
133324	159	5609270 Красноярск,оп.п.       21	5609270
133325	159	5609290 Красноярск             21	5609290
133326	159	5610181 Братск,обс.            22	5610181
133327	159	5610581 Орлинга                22	5610581
133328	159	5611161 Уоян                   23	5611161
133329	159	5611921 Катугино               23	5611921
133330	159	5613590 Волоколамск            08	5613590
133331	159	5614040 Владимир,АМСГ          08	5614040
133332	159	5614050 Владимир               08	5614050
133333	159	5614500 Лысково                29	5614500
133334	159	5614710 Чебоксары              29	5614710
133335	159	5614740 Новочебоксарск         29	5614740
133336	159	5614990 Арск                   42	5614990
133337	159	5615660 Аскино                 41	5615660
133338	159	5615960 Нязепетровск           09	5615960
133339	159	5615991 Козыревск              27	5615991
133340	159	5616030 Верхний Уфалей         09	5616030
133341	159	5616360 Шадринск               09	5616360
133342	159	5616950 Ишим                   17	5616950
133343	159	5617460 Большеречье            17	5617460
133344	159	5618560 Тайга                  20	5618560
133345	159	5618600 Анжеро-Судженск        20	5618600
133346	159	5618610 Анжеро-Судженск        20	5618610
133347	159	5618780 Мариинск               20	5618780
133348	159	5618860 Тяжин                  20	5618860
133349	159	5619170 Кемчуг                 21	5619170
133350	159	5619220 Кача                   21	5619220
133351	159	5619270 Минино                 21	5619270
133352	159	5619730 Ключи                  21	5619730
133353	159	5619930 Новочунка              22	5619930
133354	159	5620121 Вихоревка              22	5620121
133355	159	5620171 Братск,ЛПК             22	5620171
133356	159	5620291 Заярск                 22	5620291
133357	159	5621501 Молодежная             23	5621501
133358	159	5622890 Идрица                 03	5622890
133359	159	5624220 Вязники                08	5624220
133360	159	5624280 Гороховец              08	5624280
133361	159	5624340 Дзержинск              29	5624340
133362	159	5624400 Ройка                  29	5624400
133363	159	5625110 Вятские Поляны         29	5625110
133364	159	5626251 Усть-Камчатск          27	5626251
133365	159	5626271 Усть-Камчатск          27	5626271
133366	159	5626331 Мыс Африка             27	5626331
133367	159	5626350 Мальцева,колхоз        09	5626350
133368	159	5627040 Абатский               17	5627040
133369	159	5628650 Яя                     20	5628650
133374	159	5630171 Братск,обс.            22	5630171
133375	159	5630771 Казачинское,АМСГ       22	5630771
133376	159	5631331 Ангаракан              23	5631331
133377	159	5633111 Токо                   24	5633111
133378	159	5633210 Западная Двина         08	5633210
133379	159	5633430 Ржев                   08	5633430
133380	159	5633680 Клин                   08	5633680
133381	159	5633820 Загорск                08	5633820
133382	159	5634380 Нижний Новгород,АМЦ    29	5634380
133383	159	5634390 Н.Новгород,Моск.р-на   29	5634390
133384	159	5634400 Н.Новгород,мыза        29	5634400
133385	159	5635490 Янаул                  41	5635490
133386	159	5636081 Ключи                  27	5636081
133387	159	5636251 Усть-Камчатск          27	5636251
133388	159	5636290 Далматово              09	5636290
133389	159	5638400 Кожевниково            20	5638400
133390	159	5639050 Ачинск,ж.д.ст.         21	5639050
133391	159	5639460 Богунай                21	5639460
133392	159	5640411 Железногорск           22	5640411
133393	159	5641481 Таксимо                23	5641481
133394	159	5643060 Великие Луки           03	5643060
133395	159	5643290 Лесной заповедник      08	5643290
133396	159	5643750 Дмитров                08	5643750
133397	159	5643880 Александров            08	5643880
133398	159	5644130 Ковров                 08	5644130
133399	159	5644660 Козьмодемьянск         29	5644660
133400	159	5644900 Морки                  29	5644900
133401	159	5645020 Балтаси                42	5645020
133402	159	5645220 Можга                  29	5645220
133403	159	5646190 Каменск-Уральский      09	5646190
133404	159	5646540 Солобоево              17	5646540
133405	159	5646840 Голышманово            17	5646840
133406	159	5647090 Паново                 17	5647090
133407	159	5647520 Муромцево              17	5647520
133408	159	5647840 Северное               20	5647840
133409	159	5648500 Томск                  20	5648500
133410	159	5649680 Соколовка              21	5649680
133411	159	5649840 Шиткино                22	5649840
133412	159	5650391 Суворовский            22	5650391
133413	159	5651561 Муя                    23	5651561
133414	159	5653160 Торопец                08	5653160
133415	159	5653490 Старица                08	5653490
133416	159	5653600 Тургиново              08	5653600
133417	159	5653821 Аян                    25	5653821
133418	159	5653831 Аян                    25	5653831
133419	159	5653970 Юрьев-Польский         08	5653970
133420	159	5655060 Савали                 29	5655060
133421	159	5655070 Малмыж                 29	5655070
133422	159	5655380 Сарапул                29	5655380
133423	159	5655610 Чернушка               09	5655610
133424	159	5655730 Октябрьский            09	5655730
133425	159	5655820 Манчаж                 09	5655820
133426	159	5655910 Михайловск             09	5655910
133427	159	5656080 Сысерть                09	5656080
133428	159	5656470 Шатрово                09	5656470
133429	159	5656740 Вагай,ж.д.ст.          17	5656740
133430	159	5657370 Колосовка              17	5657370
133431	159	5658490 Томск,кти.оптика       20	5658490
133432	159	5658930 Тюхтет                 21	5658930
133433	159	5659330 Сухобузимское          21	5659330
133434	159	5660141 Кобляково              22	5660141
133435	159	5661831 Нижний Ингамакит       23	5661831
133436	159	5661841 Удокан                 23	5661841
133437	159	5661851 Наминга                23	5661851
133438	159	5662151 Усть-Нюкжа             25	5662151
133439	159	5663631 Батомга                25	5663631
133440	159	5664780 Йошкар-Ола             29	5664780
133441	159	5664790 Йошкар-Ола             29	5664790
133442	159	5665300 Агрыз                  42	5665300
133443	159	5665780 Красноуфимск           09	5665780
133444	159	5667660 Кыштовка               20	5667660
133445	159	5669190 Михайловка             21	5669190
133446	159	5671761 Большая Лепринда       23	5671761
133447	159	5672471 Нерюнгри               24	5672471
133448	159	5672870 Опочка                 03	5672870
133449	159	5673880 Переславль-Залесский   08	5673880
133450	159	5674310 Пурех                  29	5674310
133451	159	5674340 Городец(Волжск.ГМО)    29	5674340
133452	159	5676070 Исток                  09	5676070
133453	159	5676110 Верхнее Дуброво        09	5676110
133454	159	5676380 Бутка                  09	5676380
133455	159	5676640 Ялуторовск             17	5676640
133456	159	5679060 Большой Улуй           21	5679060
133457	159	5679600 Абан                   21	5679600
133458	159	5680381 Илимск                 22	5680381
133459	159	5680581 Усть-Кут,Г-1           22	5680581
133460	159	5680651 Звездный (Таюра)       22	5680651
133461	159	5681831 Удокан                 23	5681831
133462	159	5681841 Намингнакан            23	5681841
133463	159	5684450 Семенов                29	5684450
133464	159	5684540 Воскресенское          29	5684540
133465	159	5684980 Нартас                 29	5684980
133466	159	5685190 Вавож                  29	5685190
133467	159	5685410 Чайковский             09	5685410
133468	159	5685950 Дружинино              09	5685950
133469	159	5686060 Екатеринбург           09	5686060
133470	159	5686090 Исток                  09	5686090
133471	159	5686210 Богданович             09	5686210
133472	159	5686730 Юргинское              17	5686730
133473	159	5687060 Викулово               17	5687060
133474	159	5689680 Долгий мост            21	5689680
133475	159	5689900 Выдрино-на-Чуне        22	5689900
133476	159	5690181 Нижне-Шаманское        22	5690181
133477	159	5690571 Усть-Кут,АМСГ          22	5690571
133478	159	5691841 Чара                   23	5691841
133479	159	5692491 Чульман                24	5692491
133480	159	5693590 Тверь                  08	5693590
133481	159	5693740 Савелово               08	5693740
133482	159	5694090 Иваново                08	5694090
133483	159	5694140 Шуя                    08	5694140
133484	159	5694730 Санчурск               29	5694730
133485	159	5695110 Кильмезь               29	5695110
133486	159	5695330 Ижевск                 29	5695330
133487	159	5695560 Барда                  09	5695560
133488	159	5695680 Суда                   09	5695680
133489	159	5695910 Бисерть                09	5695910
133490	159	5695990 Ревда                  09	5695990
133491	159	5696270 Камышлов               09	5696270
133492	159	5697270 Большие Уки            17	5697270
133493	159	5697440 Тара                   17	5697440
133494	159	5698440 Брагино                20	5698440
133495	159	5698660 Зырянское              20	5698660
133496	159	5699310 Большая Мурта          21	5699310
133497	159	5699520 Дзержинское            21	5699520
133498	159	5699900 Березовый              22	5699900
133499	159	5702890 Пушкинские Горы        03	5702890
133500	159	5702990 Сущево                 03	5702990
133501	159	5703420 Кувшиново              08	5703420
133502	159	5703500 Торжок                 08	5703500
133503	159	5704230 Лух                    08	5704230
133504	159	5704870 Новый Торьял           29	5704870
133505	159	5705330 Ижевск,АГРО            29	5705330
133506	159	5705950 Кузино                 09	5705950
133507	159	5707440 Тара                   17	5707440
133508	159	5707530 Седельниково           17	5707530
133509	159	5709140 Суриково               21	5709140
133510	159	5710231 Ершово                 22	5710231
133511	159	5710391 Новая Игирма           22	5710391
133512	159	5710491 Максимово              22	5710491
133513	159	5712790 Пыталово               03	5712790
133514	159	5713310 Осташков               08	5713310
133515	159	5714520 Красные Баки           29	5714520
133516	159	5715000 Уржум                  29	5715000
133517	159	5715410 Воткинск               29	5715410
133518	159	5715480 Ножовка                09	5715480
133519	159	5715671 Усть-Хайрюзово         27	5715671
133520	159	5716470 Тугулым                09	5716470
133521	159	5716540 Тюмень                 17	5716540
133522	159	5717380 Знаменское             17	5717380
133523	159	5718190 Бакчар                 20	5718190
133524	159	5718450 Красный Яр             20	5718450
133525	159	5718620 Первомайское           20	5718620
133526	159	5719050 Новобирилюссы          21	5719050
133527	159	5719060 Бирилюссы              21	5719060
133528	159	5720331 Нижне-Илимск           22	5720331
133529	159	5721401 Таежная                22	5721401
133530	159	5723120 Холм                   03	5723120
133531	159	5723940 Ростов                 08	5723940
133532	159	5725661 Остров Птичий          27	5725661
133533	159	5726550 Тюмень                 17	5726550
133534	159	5726910 Новопетрово            17	5726910
133535	159	5726920 Балахлей               17	5726920
133536	159	5729460 Тасеево                21	5729460
133537	159	5730711 Верхне-Марково         22	5730711
133538	159	5733210 Марево                 03	5733210
133539	159	5734310 Юрьевец                08	5734310
133540	159	5735220 Селты                  29	5735220
133541	159	5735550 Оса                    09	5735550
133542	159	5738140 Парбиг                 20	5738140
133543	159	5738810 Тегульдет              20	5738810
133544	159	5740231 Воробьево              22	5740231
133545	159	5743570 Толмачи                08	5743570
133546	159	5743760 Кашин                  08	5743760
133547	159	5744130 Приволжск              08	5744130
133548	159	5744220 Кинешма                08	5744220
133549	159	5744790 Яранск                 29	5744790
133550	159	5745690 Кунгур                 09	5745690
133551	159	5745820 Шамары                 09	5745820
133552	159	5746190 Артемовский            09	5746190
133553	159	5746710 Ярково                 17	5746710
133554	159	5747350 Ново-Ягодное           17	5747350
133555	159	5747480 Васисс                 17	5747480
133556	159	5748930 Чиндат                 21	5748930
133557	159	5749490 Троицк                 21	5749490
133558	159	5753830 Углич                  08	5753830
133559	159	5754060 Нерехта                08	5754060
133560	159	5754590 Арья                   29	5754590
133561	159	5756030 Невьянск               09	5756030
133562	159	5756120 Липовское              09	5756120
133563	159	5756370 Краснополянское        09	5756370
133564	159	5757240 Тевриз                 17	5757240
133565	159	5758090 Кенга                  20	5758090
133566	159	5759160 Чойда                  21	5759160
133567	159	5761251 Конкудера              22	5761251
133568	159	5761391 Тельмама               22	5761391
133569	159	5762521 Малый Нимныр           24	5762521
133570	159	5763460 Вышний Волочек         08	5763460
133571	159	5763621 Нелькан                25	5763621
133572	159	5763980 Ярославль,Карачиха     08	5763980
133573	159	5764890 Советск                29	5764890
133574	159	5764990 Нолинск                29	5764990
133575	159	5765310 Игра                   29	5765310
133576	159	5765380 Дебессы                29	5765380
133577	159	5766300 Ирбит,Фомино           09	5766300
133578	159	5766440 Туринская Слобода      09	5766440
133579	159	5767920 Пудино                 20	5767920
133580	159	5768380 Молчаново              20	5768380
133581	159	5769230 Пировское              21	5769230
133582	159	5771181 Чуя                    22	5771181
133583	159	5772591 Канку                  24	5772591
133584	159	5772821 Спокойный              24	5772821
133585	159	5773250 Демянск                03	5773250
133586	159	5773340 Шлинский гидроузел     08	5773340
133587	159	5773621 Нелькан                25	5773621
133588	159	5774100 Кострома,АМСГ          08	5774100
133589	159	5774660 Шахунья                29	5774660
133590	159	5775470 Большая Соснова        09	5775470
133591	159	5775540 Оханск                 09	5775540
133592	159	5775950 Висим                  09	5775950
133593	159	5776321 Мыс Озерный            27	5776321
133594	159	5776620 Нижняя-Тавда           17	5776620
133595	159	5777120 Усть-Ишим              17	5777120
133596	159	5779310 Казачинское            21	5779310
133597	159	5779330 Казачинское            21	5779330
133598	159	5779950 Червянка               22	5779950
133599	159	5780751 Нижняя Тунгуска        22	5780751
133600	159	5780811 Киренск                22	5780811
133601	159	5781401 Мамакан                22	5781401
133602	159	5781751 Ничатка                23	5781751
133603	159	5782171 Енюка                  24	5782171
133604	159	5782820 Псков                  03	5782820
133605	159	5782830 Псков                  03	5782830
133606	159	5782850 Псков                  03	5782850
133607	159	5782990 Дно                    03	5782990
133608	159	5783091 Чюльбю                 24	5783091
133609	159	5783590 Максатиха              08	5783590
133610	159	5783670 Бежецк                 08	5783670
133611	159	5784000 Ярославль              08	5784000
133612	159	5784031 Энкан                  25	5784031
133613	159	5784090 Кострома               08	5784090
133614	159	5784220 Островское             08	5784220
133615	159	5785150 Уни                    29	5785150
133616	159	5785870 Кын                    09	5785870
133617	159	5785871 Тигиль                 27	5785871
133618	159	5786211 Ука                    27	5786211
133619	159	5786310 Волково(ирбит)         09	5786310
133620	159	5787730 Майск                  20	5787730
133621	159	5788260 Чаинское оп.поле       20	5788260
133622	159	5788270 Подгорное              20	5788270
133623	159	5788520 Батурино               20	5788520
133624	159	5791421 Бодайбо                22	5791421
133625	159	5793410 Бологое                08	5793410
133626	159	5793950 Тутаев                 08	5793950
133627	159	5794380 Макарьев               08	5794380
133628	159	5794580 Ветлуга                29	5794580
133629	159	5796010 Нижний Тагил           09	5796010
133630	159	5796170 Алапаевск              09	5796170
133631	159	5796900 Вагайское              17	5796900
133632	159	5799720 Гонда                  21	5799720
133633	159	5800271 Усть-Илимск            22	5800271
133634	159	5803130 Старая Русса           03	5803130
133635	159	5803330 Валдай                 03	5803330
133636	159	5804910 Верхошижемье           29	5804910
133637	159	5805640 Пермь                  09	5805640
133638	159	5810871 Чечуйск                22	5810871
133639	159	5812371 Суон-Тиит              24	5812371
133640	159	5813720 Красный Холм           08	5813720
133641	159	5813870 Рыбинск,ГМО            08	5813870
133642	159	5814990 Кумены                 29	5814990
133643	159	5815270 Глазов                 29	5815270
133644	159	5815470 Верещагино             09	5815470
133645	159	5815780 Лысьва                 09	5815780
133646	159	5816060 Верхняя Салда          09	5816060
133647	159	5816370 Туринск                09	5816370
133648	159	5816540 Тавда,Белый Яр         09	5816540
133649	159	5819300 Стрелка                21	5819300
133650	159	5820271 Усть-Илимск,второй     22	5820271
133651	159	5820571 Токма                  22	5820571
133652	159	5822910 Струги Красные         03	5822910
133653	159	5823100 Коростынь              03	5823100
133654	159	5823860 Мыс Рожновский         08	5823860
133655	159	5824020 Данилов                08	5824020
133656	159	5825540 Григорьевская          09	5825540
133657	159	5826810 Тобольск               17	5826810
133658	159	5826820 Тобольск               17	5826820
133659	159	5828060 Старица                20	5828060
133660	159	5829090 Маковское              21	5829090
133661	159	5829470 Мотыгино               21	5829470
133662	159	5830961 Дарьина                22	5830961
133663	159	5831291 Мама                   22	5831291
133664	159	5833250 Крестцы                03	5833250
133665	159	5833790 Брейтово               08	5833790
133666	159	5834710 Шабалино               29	5834710
133667	159	5834840 Котельнич              29	5834840
133668	159	5835780 Чусовой                09	5835780
133669	159	5835980 Кушва                  09	5835980
133670	159	5838290 Колпашево              20	5838290
133671	159	5840281 Кеуль                  22	5840281
133672	159	5841601 Светлый                22	5841601
133673	159	5842601 Горелый                24	5842601
133674	159	5843160 Войцы                  03	5843160
133675	159	5843330 Окуловка               03	5843330
133676	159	5843390 Боровичи               03	5843390
133677	159	5843710 Кесьма                 08	5843710
133678	159	5844240 Галич                  08	5844240
133679	159	5844340 Николо-Полома          08	5844340
133680	159	5844480 Мантурово              08	5844480
133681	159	5844560 Шарья                  08	5844560
133682	159	5845160 Фаленки                29	5845160
133683	159	5845450 Сива                   09	5845450
133684	159	5848450 Палочка                20	5848450
133685	159	5848510 Белый Яр,АМСГ          20	5848510
133686	159	5848940 Лосиноборское          21	5848940
133687	159	5849750 Богучаны               21	5849750
133688	159	5853130 Новгород               03	5853130
133689	159	5853760 Мологский отрог        01	5853760
133690	159	5853910 Пошехонье-Володарск    08	5853910
133691	159	5854150 Буй                    08	5854150
133692	159	5854970 Киров,ГМО              29	5854970
133693	159	5855020 Просница(киров)        29	5855020
133694	159	5855650 Добрянка               09	5855650
133695	159	5855890 Бисер                  09	5855890
133696	159	5855921 Усть-Воямполка         27	5855921
133697	159	5856450 Таборы                 09	5856450
133698	159	5859220 Енисейск               21	5859220
133699	159	5860981 Ичера                  22	5860981
133700	159	5862541 Алдан                  24	5862541
133701	159	5862851 Угино                  24	5862851
133702	159	5862880 Ляды                   03	5862880
133703	159	5862980 Николаевское           03	5862980
133704	159	5863560 Охоны                  03	5863560
133705	159	5864970 Киров,АМСГ             29	5864970
133706	159	5866490 Пальмино               09	5866490
133707	159	5867660 Новый Васюган,АМСГ     20	5867660
133708	159	5868670 Степановка             20	5868670
133709	159	5869580 Каменка                21	5869580
133710	159	5869870 Климино                21	5869870
133711	159	5871121 Визирный               22	5871121
133712	159	5872780 Гдов                   03	5872780
133713	159	5873061 Учур                   24	5873061
133714	159	5873270 Веребье                03	5873270
133715	159	5873711 Курун-Урях             25	5873711
133716	159	5873850 Гаютино                08	5873850
133717	159	5875210 Омутнинск              29	5875210
133718	159	5875950 Качканар               09	5875950
133719	159	5878150 Парабель               20	5878150
133720	159	5878690 Максимкин Яр           20	5878690
133721	159	5883220 Малая Вишера           03	5883220
133722	159	5883950 Владычное              08	5883950
133723	159	5884191 Улья                   25	5884191
133724	159	5884270 Чухлома                08	5884270
133725	159	5884430 Кологрив               08	5884430
133726	159	5884790 Даровское              29	5884790
133727	159	5885141 Алевина,мыс            33	5885141
133728	159	5885620 Чермоз                 09	5885620
133729	159	5885980 Качканар(ис)           09	5885980
133730	159	5886180 Дерябино               09	5886180
133731	159	5886600 Куминская              17	5886600
133732	159	5891121 Визирный               22	5891121
133733	159	5891291 Воронцовка             22	5891291
133734	159	5892631 Томмот                 24	5892631
133735	159	5893450 Хвойная                03	5893450
133736	159	5893640 Устюжна                01	5893640
133737	159	5894191 Улья                   25	5894191
133738	159	5894580 Пыщуг                  08	5894580
133739	159	5894680 Вохма                  08	5894680
133740	159	5895090 Белая Холуница         29	5895090
133741	159	5895330 Афанасьево             29	5895330
133742	159	5895620 Островная              09	5895620
133743	159	5895760 Губаха                 09	5895760
133744	159	5896080 Верхотурье             09	5896080
133745	159	5896380 Носово                 09	5896380
133746	159	5898780 Усть-Озерное           20	5898780
133747	159	5900111 Кежма                  21	5900111
133748	159	5901691 Перевоз                22	5901691
133749	159	5901981 Тяня                   24	5901981
133750	159	5902181 Джикимда               24	5902181
133751	159	5902910 Осьмино                03	5902910
133752	159	5905470 Кудымкар               09	5905470
133753	159	5906380 Новоселово             09	5906380
133754	159	5906391 Карагинский Остр       27	5906391
133755	159	5906910 Юность Комсомольская   17	5906910
133756	159	5907840 Мыльджино,АМСГ         20	5907840
133757	159	5913160 Чудово                 03	5913160
133758	159	5913790 Череповец              01	5913790
133759	159	5914230 Солигалич              08	5914230
133760	159	5915061 Завьялова,ос.(Рассвет) 33	5915061
133761	159	5915331 Братьев,мыс            33	5915331
133762	159	5915770 Кизел                  09	5915770
133763	159	5915880 Растес                 09	5915880
133764	159	5915991 Палана                 27	5915991
133765	159	5916001 Палана                 27	5916001
133766	159	5917670 Катыльга               20	5917670
133767	159	5918100 Каргасок,АМСГ          20	5918100
133768	159	5921191 Паршино                22	5921191
133769	159	5923521 Усть-Юдома             24	5923521
133770	159	5924621 Ушки                   33	5924621
133771	159	5924901 Спафарьева,остров      33	5924901
133772	159	5925241 Мелководная            33	5925241
133773	159	5926190 Сосьва                 09	5926190
133774	159	5926890 Уват                   17	5926890
133775	159	5927820 Средний Васюган        20	5927820
133776	159	5930621 Ика                    22	5930621
133777	159	5930821 Непа                   22	5930821
133778	159	5933250 Будогощь               03	5933250
133779	159	5933970 Вологда-Молочная       01	5933970
133780	159	5933990 Вологда,Прилуки        01	5933990
133781	159	5935080 Нагорское              29	5935080
133782	159	5935220 Кирс                   29	5935220
133783	159	5936321 Оссора                 27	5936321
133784	159	5938260 Березовка              20	5938260
133785	159	5942860 Кингисепп              03	5942860
133786	159	5942950 Волосово               03	5942950
133787	159	5943010 Белогорка              03	5943010
133788	159	5943130 Любань                 03	5943130
133789	159	5943200 Кириши                 03	5943200
133790	159	5943590 Бабаево                01	5943590
133791	159	5944331 Охотск                 33	5944331
133792	159	5944481 Иня                    33	5944481
133793	159	5944890 Мураши                 29	5944890
133794	159	5945660 Березники              09	5945660
133795	159	5945690 Березники              09	5945690
133796	159	5945880 Усть-Тылай             09	5945880
133797	159	5946230 Гари                   09	5946230
133798	159	5948930 Александровский шлюз   21	5948930
133799	159	5951261 Витим                  24	5951261
133800	159	5953200 Кириши                 03	5953200
133801	159	5953470 Ефимовская             03	5953470
133802	159	5954550 Никольск               01	5954550
133803	159	5955071 Магадан(Нагаева,бухта) 33	5955071
133804	159	5955920 Кытлым                 09	5955920
133805	159	5956051 Усть-Лесная            27	5956051
133806	159	5957030 Лымкоевские            17	5957030
133807	159	5957330 Таурово                17	5957330
133808	159	5957950 Прохоркино             20	5957950
133809	159	5959100 Назимово               21	5959100
133810	159	5960331 Чемдальск              21	5960331
133811	159	5963301 Усть-Миль              24	5963301
133812	159	5963930 Коробово               01	5963930
133813	159	5964150 Биряково               01	5964150
133814	159	5964911 Балаганное(Горбея,мыс) 33	5964911
133815	159	5964940 Летка,АМСГ             01	5964940
133816	159	5964950 Летка                  01	5964950
133817	159	5965131 Ола                    33	5965131
133818	159	5965450 Кочево                 09	5965450
133819	159	5965680 Березники,АМСГ         09	5965680
133820	159	5966060 Серов                  09	5966060
133821	159	5966071 Теви                   27	5966071
133822	159	5966580 Леуши                  17	5966580
133823	159	5966930 Демьянское             17	5966930
133824	159	5972711 Буяга                  24	5972711
133825	159	5972990 Кипень                 03	5972990
133826	159	5973040 Пушкин                 03	5973040
133827	159	5973360 Тихвин                 03	5973360
133828	159	5975011 Армань                 33	5975011
133829	159	5975270 Лойно                  29	5975270
133830	159	5975431 Брохово(Ямск)          33	5975431
133831	159	5975680 Соликамск,АМСГ         09	5975680
133832	159	5976740 Кондинское             17	5976740
133833	159	5977920 Ново-Никольское        20	5977920
133834	159	5982870 Старое Гарколово       03	5982870
133835	159	5983030 Ленинград,шоссейная    03	5983030
133836	159	5983771 Югаренок               24	5983771
133837	159	5984861 Талон                  33	5984861
133838	159	5985151 Клепка                 33	5985151
133839	159	5986000 Карпинск               09	5986000
133840	159	5986020 Краснотурьинск         09	5986020
133841	159	5989350 Новоерудинский         21	5989350
133842	159	5991761 Мача                   24	5991761
133843	159	5992980 Ломоносов              03	5992980
133844	159	5993030 Невская-порт           03	5993030
133845	159	5993070 Воейково               03	5993070
133846	159	5993100 Шлиссельбург           03	5993100
133847	159	5993110 Петрокрепость          03	5993110
133848	159	5993230 Волхов                 03	5993230
133849	159	5993420 Шугозеро               03	5993420
133850	159	5993600 Борисово-Судское       01	5993600
133851	159	5993840 Кириллов               01	5993840
133852	159	5994830 Опарино                29	5994830
133853	159	5995500 Коса                   09	5995500
133854	159	5998190 Напас                  20	5998190
133855	159	6002780 Мощный                 03	6002780
133856	159	6002990 Лисий Нос              03	6002990
133857	159	6003030 Санкт-Петербург        03	6003030
133858	159	6003780 Белозерск,АМСГ         01	6003780
133859	159	6004280 Тотьма                 01	6004280
133860	159	6004481 Хейджан                33	6004481
133861	159	6004580 Кичменгский городок    01	6004580
133862	159	6010811 Преображенка           22	6010811
133863	159	6012700 Гогланд                03	6012700
133864	159	6013110 Осиновец               03	6013110
133865	159	6013230 Новая Ладога           03	6013230
133866	159	6014231 Арка                   33	6014231
133867	159	6015091 Палатка(Хасын)         33	6015091
133868	159	6016000 Североуральск          09	6016000
133869	159	6017150 Салым                  17	6017150
133870	159	6022900 Озерки                 03	6022900
133871	159	6023001 Тегюльтя               24	6023001
133872	159	6023060 Токсово                03	6023060
133873	159	6025471 Тахтоямск              33	6025471
133874	159	6026130 Понил                  09	6026130
133875	159	6026280 Шанталь                09	6026280
133876	159	6030231 Ванавара               21	6030231
133877	159	6031171 Комака                 24	6031171
133878	159	6032960 Рощино                 03	6032960
133879	159	6034710 Подосиновец            29	6034710
133880	159	6035430 Гайны                  09	6035430
133881	159	6036020 Североуральск          09	6036020
133882	159	6036420 Шаим                   17	6036420
133883	159	6036900 Алтай                  17	6036900
133884	159	6039020 Ярцево                 21	6039020
133885	159	6039890 Таимба                 21	6039890
133886	159	6042041 Олекминск              24	6042041
133887	159	6042751 Добролет               24	6042751
133888	159	6042860 Приморск               03	6042860
133889	159	6043210 Сухо,маяк              03	6043210
133890	159	6043451 Усть-Мая               24	6043451
133891	159	6043751 Ыныкчан,АМСГ           24	6043751
133892	159	6044420 Нюксеница,АМСГ         01	6044420
133893	159	6044970 Объячево               01	6044970
133894	159	6045090 Койгородок,АМСГ        01	6045090
133895	159	6045650 Чердынь                09	6045650
133896	159	6045710 Красновишерск          09	6045710
133897	159	6046310 Портах                 09	6046310
133898	159	6046601 Корф                   27	6046601
133899	159	6046711 Бухта Лаврова          27	6046711
133900	159	6046971 Апука                  27	6046971
133901	159	6047081 Топата-Олюторская      27	6047081
133902	159	6047790 Александровское        20	6047790
133903	159	6048410 Ванжиль-Кынак          20	6048410
133904	159	6048840 Сым                    21	6048840
133905	159	6049300 Северо-Енисейский      21	6049300
133906	159	6051621 Нюя                    24	6051621
133907	159	6053290 Свирица                03	6053290
133908	159	6053860 Чарозеро               01	6053860
133909	159	6054020 Вожега                 01	6054020
133910	159	6054180 Чушевицы               01	6054180
133911	159	6054821 Яна                    33	6054821
133912	159	6055090 Койгородок             01	6055090
133913	159	6055260 Усть-Черная            09	6055260
133914	159	6055710 Полюдов Камень         09	6055710
133915	159	6057400 Угут                   17	6057400
133916	159	6062411 Саныяхтат              24	6062411
133917	159	6063030 Сосново                03	6063030
133918	159	6063480 Винницы                03	6063480
133919	159	6064360 Тарногский Городок     01	6064360
133920	159	6065071 Мадаун                 33	6065071
133921	159	6065840 Вая                    09	6065840
133922	159	6065850 Усть-Улс               09	6065850
133923	159	6071491 Ленск                  24	6071491
133924	159	6072870 Выборг                 03	6072870
133925	159	6073360 Лодейное Поле          03	6073360
133926	159	6073710 Анненский мост         01	6073710
133927	159	6074281 Уега                   33	6074281
133928	159	6074760 Лальск                 29	6074760
133929	159	6075591 Шелихово               33	6075591
133930	159	6075680 Ныроб,АМСГ             09	6075680
133931	159	6076040 Ивдель                 09	6076040
133932	159	6076041 Тайгонос               33	6076041
133933	159	6076301 Чемурнаут              27	6076301
133934	159	6079750 Усть-Камо              21	6079750
133935	159	6082531 Исить                  24	6082531
133936	159	6084630 Великий Устюг          01	6084630
133937	159	6085181 Атка                   33	6085181
133938	159	6091931 Килеер                 24	6091931
133939	159	6093191 Амга,АМСГ              24	6093191
133940	159	6093290 Олонец                 03	6093290
133941	159	6094030 Коноша                 01	6094030
133942	159	6096140 Оус                    09	6096140
133943	159	6096490 Супра                  17	6096490
133944	159	6097660 Нижневартовск          17	6097660
133945	159	6102890 Лесогорский            03	6102890
133946	159	6103010 Приозерск              03	6103010
133947	159	6103550 Вознесенье             03	6103550
133948	159	6103650 Вытегра                01	6103650
133949	159	6106220 Атымья                 09	6106220
133950	159	6106690 Таватьях               17	6106690
133951	159	6106900 Ханты-Мансийск         17	6106900
133952	159	6106910 Ханты-Мансийск         17	6106910
133953	159	6107260 Нефтеюганск            17	6107260
133954	159	6107880 Ваховск                17	6107880
133955	159	6108960 Ворогово               21	6108960
133956	159	6109340 Вельмо                 21	6109340
133957	159	6112691 Синское                24	6112691
133958	159	6112861 Бролог                 24	6112861
133959	159	6113801 Аллах-юнь,АМСГ         24	6113801
133960	159	6114210 Вельск                 01	6114210
133961	159	6114340 Шангалы                01	6114340
133962	159	6114660 Курцево,АГРО           01	6114660
133963	159	6114790 Вилегодское            01	6114790
133964	159	6114961 Усть-Омчуг             33	6114961
133965	159	6115030 Пустошь                01	6115030
133966	159	6115210 Лопыдино               01	6115210
133967	159	6115241 Талая                  33	6115241
133968	159	6116860 Белогорье              17	6116860
133969	159	6116900 Ханты-Мансийск         17	6116900
133970	159	6117860 Лобчинские             17	6117860
133971	159	6123240 Видлица                03	6123240
133972	159	6124660 Котлас                 01	6124660
133973	159	6125660 Чусовской              09	6125660
133974	159	6127271 Красная                27	6127271
133975	159	6130051 Муторай                21	6130051
133976	159	6130791 Ербогачен              22	6130791
133977	159	6133160 Мантсинсаари           03	6133160
133978	159	6133630 Павликовская           03	6133630
133979	159	6133640 Павликовская           03	6133640
133980	159	6134921 Бутугычаг              33	6134921
133981	159	6136050 Бурмантово             09	6136050
133982	159	6136320 Комсомольская          17	6136320
133983	159	6136730 Сеуль                  17	6136730
133984	159	6137120 Сытомино               17	6137120
133985	159	6137350 Сургут,АМСГ            17	6137350
133986	159	6138010 Ларьяк                 17	6138010
133987	159	6143090 Валаам                 03	6143090
133988	159	6143470 Ладва                  03	6143470
133989	159	6144951 Детрин                 33	6144951
133990	159	6145750 Тулпан                 09	6145750
133991	159	6146360 Советский              17	6146360
133992	159	6152921 Покровск               24	6152921
133993	159	6153900 Каргополь              01	6153900
133994	159	6155671 Пестрая Дресва         33	6155671
133995	159	6161461 Дорожный               24	6161461
133996	159	6163240 Палалахта              03	6163240
133997	159	6164590 Красноборск,АМСГ       01	6164590
133998	159	6164970 Ледья Кость            01	6164970
133999	159	6165490 Усть-Нем               01	6165490
134000	159	6169020 Бор                    21	6169020
134001	159	6170271 Стрелка Чуня           21	6170271
134002	159	6173070 Сортавала              03	6173070
134003	159	6173360 Пряжа                  03	6173360
134004	159	6174020 Няндома                01	6174020
134005	159	6175080 Нижний Чов,АГРО        01	6175080
134006	159	6175090 Сыктывкар              01	6175090
134007	159	6175370 Усть-Кулом             01	6175370
134008	159	6177070 Горшково               17	6177070
134009	159	6179640 Байкит                 21	6179640
134010	159	6183440 Петрозаводск           03	6183440
134011	159	6183450 Петрозаводск           03	6183450
134012	159	6183520 Маячный                03	6183520
134013	159	6183570 Василисин,ос.          03	6183570
134014	159	6183610 Теребовская            03	6183610
134015	159	6183660 Пудож,АМСГ             03	6183660
134016	159	6183780 Колодозеро             03	6183780
134017	159	6184771 Колымская,стоковая ниж 33	6184771
134018	159	6184830 Слободчиково           01	6184830
134019	159	6185690 Якша                   01	6185690
134020	159	6185790 Усть-Унья              01	6185790
134021	159	6187410 Ермаково               17	6187410
134022	159	6188220 Корлики                17	6188220
134023	159	6189340 Перевалочная база      21	6189340
134024	159	6190961 Чона                   24	6190961
134025	159	6192461 Тонгулах               24	6192461
134026	159	6193551 Охотский Перевоз       24	6193551
134027	159	6194741 Кулу(Нерючи)           33	6194741
134028	159	6194761 Колымская,стоковая вер 33	6194761
134029	159	6195221 Стрелка                33	6195221
134030	159	6195891 Наяхан                 33	6195891
134031	159	6195921 Эвенск                 33	6195921
134032	159	6196041 Гижига(Кушка)          33	6196041
134033	159	6196430 Хангокурт              17	6196430
134034	159	6196480 Пантынг                17	6196480
134035	159	6196490 Вонъеган               17	6196490
134036	159	6197660 Новоаганск             17	6197660
134037	159	6202971 Якутск                 24	6202971
134038	159	6203261 Чурапча                24	6203261
134039	159	6205041 Синегорье              33	6205041
134040	159	6206640 Сосновый,мыс           17	6206640
134041	159	6207690 Вар-Еган               17	6207690
134042	159	6209470 Полигус                21	6209470
134043	159	6212951 Маган                  24	6212951
134044	159	6213240 Суоярви                03	6213240
134045	159	6213930 Конево                 01	6213930
134046	159	6214290 Шенкурск               01	6214290
134047	159	6214851 Оротук                 33	6214851
134048	159	6214951 Джека Лондона,озеро    33	6214951
134049	159	6215071 Бохапча                33	6215071
134050	159	6217521 Хатырка                38	6217521
134051	159	6217730 Радужный               17	6217730
134052	159	6220821 Хамакар                22	6220821
134053	159	6221771 Сунтар                 24	6221771
134054	159	6223070 Вяртсиля               03	6223070
134055	159	6223430 Кондопога              03	6223430
134056	159	6223690 Куганаволок            03	6223690
134057	159	6224500 Верхняя Тойма,АМСГ     01	6224500
134058	159	6224910 Яренск                 01	6224910
134059	159	6225040 Усть-Вымь              01	6225040
134060	159	6225250 Лунь                   01	6225250
134061	159	6225420 Помоздино              01	6225420
134062	159	6227450 Когалым                17	6227450
134063	159	6231621 Крестях                24	6231621
134064	159	6231991 Чаингда                24	6231991
134065	159	6232711 Бердигестях            24	6232711
134066	159	6233390 Кивач                  03	6233390
134067	159	6239210 Кузьмовка              21	6239210
134068	159	6243361 Ытык-Кель,АМСГ         24	6243361
134069	159	6246090 Няксимволь             17	6246090
134070	159	6247310 Кочевые                17	6247310
134071	159	6247911 Бухта Гавриила         38	6247911
134072	159	6251131 Туой-Хая               24	6251131
134073	159	6251391 Мирный,АМСГ            24	6251391
134074	159	6253921 Нежданинский           24	6253921
134075	159	6254971 Ягодный                33	6254971
134076	159	6255231 Средникан              33	6255231
134077	159	6255530 Зеленец                01	6255530
134078	159	6255571 Омсукчан,сопка         33	6255571
134079	159	6255581 Омсукчан               33	6255581
134080	159	6256610 Октябрьское            17	6256610
134081	159	6256621 Каменское              27	6256621
134082	159	6258630 Келлог                 21	6258630
134083	159	6258900 Бахта                  21	6258900
134084	159	6263510 Бор-Пуданцев           03	6263510
134085	159	6263561 Хандыга                24	6263561
134086	159	6264081 Сунтар-Хаята,в-ч       24	6264081
134087	159	6265080 Емва                   01	6265080
134088	159	6266241 Верхний Парень         33	6266241
134089	159	6270111 Кербо                  21	6270111
134090	159	6272971 Намцы                  24	6272971
134091	159	6273121 Борогонцы              24	6273121
134092	159	6273270 Поросозеро             03	6273270
134093	159	6275001 Хатыннах               33	6275001
134094	159	6275251 Сеймчан,верхний        33	6275251
134095	159	6275620 Троицко-Печорское      01	6275620
134096	159	6277170 Нижнесортымск          17	6277170
134097	159	6283441 Крест-Хальджай         24	6283441
134098	159	6283691 Теплый Ключ,АМСГ       24	6283691
134099	159	6284811 Сусуман(Берелех)       33	6284811
134100	159	6285071 Эльген,совхоз          33	6285071
134101	159	6290841 Наканно,АМСГ           22	6290841
134102	159	6293440 Медвежьегорск          03	6293440
134103	159	6293580 Данилово               03	6293580
134104	159	6294101 Нижняя База            24	6294101
134105	159	6294270 Двинской Березник      01	6294270
134106	159	6294660 Окуловская             01	6294660
134107	159	6294970 Лоптюга                01	6294970
134108	159	6295090 Весляна                01	6295090
134109	159	6295241 Сеймчан                33	6295241
134110	159	6301231 Чернышевский           24	6301231
134111	159	6305450 Изваиль                01	6305450
134112	159	6307931 Беринговская           38	6307931
134113	159	6313831 Западная               24	6313831
134114	159	6313920 Турчасово              01	6313920
134115	159	6314040 Емца                   01	6314040
134116	159	6317530 Ноябрьск               17	6317530
134117	159	6321361 Сюльдюкар              24	6321361
134118	159	6323961 Восточная              24	6323961
134119	159	6324691 Аркагала               33	6324691
134120	159	6325260 Месью                  01	6325260
134121	159	6326460 Игрим,АМСГ             17	6326460
134122	159	6326791 Слаутное               27	6326791
134123	159	6328800 Верхнеимбатск          21	6328800
134124	159	6331831 Нюрба                  24	6331831
134125	159	6333201 Верхоянский перевоз    24	6333201
134126	159	6333340 Паданы                 03	6333340
134127	159	6333670 Калгачиха              01	6333670
134128	159	6334171 Агаякан                24	6334171
134129	159	6334321 Оймякон                24	6334321
134130	159	6335141 Каньон                 33	6335141
134131	159	6335851 Лабазная               33	6335851
134132	159	6346310 Сартынья               17	6346310
134133	159	6347271 Березово               38	6347271
134134	159	6347830 Халесовая              17	6347830
134135	159	6352031 Верхневилюйск,АМСГ     24	6352031
134136	159	6352941 Батамай                24	6352941
134137	159	6354180 Емецк                  01	6354180
134138	159	6354651 Ламут                  33	6354651
134139	159	6354701 Ламут                  33	6354701
134140	159	6354790 Вендига                01	6354790
134141	159	6354890 Кослан,АМСГ            01	6354890
134142	159	6357140 Нумто                  17	6357140
134143	159	6360391 Кислокан               21	6360391
134144	159	6364560 Сура                   01	6364560
134145	159	6365380 Ухта                   01	6365380
134146	159	6373430 Сегежа                 03	6373430
134147	159	6375180 Шомвуква               01	6375180
134148	159	6376190 Сосьва                 17	6376190
134149	159	6376720 Казым                  17	6376720
134150	159	6376960 Юильск                 17	6376960
134151	159	6382161 Вилюйск                24	6382161
134152	159	6383080 Реболы                 03	6383080
134153	159	6384070 Холмогорская           01	6384070
134154	159	6384561 Делянкир               24	6384561
134155	159	6385670 Дутово,АМСГ            01	6385670
134156	159	6385730 Вуктыл                 01	6385730
134157	159	6389650 Учами                  21	6389650
134158	159	6392291 Кызыл-Сыр              24	6392291
134159	159	6392491 Хатырык-Хомо           24	6392491
134160	159	6392751 Сангары,АМСГ           24	6392751
134161	159	6393530 Воренжа                03	6393530
134162	159	6393591 Томпо                  24	6393591
134163	159	6393810 Онега                  01	6393810
134164	159	6394311 Малый Тарын            24	6394311
134165	159	6395411 Балыгычан              33	6395411
134166	159	6396510 Березово               17	6396510
134167	159	6398210 Толька                 17	6398210
134168	159	6403031 Сеген-Кюель            24	6403031
134169	159	6404191 Юрты                   24	6404191
134170	159	6404450 Карпогоры,АМСГ         01	6404450
134171	159	6405891 Кедон                  33	6405891
134172	159	6413280 Ругозеро               03	6413280
134173	159	6414801 Дарпир                 33	6414801
134174	159	6415940 Верхний Щугор          01	6415940
134175	159	6421691 Чумпурук               24	6421691
134176	159	6423590 Колежма                03	6423590
134177	159	6424170 Холмогоры              01	6424170
134178	159	6425360 Кедва-Вом              01	6425360
134179	159	6426421 Верхне-Пенжино         27	6426421
134180	159	6427621 Яранги                 38	6427621
134181	159	6428750 Верещагино             21	6428750
134182	159	6429380 Тутончаны              21	6429380
134183	159	6430021 Тура                   21	6430021
134184	159	6430031 Тура                   21	6430031
134185	159	6432641 Сого-Хая               24	6432641
134186	159	6435760 Усть-Щугор             01	6435760
134187	159	6436090 Саранпауль             17	6436090
134188	159	6436111 Кегали                 33	6436111
134189	159	6437810 Харампур               17	6437810
134190	159	6443710 Лямца                  01	6443710
134191	159	6444201 Маршальский пр         24	6444201
134192	159	6445520 Ираель                 01	6445520
134193	159	6445731 Кольцевая              33	6445731
134194	159	6447223 Мыс Чаплина            38	6447223
134195	159	6447323 Бухта Провидения       38	6447323
134196	159	6449310 Кочумдек               21	6449310
134197	159	6452051 Угулятцы               24	6452051
134198	159	6454171 Эльги                  24	6454171
134199	159	6454441 Нера,АМСГ              24	6454441
134200	159	6455540 Ираель                 01	6455540
134201	159	6459110 Ногинск                21	6459110
134202	159	6461251 Хабардино              24	6461251
134203	159	6463490 Разнаволок             01	6463490
134204	159	6463980 Северодвинск           01	6463980
134205	159	6464050 Архангельск            01	6464050
134206	159	6465970 Неройка                01	6465970
134207	159	6473210 Юшкозеро               03	6473210
134208	159	6473560 Жужмуй                 01	6473560
134209	159	6474340 Пинега                 01	6474340
134210	159	6476560 Казымский,мыс          17	6476560
134211	159	6477041 Марково                38	6477041
134212	159	6483840 Унский маяк            01	6483840
134213	159	6484770 Койнас                 01	6484770
134214	159	6485110 Левкинская             01	6485110
134215	159	6485371 Коркодон(Столбовое)    33	6485371
134216	159	6487761 Анадырь                38	6487761
134217	159	6494030 Мудьюг остров          01	6494030
134218	159	6494580 Лешуконское,АМСГ       01	6494580
134219	159	6497100 Лонгъюган              17	6497100
134220	159	6497441 Танюрер                38	6497441
134221	159	6497780 Тарко-Сале             17	6497780
134222	159	6499890 Тембенчи               21	6499890
134223	159	6503071 Сюрен-Кюель            24	6503071
134224	159	6503480 Кемь-порт              01	6503480
134225	159	6503570 Соловки                01	6503570
134226	159	6505390 Ижма                   01	6505390
134227	159	6513310 Шомба                  03	6513310
134228	159	6515710 Печора                 01	6515710
134229	159	6523120 Калевала               03	6523120
134230	159	6523680 Жижгин,остров          01	6523680
134231	159	6524321 Предпорожная           24	6524321
134232	159	6524960 Борковская             01	6524960
134233	159	6526051 Омолон                 38	6526051
134234	159	6526801 Чуванское              38	6526801
134235	159	6527681 Канчалан               38	6527681
134236	159	6528780 Сухая Тунгуска         21	6528780
134237	159	6532411 Бестях,звероферма      24	6532411
134238	159	6533581 Иэма                   24	6533581
134239	159	6536871 Еропол                 38	6536871
134240	159	6544190 Кепино                 01	6544190
134241	159	6546470 Мужи                   17	6546470
134242	159	6553970 Зимнегорский маяк      01	6553970
134243	159	6555220 Усть-Цильма            01	6555220
134244	159	6557250 Надым                  17	6557250
134245	159	6557291 Снежное                38	6557291
134246	159	6567113 Лаврентия              38	6567113
134247	159	6567270 Надым                  17	6567270
134248	159	6569010 Большой Порог          21	6569010
134249	159	6575091 Зырянка                24	6575091
134250	159	6575960 Кожим рудник           01	6575960
134251	159	6576241 Уточан                 38	6576241
134252	159	6578240 Красноселькупск        17	6578240
134253	159	6583390 Энгозеро               03	6583390
134254	159	6584630 Мосеево                01	6584630
134255	159	6586903 Ратманова,остров       38	6586903
134256	159	6586913 Ратманова,остров       38	6586913
134257	159	6587450 Пангоды                17	6587450
134258	159	6588790 Туруханск              21	6588790
134259	159	6588800 Туруханск,ГМО          21	6588800
134260	159	6591141 Айхал                  24	6591141
134261	159	6591151 Айхал                  24	6591151
134262	159	6593180 Кестеньга              03	6593180
134263	159	6593480 Гридино                01	6593480
134264	159	6594070 Инцы                   01	6594070
134265	159	6594420 Мезень                 01	6594420
134266	159	6595520 Мутный Материк         01	6595520
134267	159	6596590 Питляр                 17	6596590
134268	159	6598430 Янов Стан              21	6598430
134269	159	6601741 Эйк                    24	6601741
134270	159	6605690 Усть-Уса               01	6605690
134271	159	6605740 Усинск                 01	6605740
134272	159	6605750 Усинск                 01	6605750
134273	159	6606010 Инта,АМСГ              01	6606010
134274	159	6606020 Инта,АМСГ              01	6606020
134275	159	6606870 Полуй                  17	6606870
134276	159	6607840 Уренгой                17	6607840
134277	159	6613290 Лоухи                  03	6613290
134278	159	6613780 Чаваньга               02	6613780
134279	159	6617680 Новый Уренгой          17	6617680
134280	159	6618210 Таз                    17	6618210
134281	159	6623110 Зашеек                 03	6623110
134282	159	6623950 Пялица                 02	6623950
134283	159	6624410 Семжа                  01	6624410
134284	159	6627023 Уэлен                  38	6627023
134285	159	6631431 Шелагонцы              24	6631431
134286	159	6633600 Кашкаранцы             02	6633600
134287	159	6633610 Кашкаранцы             02	6633610
134288	159	6635260 Окунев Нос             01	6635260
134289	159	6637923 Эгвекинот              38	6637923
134290	159	6641261 Далдын                 24	6641261
134291	159	6644330 Абрамовский Маяк       01	6644330
134292	159	6644991 Арылах                 24	6644991
134293	159	6646080 Петрунь                01	6646080
134294	159	6647331 Эньмувеем              38	6647331
134295	159	6654070 Сосновец,остров        01	6654070
134296	159	6654321 Усть-Мома              24	6654321
134297	159	6656431 Баимка                 38	6656431
134298	159	6656660 Салехард               17	6656660
134299	159	6656670 Салехард               17	6656670
134300	159	6658720 Курейка                21	6658720
134301	159	6664470 Несь                   01	6664470
134302	159	6664590 Вижас                  01	6664590
134303	159	6665680 Колва                  01	6665680
134304	159	6665930 Адзьва-Вом             01	6665930
134305	159	6665941 Усть-Олой              38	6665941
134306	159	6667290 Ныда                   17	6667290
134307	159	6668230 Сидоровск              17	6668230
134308	159	6671241 Полярный               24	6671241
134309	159	6673140 Зареченск              02	6673140
134310	159	6673290 Ковда                  02	6673290
134311	159	6673430 Умба                   02	6673430
134312	159	6673810 Слюдянка               02	6673810
134313	159	6674250 Моржовец               01	6674250
134314	159	6676260 Сивая Маска            01	6676260
134315	159	6682341 Жиганск                24	6682341
134316	159	6683161 Екючю                  24	6683161
134317	159	6683671 Усть-Чаркы             24	6683671
134318	159	6684780 Нижняя Пеша            01	6684780
134319	159	6686880 Салемал                01	6686880
134320	159	6686920 Салемал                01	6686920
134321	159	6687080 Яр-Сале                01	6687080
134322	159	6688380 Советская Речка        21	6688380
134323	159	6693040 Алакуртти              02	6693040
134324	159	6695570 Мишвань                01	6695570
134325	159	6696570 Ра-Из                  17	6696570
134326	159	6697090 Яр-Сале                01	6697090
134327	159	6698840 Светлогорск            21	6698840
134328	159	6699350 Агата                  21	6699350
134329	159	6705120 Коткино                01	6705120
134330	159	6706510 Полярный Урал          01	6706510
134331	159	6707193 Мыс Нэттэн             38	6707193
134332	159	6707893 Амгуэма,87 км          38	6707893
134333	159	6710851 Ярольин                24	6710851
134334	159	6712621 Собопол                24	6712621
134335	159	6713240 Кандалакша             02	6713240
134336	159	6713420 Канозеро               02	6713420
134337	159	6713970 Каневка                02	6713970
134338	159	6715940 Хоседа-Хард            01	6715940
134339	159	6716410 Елецкая                01	6716410
134340	159	6724140 Терско-Орловский       02	6724140
134341	159	6724390 Конушин,мыс            01	6724390
134342	159	6726801 Илирней                38	6726801
134343	159	6735911 Мандриково             38	6735911
134344	159	6736370 Хановей                01	6736370
134345	159	6736821 Илирней                38	6736821
134346	159	6743260 Зашеек                 02	6743260
134347	159	6743710 Краснощелье            02	6743710
134348	159	6745800 Хорей-Вер              01	6745800
134349	159	6753380 Центральная            02	6753380
134350	159	6755371 Среднеколымск          24	6755371
134351	159	6756400 Воркута                01	6756400
134352	159	6757463 О.Колючин              38	6757463
134353	159	6757870 Тазовск                17	6757870
134354	159	6758660 Игарка                 21	6758660
134355	159	6758780 Горбиачин              21	6758780
134356	159	6763040 Ковдор                 02	6763040
134357	159	6763120 Ена                    02	6763120
134358	159	6763340 Апатиты                02	6763340
134359	159	6763341 Верхоянск              24	6763341
134360	159	6763350 Кировск                02	6763350
134361	159	6763360 Кировск                02	6763360
134362	159	6763370 Кировск,АМСГ           02	6763370
134363	159	6763400 Коашва                 02	6763400
134364	159	6763711 Улахан-Кюель           24	6763711
134365	159	6765520 Шапкино                01	6765520
134366	159	6766610 Большая Хадата         17	6766610
134367	159	6771641 Маак                   24	6771641
134368	159	6773330 Хибины                 02	6773330
134369	159	6773370 Новый Рудник           02	6773370
134370	159	6773380 Юкспор                 02	6773380
134371	159	6773471 Батагай                24	6773471
134372	159	6774870 Индига                 01	6774870
134373	159	6774880 Индига                 01	6774880
134374	159	6775300 Нарьян-Мар             01	6775300
134375	159	6775310 Нарьян-Мар             01	6775310
134376	159	6777290 Новый Порт             01	6777290
134377	159	6777300 Новый Порт             01	6777300
134378	159	6777833 Амгуэма                38	6777833
134379	159	6783041 Батагай-Алыта          24	6783041
134380	159	6784670 Мыс Микулкин           01	6784670
134381	159	6786611 Капервеем              38	6786611
134382	159	6787583 Мыс Ванкарем           38	6787583
134383	159	6792331 Мянгкяра               24	6792331
134384	159	6793290 Мончегорск             02	6793290
134385	159	6793690 Колмъявр               02	6793690
134386	159	6794410 Шойна                  01	6794410
134387	159	6796480 Хальмер-Ю              01	6796480
134388	159	6797873 Иультин                38	6797873
134389	159	6803290 Мончегорск             02	6803290
134390	159	6803500 Ловозеро               02	6803500
134391	159	6803510 Ловозеро               02	6803510
134392	159	6803690 Колмъявр               02	6803690
134393	159	6806661 Билибино               38	6806661
134394	159	6813950 Йоканьга               02	6813950
134395	159	6816421 Островное              38	6816421
134396	159	6818770 Снежногорск            21	6818770
134397	159	6823980 Святой Нос             02	6823980
134398	159	6824541 Дружина                24	6824541
134399	159	6826121 Константиновская       38	6826121
134400	159	6833840 Губа Дроздовка         02	6833840
134401	159	6835450 Мыс Болванский         01	6835450
134402	159	6843070 Ниванкюль              02	6843070
134403	159	6843330 Пулозеро               02	6843330
134404	159	6843870 Черный,мыс             02	6843870
134405	159	6845080 Сенгейский Шар         01	6845080
134406	159	6848930 Исток                  21	6848930
134407	159	6850241 Ессей                  21	6850241
134408	159	6851241 Оленек                 24	6851241
134409	159	6852890 Верховье р.Лотты       02	6852890
134410	159	6853481 Янск                   24	6853481
134411	159	6853530 Воронин Погост         02	6853530
134412	159	6854621 Белая Гора             24	6854621
134413	159	6856831 Бараниха               38	6856831
134414	159	6857360 Каменный               01	6857360
134415	159	6861831 Сухана                 24	6861831
134416	159	6863180 Падун                  02	6863180
134417	159	6865230 Табседа                01	6865230
134418	159	6865550 Мыс Константиновский   01	6865550
134419	159	6872401 Джарджан               24	6872401
134420	159	6874330 Канин Нос              01	6874330
134421	159	6875871 Колымская              24	6875871
134422	159	6878630 Потапово               21	6878630
134423	159	6882661 Верхний Джарджан       24	6882661
134424	159	6883740 О.Харлов               02	6883740
134425	159	6884930 Бугрино                01	6884930
134426	159	6885800 Варандей               01	6885800
134427	159	6886121 Черский                24	6886121
134428	159	6886131 Черский                24	6886131
134429	159	6886140 Коротаиха              01	6886140
134430	159	6892850 Кайтакоски             02	6892850
134431	159	6892880 Янискоски              02	6892880
134432	159	6893300 Кола                   02	6893300
134433	159	6893560 Туманная               02	6893560
134434	159	6895380 Ходовариха             01	6895380
134435	159	6897081 Чаун                   38	6897081
134436	159	6897943 Мыс Шмидта             38	6897943
134437	159	6897953 Мыс Шмидта             38	6897953
134438	159	6902880 Янискоски              02	6902880
134439	159	6903310 Мурманск               02	6903310
134440	159	6907371 Майская                38	6907371
134441	159	6913610 Дальне-Зеленецкая      02	6913610
134442	159	6915451 Андрюшкино             24	6915451
134443	159	6917690 Антипаюта              01	6917690
134444	159	6918220 Мессояха               21	6918220
134445	159	6923140 Перевал                02	6923140
134446	159	6923350 Полярное               02	6923350
134447	159	6923510 Териберка              02	6923510
134448	159	6924741 Ожогино                24	6924741
134449	159	6925451 Андрюшкино             24	6925451
134450	159	6926450 Усть-Кара              01	6926450
134451	159	6927871 Полярная               38	6927871
134452	159	6927881 Полярная               38	6927881
134453	159	6928230 Мессояха               21	6928230
134454	159	6933280 Ура-Губа               02	6933280
134455	159	6933971 Депутатский            24	6933971
134456	159	6936450 Усть-Кара              01	6936450
134457	159	6938780 Надежда                21	6938780
134458	159	6938790 Надежда                21	6938790
134459	159	6938830 Норильск (Тайм.ЦГМС)   21	6938830
134460	159	6943020 Никель                 02	6943020
134461	159	6948610 Дудинка                21	6948610
134462	159	6948750 Алыкель,АМСГ           21	6948750
134463	159	6953221 Намы                   24	6953221
134464	159	6954910 Колгуев,северный       01	6954910
134465	159	6956661 Раучуа                 38	6956661
134466	159	6958840 Кыллах-Кюель           21	6958840
134467	159	6963240 Пикшуев,мыс            02	6963240
134468	159	6964751 Воронцово              24	6964751
134469	159	6966020 Белый Нос              01	6966020
134470	159	6966231 Б.Амбарчик             38	6966231
134471	159	6967201 Красноармейский        38	6967201
134472	159	6967211 Красноармейский        38	6967211
134473	159	6968430 Тухард                 21	6968430
134474	159	6973140 Печенга                02	6973140
134475	159	6973310 Цып-Наволок            02	6973310
134476	159	6976680 Марресаля,мыс          01	6976680
134477	159	6977031 Певек                  38	6977031
134478	159	6977051 Приемная               38	6977051
134479	159	6982821 Саханджа               24	6982821
134480	159	6983521 Джангкы                24	6983521
134481	159	6986170 Амдерма                01	6986170
134482	159	6987061 Певек,АМСГ             38	6987061
134483	159	6992511 Сектях                 24	6992511
134484	159	6993200 Вайда-Губа             02	6993200
134485	159	6996801 О.Айон                 38	6996801
134486	159	6997581 Мыс Биллингса          38	6997581
134487	159	7003571 Куйга                  24	7003571
134488	159	7011391 Джалинда               24	7011391
134489	159	7017081 Валькаркай             38	7017081
134490	159	7018320 Караул                 21	7018320
134491	159	7027260 Сеяха                  01	7027260
134492	159	7045910 Им.Е.К.Федорова        01	7045910
134493	159	7047410 Тадебяяха              01	7047410
134494	159	7063431 Кулар                  24	7063431
134495	159	7064791 Чокурдах               24	7064791
134496	159	7066241 О.Четырехстолбовой     24	7066241
134497	159	7072741 Кюсюр                  24	7072741
134498	159	7075401 Алазея                 24	7075401
134499	159	7075760 Мыс Меньшикова         01	7075760
134500	159	7083081 Найба                  24	7083081
134501	159	7083611 Юбилейная              24	7083611
134502	159	7083621 Юбилейная              24	7083621
134503	159	7085371 Алазея                 24	7085371
134504	159	7097850 Гыдо-Ямо               17	7097850
134505	159	7097933 Бухта Сомнительная     38	7097933
134506	159	7098990 Кресты Таймыр.         21	7098990
134507	159	7107863 О.Врангеля             38	7107863
134508	159	7109450 Волочанка              21	7109450
134509	159	7116680 Харасавэй,мыс          01	7116680
134510	159	7125031 Индигирская            24	7125031
134511	159	7146760 Моржовая               01	7146760
134512	159	7153671 Нижнеянск              24	7153671
134513	159	7157180 Тамбей                 01	7157180
134514	159	7162891 Тикси,бухта            24	7162891
134515	159	7163001 О.Муостах              24	7163001
134516	159	7191411 Саскылах               24	7191411
134517	159	7192351 Тюмети                 24	7192351
134518	159	7192361 Тюмети                 24	7192361
134519	159	7198270 Сопочная Карга         01	7198270
134520	159	7200251 Хатанга                01	7200251
134521	159	7203281 Буор-Хая,мыс           24	7203281
134522	159	7207430 Им.60-летия ВЛКСМ      01	7207430
134523	159	7237960 Лескина                01	7237960
134524	159	7242631 Столб(Им.Хабарова)     24	7242631
134525	159	7242641 Столб(Им.Хабарова)     24	7242641
134526	159	7245270 Малые Кармакулы        01	7245270
134527	159	7247280 Мыс Дровяной           01	7247280
134528	159	7256890 Пайндтэ                01	7256890
134529	159	7262211 Таймылыр               24	7262211
134530	159	7284071 Святой Нос,мыс         24	7284071
134531	159	7301991 Усть-Оленек            24	7301991
134532	159	7302171 Олимпийская            24	7302171
134533	159	7318050 Срза М-203             01	7318050
134534	159	7321351 Анабар                 24	7321351
134535	159	7322881 Сагыллах-Ары           24	7322881
134536	159	7324321 Мыс Шалаурова          24	7324321
134537	159	7324391 Мыс Шалаурова          24	7324391
134538	159	7328970 Усть-Тарея             01	7328970
134539	159	7333991 Мыс Кигилях            24	7333991
134540	159	7337000 Им.Попова              01	7337000
134541	159	7343991 Мыс Кигилях            24	7343991
134542	159	7351871 Мыс Тэрпяй Тумса       24	7351871
134543	159	7357580 О.Вилькицкого          01	7357580
134544	159	7358040 О.Диксон               01	7358040
134545	159	7358600 Пясина                 01	7358600
134546	159	7361871 Мыс Тэрпяй Тумса       24	7361871
134547	159	7370971 Косистый,мыс           01	7370971
134548	159	7392451 Дунай                  24	7392451
134549	159	7413541 Столбовой,ос.          24	7413541
134550	159	7460141 Таймыр,озеро           01	7460141
134551	159	7471291 О.Преображения         21	7471291
134552	159	7473891 Пролив Санникова       24	7473891
134553	159	7494211 Земля Бунге            24	7494211
134554	159	7548890 Мыс Стерлегова         01	7548890
134555	159	7551341 Бухта М.Прончищевой    21	7551341
134556	159	7598310 О-ва Известий ЦИК      01	7598310
134557	159	7603791 О.Котельный            24	7603791
134558	159	7625281 Остров Жохов           24	7625281
134559	159	7626360 Русская Гавань         01	7626360
134560	159	7639480 О.Правды               01	7639480
134561	159	7681041 Андрея                 21	7681041
134562	159	7706860 Мыс Желания            01	7706860
134563	159	7718920 О.Исаченко             01	7718920
134564	159	7729640 Русский                01	7729640
134565	159	7758220 О.Уединения            01	7758220
134566	159	7760151 О-ва Гейберга          01	7760151
134567	159	7770431 Им.Е.К.Федорова        01	7770431
134568	159	7810681 О.Малый Таймыр         01	7810681
134569	159	7811430 Баренцбург             02	7811430
134570	159	7820331 Бухта Солнечная        01	7820331
134571	159	7869870 Краснофлотские,о-ва    01	7869870
134572	159	7940251 Мыс Песчаный           01	7940251
134573	159	7957700 О.Визе                 01	7957700
134574	159	7969060 О.Голомянный           01	7969060
134575	159	8023680 О.Виктория             01	8023680
134576	159	8035280 Бухта Тихая            01	8035280
134577	159	8065800 Им.Э.Т.Кренкеля,ГМО    01	8065800
134578	159	8084760 Нагурская              01	8084760
134579	159	8087960 О.Ушакова              01	8087960
134580	159	8185800 О.Рудольфа             01	8185800
\.


--
-- Data for Name: timeaql; Type: TABLE DATA; Schema: public; Owner: aisori
--

COPY public.timeaql (aliasid, leafid, aqlid) FROM stdin;
2	476	2433
2	477	2434
2	478	2435
2	479	2436
2	480	2437
2	481	2438
2	482	2439
2	483	2440
2	484	2441
2	485	2442
2	486	2443
2	487	2444
2	488	2445
2	489	2446
2	490	2447
2	491	2448
2	492	2449
3	493	2450
3	494	2451
3	495	2452
3	495	2453
3	495	2454
3	495	2455
3	496	2456
3	497	2457
3	497	2458
3	497	2459
3	497	2460
3	498	2461
3	499	2462
3	500	2463
3	501	2464
3	501	2465
3	501	2466
3	501	2467
3	501	2468
3	501	2469
3	501	2470
3	501	2471
3	501	2472
3	501	2473
3	501	2474
3	501	2475
3	501	2476
3	501	2477
3	501	2478
3	501	2479
3	501	2480
3	502	2481
3	502	2482
3	502	2483
3	502	2484
3	502	2485
3	502	2486
3	502	2487
3	502	2488
3	502	2489
3	502	2490
3	502	2491
3	502	2492
3	502	2493
3	502	2494
3	502	2495
3	502	2496
3	502	2497
3	503	2498
3	503	2499
3	503	2500
3	503	2501
3	503	2502
3	503	2503
3	503	2504
3	503	2505
3	503	2506
3	503	2507
3	503	2508
3	503	2509
3	503	2510
3	503	2511
3	503	2512
3	503	2513
3	503	2514
3	503	2515
3	503	2516
3	503	2517
3	504	2518
3	504	2519
3	504	2520
3	504	2521
3	504	2522
3	504	2523
3	504	2524
3	504	2525
3	504	2526
3	504	2527
3	505	2528
3	505	2529
3	505	2530
3	505	2531
3	505	2532
3	505	2533
3	505	2534
3	505	2535
3	505	2536
3	505	2537
3	505	2538
3	505	2539
3	505	2540
3	505	2541
3	505	2542
3	505	2543
3	505	2544
3	505	2545
3	505	2546
3	505	2547
\.


--
-- Data for Name: timeleafs; Type: TABLE DATA; Schema: public; Owner: aisori
--

COPY public.timeleafs (aliasid, leafid, timeid, fullname, tfamily, prefix, pathdat, keyfrm, fnamefrm, stfileid, allzipname, zipsize) FROM stdin;
3	493	1	ВОСХОД  - 8-срочные данные, 1966-76 гг.	Voshod	vosh	..\\..\\drive_f\\BDM\\Vosh_n\\DAT\\	ffflllq	Tqffflll.2	159	\N	\N
3	494	1	СУТ77   - суточные данные, 1977-83 гг.	SUT77	sut77	..\\..\\drive_f\\BDM\\Sutki77_n\\DAT\\	ffflllq	Dqffflll.3	159	\N	\N
3	495	1	ТМСС - суточные обобщения с 1984 г.	TMSS	tmss	..\\..\\drive_f\\BDM\\TMSS_n\\DAT\\	ffflllq	Sqffflll.4	159	\N	\N
3	496	1	ТМ1_SR  - 4-срочные данные до 1965 г.	TM1_SR65	sr65	..\\..\\drive_f\\BDM\\TM1sr_n\\DAT\\	ffflllq	Tqffflll.1	159	\N	\N
3	497	1	ТМСС - суточные обобщения 2018 г.	TMSS	tmss	..\\..\\drive_f\\BDM\\TMSS_18\\DAT\\	ffflllq	Sqffflll.4	159	\N	\N
3	498	1	TM1_SU  - суточные данные до 1965 г.	TM1_SU	su65	..\\..\\drive_f\\BDM\\TM1su_0\\DAT\\	ffflllq	Dqffflll.1	159	\N	\N
3	499	1	ТМ0_SR  - 3-срочные данные до 1935 г.	TM1_SR	srTm0	..\\..\\drive_f\\BDM\\TM0sr_n\\DAT\\	ffflllq	Tqffflll.0	159	\N	\N
3	500	1	СУТ66   - суточные данные, 1966-76 гг.	SUT66	sut66	..\\..\\drive_f\\BDM\\Sutki66_n\\DAT\\	ffflllq	Dqffflll.2	159	\N	\N
3	501	1	ТМС - наблюдения на станциях с 1984 г.	TMS	tms	..\\..\\drive_f\\BDM\\TMS_n\\DAT\\	ffflllq	Iqffflll.4	159	\N	\N
3	502	1	ТМС - наблюдения на станциях 2018 г.	TMS	tms	..\\..\\drive_f\\BDM\\TMS_18\\DAT\\	ffflllq	Iqffflll.4	159	\N	\N
3	503	1	ТМСМ - месячные наблюд. на станциях с 1984 г.	TMSM	tmsM	..\\..\\drive_f\\BDM\\TMSM_n\\DAT\\	ffflllq	Mqffflll.4	159	\N	\N
3	504	1	ТММ1 - наблюдения на станциях 1977-1984 гг.	TMM1_NEW	tmmn	..\\..\\drive_f\\BDM\\TMM1_n\\DAT\\	ffflllq	Iqffflll.3	159	\N	\N
3	505	1	ТМСМ - месячные наблюдения 2018 г.	TMSM	tmsM	..\\..\\drive_f\\BDM\\TMSM_18\\DAT\\	ffflllq	Mqffflll.4	159	\N	\N
2	478	2	t-почвы(по коленч.терм.Савинова) Tpgks	TPGKS	Tpgks	..\\WEB\\CLIM\\TPGKS\\	\N	\N	152	Tpgks.zip	16.4 MB
2	479	2	TPG - Температура почвы на глубинах	TPG	Tpg	..\\WEB\\CLIM\\TPG\\	\N	\N	149	Tpg.zip	64.2 MB
2	483	3	Температура воздуха	SY_M5_1	Sym	..\\WEB\\CLIM\\TABS\\T_mes.tab	\N	\N	156	T_mes.zip	1.1 MB
2	485	3	Атмосферное давление на уровне станции	SY_M6_1	Sym6	..\\WEB\\CLIM\\TABS\\Ps_mes.tab	\N	\N	156	PS_mes.zip	0.75 MB
2	486	3	Упругость водяного пара	SY_M5_1	Sym	..\\WEB\\CLIM\\TABS\\E_mes.tab	\N	\N	156	E_mes.zip	0.83 MB
2	487	3	Cуммы осадков,с устраненными погрешностями	Summesc	Summ	..\\Web\\CLIM\\Summesc\\	\N	\N	155	Summesc.zip	4.5 MB
2	490	3	Продолжительность солнечного сияния	SY_M5	Sym5	..\\WEB\\CLIM\\TABS\\Pss_mes.tab	\N	\N	157	Pss_mes.zip	0.52 MB
2	492	3	Атмосферные осадки	SY_M5_1	Sym	..\\WEB\\CLIM\\TABS\\R_mes.tab	\N	\N	156	R_mes.zip	0.7 MB
2	488	3	Атмосферное давление на уровне моря	SY_M6_1	Sym6_1	..\\WEB\\CLIM\\TABS\\Pm_mes.tab	\N	\N	153	PM_mes.zip	0.71 MB
2	484	3	Число дней с осадками => 1 мм	SY_M5_2	Sym5_2	..\\WEB\\CLIM\\TABS\\ND_mes.tab	\N	\N	156	ND_mes.zip	0.38 MB
2	476	1	8-срочные наблюдения атмосферных явлений  (ATM8C)	ATM8C	Atm8c	..\\Web\\Clim\\Atm8c\\	nnnnn	Annnnn.dat	147	Atm8c.zip	537.3 MB
2	481	2	SNMAR - Маршрутные снегосъемки	SNMAR	snma	..\\WEB\\CLIM\\SNMAR\\	\N	\N	148	SnMar.zip	6.6 MB
2	482	2	SNOW - Снежный покров	SNOW	snow	..\\WEB\\CLIM\\SNOW\\	\N	\N	150	Snow.zip	55.2 MB
2	480	2	TTTR - Температура и осадки	TTTR	Tttr	..\\WEB\\CLIM\\TTTR\\	\N	\N	151	Tttr.zip	167.1 MB
2	491	3	Метеопараметры атмосферы	AMMV	Ammv	..\\Web\\CLIM\\AMMV\\	\N	\N	158	Ammv.zip	6.68 MB
2	489	3	Метеопараметры в пограничном слое атмосф.	BOUND	BOUND	..\\Web\\CLIM\\BOUND\\	\N	\N	154	Bound.zip	1.72 MB
2	477	1	8-срочные наблюдения на станциях, (SROK8C)	SROK8C	Sro8c	..\\WEB\\CLIM\\SROK8C\\	nnnnn	nnnnn.dat	147	Srok8c.zip	3.4 GB
\.


--
-- Data for Name: ucomments; Type: TABLE DATA; Schema: public; Owner: aisori
--

COPY public.ucomments (idcomm, tstamp, logname, textcomm, aliasid) FROM stdin;
1	2018-02-09 12:36:27.276272+03	Eternal	Все прекрасно. Работает. Удобнее, чем было. Спасибо.	2
2	2018-03-03 11:57:06.398538+03	PZELA	 СУПЕР!!! Когда-то надо начинать по новому?!!!	2
3	2018-04-10 11:18:17.821429+03	COOLER	а г Владимир нет в списке(	2
4	2018-07-31 14:44:44.746972+03	zakon929	города ульяновска нет в списке	2
5	2018-08-10 07:14:48.249642+03	verra29	Здравствуйте, подскажите, почему не работает электронный справочник "Климат России"?	2
6	2018-08-10 14:53:53.430723+03	serge1	To verra29 from 2018-08-10:\r\nБлагодарим за то, что известили о проблеме. Доступ к справочнику восстановлен.	2
7	2018-08-30 09:22:48.195857+03	Тоска	Метеостанция 29570 Красноярск оп.п. данные по срокам 1993 год  месяц январь 1 число два срока 15:00.\r\nДо конца массива получилась сдвижка. Она касается только значений срока или  и значений метеопараметров? Спасибо!	2
8	2018-08-31 08:13:44.708607+03	serge1	TO Тоска FROM 2018-08-30:\r\nОбъясняется такая ситуация следующим образом. Дело в том, что до 1993 г. данные наблюдений фиксировались по Московскому декретному времени, а с 1993 г. - по Гринвичскому. Московское декретное время отличается от Гринвичского на +3 часа. Конкретно для станции 29570 первым сроком наблюдений до 1993 г. по местному времени был срок 18, а последним - 15. Начиная с 1993 г. ситуация изменилась. Первым сроком по местному времени стал срок 15, а последним - 12. Из-за этого и получается, что на стыке 1992 г. и 1993 г. идут два подряд срока 15.	2
9	2018-10-08 14:17:18.671671+03	kuaz	Нет станции КИРОВ 27199 !!! 	2
10	2018-10-11 06:30:29.417772+03	1948klimat	Доброе утро! Почему не работает справочник "Климат России"?	2
11	2018-11-01 12:18:41.025759+03	newpolus	в Новом Уренгое нет метеостанции?	2
12	2018-11-02 07:45:20.902803+03	serge1	TO newpolus от 2018-11-01:\r\nВ Новом Уренгое есть метеостанция, но она не входит в перечень станций, информация по которым предоставляется в открытом доступе.	2
13	2019-01-14 11:15:37.584553+03	anna_karpova	Добрый день! \r\n\r\nПодскажите, пожалуйста, как заказать данные? Спасибо.	2
14	2019-01-15 07:54:44.3134+03	serge1	TO anna_karpova от 2019-01-14:\r\nЕсли необходимы данные, которых нет в открытом доступе, то Вам нужно написать заявку на имя\r\nДиректора института с перечнем интересующих Вас данных.	2
15	2019-02-03 22:56:48.125202+03	AtataAtata	Здравствуйте. Подскажите пожалуйста могу ли я при помощи вашей БД получить последние (не позднее суток) данные зондирования атмосферы на станции (нужен например ветер на максимальных высотах). Заранее спасибо! если можете подсказать где данные взять буду благодарен!	2
16	2019-02-04 08:55:54.277949+03	serge1	TO AtataAtata от 2019-02-03:\r\nПопробуйте обратиться в отдел аэрологии.\r\nhttp://meteo.ru/structure/aerology	2
17	2019-02-17 21:38:28.488156+03	Тоска	Здравствуйте! Поясните, пожалуйста, в чём заключается различие данных  средней месячной температуры воздуха вашего массива и прибрежных наблюдений массив ЕСИМО, например  по станциям Анапа, Феодосия и т.д. Спасибо!	2
18	2019-02-18 08:07:23.515829+03	serge1	TO Тоска от 2019-02-17:\r\nМы не имеем отношения к массивам ЕСИМО поэтому не можем ответить на этот вопрос.	2
19	2019-03-03 13:46:04.914599+03	pech_kin28S	Здравствуйте! Можно ли получить данные по метеостанции Каменск-Шахтинский которая,не входит в общий перечень станций? Если нет, посоветуйте, источник где можно найти архив наблюдений на этой станции. Нашел архив только на сайте rp5, там архив с 2011 года.	2
20	2019-03-04 08:09:23.178604+03	serge1	TO pech_kin28S от 2019-03-03:\r\nЕсли необходимы данные, которые не представлены в массивах, то Вы можете подать запрос на имя Директора института с перечнем \r\nинтересующих Вас данных. Работа по подготовке нужной информации \r\nможет быть выполнена в рамках договора.	2
21	2019-03-11 11:00:16.473485+03	a.kas	Здравствуйте! Когда планируется опубликовать архивные данные за прошедший 2018 год?	2
22	2019-03-12 14:21:48.020398+03	serge1	TO a.kas от 2019-03-11:\r\nЕсли не возникнет форс-мажорных обстоятельств, то часть массивов будут обновлена на этой неделе.	2
23	2019-03-13 10:09:17.784795+03	dmitk	Подскажите, пожалуйста, а что означает поле "Признак качества"? 	2
24	2019-03-13 10:39:52.032041+03	dmitk	Подскажите, пожалуйста, а что означает поле "Признак качества"? \r\nСам нашел\r\n0 Значение не контролировалось\r\n1 Правильное значение\r\n2 Сомнительное значение\r\n3 Ошибочное значение\r\n4 Исправленное в процессе контроля (вместо ошибочного)\r\n5 Восстановленное при контроле значение (вместо отсутствующего)\r\n9 Признак отсутствия значения	2
25	2019-03-20 09:47:46.92862+03	a.kas	Здравствуйте! За 2018 год часть данных появилась,спасибо!\r\nНо появилось не все, много пропусков.\r\nКогда примерно планируете опубликовать остальное за 2018 год?	2
26	2019-03-21 07:50:55.675325+03	serge1	TO a.kas от 2019-03-20:\r\nТочный ответ дать трудно. Мы только выкладываем данные которые есть в наличии.	2
27	2019-04-23 16:55:56.056571+03	vturin	Подскажите пожалуйста, как определяется перечень станций, информация по которым предоставляется в открытом доступе? Спасибо.	2
28	2019-04-24 07:47:41.302998+03	serge1	TO vturin от 2019-04-23:\r\nПеречень станций России для новой версии архива составлен на основании Списка станций Росгидромета, включенных в Глобальную сеть наблюдений за климатом (утвержденного Руководителем Росгидромета 25 марта 2004г.) и Списка реперных метеорологических станций Росгидромета, подготовленного в Главной Геофизической Обсерватории им. А.И. Воейкова.\r\n\r\nВзято из описания массива данных TTTR: http://meteo.ru/data/162-temperature-precipitation	2
29	2019-05-15 02:03:45.639408+03	razdolbai61	Здравствуйте! \r\nПри загрузке архивов данных Srok8c одним файлом в файлах по точкам между столбцами параметров №13 "Начало метеорологических суток по ПДЗВ" и №14 "Горизонтальная видимость" присутствует столбец с неизвестным параметром, который в описаниях отсутствует (При загрузке файлов с настройкой и выбором точек и параметров данный параметр отсутствует). Просмотрел не все файлы, но в просмотренных присутствует.\r\nДанный параметр принимает значения по точке 20046:\r\n"2" от 31.12.1965 18 часов по Гринвичу до 31.12.1975 15 часов по Гринвичу;\r\n(1976г. отсутствует, примечание в каталоге отсутствует)\r\n"3" от 31.1.1977 18 часов по Гринвичу до 31.12.1984 15 часов по Гринвичу;\r\n"4" от 31.12.1984 18 часов по Гринвичу до 31.12.2017 15 часов по Гринвичу (последняя дата файла);\r\nПо точке 22550:\r\n"2" от 31.12.1965 18 часов по Гринвичу до 31.10.1976 15 часов по Гринвичу;\r\n(1976г. отсутствует, примечание в каталоге отсутствует)\r\n"3" от 31.1.1976 18 часов по Гринвичу до 31.12.1983 15 часов по Гринвичу;\r\n"4" от 31.12.1983 18 часов по Гринвичу до 31.12.2018 15 часов по Гринвичу (последняя дата файла);\r\nВ описаниях присутствуют 89 параметров, в реалии их 90. В связи с этим прошу уточнить наименование параметра.	2
30	2019-05-15 06:33:23.054426+03	razdolbai61	Виноват. Не сразу обратил внимание на файл .ddl. Вопрос отпал.	2
\.


--
-- Data for Name: ugms; Type: TABLE DATA; Schema: public; Owner: aisori
--

COPY public.ugms (ugmsid, ugmsname) FROM stdin;
2	2  Мурманское УГМС
1	1  Северное УГМС
3	3  Северо-Западное УГМС
6	6  Калининградское ЦГМС
7	7  Белгидромет
8	8  Центральное
9	9  Уральское УГМС
13	13 Северо-Кавказское УГМС
12	12 Приволжское УГМС
17	17 Обь-Иртышское УГМС
20	20 Западно-Сибирское УГМС
21	21 Средне-Сибирское УГМС
22	22 Иркутское УГМС
23	23 Забайкальское УГМС
24	24 Якутское УГМС
25	25 Дальневосточное УГМС
26	26 Приморское УГМС
27	27 Камчатское УГМС
28	28 УГМС ЦЧО
29	29 Верхне-Волжское УГМС
33	33 Колымское УГМС
34	34 Сахалинское УГМС 
38	38 Чукотское УГМС
41	41 Башкирское УГМС
42	42 УГМС  Республики Татарстан
47	47 Крымское УГМС
10	10 Крымское УГМС (до 1990 г.)
83	83 ЦГМС Сочи
\.


--
-- Data for Name: userlog; Type: TABLE DATA; Schema: public; Owner: aisori
--

COPY public.userlog (seansid, userid, ipadr, tstamp) FROM stdin;
3176	103	193.233.182.153	2018-04-25 10:11:34.073046
3223	103	193.233.182.153	2018-04-26 02:03:49.558449
\.


--
-- Data for Name: waiconf; Type: TABLE DATA; Schema: public; Owner: aisori
--

COPY public.waiconf (chkey, chvar, chcomment) FROM stdin;
aql	wq	префикс файла запроса
bat	wb	префикс генерируемого BAT-файла
dbpart	DBPart	раздел базы данных
delim	Delim	разделитель (0-пробел, 1 - ;)
fnaql	FnAql	имя файла с запросом
ini	wi	префикс ini-файла
listinfile	ListInFile	Файл со списком станций
namefamily	NameFamily	имя архива
nodubl	NoDubl	удалить дубли (0-1)
outfilecur	OutFileCur	имя выходного файла
prtl	Prtl	файл с протоколом
result	wr	префикс файла с результатом
runcom	AiSori_Pr.exe	исп.модуль WebSori для выборки данных
shprtl	pr	префикс файла протокола
stations	ws	префикс файла станций
title	Title	включить заголовок записи (0-1)
drive	D:	диск
respath	D:\\WSoriWeb\\Temp\\	путь сохранения результатов
path	WSoriWeb\\Bin\\	корневой каталог данных на диске
batpath	/opt/laori/drive_d/WSoriWeb/Temp/	путь запуска bat-файл
linrespath	/opt/laori/drive_d/WSoriWeb/Temp/	linux: каталог сохранения результатов
command	wine cmd.exe /c	префикс команды запуска bat-файла
\.


--
-- Data for Name: worklog; Type: TABLE DATA; Schema: public; Owner: aisori
--

COPY public.worklog (idwork, seansid, userid, aliasid, timeid, leafid, stfileid, datasize, stations, tname, leafname, stfname, aqlquery) FROM stdin;
3108	3176	103	2	2	211	69	1707480	{31510}	Сутки	TPG - Температура почвы на глубинах	Станции_(почва).txt	 WA1 (32000) CHAR; \r\n IN: STREAM(R) TPG;\r\n     PORTION НАБЛДЕНЬ;\r\n   RECORD НАБЛДЕНЬ NAT;\r\nIF (ГОД * 1) ;\r\n\r\nIF (МЕСЯЦ * 2) ;\r\n\r\nIF (ДЕНЬ * 3) ;\r\n\r\nWA1 = СТАНЦИЯ FC(5), // Индекс ВМО\r\nГОД FC(4), // Год\r\nМЕСЯЦ FC(2), // Месяц\r\nДЕНЬ FC(2), // День\r\nT02 FC(5,1), // Температура на глубине 2 см\r\nT05 FC(5,1), // Температура на глубине 5 см\r\nT10 FC(5,1), // Температура на глубине 10 см\r\nT15 FC(5,1), // Температура на глубине 15 см\r\nT20 FC(5,1), // Температура на глубине 20 см\r\nT40 FC(5,1), // Температура на глубине 40 см\r\nT60 FC(5,1), // Температура на глубине 60 см\r\nT80 FC(5,1), // Температура на глубине 80 см\r\nT120 FC(5,1), // Температура на глубине 120 см\r\nT160 FC(5,1), // Температура на глубине 160 см\r\nT240 FC(5,1), // Температура на глубине 240 см\r\nT320 FC(5,1); // Температура на глубине 320 см\r\n\r\n   END НАБЛДЕНЬ;\r\n
3170	3223	103	2	2	211	69	796824	{31510}	Сутки	TPG - Температура почвы на глубинах	Станции_(почва).txt	 WA1 (32000) CHAR; \r\n IN: STREAM(R) TPG;\r\n     PORTION НАБЛДЕНЬ;\r\n   RECORD НАБЛДЕНЬ NAT;\r\nIF (ГОД * 1) ;\r\n\r\nIF (МЕСЯЦ * 2) ;\r\n\r\nIF (ДЕНЬ * 3) ;\r\n\r\nWA1 = СТАНЦИЯ FC(5), // Индекс ВМО\r\nГОД FC(4), // Год\r\nМЕСЯЦ FC(2), // Месяц\r\nДЕНЬ FC(2), // День\r\nT80 FC(5,1), // Температура на глубине 80 см\r\nT80.Q FC(1), // Признак качества\r\nT160 FC(5,1), // Температура на глубине 160 см\r\nT160.Q FC(1), // Признак качества\r\nT320 FC(5,1), // Температура на глубине 320 см\r\nT320.Q FC(1); // Признак качества\r\n\r\n   END НАБЛДЕНЬ;\r\n
\.


--
-- Name: aliases_aliasid_seq; Type: SEQUENCE SET; Schema: public; Owner: aisori
--

SELECT pg_catalog.setval('public.aliases_aliasid_seq', 3, true);


--
-- Name: aqlfiles_aqlid_seq; Type: SEQUENCE SET; Schema: public; Owner: aisori
--

SELECT pg_catalog.setval('public.aqlfiles_aqlid_seq', 2547, true);


--
-- Name: faillog_failid_seq; Type: SEQUENCE SET; Schema: public; Owner: aisori
--

SELECT pg_catalog.setval('public.faillog_failid_seq', 5915, true);


--
-- Name: newstext_newsid_seq; Type: SEQUENCE SET; Schema: public; Owner: aisori
--

SELECT pg_catalog.setval('public.newstext_newsid_seq', 10, true);


--
-- Name: reguser_uid_seq; Type: SEQUENCE SET; Schema: public; Owner: aisori
--

SELECT pg_catalog.setval('public.reguser_uid_seq', 21285, true);


--
-- Name: restmail_eid_seq; Type: SEQUENCE SET; Schema: public; Owner: aisori
--

SELECT pg_catalog.setval('public.restmail_eid_seq', 1, false);


--
-- Name: session_id; Type: SEQUENCE SET; Schema: public; Owner: aisori
--

SELECT pg_catalog.setval('public.session_id', 19448, true);


--
-- Name: statfiles_stfileid_seq; Type: SEQUENCE SET; Schema: public; Owner: aisori
--

SELECT pg_catalog.setval('public.statfiles_stfileid_seq', 159, true);


--
-- Name: stations_stid_seq; Type: SEQUENCE SET; Schema: public; Owner: aisori
--

SELECT pg_catalog.setval('public.stations_stid_seq', 134580, true);


--
-- Name: timeleafs_leafid_seq; Type: SEQUENCE SET; Schema: public; Owner: aisori
--

SELECT pg_catalog.setval('public.timeleafs_leafid_seq', 505, true);


--
-- Name: ucomments_idcomm_seq; Type: SEQUENCE SET; Schema: public; Owner: aisori
--

SELECT pg_catalog.setval('public.ucomments_idcomm_seq', 30, true);


--
-- Name: worklog_idwork_seq; Type: SEQUENCE SET; Schema: public; Owner: aisori
--

SELECT pg_catalog.setval('public.worklog_idwork_seq', 20379, true);


--
-- Name: aliases aliases_pkey; Type: CONSTRAINT; Schema: public; Owner: aisori
--

ALTER TABLE ONLY public.aliases
    ADD CONSTRAINT aliases_pkey PRIMARY KEY (aliasid);


--
-- Name: aqlfiles aqlfiles_pkey; Type: CONSTRAINT; Schema: public; Owner: aisori
--

ALTER TABLE ONLY public.aqlfiles
    ADD CONSTRAINT aqlfiles_pkey PRIMARY KEY (aqlid);


--
-- Name: countries country_pk; Type: CONSTRAINT; Schema: public; Owner: aisori
--

ALTER TABLE ONLY public.countries
    ADD CONSTRAINT country_pk PRIMARY KEY (countryname);


--
-- Name: faillog faillog_pkey; Type: CONSTRAINT; Schema: public; Owner: aisori
--

ALTER TABLE ONLY public.faillog
    ADD CONSTRAINT faillog_pkey PRIMARY KEY (failid);


--
-- Name: newstext newstext_pkey; Type: CONSTRAINT; Schema: public; Owner: aisori
--

ALTER TABLE ONLY public.newstext
    ADD CONSTRAINT newstext_pkey PRIMARY KEY (newsid);


--
-- Name: numusers numusers_pkey; Type: CONSTRAINT; Schema: public; Owner: aisori
--

ALTER TABLE ONLY public.numusers
    ADD CONSTRAINT numusers_pkey PRIMARY KEY (dummyid);


--
-- Name: reguser reguser_pkey; Type: CONSTRAINT; Schema: public; Owner: aisori
--

ALTER TABLE ONLY public.reguser
    ADD CONSTRAINT reguser_pkey PRIMARY KEY (uid);


--
-- Name: restmail restmail_pkey; Type: CONSTRAINT; Schema: public; Owner: aisori
--

ALTER TABLE ONLY public.restmail
    ADD CONSTRAINT restmail_pkey PRIMARY KEY (eid);


--
-- Name: srsume srsume_pkey; Type: CONSTRAINT; Schema: public; Owner: aisori
--

ALTER TABLE ONLY public.srsume
    ADD CONSTRAINT srsume_pkey PRIMARY KEY (aliasid, timeid);


--
-- Name: statfiles statfiles_pkey; Type: CONSTRAINT; Schema: public; Owner: aisori
--

ALTER TABLE ONLY public.statfiles
    ADD CONSTRAINT statfiles_pkey PRIMARY KEY (stfileid);


--
-- Name: stations stations_pkey; Type: CONSTRAINT; Schema: public; Owner: aisori
--

ALTER TABLE ONLY public.stations
    ADD CONSTRAINT stations_pkey PRIMARY KEY (stid);


--
-- Name: timeaql timeaql_pkey; Type: CONSTRAINT; Schema: public; Owner: aisori
--

ALTER TABLE ONLY public.timeaql
    ADD CONSTRAINT timeaql_pkey PRIMARY KEY (leafid, aqlid);


--
-- Name: timeleafs timeleafs_pkey; Type: CONSTRAINT; Schema: public; Owner: aisori
--

ALTER TABLE ONLY public.timeleafs
    ADD CONSTRAINT timeleafs_pkey PRIMARY KEY (leafid);


--
-- Name: ucomments ucomm_pk; Type: CONSTRAINT; Schema: public; Owner: aisori
--

ALTER TABLE ONLY public.ucomments
    ADD CONSTRAINT ucomm_pk PRIMARY KEY (idcomm);


--
-- Name: ugms ugms_pkey; Type: CONSTRAINT; Schema: public; Owner: aisori
--

ALTER TABLE ONLY public.ugms
    ADD CONSTRAINT ugms_pkey PRIMARY KEY (ugmsid);


--
-- Name: userlog userlog_pkey; Type: CONSTRAINT; Schema: public; Owner: aisori
--

ALTER TABLE ONLY public.userlog
    ADD CONSTRAINT userlog_pkey PRIMARY KEY (seansid);


--
-- Name: waiconf waiconf_pkey; Type: CONSTRAINT; Schema: public; Owner: aisori
--

ALTER TABLE ONLY public.waiconf
    ADD CONSTRAINT waiconf_pkey PRIMARY KEY (chkey);


--
-- Name: worklog worklog_pkey; Type: CONSTRAINT; Schema: public; Owner: aisori
--

ALTER TABLE ONLY public.worklog
    ADD CONSTRAINT worklog_pkey PRIMARY KEY (idwork);


--
-- Name: aqlfiles aqlfiles_aliasid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: aisori
--

ALTER TABLE ONLY public.aqlfiles
    ADD CONSTRAINT aqlfiles_aliasid_fkey FOREIGN KEY (aliasid) REFERENCES public.aliases(aliasid);


--
-- Name: newstext newstext_aliasid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: aisori
--

ALTER TABLE ONLY public.newstext
    ADD CONSTRAINT newstext_aliasid_fkey FOREIGN KEY (aliasid) REFERENCES public.aliases(aliasid);


--
-- Name: reguser reguser_aliasid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: aisori
--

ALTER TABLE ONLY public.reguser
    ADD CONSTRAINT reguser_aliasid_fkey FOREIGN KEY (aliasid) REFERENCES public.aliases(aliasid);


--
-- Name: reguser reguser_countryname_fkey; Type: FK CONSTRAINT; Schema: public; Owner: aisori
--

ALTER TABLE ONLY public.reguser
    ADD CONSTRAINT reguser_countryname_fkey FOREIGN KEY (countryname) REFERENCES public.countries(countryname);


--
-- Name: restmail restmail_uid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: aisori
--

ALTER TABLE ONLY public.restmail
    ADD CONSTRAINT restmail_uid_fkey FOREIGN KEY (uid) REFERENCES public.reguser(uid);


--
-- Name: srsume srsume_aliasid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: aisori
--

ALTER TABLE ONLY public.srsume
    ADD CONSTRAINT srsume_aliasid_fkey FOREIGN KEY (aliasid) REFERENCES public.aliases(aliasid);


--
-- Name: statfiles statfiles_aliasid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: aisori
--

ALTER TABLE ONLY public.statfiles
    ADD CONSTRAINT statfiles_aliasid_fkey FOREIGN KEY (aliasid) REFERENCES public.aliases(aliasid);


--
-- Name: stations stations_stfileid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: aisori
--

ALTER TABLE ONLY public.stations
    ADD CONSTRAINT stations_stfileid_fkey FOREIGN KEY (stfileid) REFERENCES public.statfiles(stfileid);


--
-- Name: timeaql timeaql_aliasid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: aisori
--

ALTER TABLE ONLY public.timeaql
    ADD CONSTRAINT timeaql_aliasid_fkey FOREIGN KEY (aliasid) REFERENCES public.aliases(aliasid);


--
-- Name: timeaql timeaql_aqlid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: aisori
--

ALTER TABLE ONLY public.timeaql
    ADD CONSTRAINT timeaql_aqlid_fkey FOREIGN KEY (aqlid) REFERENCES public.aqlfiles(aqlid);


--
-- Name: timeaql timeaql_timeid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: aisori
--

ALTER TABLE ONLY public.timeaql
    ADD CONSTRAINT timeaql_timeid_fkey FOREIGN KEY (leafid) REFERENCES public.timeleafs(leafid);


--
-- Name: timeleafs timeleafs_aliasid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: aisori
--

ALTER TABLE ONLY public.timeleafs
    ADD CONSTRAINT timeleafs_aliasid_fkey FOREIGN KEY (aliasid, timeid) REFERENCES public.srsume(aliasid, timeid);


--
-- Name: timeleafs timeleafs_stfileid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: aisori
--

ALTER TABLE ONLY public.timeleafs
    ADD CONSTRAINT timeleafs_stfileid_fkey FOREIGN KEY (stfileid) REFERENCES public.statfiles(stfileid);


--
-- Name: ucomments ucomments_aliasid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: aisori
--

ALTER TABLE ONLY public.ucomments
    ADD CONSTRAINT ucomments_aliasid_fkey FOREIGN KEY (aliasid) REFERENCES public.aliases(aliasid);


--
-- Name: userlog userlog_userid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: aisori
--

ALTER TABLE ONLY public.userlog
    ADD CONSTRAINT userlog_userid_fkey FOREIGN KEY (userid) REFERENCES public.reguser(uid);


--
-- PostgreSQL database dump complete
--

