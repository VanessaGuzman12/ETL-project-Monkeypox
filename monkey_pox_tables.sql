-- Table: public.cities_master

-- DROP TABLE IF EXISTS public.cities_master;

CREATE TABLE IF NOT EXISTS public.cities_master
(
    rank bigint,
    "City" text COLLATE pg_catalog."default",
    "Country" text COLLATE pg_catalog."default",
    "2022_Population" bigint,
    "2021_Population" bigint,
    "Growth" double precision
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.cities_master
    OWNER to postgres;
---------------------------------------------------------------------------------

-- Table: public.monkeypox_locations

-- DROP TABLE IF EXISTS public.monkeypox_locations;

CREATE TABLE IF NOT EXISTS public.monkeypox_locations
(
    "ID" double precision,
    "City" text COLLATE pg_catalog."default",
    "Country" text COLLATE pg_catalog."default",
    "Contact_location" text COLLATE pg_catalog."default"
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.monkeypox_locations
    OWNER to postgres;

---------------------------------------------------------------------------------
-- Table: public.monkeypox_master

-- DROP TABLE IF EXISTS public.monkeypox_master;

CREATE TABLE IF NOT EXISTS public.monkeypox_master
(
    "ID" double precision,
    "Status" text COLLATE pg_catalog."default",
    "Location" text COLLATE pg_catalog."default",
    "City" text COLLATE pg_catalog."default",
    "Country" text COLLATE pg_catalog."default",
    "Age" text COLLATE pg_catalog."default",
    "Gender" text COLLATE pg_catalog."default",
    "Date_onset" text COLLATE pg_catalog."default",
    "Date_confirmation" text COLLATE pg_catalog."default",
    "Symptoms" text COLLATE pg_catalog."default",
    hospitalised text COLLATE pg_catalog."default",
    "Date_hospitalisation" text COLLATE pg_catalog."default",
    "Isolated" text COLLATE pg_catalog."default",
    "Date_isolation" text COLLATE pg_catalog."default",
    "Outcome" text COLLATE pg_catalog."default",
    "Contact_comment" text COLLATE pg_catalog."default",
    "Contact_ID" double precision,
    "Contact_location" text COLLATE pg_catalog."default",
    "Travel_history" text COLLATE pg_catalog."default",
    "Travel_history_entry" text COLLATE pg_catalog."default",
    "Travel_history_start" text COLLATE pg_catalog."default",
    "Travel_history_location" text COLLATE pg_catalog."default",
    "Travel_history_country" text COLLATE pg_catalog."default",
    "Genomics_Metadata" text COLLATE pg_catalog."default",
    "Confirmation_method" text COLLATE pg_catalog."default",
    "Source" text COLLATE pg_catalog."default",
    "Source_II" text COLLATE pg_catalog."default",
    "Date_entry" text COLLATE pg_catalog."default",
    "Date_last_modified" text COLLATE pg_catalog."default",
    "Source_III" text COLLATE pg_catalog."default",
    "Country_ISO3" text COLLATE pg_catalog."default"
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.monkeypox_master
    OWNER to postgres;


---------------------------------------------------------------------------------
-- Table: public.monkeypox_symptoms

-- DROP TABLE IF EXISTS public.monkeypox_symptoms;

CREATE TABLE IF NOT EXISTS public.monkeypox_symptoms
(
    index bigint,
    "Symptoms" text COLLATE pg_catalog."default"
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.monkeypox_symptoms
    OWNER to postgres;
-- Index: ix_monkeypox_symptoms_index

-- DROP INDEX IF EXISTS public.ix_monkeypox_symptoms_index;

CREATE INDEX IF NOT EXISTS ix_monkeypox_symptoms_index
    ON public.monkeypox_symptoms USING btree
    (index ASC NULLS LAST)
    TABLESPACE pg_default;

---------------------------------------------------------------------------------
-- Table: public.monkeypox_travel

-- DROP TABLE IF EXISTS public.monkeypox_travel;

CREATE TABLE IF NOT EXISTS public.monkeypox_travel
(
    "ID" double precision,
    "Travel_history" text COLLATE pg_catalog."default",
    "Travel_history_entry" text COLLATE pg_catalog."default",
    "Travel_history_start" text COLLATE pg_catalog."default",
    "Travel_history_location" text COLLATE pg_catalog."default",
    "Travel_history_country" text COLLATE pg_catalog."default"
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.monkeypox_travel
    OWNER to postgres;

---------------------------------------------------------------------------------
-- Table: public.Daily_CaseLoad_by_Country

-- DROP TABLE IF EXISTS public."Daily_CaseLoad_by_Country";

CREATE TABLE IF NOT EXISTS public."Daily_CaseLoad_by_Country"
(
    "Country" text COLLATE pg_catalog."default",
    "2022-05-06" bigint,
    "2022-05-12" bigint,
    "2022-05-13" bigint,
    "2022-05-15" bigint,
    "2022-05-17" bigint,
    "2022-05-18" bigint,
    "2022-05-19" bigint,
    "2022-05-20" bigint,
    "2022-05-21" bigint,
    "2022-05-23" bigint,
    "2022-05-24" bigint,
    "2022-05-25" bigint,
    "2022-05-26" bigint,
    "2022-05-27" bigint,
    "2022-05-28" bigint,
    "2022-05-29" bigint,
    "2022-05-30" bigint,
    "2022-05-31" bigint,
    "2022-06-01" bigint,
    "2022-06-02" bigint,
    "2022-06-03" bigint,
    "2022-06-04" bigint,
    "2022-06-06" bigint
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public."Daily_CaseLoad_by_Country"
    OWNER to postgres;

---------------------------------------------------------------------------------
-- Table: public.Worldwide_Case_Detection_Timeline

-- DROP TABLE IF EXISTS public."Worldwide_Case_Detection_Timeline";

CREATE TABLE IF NOT EXISTS public."Worldwide_Case_Detection_Timeline"
(
    "Date_confirmation" text COLLATE pg_catalog."default",
    "Country" text COLLATE pg_catalog."default",
    "City" text COLLATE pg_catalog."default",
    "Age" text COLLATE pg_catalog."default",
    "Gender" text COLLATE pg_catalog."default",
    "Symptoms" text COLLATE pg_catalog."default",
    hospitalised text COLLATE pg_catalog."default",
    "Isolated" text COLLATE pg_catalog."default",
    "Travel_history" text COLLATE pg_catalog."default"
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public."Worldwide_Case_Detection_Timeline"
    OWNER to postgres;
