PGDMP         #                w         	   JapanWork    11.2    11.2 q               0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                       false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                       false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                       false                       1262    16396 	   JapanWork    DATABASE     �   CREATE DATABASE "JapanWork" WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'English_United States.1252' LC_CTYPE = 'English_United States.1252';
    DROP DATABASE "JapanWork";
             postgres    false                        3079    16417    pgcrypto 	   EXTENSION     <   CREATE EXTENSION IF NOT EXISTS pgcrypto WITH SCHEMA public;
    DROP EXTENSION pgcrypto;
                  false                       0    0    EXTENSION pgcrypto    COMMENT     <   COMMENT ON EXTENSION pgcrypto IS 'cryptographic functions';
                       false    3                        3079    16463 	   uuid-ossp 	   EXTENSION     ?   CREATE EXTENSION IF NOT EXISTS "uuid-ossp" WITH SCHEMA public;
    DROP EXTENSION "uuid-ossp";
                  false                       0    0    EXTENSION "uuid-ossp"    COMMENT     W   COMMENT ON EXTENSION "uuid-ossp" IS 'generate universally unique identifiers (UUIDs)';
                       false    2            �            1259    17308    academy    TABLE     i  CREATE TABLE public.academy (
    id uuid NOT NULL,
    academy_center_name character varying,
    major_name character varying,
    grade double precision,
    grade_system integer,
    create_date timestamp without time zone,
    update_date timestamp without time zone,
    is_delete boolean,
    candidate_id uuid,
    start_date date,
    end_date date
);
    DROP TABLE public.academy;
       public         postgres    false            �            1259    16563    application    TABLE     �   CREATE TABLE public.application (
    id uuid NOT NULL,
    company_id uuid,
    candidate_id uuid,
    status integer,
    create_date timestamp without time zone,
    update_date timestamp without time zone,
    is_delete boolean
);
    DROP TABLE public.application;
       public         postgres    false            �            1259    16506    business_type    TABLE       CREATE TABLE public.business_type (
    id uuid NOT NULL,
    name_vi character varying,
    name_ja character varying,
    description character varying,
    create_date timestamp without time zone,
    update_date timestamp without time zone,
    is_delete boolean
);
 !   DROP TABLE public.business_type;
       public         postgres    false            �            1259    16495 	   candidate    TABLE     7  CREATE TABLE public.candidate (
    id uuid NOT NULL,
    user_id uuid,
    name character varying,
    gender character varying,
    residental_district_id uuid,
    residental_address character varying,
    introduction character varying,
    avatar_url character varying,
    japanese_level integer,
    wish_business_type_id uuid,
    status character varying,
    wish_salary double precision DEFAULT 0,
    wish_working_district_id uuid,
    wish_contract_type_id uuid,
    create_date timestamp without time zone,
    update_date time without time zone,
    is_delete boolean,
    residental_city_id uuid,
    language_certificate_id uuid,
    wish_working_city_id uuid,
    wish_working_address character varying,
    wish_level_id uuid,
    status_info integer,
    marital character varying(255),
    dob date
);
    DROP TABLE public.candidate;
       public         postgres    false            �            1259    16515    city    TABLE       CREATE TABLE public.city (
    id uuid NOT NULL,
    name_vi character varying,
    name_ja character varying,
    description character varying,
    create_date timestamp without time zone,
    update_date timestamp without time zone,
    is_delete boolean
);
    DROP TABLE public.city;
       public         postgres    false            �            1259    16487    company    TABLE     �  CREATE TABLE public.company (
    id uuid NOT NULL,
    user_id uuid,
    name character varying,
    scale integer,
    district_id uuid,
    address character varying,
    logo_url character varying,
    cover_image_url character varying,
    introduction character varying,
    create_date timestamp without time zone,
    update_date timestamp without time zone,
    is_delete boolean,
    city_id uuid,
    status character varying(255)
);
    DROP TABLE public.company;
       public         postgres    false            �            1259    17250    company_business    TABLE     f   CREATE TABLE public.company_business (
    company_id uuid NOT NULL,
    business_id uuid NOT NULL
);
 $   DROP TABLE public.company_business;
       public         postgres    false            �            1259    16539    company_translation    TABLE     3  CREATE TABLE public.company_translation (
    id uuid NOT NULL,
    company_id uuid,
    translator_id uuid,
    name character varying,
    description character varying,
    status integer,
    create_date timestamp without time zone,
    update_date timestamp without time zone,
    is_delete boolean
);
 '   DROP TABLE public.company_translation;
       public         postgres    false            �            1259    16714    confirmation_token    TABLE     �   CREATE TABLE public.confirmation_token (
    token_id uuid NOT NULL,
    user_id uuid,
    expiry_date timestamp without time zone,
    token character varying(255),
    is_delete boolean
);
 &   DROP TABLE public.confirmation_token;
       public         postgres    false            �            1259    16531    contract_type    TABLE       CREATE TABLE public.contract_type (
    id uuid NOT NULL,
    name_vi character varying,
    name_ja character varying,
    description character varying,
    create_date timestamp without time zone,
    update_date timestamp without time zone,
    is_delete boolean
);
 !   DROP TABLE public.contract_type;
       public         postgres    false            �            1259    17295    currency_unit    TABLE       CREATE TABLE public.currency_unit (
    id uuid NOT NULL,
    name_vi character varying,
    name_ja character varying,
    description character varying,
    create_date timestamp without time zone,
    update_date timestamp without time zone,
    is_delete boolean
);
 !   DROP TABLE public.currency_unit;
       public         postgres    false            �            1259    16523    district    TABLE     -  CREATE TABLE public.district (
    id uuid NOT NULL,
    name_vi character varying,
    name_ja character varying,
    country_code character varying,
    description character varying,
    create_date timestamp without time zone,
    update_date timestamp without time zone,
    is_delete boolean
);
    DROP TABLE public.district;
       public         postgres    false            �            1259    17316 
   experience    TABLE     X  CREATE TABLE public.experience (
    id uuid NOT NULL,
    candidate_id uuid,
    organizaion character varying,
    level_id uuid,
    description character varying,
    create_date timestamp without time zone,
    update_date timestamp without time zone,
    is_delete boolean,
    business_id uuid,
    start_date date,
    end_date date
);
    DROP TABLE public.experience;
       public         postgres    false            �            1259    16547    job    TABLE     �  CREATE TABLE public.job (
    id uuid NOT NULL,
    name character varying,
    company_id uuid,
    contract_type_id uuid,
    work_place_district_id uuid,
    work_place_address character varying,
    description character varying,
    skill_requirement character varying,
    benefit character varying,
    japanese_level_requirement integer,
    create_date timestamp without time zone,
    update_date timestamp without time zone,
    is_delete boolean,
    work_place_city_id uuid,
    min_salary double precision,
    max_salary double precision,
    level_id uuid,
    application_deadline date,
    currency_unit_id uuid,
    status character varying
);
    DROP TABLE public.job;
       public         postgres    false            �            1259    17280    job_business    TABLE     ^   CREATE TABLE public.job_business (
    job_id uuid NOT NULL,
    business_id uuid NOT NULL
);
     DROP TABLE public.job_business;
       public         postgres    false            �            1259    16555    job_translation    TABLE     s  CREATE TABLE public.job_translation (
    id uuid NOT NULL,
    job_id uuid,
    translator_id uuid,
    name character varying,
    description character varying,
    skill_requirement character varying,
    benefit character varying,
    status integer,
    create_date timestamp without time zone,
    update_date timestamp without time zone,
    is_delete boolean
);
 #   DROP TABLE public.job_translation;
       public         postgres    false            �            1259    16568    language_certificate    TABLE       CREATE TABLE public.language_certificate (
    id uuid NOT NULL,
    language_certificate_type_id uuid,
    score integer,
    create_date timestamp without time zone,
    update_date timestamp without time zone,
    is_delete boolean,
    taken_date date,
    candidate_id uuid
);
 (   DROP TABLE public.language_certificate;
       public         postgres    false            �            1259    16573    language_certificate_type    TABLE     $  CREATE TABLE public.language_certificate_type (
    id uuid NOT NULL,
    description character varying,
    is_delete boolean,
    create_date timestamp without time zone,
    update_date timestamp without time zone,
    name_ja character varying(255),
    name_vi character varying(255)
);
 -   DROP TABLE public.language_certificate_type;
       public         postgres    false            �            1259    16891    level    TABLE       CREATE TABLE public.level (
    id uuid NOT NULL,
    name_vi character varying(256),
    name_ja character varying(256),
    description character varying,
    create_date timestamp without time zone,
    update_date timestamp without time zone,
    is_delete boolean
);
    DROP TABLE public.level;
       public         postgres    false            �            1259    16581    mark    TABLE     �   CREATE TABLE public.mark (
    id uuid NOT NULL,
    candidate_id uuid,
    scale_mark_id uuid,
    score integer,
    create_date timestamp without time zone,
    update_date timestamp without time zone,
    is_delete boolean
);
    DROP TABLE public.mark;
       public         postgres    false            �            1259    16476    persistent_logins    TABLE     �   CREATE TABLE public.persistent_logins (
    username character varying(64) NOT NULL,
    series character varying(64) NOT NULL,
    token character varying(64) NOT NULL,
    last_used timestamp without time zone NOT NULL
);
 %   DROP TABLE public.persistent_logins;
       public         postgres    false            �            1259    16586    score    TABLE        CREATE TABLE public.score (
    id uuid NOT NULL,
    name_ja character(255),
    name_vi character(255),
    description character varying,
    create_date timestamp without time zone,
    update_date timestamp without time zone,
    is_delete boolean
);
    DROP TABLE public.score;
       public         postgres    false            �            1259    16594 
   translator    TABLE     �  CREATE TABLE public.translator (
    id uuid NOT NULL,
    account_id uuid,
    name character varying,
    dob time without time zone,
    living_district_id uuid,
    living_address character varying,
    introduction character varying,
    avatar_url character varying,
    japanese_level integer,
    create_date timestamp without time zone,
    update_date timestamp without time zone,
    gender integer,
    is_delete boolean
);
    DROP TABLE public.translator;
       public         postgres    false            �            1259    16481    userconnection    TABLE     �  CREATE TABLE public.userconnection (
    userid character varying,
    providerid character varying,
    rank bigint,
    displayname character varying,
    profileurl character varying(512),
    imageurl character varying(512),
    accesstoken character varying(512),
    secret character varying(512),
    refreshtoken character varying(512),
    expiretime bigint,
    provideruserid character varying
);
 "   DROP TABLE public.userconnection;
       public         postgres    false            �            1259    16763    users    TABLE     Y  CREATE TABLE public.users (
    is_enabled boolean,
    image_url character varying(255),
    name character varying(255) NOT NULL,
    password character varying(255),
    provider character varying(255) NOT NULL,
    provider_id character varying(255),
    id uuid NOT NULL,
    email character varying NOT NULL,
    role character varying
);
    DROP TABLE public.users;
       public         postgres    false            �          0    17308    academy 
   TABLE DATA               �   COPY public.academy (id, academy_center_name, major_name, grade, grade_system, create_date, update_date, is_delete, candidate_id, start_date, end_date) FROM stdin;
    public       postgres    false    221   џ       �          0    16563    application 
   TABLE DATA               p   COPY public.application (id, company_id, candidate_id, status, create_date, update_date, is_delete) FROM stdin;
    public       postgres    false    209   ��       �          0    16506    business_type 
   TABLE DATA               o   COPY public.business_type (id, name_vi, name_ja, description, create_date, update_date, is_delete) FROM stdin;
    public       postgres    false    202   ��       �          0    16495 	   candidate 
   TABLE DATA               �  COPY public.candidate (id, user_id, name, gender, residental_district_id, residental_address, introduction, avatar_url, japanese_level, wish_business_type_id, status, wish_salary, wish_working_district_id, wish_contract_type_id, create_date, update_date, is_delete, residental_city_id, language_certificate_id, wish_working_city_id, wish_working_address, wish_level_id, status_info, marital, dob) FROM stdin;
    public       postgres    false    201   {�       �          0    16515    city 
   TABLE DATA               f   COPY public.city (id, name_vi, name_ja, description, create_date, update_date, is_delete) FROM stdin;
    public       postgres    false    203   �       �          0    16487    company 
   TABLE DATA               �   COPY public.company (id, user_id, name, scale, district_id, address, logo_url, cover_image_url, introduction, create_date, update_date, is_delete, city_id, status) FROM stdin;
    public       postgres    false    200   p�       �          0    17250    company_business 
   TABLE DATA               C   COPY public.company_business (company_id, business_id) FROM stdin;
    public       postgres    false    218   <�       �          0    16539    company_translation 
   TABLE DATA               �   COPY public.company_translation (id, company_id, translator_id, name, description, status, create_date, update_date, is_delete) FROM stdin;
    public       postgres    false    206   Y�       �          0    16714    confirmation_token 
   TABLE DATA               ^   COPY public.confirmation_token (token_id, user_id, expiry_date, token, is_delete) FROM stdin;
    public       postgres    false    215   v�       �          0    16531    contract_type 
   TABLE DATA               o   COPY public.contract_type (id, name_vi, name_ja, description, create_date, update_date, is_delete) FROM stdin;
    public       postgres    false    205   <�       �          0    17295    currency_unit 
   TABLE DATA               o   COPY public.currency_unit (id, name_vi, name_ja, description, create_date, update_date, is_delete) FROM stdin;
    public       postgres    false    220   Ϧ       �          0    16523    district 
   TABLE DATA               x   COPY public.district (id, name_vi, name_ja, country_code, description, create_date, update_date, is_delete) FROM stdin;
    public       postgres    false    204   ��                  0    17316 
   experience 
   TABLE DATA               �   COPY public.experience (id, candidate_id, organizaion, level_id, description, create_date, update_date, is_delete, business_id, start_date, end_date) FROM stdin;
    public       postgres    false    222   ߧ       �          0    16547    job 
   TABLE DATA               A  COPY public.job (id, name, company_id, contract_type_id, work_place_district_id, work_place_address, description, skill_requirement, benefit, japanese_level_requirement, create_date, update_date, is_delete, work_place_city_id, min_salary, max_salary, level_id, application_deadline, currency_unit_id, status) FROM stdin;
    public       postgres    false    207   Ш       �          0    17280    job_business 
   TABLE DATA               ;   COPY public.job_business (job_id, business_id) FROM stdin;
    public       postgres    false    219   +�       �          0    16555    job_translation 
   TABLE DATA               �   COPY public.job_translation (id, job_id, translator_id, name, description, skill_requirement, benefit, status, create_date, update_date, is_delete) FROM stdin;
    public       postgres    false    208   ��       �          0    16568    language_certificate 
   TABLE DATA               �   COPY public.language_certificate (id, language_certificate_type_id, score, create_date, update_date, is_delete, taken_date, candidate_id) FROM stdin;
    public       postgres    false    210   ��       �          0    16573    language_certificate_type 
   TABLE DATA               {   COPY public.language_certificate_type (id, description, is_delete, create_date, update_date, name_ja, name_vi) FROM stdin;
    public       postgres    false    211   \�       �          0    16891    level 
   TABLE DATA               g   COPY public.level (id, name_vi, name_ja, description, create_date, update_date, is_delete) FROM stdin;
    public       postgres    false    217   �       �          0    16581    mark 
   TABLE DATA               k   COPY public.mark (id, candidate_id, scale_mark_id, score, create_date, update_date, is_delete) FROM stdin;
    public       postgres    false    212   H�       �          0    16476    persistent_logins 
   TABLE DATA               O   COPY public.persistent_logins (username, series, token, last_used) FROM stdin;
    public       postgres    false    198   e�       �          0    16586    score 
   TABLE DATA               g   COPY public.score (id, name_ja, name_vi, description, create_date, update_date, is_delete) FROM stdin;
    public       postgres    false    213   B�       �          0    16594 
   translator 
   TABLE DATA               �   COPY public.translator (id, account_id, name, dob, living_district_id, living_address, introduction, avatar_url, japanese_level, create_date, update_date, gender, is_delete) FROM stdin;
    public       postgres    false    214   _�       �          0    16481    userconnection 
   TABLE DATA               �   COPY public.userconnection (userid, providerid, rank, displayname, profileurl, imageurl, accesstoken, secret, refreshtoken, expiretime, provideruserid) FROM stdin;
    public       postgres    false    199   |�       �          0    16763    users 
   TABLE DATA               n   COPY public.users (is_enabled, image_url, name, password, provider, provider_id, id, email, role) FROM stdin;
    public       postgres    false    216   ��       O           2606    17315    academy academy_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.academy
    ADD CONSTRAINT academy_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.academy DROP CONSTRAINT academy_pkey;
       public         postgres    false    221            5           2606    16567    application application_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.application
    ADD CONSTRAINT application_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.application DROP CONSTRAINT application_pkey;
       public         postgres    false    209            '           2606    16513     business_type business_type_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.business_type
    ADD CONSTRAINT business_type_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.business_type DROP CONSTRAINT business_type_pkey;
       public         postgres    false    202            %           2606    16502    candidate candidate_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.candidate
    ADD CONSTRAINT candidate_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.candidate DROP CONSTRAINT candidate_pkey;
       public         postgres    false    201            )           2606    16522    city city_pkey 
   CONSTRAINT     L   ALTER TABLE ONLY public.city
    ADD CONSTRAINT city_pkey PRIMARY KEY (id);
 8   ALTER TABLE ONLY public.city DROP CONSTRAINT city_pkey;
       public         postgres    false    203            I           2606    17254 &   company_business company_business_pkey 
   CONSTRAINT     y   ALTER TABLE ONLY public.company_business
    ADD CONSTRAINT company_business_pkey PRIMARY KEY (company_id, business_id);
 P   ALTER TABLE ONLY public.company_business DROP CONSTRAINT company_business_pkey;
       public         postgres    false    218    218            "           2606    16494    company company_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.company
    ADD CONSTRAINT company_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.company DROP CONSTRAINT company_pkey;
       public         postgres    false    200            /           2606    16546 ,   company_translation company_translation_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.company_translation
    ADD CONSTRAINT company_translation_pkey PRIMARY KEY (id);
 V   ALTER TABLE ONLY public.company_translation DROP CONSTRAINT company_translation_pkey;
       public         postgres    false    206            A           2606    16721 *   confirmation_token confirmation_token_pkey 
   CONSTRAINT     n   ALTER TABLE ONLY public.confirmation_token
    ADD CONSTRAINT confirmation_token_pkey PRIMARY KEY (token_id);
 T   ALTER TABLE ONLY public.confirmation_token DROP CONSTRAINT confirmation_token_pkey;
       public         postgres    false    215            -           2606    16538     contract_type contract_type_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.contract_type
    ADD CONSTRAINT contract_type_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.contract_type DROP CONSTRAINT contract_type_pkey;
       public         postgres    false    205            M           2606    17302     currency_unit currency_unit_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.currency_unit
    ADD CONSTRAINT currency_unit_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.currency_unit DROP CONSTRAINT currency_unit_pkey;
       public         postgres    false    220            +           2606    16530    district district_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.district
    ADD CONSTRAINT district_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.district DROP CONSTRAINT district_pkey;
       public         postgres    false    204            7           2606    16572 -   language_certificate english_certificate_pkey 
   CONSTRAINT     k   ALTER TABLE ONLY public.language_certificate
    ADD CONSTRAINT english_certificate_pkey PRIMARY KEY (id);
 W   ALTER TABLE ONLY public.language_certificate DROP CONSTRAINT english_certificate_pkey;
       public         postgres    false    210            9           2606    16580 7   language_certificate_type english_certificate_type_pkey 
   CONSTRAINT     u   ALTER TABLE ONLY public.language_certificate_type
    ADD CONSTRAINT english_certificate_type_pkey PRIMARY KEY (id);
 a   ALTER TABLE ONLY public.language_certificate_type DROP CONSTRAINT english_certificate_type_pkey;
       public         postgres    false    211            Q           2606    17389    experience experience_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.experience
    ADD CONSTRAINT experience_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.experience DROP CONSTRAINT experience_pkey;
       public         postgres    false    222            K           2606    17284    job_business job_business_pkey 
   CONSTRAINT     m   ALTER TABLE ONLY public.job_business
    ADD CONSTRAINT job_business_pkey PRIMARY KEY (job_id, business_id);
 H   ALTER TABLE ONLY public.job_business DROP CONSTRAINT job_business_pkey;
       public         postgres    false    219    219            1           2606    16554    job job_pkey 
   CONSTRAINT     J   ALTER TABLE ONLY public.job
    ADD CONSTRAINT job_pkey PRIMARY KEY (id);
 6   ALTER TABLE ONLY public.job DROP CONSTRAINT job_pkey;
       public         postgres    false    207            3           2606    16562 $   job_translation job_translation_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.job_translation
    ADD CONSTRAINT job_translation_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.job_translation DROP CONSTRAINT job_translation_pkey;
       public         postgres    false    208            G           2606    16898    level level_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.level
    ADD CONSTRAINT level_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.level DROP CONSTRAINT level_pkey;
       public         postgres    false    217            ;           2606    16585    mark mark_pkey 
   CONSTRAINT     L   ALTER TABLE ONLY public.mark
    ADD CONSTRAINT mark_pkey PRIMARY KEY (id);
 8   ALTER TABLE ONLY public.mark DROP CONSTRAINT mark_pkey;
       public         postgres    false    212                        2606    16480 (   persistent_logins persistent_logins_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.persistent_logins
    ADD CONSTRAINT persistent_logins_pkey PRIMARY KEY (series);
 R   ALTER TABLE ONLY public.persistent_logins DROP CONSTRAINT persistent_logins_pkey;
       public         postgres    false    198            =           2606    16593    score score_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.score
    ADD CONSTRAINT score_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.score DROP CONSTRAINT score_pkey;
       public         postgres    false    213            ?           2606    16601    translator translator_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.translator
    ADD CONSTRAINT translator_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.translator DROP CONSTRAINT translator_pkey;
       public         postgres    false    214            C           2606    16782 !   users uk6dotkott2kjsp8vw4d0m25fb7 
   CONSTRAINT     ]   ALTER TABLE ONLY public.users
    ADD CONSTRAINT uk6dotkott2kjsp8vw4d0m25fb7 UNIQUE (email);
 K   ALTER TABLE ONLY public.users DROP CONSTRAINT uk6dotkott2kjsp8vw4d0m25fb7;
       public         postgres    false    216            E           2606    16779    users users_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public         postgres    false    216            #           1259    16618    fki_company_id_district    INDEX     R   CREATE INDEX fki_company_id_district ON public.company USING btree (district_id);
 +   DROP INDEX public.fki_company_id_district;
       public         postgres    false    200            R           2606    17255 #   company fk11ll1ewpdxjg9bm3jtg858qn8    FK CONSTRAINT     �   ALTER TABLE ONLY public.company
    ADD CONSTRAINT fk11ll1ewpdxjg9bm3jtg858qn8 FOREIGN KEY (city_id) REFERENCES public.city(id);
 M   ALTER TABLE ONLY public.company DROP CONSTRAINT fk11ll1ewpdxjg9bm3jtg858qn8;
       public       postgres    false    203    2857    200            i           2606    17285 (   job_business fk1qyg6qgsgwqew5xek5d1jqt49    FK CONSTRAINT     �   ALTER TABLE ONLY public.job_business
    ADD CONSTRAINT fk1qyg6qgsgwqew5xek5d1jqt49 FOREIGN KEY (business_id) REFERENCES public.business_type(id);
 R   ALTER TABLE ONLY public.job_business DROP CONSTRAINT fk1qyg6qgsgwqew5xek5d1jqt49;
       public       postgres    false    2855    219    202            b           2606    17069    job fk340ge244fpu56r9t5ii1b2sb1    FK CONSTRAINT        ALTER TABLE ONLY public.job
    ADD CONSTRAINT fk340ge244fpu56r9t5ii1b2sb1 FOREIGN KEY (level_id) REFERENCES public.level(id);
 I   ALTER TABLE ONLY public.job DROP CONSTRAINT fk340ge244fpu56r9t5ii1b2sb1;
       public       postgres    false    2887    207    217            S           2606    17260 #   company fk402ranx730490dy8be5u3wgip    FK CONSTRAINT     �   ALTER TABLE ONLY public.company
    ADD CONSTRAINT fk402ranx730490dy8be5u3wgip FOREIGN KEY (district_id) REFERENCES public.district(id);
 M   ALTER TABLE ONLY public.company DROP CONSTRAINT fk402ranx730490dy8be5u3wgip;
       public       postgres    false    200    2859    204            _           2606    17054    job fk5q04favsasq8y70bsei7wv8fc    FK CONSTRAINT     �   ALTER TABLE ONLY public.job
    ADD CONSTRAINT fk5q04favsasq8y70bsei7wv8fc FOREIGN KEY (company_id) REFERENCES public.company(id);
 I   ALTER TABLE ONLY public.job DROP CONSTRAINT fk5q04favsasq8y70bsei7wv8fc;
       public       postgres    false    200    2850    207            l           2606    17373 &   experience fk6ow5q7e5c97l06m7toph3fe26    FK CONSTRAINT     �   ALTER TABLE ONLY public.experience
    ADD CONSTRAINT fk6ow5q7e5c97l06m7toph3fe26 FOREIGN KEY (business_id) REFERENCES public.business_type(id);
 P   ALTER TABLE ONLY public.experience DROP CONSTRAINT fk6ow5q7e5c97l06m7toph3fe26;
       public       postgres    false    222    202    2855            c           2606    17303    job fk7r8irn30js2xmapby1aeu5dbr    FK CONSTRAINT     �   ALTER TABLE ONLY public.job
    ADD CONSTRAINT fk7r8irn30js2xmapby1aeu5dbr FOREIGN KEY (currency_unit_id) REFERENCES public.currency_unit(id);
 I   ALTER TABLE ONLY public.job DROP CONSTRAINT fk7r8irn30js2xmapby1aeu5dbr;
       public       postgres    false    2893    220    207            V           2606    16994 %   candidate fk9dgabpgibita8pbtc0usr8biw    FK CONSTRAINT     �   ALTER TABLE ONLY public.candidate
    ADD CONSTRAINT fk9dgabpgibita8pbtc0usr8biw FOREIGN KEY (residental_city_id) REFERENCES public.city(id);
 O   ALTER TABLE ONLY public.candidate DROP CONSTRAINT fk9dgabpgibita8pbtc0usr8biw;
       public       postgres    false    2857    203    201            ^           2606    17049    job fka4g07wo4n04hahen14x1qkmtx    FK CONSTRAINT     �   ALTER TABLE ONLY public.job
    ADD CONSTRAINT fka4g07wo4n04hahen14x1qkmtx FOREIGN KEY (work_place_city_id) REFERENCES public.city(id);
 I   ALTER TABLE ONLY public.job DROP CONSTRAINT fka4g07wo4n04hahen14x1qkmtx;
       public       postgres    false    207    203    2857            f           2606    16858 .   confirmation_token fkah4p1rycwibwm6s9bsyeckq51    FK CONSTRAINT     �   ALTER TABLE ONLY public.confirmation_token
    ADD CONSTRAINT fkah4p1rycwibwm6s9bsyeckq51 FOREIGN KEY (user_id) REFERENCES public.users(id);
 X   ALTER TABLE ONLY public.confirmation_token DROP CONSTRAINT fkah4p1rycwibwm6s9bsyeckq51;
       public       postgres    false    215    216    2885            X           2606    17004 %   candidate fkc23nbdgfce6rnt56ofltvxu71    FK CONSTRAINT     �   ALTER TABLE ONLY public.candidate
    ADD CONSTRAINT fkc23nbdgfce6rnt56ofltvxu71 FOREIGN KEY (user_id) REFERENCES public.users(id);
 O   ALTER TABLE ONLY public.candidate DROP CONSTRAINT fkc23nbdgfce6rnt56ofltvxu71;
       public       postgres    false    2885    216    201            \           2606    17353 %   candidate fkcb7hemrnd120drgqdy35cd4ia    FK CONSTRAINT     �   ALTER TABLE ONLY public.candidate
    ADD CONSTRAINT fkcb7hemrnd120drgqdy35cd4ia FOREIGN KEY (wish_level_id) REFERENCES public.level(id);
 O   ALTER TABLE ONLY public.candidate DROP CONSTRAINT fkcb7hemrnd120drgqdy35cd4ia;
       public       postgres    false    2887    217    201            `           2606    17059    job fkclfbkg6g9ngg3th6wa48t881r    FK CONSTRAINT     �   ALTER TABLE ONLY public.job
    ADD CONSTRAINT fkclfbkg6g9ngg3th6wa48t881r FOREIGN KEY (contract_type_id) REFERENCES public.contract_type(id);
 I   ALTER TABLE ONLY public.job DROP CONSTRAINT fkclfbkg6g9ngg3th6wa48t881r;
       public       postgres    false    207    2861    205            Z           2606    17024 %   candidate fkdah7t9poruribnoevnhxah1ts    FK CONSTRAINT     �   ALTER TABLE ONLY public.candidate
    ADD CONSTRAINT fkdah7t9poruribnoevnhxah1ts FOREIGN KEY (wish_working_district_id) REFERENCES public.district(id);
 O   ALTER TABLE ONLY public.candidate DROP CONSTRAINT fkdah7t9poruribnoevnhxah1ts;
       public       postgres    false    2859    204    201            m           2606    17378 &   experience fkfurbkim8pb2npt8cy0c1xskmm    FK CONSTRAINT     �   ALTER TABLE ONLY public.experience
    ADD CONSTRAINT fkfurbkim8pb2npt8cy0c1xskmm FOREIGN KEY (level_id) REFERENCES public.level(id);
 P   ALTER TABLE ONLY public.experience DROP CONSTRAINT fkfurbkim8pb2npt8cy0c1xskmm;
       public       postgres    false    222    2887    217            [           2606    17327 %   candidate fkhapbwn8l18ftobyrxsifwln5j    FK CONSTRAINT     �   ALTER TABLE ONLY public.candidate
    ADD CONSTRAINT fkhapbwn8l18ftobyrxsifwln5j FOREIGN KEY (wish_business_type_id) REFERENCES public.business_type(id);
 O   ALTER TABLE ONLY public.candidate DROP CONSTRAINT fkhapbwn8l18ftobyrxsifwln5j;
       public       postgres    false    201    2855    202            g           2606    17270 ,   company_business fkhqdaw0i6lfxm04wrlrufvm4td    FK CONSTRAINT     �   ALTER TABLE ONLY public.company_business
    ADD CONSTRAINT fkhqdaw0i6lfxm04wrlrufvm4td FOREIGN KEY (business_id) REFERENCES public.business_type(id);
 V   ALTER TABLE ONLY public.company_business DROP CONSTRAINT fkhqdaw0i6lfxm04wrlrufvm4td;
       public       postgres    false    218    2855    202            k           2606    17368 #   academy fkhqxm4pkjc9c9bqjxbkw0odj80    FK CONSTRAINT     �   ALTER TABLE ONLY public.academy
    ADD CONSTRAINT fkhqxm4pkjc9c9bqjxbkw0odj80 FOREIGN KEY (candidate_id) REFERENCES public.candidate(id);
 M   ALTER TABLE ONLY public.academy DROP CONSTRAINT fkhqxm4pkjc9c9bqjxbkw0odj80;
       public       postgres    false    201    2853    221            W           2606    16999 %   candidate fkjwg3h8xy75pqw9142mkqbd23i    FK CONSTRAINT     �   ALTER TABLE ONLY public.candidate
    ADD CONSTRAINT fkjwg3h8xy75pqw9142mkqbd23i FOREIGN KEY (residental_district_id) REFERENCES public.district(id);
 O   ALTER TABLE ONLY public.candidate DROP CONSTRAINT fkjwg3h8xy75pqw9142mkqbd23i;
       public       postgres    false    201    2859    204            U           2606    16989 %   candidate fkklte55u5fs14c2hx895gl4nbq    FK CONSTRAINT     �   ALTER TABLE ONLY public.candidate
    ADD CONSTRAINT fkklte55u5fs14c2hx895gl4nbq FOREIGN KEY (language_certificate_id) REFERENCES public.language_certificate(id);
 O   ALTER TABLE ONLY public.candidate DROP CONSTRAINT fkklte55u5fs14c2hx895gl4nbq;
       public       postgres    false    201    2871    210            e           2606    17347 0   language_certificate fkl01tem0k01cvvgujxratgmbiy    FK CONSTRAINT     �   ALTER TABLE ONLY public.language_certificate
    ADD CONSTRAINT fkl01tem0k01cvvgujxratgmbiy FOREIGN KEY (candidate_id) REFERENCES public.candidate(id);
 Z   ALTER TABLE ONLY public.language_certificate DROP CONSTRAINT fkl01tem0k01cvvgujxratgmbiy;
       public       postgres    false    2853    201    210            d           2606    17074 0   language_certificate fkm4m70ju7s3fa3v9wr5w112xls    FK CONSTRAINT     �   ALTER TABLE ONLY public.language_certificate
    ADD CONSTRAINT fkm4m70ju7s3fa3v9wr5w112xls FOREIGN KEY (language_certificate_type_id) REFERENCES public.language_certificate_type(id);
 Z   ALTER TABLE ONLY public.language_certificate DROP CONSTRAINT fkm4m70ju7s3fa3v9wr5w112xls;
       public       postgres    false    2873    210    211            j           2606    17290 (   job_business fkm5fm3vgrk13vsyx2kdk72dd2k    FK CONSTRAINT     �   ALTER TABLE ONLY public.job_business
    ADD CONSTRAINT fkm5fm3vgrk13vsyx2kdk72dd2k FOREIGN KEY (job_id) REFERENCES public.job(id);
 R   ALTER TABLE ONLY public.job_business DROP CONSTRAINT fkm5fm3vgrk13vsyx2kdk72dd2k;
       public       postgres    false    219    2865    207            ]           2606    17363 %   candidate fkma4314nk4e549l1m0hsgxr8uq    FK CONSTRAINT     �   ALTER TABLE ONLY public.candidate
    ADD CONSTRAINT fkma4314nk4e549l1m0hsgxr8uq FOREIGN KEY (wish_contract_type_id) REFERENCES public.contract_type(id);
 O   ALTER TABLE ONLY public.candidate DROP CONSTRAINT fkma4314nk4e549l1m0hsgxr8uq;
       public       postgres    false    2861    205    201            Y           2606    17019 %   candidate fkosimfc8rymgvk9klmk5329id0    FK CONSTRAINT     �   ALTER TABLE ONLY public.candidate
    ADD CONSTRAINT fkosimfc8rymgvk9klmk5329id0 FOREIGN KEY (wish_working_city_id) REFERENCES public.city(id);
 O   ALTER TABLE ONLY public.candidate DROP CONSTRAINT fkosimfc8rymgvk9klmk5329id0;
       public       postgres    false    2857    203    201            h           2606    17275 ,   company_business fkpvcl1pngywmthjs778mp9bobq    FK CONSTRAINT     �   ALTER TABLE ONLY public.company_business
    ADD CONSTRAINT fkpvcl1pngywmthjs778mp9bobq FOREIGN KEY (company_id) REFERENCES public.company(id);
 V   ALTER TABLE ONLY public.company_business DROP CONSTRAINT fkpvcl1pngywmthjs778mp9bobq;
       public       postgres    false    200    2850    218            a           2606    17064    job fkr52bhnlhqkgw7ye122c0p86kd    FK CONSTRAINT     �   ALTER TABLE ONLY public.job
    ADD CONSTRAINT fkr52bhnlhqkgw7ye122c0p86kd FOREIGN KEY (work_place_district_id) REFERENCES public.district(id);
 I   ALTER TABLE ONLY public.job DROP CONSTRAINT fkr52bhnlhqkgw7ye122c0p86kd;
       public       postgres    false    207    204    2859            n           2606    17383 &   experience fksmv65lqovssalk12ti3cqkpjf    FK CONSTRAINT     �   ALTER TABLE ONLY public.experience
    ADD CONSTRAINT fksmv65lqovssalk12ti3cqkpjf FOREIGN KEY (candidate_id) REFERENCES public.candidate(id);
 P   ALTER TABLE ONLY public.experience DROP CONSTRAINT fksmv65lqovssalk12ti3cqkpjf;
       public       postgres    false    201    2853    222            T           2606    17265 #   company fksxe9t9istcdt2mtdbvgh83a9g    FK CONSTRAINT     �   ALTER TABLE ONLY public.company
    ADD CONSTRAINT fksxe9t9istcdt2mtdbvgh83a9g FOREIGN KEY (user_id) REFERENCES public.users(id);
 M   ALTER TABLE ONLY public.company DROP CONSTRAINT fksxe9t9istcdt2mtdbvgh83a9g;
       public       postgres    false    2885    216    200            �   �   x�Ŏ=�@F��\`���,�Pz[��#$F��B��ږ�{x!����{�����]�8@j]�Ƞ�R�>K(Bl��G}������>-��p�B������H=�����>��W����A�\@9#��H�J,9nw��kڰ�HC(�h\�s� a����k���2��>�S��jOMUUJCZ      �      x������ � �      �   �   x���!�0�q���x�{}]Y�x<���FHJ ��h 9��,�@~�|�o��b`�bm
N�<���Mi)r2Z��C�Ͳ�o�lk��.���}���1V���G�d3P,)�#�5��t�1a&o��րv��\���|�
�'��9V2Vu{_˦��f����S���A�S!��#e�      �   �  x��R��A�G_��^ͣ{5�ؙ�0�Kzfz���V��������]���#B��s�4UT�՝�O��kQ�P,h֓ä%��YR���8��)H��X�>J2�����ih���84����N�j�D��Ͼ�
`�s�� �rb�
͛��׆�E��t�kl^m�͟��<�x�r����<�|)�y�;O���8^��妽����a�m���zXJ�9�v���z���3�%�5 ������%vʮ:�q��p�ʨ�8k��B���$K�)�@�	h�UI����1X��ց�@��h�uL�[;�KER<`V��SL�$,E���x��ݮJ�rA*0��w'�d�@e��#��*od��8��l���b���<�$      �   K   x�3H330JI3�5NL1�5IN4յLM4�5J�HJKI2III5�442�44��1~ ��e@X�1����4��qqq ��      �   �  x��Q��A��_1�����\"!B:ɚ��]/��^���/D$�Ȑ�������p�.!%�VwWI�U�uNg��堭��]+ ؄��h��Dh�lJ|d
_�#���"����e��x��_Nx��XY ��Q�+�"{9�4y>�o��������H�������~�4=;E8��e�w��M�obW�M����n���j��;���/�=��[o#\�����/Mp��6���8������r)� ���ك�\i�TFx���]G���E n@**������9��%��\b�AE��s4J� �O-&�X$9�8��q,8s(D�9C�TM/�@�es�c�FbCh�h$-*u�jr kB�EY/���yz�����v�������n��U?�����t�������t��鸺����������	j*�B�6L(���_��f���X��      �      x������ � �      �      x������ � �      �   �   x�]ιu�0�Z�"�O<%z�4���G���/�sXe��}��Q8ˡ�cG�ܩ����E���s�j�}d�J�j������i/��xORh*a�-�֗��eg���w�Į+o�5d̅�k���Z<�L:��R�K��K�-��;C��C�{�.ؙ:�[Tan���J�u�����9�C      �   �   x�u�1
�0 �����%[��tQ\
)�����B�d;n�[�(���]!cDPAkr�i���2?�����N�"
D��s�D[����R�J�P�S�U �hhS�$�K��opF�8z��r�"���s_�K;�      �   �   x�uͽ�0��ڞ�\���'IM�	��gǈ*f-�-X!%Y${�B���k��{��T���#ؘ{�����̵�n��q��œ����8��؀v`Hah�k��iՋd��d��f��8�0���7S#v��Y��AL����;�-ꪱk\侒R~ ��=�      �   N   x�u���0�3L�4�j�,^�����xz���{��%�jH�hb�GK]n�Q%P�OE����t����U��TE          �   x�ݏ;N�1�k���6��zmoZzJhh�XGJ� ���Qrn�#j.@5���ьX�P��X
1D�"�Ќz-T�l�Ρ��
�{�8���@���b��������/o��>����������o�ɳ�#e�:A��� g��RW�
��^.����$œ�1�C�%�?��45��$0BL=B�y��(ɔ&!_�X iـ�v����V��z��A���{�-V���v۶� y^��      �   K  x�uP�N�1�}O�`����gS�AG�4k��C����2RR�	����PP�$��k�TT+͎F;�3��2ITb JԤkW�3�����v�y��Yۻ��������Թ������ϐ�k͕Urb�LI5rH�r�@�h)k�%42(IZ�2;�q)ˈB�� �L����w�|`�w�ϳ=9���ò_��~��z�_�˼_��S��R��^���EL0]d�d=Q>b>L��w�=��ND=P��ă/�t-�ڼq�o���8� 2e��P����eSy7c�Xj��@��WEȨ��]�XK�f��ods{)s�՗��j�D~�      �   c   x��̱� ����<�O�������m�M]�ń�U�u��W;��d�t�MR�O"8}��.8�Xڗi�rh�7���{��zTX�W)�x�%z      �      x������ � �      �   �   x�͎�q1��*���PKJ$��ON��	v�ȹS �+���Z�Czz�gE�K�����V�����'�i�J�q5������j�-|3^��?��5v�r5�U;k#u	v��7�{�ۧ�'� �V���u�}�����u��7�;Q�      �   t   x�uͱ� E�����A�.q�	܀A����"%�kn���V-�Lx�{n4-1�&\P�}9sS����J�`=�!�l��9yn���Q�΄��Ɗ�x�jQELss��������/��+H      �   X   x�u�1�  �Y^�0���o�Q&�5}�.�.�g�\�Q�V�An�*�GU)}�{�����^�ڑC&V$�L��9�R+��� /���      �      x������ � �      �   �  x���ɲ�H��}���Dc����@TF�Q��*���2=}Í���Vu!ر8��y�髨���WŮ�k	wX�I@l!��c���W�7I����m-���^�S'>@@�zxP�@1�I
�������/d�鑏��)�}���.+��6
)5��;��zC�@@��x��(���D��`ϋ)�V��U�8L�5�(1*7�3�ylEo����I�� ū6�+�%\8V�m8�^/�����?�x�DLS/�C�k�74$ˣ��H��9ּ��OGU��6��ep�fYJpO9I�`����kV ��H�	TY�����`���.X�݈2���6M%V��#��Ӊ���T���"�*V��R��%�w��g:�Zp
�l�� ��Q�>����A����&�NMl@�:Zg���*M�*u����B��Ψޛ*�hB$Cs�G�|?���IH+g#?o=�r���)ѯ!�ݳ{]o񬈿�@4��$����BV0;+OF�Yǳi9���VJa X�/-���Ca ^��@c�A��Q�s��3��7Q7o]�*2]U9v��]ب�u�d�D��K���A��� eQI$��Z���l��郡�|�LN����f��z��? &�_V(��e5z�p��k�y6<�T?U��|�$��U���N*L�zG��I�Mp�+����]��檟�=q|��t��tN(��$�[W�b��|fV ���	P��}���%0�J=�Ɯ���cl��q"��W�Y{ի��^�5_P�ϬЃ*��� �0 hB���ܗo�c$���Ϧ��3����Bo�w,`L4���Awb������ �g�ч��S^H��~�.M����
+P��p��Zk#�W=���3��޾��`"9lb�uf�R����o(hH
Lpa��1���]��qwxW�n�D��z�j/ʞ��m���@��7�&�)�C]��Q{����e�.�b�y{���3�!���ٻ��~mЀ�I�� E�
��_�Q��u;5�4�r<�-��s�2��[���Y�U�@S$���Rs���{kGx�qz'*��|���uc�7jl��;%C2pU�<V�X�}c}�,�ٌ�@ɬ�ru�坥��q�[<D����^�֪�����Y��Q����}r7沏7�S*�E��H0ź�D�d��ps��P���F��1���^Q�2l��<��Ge@�Y2������_���      �      x������ � �      �      x������ � �      �      x������ � �      �   E  x�e��n�0 ��kxo��C�ލ�(�����t���D�~�jF_�ϗ�Q����3X�=��!�D͇�`Y���hb�|�1��|��T�Ŕ���Lxw}ߤT)�)+�J��P�%�a`����a`ƕ*o/�:-D����J-=��N��7'p�������[�jH��'�������_d`ָ�ǝ_���?��bS�ut��i"�������������'B��f=�w:�P0>yӜ6�����K�4�����N>��qx<�<���sU�"$Ka���%��(l�l�ui"��
?ݢ��	��VSU��Պ/     