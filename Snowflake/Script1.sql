-- CREATE DATABASE DSCOVR; -- we create the database
-- CREATE SCHEMA SPACEAPPS; -- we create de schema
-- CREATE OR REPLACE FILE FORMAT CSV_FILEFORMAT TYPE = CSV; -- we create the file format to load csdv files

-- CREATE or replace STORAGE INTEGRATION gcs_int
--   TYPE = EXTERNAL_STAGE
--   STORAGE_PROVIDER = 'GCS'
--   ENABLED = TRUE
--   STORAGE_ALLOWED_LOCATIONS = ('gcs://dscovr'); -- create a storage integration connected to gcp

-- DESC STORAGE INTEGRATION gcs_int; 
-- STORAGE_GCP_SERVICE_ACCOUNT kaj500000@gcpuseast4-eea5.iam.gserviceaccount.com 
-- ESTE SE NECESITA AL MOMENTO DE AGREGAR UN PRINCIPAL SOBRE EL BUCKET
-- ADEMÁS DEL ROL CON LOS PERMISOS NECESARIOS DE ACUERDO A LA DOCUMENTACION EN SNOWFLAKE
-- ES NECESARIO SEGUIR EL PASO A PASO QUE SE DESCRIBE EN ESTA PAGINA
-- https://docs.snowflake.com/en/user-guide/data-load-gcs-config

-- USE SCHEMA DSCOVR.SPACEAPPS;

-- CREATE OR REPLACE STAGE my_ext_stage
--   URL='gcs://dscovr'
--   STORAGE_INTEGRATION = gcs_int
--   FILE_FORMAT = CSV_FILEFORMAT; -- create a stage

CREATE OR REPLACE TABLE DSCOVR.SPACEAPPS.COMPLETE_DATA_WITH_KP ( -- Define the new table
join_date VARCHAR(100),
Year VARCHAR(100),
Month VARCHAR(100),
Day VARCHAR(100),
days VARCHAR(100),
days_m VARCHAR(100),
BSR VARCHAR(100),
dB VARCHAR(100),
Kp1 VARCHAR(100),
Kp2 VARCHAR(100),
Kp3 VARCHAR(100),
Kp4 VARCHAR(100),
Kp5 VARCHAR(100),
Kp6 VARCHAR(100),
Kp7 VARCHAR(100),
Kp8 VARCHAR(100),
ap1 VARCHAR(100),
ap2 VARCHAR(100),
ap3 VARCHAR(100),
ap4 VARCHAR(100),
ap5 VARCHAR(100),
ap6 VARCHAR(100),
ap7 VARCHAR(100),
ap8 VARCHAR(100),
Ap VARCHAR(100),
SN VARCHAR(100),
F107obs VARCHAR(100),
F107adj VARCHAR(100),
D VARCHAR(100),
Date VARCHAR(100),
timestamp VARCHAR(100),
gse_x VARCHAR(100),
gse_y VARCHAR(100),
gse_z VARCHAR(100),
raw_4 VARCHAR(100),
raw_5 VARCHAR(100),
raw_6 VARCHAR(100),
raw_7 VARCHAR(100),
raw_8 VARCHAR(100),
raw_9 VARCHAR(100),
raw_10 VARCHAR(100),
raw_11 VARCHAR(100),
raw_12 VARCHAR(100),
raw_13 VARCHAR(100),
raw_14 VARCHAR(100),
raw_15 VARCHAR(100),
raw_16 VARCHAR(100),
raw_17 VARCHAR(100),
raw_18 VARCHAR(100),
raw_19 VARCHAR(100),
raw_20 VARCHAR(100),
raw_21 VARCHAR(100),
raw_22 VARCHAR(100),
raw_23 VARCHAR(100),
raw_24 VARCHAR(100),
raw_25 VARCHAR(100),
raw_26 VARCHAR(100),
raw_27 VARCHAR(100),
raw_28 VARCHAR(100),
raw_29 VARCHAR(100),
raw_30 VARCHAR(100),
raw_31 VARCHAR(100),
raw_32 VARCHAR(100),
raw_33 VARCHAR(100),
raw_34 VARCHAR(100),
raw_35 VARCHAR(100),
raw_36 VARCHAR(100),
raw_37 VARCHAR(100),
raw_38 VARCHAR(100),
raw_39 VARCHAR(100),
raw_40 VARCHAR(100),
raw_41 VARCHAR(100),
raw_42 VARCHAR(100),
raw_43 VARCHAR(100),
raw_44 VARCHAR(100),
raw_45 VARCHAR(100),
raw_46 VARCHAR(100),
raw_47 VARCHAR(100),
raw_48 VARCHAR(100),
raw_49 VARCHAR(100),
raw_50 VARCHAR(100),
raw_51 VARCHAR(100),
raw_52 VARCHAR(100),
raw_53 VARCHAR(100)
);

COPY INTO DSCOVR.SPACEAPPS.COMPLETE_DATA_WITH_KP
FROM '@my_ext_stage/merged_kp_dscovr.csv'
FILE_FORMAT = my_csv_format
ON_ERROR = CONTINUE; -- load the new table with information from GCP

CREATE OR REPLACE TABLE COMPLETE_DATA_WITH_KP_CUADRADO
AS
SELECT 
SQRT(gse_x*gse_x + gse_y*gse_y + gse_z*gse_z) AS cuadrado,
*
FROM DSCOVR.SPACEAPPS.COMPLETE_DATA_WITH_KP; -- We compute the module of the vector

CREATE OR REPLACE TABLE DSCOVR.SPACEAPPS.CORRELACION_CUADRADO AS
(
SELECT
CORR(kp1, cuadrado) as correlacion_kp1_cuadrado,
CORR(kp2, cuadrado) as correlacion_kp2_cuadrado,
CORR(kp3, cuadrado) as correlacion_kp3_cuadrado,
CORR(kp4, cuadrado) as correlacion_kp4_cuadrado,
CORR(kp5, cuadrado) as correlacion_kp5_cuadrado,
CORR(kp6, cuadrado) as correlacion_kp6_cuadrado,
CORR(kp7, cuadrado) as correlacion_kp7_cuadrado,
CORR(kp8, cuadrado) as correlacion_kp8_cuadrado
FROM
    DSCOVR.SPACEAPPS.COMPLETE_DATA_WITH_KP_CUADRADO
); --compute the correlation vs the kp's values

SELECT * FROM SPACEAPPS.CORRELACION_CUADRADO;