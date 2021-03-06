PGDMP                         x           seidlserverdb    12.2    12.2                0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                       1262    41167    seidlserverdb    DATABASE     �   CREATE DATABASE seidlserverdb WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'German_Austria.1252' LC_CTYPE = 'German_Austria.1252';
    DROP DATABASE seidlserverdb;
                postgres    false            �            1259    41183    refresh_tokens    TABLE     n   CREATE TABLE public.refresh_tokens (
    refresh_token character varying(300) NOT NULL,
    userid integer
);
 "   DROP TABLE public.refresh_tokens;
       public         heap    postgres    false            �            1259    41170    users    TABLE       CREATE TABLE public.users (
    userid integer NOT NULL,
    username character varying(30) NOT NULL,
    first_name character varying(30),
    last_name character varying(30),
    email character varying(30) NOT NULL,
    password character varying(200) NOT NULL
);
    DROP TABLE public.users;
       public         heap    postgres    false            �            1259    41168    users_userid_seq    SEQUENCE     �   CREATE SEQUENCE public.users_userid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.users_userid_seq;
       public          postgres    false    203                       0    0    users_userid_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.users_userid_seq OWNED BY public.users.userid;
          public          postgres    false    202            �
           2604    41173    users userid    DEFAULT     l   ALTER TABLE ONLY public.users ALTER COLUMN userid SET DEFAULT nextval('public.users_userid_seq'::regclass);
 ;   ALTER TABLE public.users ALTER COLUMN userid DROP DEFAULT;
       public          postgres    false    203    202    203                      0    41183    refresh_tokens 
   TABLE DATA           ?   COPY public.refresh_tokens (refresh_token, userid) FROM stdin;
    public          postgres    false    204                    0    41170    users 
   TABLE DATA           Y   COPY public.users (userid, username, first_name, last_name, email, password) FROM stdin;
    public          postgres    false    203                      0    0    users_userid_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.users_userid_seq', 8, true);
          public          postgres    false    202            �
           2606    41177    users Unique Email 
   CONSTRAINT     P   ALTER TABLE ONLY public.users
    ADD CONSTRAINT "Unique Email" UNIQUE (email);
 >   ALTER TABLE ONLY public.users DROP CONSTRAINT "Unique Email";
       public            postgres    false    203            �
           2606    41187 "   refresh_tokens refresh_tokens_pkey 
   CONSTRAINT     k   ALTER TABLE ONLY public.refresh_tokens
    ADD CONSTRAINT refresh_tokens_pkey PRIMARY KEY (refresh_token);
 L   ALTER TABLE ONLY public.refresh_tokens DROP CONSTRAINT refresh_tokens_pkey;
       public            postgres    false    204            �
           2606    41175    users users_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (userid);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public            postgres    false    203            �
           1259    41193 
   fki_userid    INDEX     G   CREATE INDEX fki_userid ON public.refresh_tokens USING btree (userid);
    DROP INDEX public.fki_userid;
       public            postgres    false    204            �
           2606    41188    refresh_tokens userid    FK CONSTRAINT     �   ALTER TABLE ONLY public.refresh_tokens
    ADD CONSTRAINT userid FOREIGN KEY (userid) REFERENCES public.users(userid) NOT VALID;
 ?   ALTER TABLE ONLY public.refresh_tokens DROP CONSTRAINT userid;
       public          postgres    false    2695    204    203               �   x����N�0 �᳼$��ㆀ-��V�C+B6�>�ԇ�����W<2�%"р��I�h��>{w1��7<�{��~⭯��qW	����5:u2o�ȲH�]ܳ�M�'��D�sLwК����E'B/Y/+��Gژ��|���ap��v�����hyB����I\:�i~�N��C�!�A���+�|���J��&ԇV�V��1J�L�X^�v�o����h@g�ꐼ�E���>-�0n���         �   x�u̻n�0 ��?�.&d+	P��."�.6�"��~�V�ZuA:��#}�Rcƕ�3��w?�e��\{*(�TQ���=�֘��P��a�T���h���&��F1�B��E���.���f꾐�9�`�(ܦ�|��	��o{6����^�*��ǣeZ���A6DA{����˥u �t��><�y��^���.���_�	�v����C����fI��a�
�T����$Oo ��@u�     